From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Aug 2016 22:55:21 +0200
Subject: [Buildroot] [PATCH 1/1] support/download/git: Prioritize remote
	archive
In-Reply-To: <87zio4pol6.fsf@dell.be.48ers.dk>
References: <1471461016-9660-1-git-send-email-kamath.ben@gmail.com>
 <20160817210314.GG5778@free.fr> <87zio4pol6.fsf@dell.be.48ers.dk>
Message-ID: <20160822205521.GB5779@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2016-08-22 21:53 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > NAK in the state.
> 
>  > If the package needs submodules, we can't ask the remote to generate
>  > the archive for us, because git-archive does not know how to include
>  > submodules.
> 
>  > So, maybe this would work:
> 
>  >     if [ ${recurse} -eq 0 ]; then
>  >         if _git blabla remote archive; then
>  >             exit 0
>  >         fi
>  >     fi
> 
> Or alternatively, we look at the alternative approach for handling
> submodules - E.G. splicing git archive outputs.

And I think I already explained that this was not so trivial...

For example, I did this layout of git tree and submodules:

    foo/
    foo/.git/
    foo/foo             <- file with "FOO" in it
    foo/bar/
    foo/bar/.git
    foo/bar/bar         <- file with "BAR" in it
    foo/bar/buz/
    foo/bar/buz/.git
    foo/bar/buz/buz     <- file with "BUW" in it

  - each git tree has a file named after the git tree and containing the
    name of the git tree in uppercase (just for fun and as a way to check
    what I did).
  - 'foo' is a git tree with a submodule 'bar'.
  - 'bar' is a git tree with a submodule 'buz'.
  - So, 'buz' is *not* a submodule of 'foo'

    $ git submodule foreach -q --recursive 'printf "name=${name} path=${path} toplevel=${toplevel}\n"'
    name=bar  path=bar toplevel=/home/ymorin/dev/buildroot/foo/git/foo
    name=buz  path=buz toplevel=/home/ymorin/dev/buildroot/foo/git/foo/bar

So it means we have no easy way to get the relative path to the
sub-submodules. We have to extract them:

    $ git submodule foreach -q --recursive "printf \"reldir=\${toplevel#$(git rev-parse --show-toplevel)}/\${path}\n\""
    reldir=/bar
    reldir=/bar/buz

And then for each of them, we shoe-horn that path as a --prefix to git
archive.

This does not make our git wrapper any much simpler:
  - we still need to try a shallow clone and fallback to a full clone,
  - we still need to fetch the special refs,
  - we still need to do checkouts (thus non-bare clones) because
    submodules are only known with a working tree,
  - we still need to init and update submodules, recursively.

The only slight simplification would be with using git-archive instead
of a canned tar, but even then this git-archive command would be quite
complex (untested):

    $ git archive --prefix=${basename} --format=tar >"${output}.tmp"
    $ git submodule foreach -q --recursive \
        "git archive --prefix=${basename}\${toplevel#$(git rev-parse --show-toplevel)}/\${path}/ --format=tar" \
        >>"${output}.tmp"
    $ gzip -9 <"${output}.tmp" >"${output}"

Sorry, but this is totally unreadable... :-/

And this is only about replacing the *single* tar we have right now.
We'd still have to keep all the rest of the wrapper...

However, taking again my exmple git tree above:

    $ git archive --prefix=foo/ --format=tar HEAD >foo.tar
    $ ls -l foo.tar
    -rw-rw-r-- 1 ymorin ymorin 10240 Aug 22 22:37 foo.tar

    $ git submodule foreach -q --recursive "git archive --prefix=foo\${toplevel#$(git rev-parse --show-toplevel)}/\${path}/ --format=tar HEAD >>$(pwd)/foo.tar"
    $ ls -l foo.tar
    -rw-rw-r-- 1 ymorin ymorin 30720 Aug 22 22:37 foo.tar

So it seems the submodules were somewhat added to the acrchive, right?
Well, at least it seems the archive is ill-formed:

    $ tar tf foo.tar
    foo/
    foo/.gitmodules
    foo/bar/
    foo/foo

If I 'hexdump -Cv foo.tar' it looks like there is everything in there,
though... But git-archive generates a 'global pax header' (whatever that
is) by default. We can tell it not too, by using a special syntax when
specifying the tree-ish: using HEAD^{tree} instead of HEAD.

No more luck at extracting the archive... :-(

So I'm not sure where to go from here.

>  > Also, as stated by Thomas, we want to generate reproducible archives, so
>  > that we can check the hashes of archives. We go at great length to
>  > generate such archives locally, but I don't see a guarantee that the
>  > remote archive would be reproducible.
> 
> Normal 'git archive' output should be reproducable, E.G. that is what we
> used until recently.

Yet, we did notice that, at one point, github archives were *not*
reproducible...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
