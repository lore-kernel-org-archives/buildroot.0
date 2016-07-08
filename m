From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 8 Jul 2016 17:33:05 -0300 (BRT)
Subject: [Buildroot] [PATCH v6] util-linux: rework utilities menu for
 finer control
In-Reply-To: <20160706215407.GF3763@free.fr>
References: <1275872201.8394962.1467773032223.JavaMail.zimbra@datacom.ind.br>
 <1467773719-10013-1-git-send-email-casantos@datacom.ind.br>
 <20160706215407.GF3763@free.fr>
Message-ID: <903784225.9298241.1468009985372.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: buildroot at buildroot.org, "romain naour" <romain.naour@gmail.com>
> Sent: Wednesday, July 6, 2016 6:54:07 PM
> Subject: Re: [Buildroot] [PATCH v6] util-linux: rework utilities menu for finer control

---8<---
> I know this is already version 6 of the patch, yet, there are still
> issues with this patch. It lacked more reviews so far becasue it is too
> big.
> 
> First, it is too big because it groups together at least three different
> changes:
> 
>  - cleanups in the libraries and tools selections: this should be a
>    patch on its own (but see more comments below);
> 
>  - addition of new libs and tools: this should be a second, separate
>    patch too;
> 
>  - addition of the biggish choice: this should be done as a separate
>    third patch, on its own. Furthemore, it should default to installign
>    everything (or at least, as much as possible), otherwise the
>    autobuilders would default to installing nothing, and thus we would
>    never exercise this package at all.
---8<---

OK, I will split the patch as suggested.

---8<--- 

>> +choice
>> +	prompt "Install utilities"
>> +	default BR2_PACKAGE_UTIL_LINUX_NO_BINARIES
>> +
>> +config BR2_PACKAGE_UTIL_LINUX_NO_BINARIES
>> +	bool "none"
>> +	help
>> +	  Disable all util-linux binaries.
>> +
>> +config BR2_PACKAGE_UTIL_LINUX_ALL_BINARIES
>> +	bool "all"
>>  	depends on BR2_USE_MMU # fork()
>> -	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
>> -	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
>> -	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
>> -	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>> +	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID     # findmnt, etc
>> +	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT     # findmnt, etc
>> +	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK     # fdisk, etc
>> +	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS # findmnt, etc
>> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID      # findmnt, etc
>> +	select BR2_PACKAGE_LINUX_PAM  # login utils
>> +	select BR2_PACKAGE_ZLIB  # cramfs
>> +	select BR2_PACKAGE_NCURSES  # more, setterm, ul
>> +	select BR2_PACKAGE_LIBCAP_NG  # setpriv
>> +	help
>> +	  Install the complete set of util-linux binaries.
>> +
>> +config BR2_PACKAGE_UTIL_LINUX_BINARIES
>> +	bool "custom"
>>  	help
>> -	  Install the basic set of util-linux binaries.
>> +	  Manually select which util-linux binaries to install.
>> +
>> +endchoice
> 
> As said above, this choice would default to "none", which is not nice
> for the user (if util-linux is selected, surely the user wants things
> from it). It laso means the autobuilders (which can't randomise the
> choices) would never really test util-linux.

I can make "basic set" the default but this will be different from the current default and potentally conflict with busybox. Remember that installing only the libraries is a valid option because other packages require them (bcache-tools, btrfs-progs, e2fsprogs, efl, eudev, systemd and xfsprogs select BR2_PACKAGE_UTIL_LINUX_LIBBLKID).

> So, it should default to "all". And I think the entries should be
> re-orderd, like that:
> 
>    all
>    none
>    custom
> 
>>  if BR2_PACKAGE_UTIL_LINUX_BINARIES
>>  
>> +config BR2_PACKAGE_UTIL_LINUX_BASIC_SET
>> +	bool "Basic set"
> 
> Would it make sense to have this in the choice?
> 
>    all
>    basic set
>    none
>    custom

The problem is that both "all" and "custom" are supersets of "basic set". I will look for a better way to group them.

>> +	default y
>> +	depends on BR2_USE_MMU # fork() (dmesg, flock, script, setsid, swapon)
>> +	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID     # findmnt, etc
>> +	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT     # findmnt, etc
>> +	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK     # fdisk, etc
>> +	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS # findmnt, etc
>> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID      # findmnt, etc
>> +	help
>> +	  Install a basic set of util-linux binaries.
>> +
>> +	  blkdiscard, blkid, blockdev, chcpu, col, colcrt, colrm,
>> +	  column, ctrlaltdel, dmesg, fdisk, findfs, findmnt, flock,
>> +	  fsfreeze, fstrim, getopt, hexdump, ipcmk, isosize, ldattach,
>> +	  look, lsblk, lscpu, lsipc, lslocks, lsns, mcookie, mkfs,
>> +	  mkswap, namei, prlimit, readprofile, renice, rev, rtcwake,
>> +	  script, scriptreplay, setarch, setsid, sfdisk, swaplabel,
>> +	  swapoff, swapon, tailf, uuidgen, whereis, wipefs
> 
> Is this list supposed to change between version of util-linux?
> I don't think we should assume it would not.
> 
> This will make it rather difficult to maintain that list when bumping to
> a new version.
> 
> I would suggest that we do not mention that list at all (unless there is
> a super-easy way to get it just by extracting the source of util-linux).


It is easy to obtain. Just choose the basic set, make run

    $ make util-linux-dirclean util-linux
    $ make util-linux-reinstall TARGET_DIR=/tmp/util-linux-target
    $ echo $(find /tmp/util-linux-target/{usr/,}{s,}bin -type f | sed -e 's:.*/::g'|sort)|sed 's/ /, /g'

> I've stopped reviewing here, becasue all the following changes are
> partly due to each of the three changes your patch does.
> 
> Could you please split it on three, as explained above, and respin?
> 
> To be honest, I'm not sure if the biggish choice will eventually land,
> but at least the fixups and the additions of new libs and tools will.

Thanks for the review!

Carlos Santos (Casantos)
DATACOM, P&D
