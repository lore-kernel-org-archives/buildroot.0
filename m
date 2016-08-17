From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Aug 2016 23:31:02 +0200
Subject: [Buildroot] [PATCH 1/1] support/download/git: Prioritize remote
 archive
In-Reply-To: <CAJsd3zJZ6o3dbCuRC8uZ6CE_41jqmVYbtRrkCQZhEkdmeG_t0Q@mail.gmail.com>
References: <1471461016-9660-1-git-send-email-kamath.ben@gmail.com>
 <20160817210314.GG5778@free.fr>
 <CAJsd3zJZ6o3dbCuRC8uZ6CE_41jqmVYbtRrkCQZhEkdmeG_t0Q@mail.gmail.com>
Message-ID: <20160817213102.GH5778@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Benjamin, All,

On 2016-08-17 14:13 -0700, Benjamin Kamath spake thusly:
> On Wed, Aug 17, 2016 at 2:03 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Benjamin, All,
> >
> >>
> >> +# Try a remote archive, since it is as fast as a shallow clone and can give us
> >> +# an archive directly. Also, if uploadArchive.allowUnreachable is set to true
> >> +# on the remote, this will also work for arbitrary sha1s, and will offer a
> >> +# considerable speedup over a full clone.
> >> +printf "Doing remote archive\n"
> >> +if _git archive --format=tar.gz --prefix=${basename}/ --remote=${repo} -o ${output} ${cset} 2>&1; then
> >> +    exit 0
> >> +fi
> >
> > NAK in the state.
> Is this related to the following paragraph or a separate issue?

It's "NAK in the state" because of what I explained below.

I'm OK for this feature if:
  - the submodule support is handled (at least as I suggest),
  - the reproducibility of archives is guaranteed.

> > If the package needs submodules, we can't ask the remote to generate
> > the archive for us, because git-archive does not know how to include
> > submodules.
> >
> > So, maybe this would work:
> >
> >     if [ ${recurse} -eq 0 ]; then
> >         if _git blabla remote archive; then
> >             exit 0
> >         fi
> >     fi
> Indeed, I hadn't thought about submodules. I think your suggestion
> would be sufficient. After all,
> it should fall back to the older behavior upon failure.
> 
> >
> > Also, as stated by Thomas, we want to generate reproducible archives, so
> > that we can check the hashes of archives. We go at great length to
> > generate such archives locally, but I don't see a guarantee that the
> > remote archive would be reproducible.
> 
> I'm quite certain the archive is reproducible but this requires a bit
> more investigation
> to prove.

Well, I had a wquick look at archive.c in the git git tree (weird to
write that!), and I can neither conclusively state that they are not
that are not... :-/

There does not seem to be any call to sort() in there, not are they
setting LC_COLLATE anywhere.

However, I've tried to generate two archives (locally) with different
collating rules (en_US.UTF-8 which does not differentiate between upper
and lower case, and C which does) and the two archive had the same sha1.

Inspecting the archives in both cases shows that the collating seems to
always be C, with Uppercase always before lowercase, with .files before
non-dot files, and so on...

So, I think it is safe to assume that git-archives always generates
reproducible archive.

There. Solved that one for you! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
