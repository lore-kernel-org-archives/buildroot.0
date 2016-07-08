From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 Jul 2016 22:52:17 +0200
Subject: [Buildroot] [PATCH v6] util-linux: rework utilities menu for
 finer control
In-Reply-To: <903784225.9298241.1468009985372.JavaMail.zimbra@datacom.ind.br>
References: <1275872201.8394962.1467773032223.JavaMail.zimbra@datacom.ind.br>
 <1467773719-10013-1-git-send-email-casantos@datacom.ind.br>
 <20160706215407.GF3763@free.fr>
 <903784225.9298241.1468009985372.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20160708205217.GB3757@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2016-07-08 17:33 -0300, Carlos Santos spake thusly:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > To: "Carlos Santos" <casantos@datacom.ind.br>
> > Cc: buildroot at buildroot.org, "romain naour" <romain.naour@gmail.com>
> > Sent: Wednesday, July 6, 2016 6:54:07 PM
> > Subject: Re: [Buildroot] [PATCH v6] util-linux: rework utilities menu for finer control
> 
> ---8<---
> > I know this is already version 6 of the patch, yet, there are still
> > issues with this patch. It lacked more reviews so far becasue it is too
> > big.
> > 
> > First, it is too big because it groups together at least three different
> > changes:
> > 
> >  - cleanups in the libraries and tools selections: this should be a
> >    patch on its own (but see more comments below);
> > 
> >  - addition of new libs and tools: this should be a second, separate
> >    patch too;
> > 
> >  - addition of the biggish choice: this should be done as a separate
> >    third patch, on its own. Furthemore, it should default to installign
> >    everything (or at least, as much as possible), otherwise the
> >    autobuilders would default to installing nothing, and thus we would
> >    never exercise this package at all.
> ---8<---
> 
> OK, I will split the patch as suggested.

Great, thanks! :-)

> ---8<--- 
> 
> >> +choice
> >> +	prompt "Install utilities"
> >> +	default BR2_PACKAGE_UTIL_LINUX_NO_BINARIES
> >> +
> >> +config BR2_PACKAGE_UTIL_LINUX_NO_BINARIES
> >> +	bool "none"
> >> +	help
> >> +	  Disable all util-linux binaries.
> >> +
> >> +config BR2_PACKAGE_UTIL_LINUX_ALL_BINARIES
> >> +	bool "all"
> >>  	depends on BR2_USE_MMU # fork()
> >> -	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> >> -	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
> >> -	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
> >> -	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> >> +	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID     # findmnt, etc
> >> +	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT     # findmnt, etc
> >> +	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK     # fdisk, etc
> >> +	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS # findmnt, etc
> >> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID      # findmnt, etc
> >> +	select BR2_PACKAGE_LINUX_PAM  # login utils
> >> +	select BR2_PACKAGE_ZLIB  # cramfs
> >> +	select BR2_PACKAGE_NCURSES  # more, setterm, ul
> >> +	select BR2_PACKAGE_LIBCAP_NG  # setpriv
> >> +	help
> >> +	  Install the complete set of util-linux binaries.
> >> +
> >> +config BR2_PACKAGE_UTIL_LINUX_BINARIES
> >> +	bool "custom"
> >>  	help
> >> -	  Install the basic set of util-linux binaries.
> >> +	  Manually select which util-linux binaries to install.
> >> +
> >> +endchoice
> > 
> > As said above, this choice would default to "none", which is not nice
> > for the user (if util-linux is selected, surely the user wants things
> > from it). It laso means the autobuilders (which can't randomise the
> > choices) would never really test util-linux.
> 
> I can make "basic set" the default but this will be different from the
> current default and potentally conflict with busybox. Remember that
> installing only the libraries is a valid option because other packages
> require them (bcache-tools, btrfs-progs, e2fsprogs, efl, eudev,
> systemd and xfsprogs select BR2_PACKAGE_UTIL_LINUX_LIBBLKID).

[please wrap your lines at ~80 chars]

See below for my stake on this...

