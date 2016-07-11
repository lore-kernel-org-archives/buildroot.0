From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 Jul 2016 22:22:06 +0200
Subject: [Buildroot] [PATCH] core: do not remove dl/ directory on
	distclean
In-Reply-To: <87a8ho9c2p.fsf@dell.be.48ers.dk>
References: <1468187749-3955-1-git-send-email-yann.morin.1998@free.fr>
 <20160711032615.GJ3870@tarshish> <20160711163446.GB3734@free.fr>
 <87a8ho9c2p.fsf@dell.be.48ers.dk>
Message-ID: <20160711202206.GA5122@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2016-07-11 22:03 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > Baruch, All,
>  > On 2016-07-11 06:26 +0300, Baruch Siach spake thusly:
>  >> On Sun, Jul 10, 2016 at 11:55:49PM +0200, Yann E. MORIN wrote:
>  >> > Currently, if the dl/ directory is the default location, it is removed
>  >> > on distclean.
>  >> > 
>  >> > However, the dl/ directory is a precious location: it contains all the
>  >> > tarballs downloaded so far, and some can be relatively huge, taking some
>  >> > previous time to re-download, especially on slowish links.
>  >> > 
>  >> > Don't remove it on distclean. If the user really needs to regain some
>  >> > space, leave it to him to clean this directory up manually.
>  >> 
>  >> Current Makefile help text for 'distclean' says:
>  >> 
>  >> delete all non-source files (including .config)
>  >> 
>  >> Not deleting the dl/ directory is not consistent with this description, IMO.
> 
>  > Well, I do understand it the other way: non-source files are deleted,
>  > but source files are not deleted.
> 
>  > And I would argue that the content of dl/ *are* source files. If
>  > anything, they are the archetype of source files.
> 
>  > Ergo, distclean should not remove them.
> 
> Sorry, I agree with Baruch. Distclean should leave the directory
> structure like it was when the buildroot tarball was extracted (or git
> cloned)

Right, on principle. Except...

> E.G. the GNU standard make targets state:
> 
> https://www.gnu.org/prep/standards/standards.html#Standard-Targets
> 
> ?distclean?
> 
> Delete all files in the current directory (or created by this makefile)
> that are created by configuring or building the program. If you have
> unpacked the source and built the program without creating any other
> files, ?make distclean? should leave only the files that were in the
> distribution. However, there is no need to delete parent directories
> that were created with ?mkdir -p?, since they could have existed anyway.

... we could (should?) consider that dl/ is a special case. It really
holds content that can be difficult to retrieve.

Think of a tarball made from a git clone from a Linux kernel for
example. This can be really costly to download, especially on slow
links. For example:

Downloaded  Repo
-----------------------------------------------------------------------------
1.02 GiB    git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
1.43 GiB    git://github.com/raspberrypi/linux.git


But Oh well... I'm not impacted as I have BR2_DL_DIR in my environment
pointing somehwere else and reliable... I find it just sad that
unsuspecting users, especially newcomers) would hit that when told to
start over from scratch...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
