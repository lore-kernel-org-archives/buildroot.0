From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Jun 2018 17:44:33 +0200
Subject: [Buildroot] [PATCH 1/2] git: fix handling of git repos using
 master as version
In-Reply-To: <CAESO2E+hb8=2vfAstXvYeG05L6ELKMHcYCGkoHRukptkrDhZHQ@mail.gmail.com>
References: <1528119150-28659-1-git-send-email-bbeckett@netvu.org.uk>
 <20180604163302.2d529afd@windsurf>
 <CAESO2E+hb8=2vfAstXvYeG05L6ELKMHcYCGkoHRukptkrDhZHQ@mail.gmail.com>
Message-ID: <20180604154433.GA3700@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-06-04 15:59 +0100, Bob Beckett spake thusly:
> Is this philosophy set in stone? I can conceive of useful situations where branches are preferable.

The problem, as Thomas quickly explained, is that it does not behave as
users expect.

First, Buildroot creates a local tarball of the git reository. We do
that for various reasons, one beiong to be able to prepare the
compliance archive (make legal-info).

So, if you run "make clean; make" then the local archive already exists
and Buildroot will not download it again, i.e. it will nt update your
git tree.

Now, if you run "make distclean", then yes, it removes the download
directory that you get in "buildroot/dl/", and so you will re-download
again, and that will be the new branch you'll get.

However, it is possible to override the download location, if you export
BR2_DL_DIR in the environment, to tell Buildroot where to look for, and
store new downloads, as a way to cache downloads for those users behind
slow connections (not everyone has ADSL-class connection, even less so
gigabit-class fibers). If BR2_DL_DIR is set, then Buildroot will never
remove it, even with "make distclean". So, you're back to square one,
where the local tarball still represent an old state of your branch.

Ergo, it does not behave as you would think it would.

The second problem, is that using a branch name makes the build
non-reproducible.

Today, you'll get a set of source from your branch, but maybe tomorrow
it will point to something else, or even have disapeared (which is the
least problematic issue, because the build would obviously fail, while
it could succeed and result in a flawed state with a new branch).

Ergo, it does not behave as you would think it would.

So, using a branch name is flawed in two ways. We can't add support for
using branch names in any reliable and predictable manner.

> During large projects, where the rootfs is being developed at the same time as some custom packages,
> it is quite useful to have a branch as the target. Usually, I just do a dirclean and delete the tar when I know
> something has changed.
> 
> If you wanted to make it more predictable, then maybe name the tar based on the version (branch name in this case) plus the sha,

But we can't know the sha1 before we git checkout the branch, so we
don;t know if we already have it localy, so we don;t know we can use a
cached version, so this undermines the very reason to have a local cache
to start with...

> this way new tar packages would be created if the branch advances and also if a tag (or other supported refspec) changes via a
> rebase etc.

Changing a tag is bad. Repeat after me: changing a tag is bad! ;-)

Yes, git allows that. Guns also allow one to shoot in ones' own foot.
That does not mean this is a good idea... ;-p

> The particular thing I like to avoid is multiple version bumps in the package spec and tags in the package source repos during
> development. When many people are working on package project, expecting them all to take time to publish tags for every little
> change gets unrealistic.
> 
> The question I would ask is is there any harm in supporting that if it can be done reliably and predictably?
> Anyway, if this design is locked down, then I will just maintain this patch locally for us to use :)

And as I hope I clearly explained above, there is no wau to make it work
predictably and reliably.

Regards,
Yann E. MORIN.

> Thanks
> 
> Bob
> On Mon, Jun 4, 2018 at 3:33 PM, Thomas Petazzoni < [1]thomas.petazzoni@bootlin.com> wrote:
> 
>   Hello,
>   On Mon,? 4 Jun 2018 14:32:29 +0100, Robert Beckett wrote:
>   > Since changing to git init followed by fetch to initialise
>   > git cache, when using master branch as the target version
>   > for a package, git refuses to fetch in to currently checkout
>   > out branch or master.
> 
>   I think we don't want to support using branches as Git versions, as it
>   doesn't make sense, because it won't behave as the user expects.
> 
>   If you use a branch as _VERSION for a package, Buildroot will only
>   download once, and never update to newer commits in this branch,
>   because it will already have a cached tarball in its DL_DIR.
> 
>   So I'm not sure we want to add some code to support a use case that we
>   don't want support :-)
>   Thomas
>   --
>   Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
>   Embedded Linux and Kernel engineering
>   [2]https://bootlin.com
> 
> Links:
> 1. mailto:thomas.petazzoni at bootlin.com
> 2. https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