> > So, it should default to "all". And I think the entries should be
> > re-orderd, like that:
> > 
> >    all
> >    none
> >    custom
> > 
> >>  if BR2_PACKAGE_UTIL_LINUX_BINARIES
> >>  
> >> +config BR2_PACKAGE_UTIL_LINUX_BASIC_SET
> >> +	bool "Basic set"
> > 
> > Would it make sense to have this in the choice?
> > 
> >    all
> >    basic set
> >    none
> >    custom
> 
> The problem is that both "all" and "custom" are supersets of "basic
> set".

Hmm... So it is not possible to install a custom list that does not
include the basic set?

> I will look for a better way to group them.

Well, in light of what you explained above, I'm indeed no longer so sure
what should be the default.

However, I would argue that we add new options to existing packages
every now and then, especially implicit options.

For example, consider an hypotetical package bar that has an optional
dependency on libfoo. We first package bar but not libnfoo, so we have
--disable-libfoo (e.g. because there is a bug or whatever) and we do a
release of Buidlroot with just bar. Now, months later, someone fixes
that bug (or bumps the pcakges or whatever) and adds this optional
implicit dependency of bar to libfoo and passes the correct
--enable-libfoo, then we do a new release of Buidlroot.

Someone with a configuration for the previous release will see a
different behaviour of bar, possibly with an extra size impact on the
rootfs, when updating to the next release.

Yes, we do change such things between releases. No, we do not guarantee
exact (feature-wise) reproducible builds between releases (not that we
could, even if we wanted).

All we try to guarantee is that we only "add", and not "remove",
features and behaviour. Yes, we _try_, which means sometimes we can't
(or fail to).

So, I for one would be rather fine if the default would change over to
"all" (as long as BUSYBOX_SHOW_OTHERS is enabled, of course).

> >> +	default y
> >> +	depends on BR2_USE_MMU # fork() (dmesg, flock, script, setsid, swapon)
> >> +	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID     # findmnt, etc
> >> +	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT     # findmnt, etc
> >> +	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK     # fdisk, etc
> >> +	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS # findmnt, etc
> >> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID      # findmnt, etc
> >> +	help
> >> +	  Install a basic set of util-linux binaries.
> >> +
> >> +	  blkdiscard, blkid, blockdev, chcpu, col, colcrt, colrm,
> >> +	  column, ctrlaltdel, dmesg, fdisk, findfs, findmnt, flock,
> >> +	  fsfreeze, fstrim, getopt, hexdump, ipcmk, isosize, ldattach,
> >> +	  look, lsblk, lscpu, lsipc, lslocks, lsns, mcookie, mkfs,
> >> +	  mkswap, namei, prlimit, readprofile, renice, rev, rtcwake,
> >> +	  script, scriptreplay, setarch, setsid, sfdisk, swaplabel,
> >> +	  swapoff, swapon, tailf, uuidgen, whereis, wipefs
> > 
> > Is this list supposed to change between version of util-linux?
> > I don't think we should assume it would not.
> > 
> > This will make it rather difficult to maintain that list when bumping to
> > a new version.
> > 
> > I would suggest that we do not mention that list at all (unless there is
> > a super-easy way to get it just by extracting the source of util-linux).
> 
> It is easy to obtain. Just choose the basic set, make run
> 
>     $ make util-linux-dirclean util-linux
>     $ make util-linux-reinstall TARGET_DIR=/tmp/util-linux-target
>     $ echo $(find /tmp/util-linux-target/{usr/,}{s,}bin -type f | sed -e 's:.*/::g'|sort)|sed 's/ /, /g'

Meh...

When I said "super-easy" I really meant it, like:

    sed -e -r '/^BASIC_SET = (.*)/!d; s//\1/' configure.ac

(or whatever, something really trivial)

Regards,
Yann E. MORIN.

> > I've stopped reviewing here, becasue all the following changes are
> > partly due to each of the three changes your patch does.
> > 
> > Could you please split it on three, as explained above, and respin?
> > 
> > To be honest, I'm not sure if the biggish choice will eventually land,
> > but at least the fixups and the additions of new libs and tools will.
> 
> Thanks for the review!
> 
> Carlos Santos (Casantos)
> DATACOM, P&D

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
