From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Apr 2018 21:59:48 +0200
Subject: [Buildroot] [PATCH 3/4] download/git: ensure we can checkout
 repos with submodule conversions
In-Reply-To: <627eaa46-0acb-9753-15a0-d805abb18164@mind.be>
References: <a45b9ba78d527d29cfd5cc0daf4c767c7feb8643.1523983687.git.yann.morin.1998@free.fr>
 <5ad6b7cbf192b_23c22af60ee98304189d9@ultri4.mail>
 <627eaa46-0acb-9753-15a0-d805abb18164@mind.be>
Message-ID: <20180419195948.GD30285@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Ricardo, All,

On 2018-04-18 10:04 +0200, Arnout Vandecappelle spake thusly:
> On 18-04-18 05:13, Ricardo Martincoski wrote:
> > Hello,
> > 
> > Really sorry I did finished the review/tests today to send by tags.

He, no problem at all! ;-)

> > Could you double-check the --force option for git 1.7.1? I am not sure we would
> > have a workaround for this if it is not supported.
> 
>  The help of 1.7.1 says:
> 
> git submodule [--quiet] update [--init] [-N|--no-fetch] [--rebase] [--reference
> <repository>] [--merge] [--recursive] [--] [<path>...]
> 
> No force there... Checking the code, I don't see any handling of -f or --force.

I don't have access to a pre 1.8.0 git here... :-/

> > Also a question and some typos.
> > 
> > On Tue, Apr 17, 2018 at 01:48 PM, Yann E. MORIN wrote:
> [snip]
> >> +# files after the checkout.
> >> +find . -type f -name .git -exec rm {} +
> > 
> > In the unlikely case some user tries to abuse the git cache by first populating
> > it using the 'git multiple working trees' feature the main
> > dl/<package>/git/.git would be a file too. After this command all git commands
> > will fail.
> > But... well... that is expected! The user should not mess with the git cache,
> > it is there to be used solely by buildroot.
> > So we are good IMO.
>  +1

Indeed, we should not try to support that case.

>  That said, IMO it would be better if the git cache were a bare repo, and that
> we did the checkout outside of the repo. But I don't think that works well with
> submodules. Submodules are annoying...

Yes, see below for an explanation in a few git commands what I'm trying
to work around...

> >> +# Restore repository to the new, clean-checkout state.
> >> +_git clean -ffdx
> >> +_git checkout -- .
> > 
> > So it is needed to checkout the .git files again? Or did I miss something?
>  I'm missing the point as well. Clearly needs a comment :-)

Well, the situation is pretty tricky, and I don't understand all the
conditions. But, two things:

  - there can be cases where git checkout did not properly finish in the
    past, so we'd be left with untracked files (as is the cases
    currently in some of the autobuilders), or in case the user did
    interrupt git in the middle of a checkout, or in case a CI job
    killed a runaway job...

  - we could well have removed .git files that were not indications of
    submodules, so we want torestore those.

Speaking of submodules, what this whole patch is about is to workaround
idiosyncrasies in the way git handles sub;odules.

Consider this sequence:

    $ git init meh.git; cd meh.git
    $ mkdir foo; echo BAR >foo/bar
    $ git add foo/bar; git commit -m "foo/bar: BAR"
    $ cp -a foo ../foo.git
    $ git rm -r foo; git commit -m "foo/bar: before submod"

    $ cd ../foo.git; git init .
    $ git add bar; git commit -m "bar: BAR"

    $ cd ../meh.git
    $ git submodule add ../foo.git foo
    $ git commit -m "foo: submod"

Now that we have our git trees, with a sub-dir to sub-module conversion,
let's navigate in the history:

    $ git checkout HEAD^^  # Back to first commit: foo is just a subdir
    error: The following untracked working tree files would be
    overwritten by checkout:
        foo/bar
    Please move or remove them before you switch branches.
    Aborting

    $ rm -f foo/.git
    $ git checkout HEAD^^  # Back to first commit: foo is just a subdir
    warning: unable to rmdir foo: Directory not empty
    Note: checking out 'HEAD^^'.
    [...]
    HEAD is now at f18f7ad... foo/bar: BAR

    $ ls -lA foo/
    -rw-rw-r-- 1 ymorin ymorin  4 avril 18 21:25 bar
    -rw-rw-r-- 1 ymorin ymorin 28 avril 18 21:24 .git

Meh... Extra .git file lingering around... :-/

    $ git clean -ffdx

    $ ls -lA foo/
    -rw-rw-r-- 1 ymorin ymorin  4 avril 18 21:25 bar
    -rw-rw-r-- 1 ymorin ymorin 28 avril 18 21:24 .git

Bummer, still there... Let's remove it manually, then:

    $ rm -f foo/.git

Now, let's come back to master:

    $ git checkout master
    Previous HEAD position was f18f7ad... foo/bar: BAR
    Switched to branch 'master'
    $ ls -lA foo/
    [nothing, deep-space void...]

    $ git submodule update --init
    Submodule path 'foo': checked out '1184643257e1e3f63a2f849dd4737c5055184aff'

(weird, it sorks now; I'm pretty sure I got a case where Ineeded a
--force to the sbmodule update... Sigh, I'll have to investigate
further...)

> > Long time since I developed using submodules, so I now forgot some catches.
> > Anyway I will play with those commands tomorrow to try to understand.
> > 
> > [snip]
> >> -    _git submodule update --init --recursive
> >> +    _git submodule update --init --recursive --force
> > 
> > It seems --force does not exist on git 1.7.1.
> > It is still possible I did something wrong when creating the docker image.
> > https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/63519024
> 
>  No, it doesn't exist.

Grrr... :-(

On the other hand, I can't reproduce the case where I needed the
submodule update --force. So maybe it is not needed, afterall?

I'll investigate further.

>  Note that git 1.7.1 also doesn't have the .git files in the submodules; the
> submodules have .git directories, i.e. they're indistinguishable from normal
> repos. I think that that is not a problem for this patch, since I think git
> 1.7.1 *will* kill .git directories when doing git clean --ffdx, but I'm not
> sure. Note that this implies that submodules will *not* be cached...
> 
>  I'm liking the bare repos more and more :-)

But then, we can't have submodules stored in a bare repo, because we
need a workign copy to have the list of submodules, and their
versions...

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> > It does work for git 1.8.3.
> > https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/63525858
> > 
> > 
> > Regards,
> > Ricardo
> > 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
