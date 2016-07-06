From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 6 Jul 2016 23:54:07 +0200
Subject: [Buildroot] [PATCH v6] util-linux: rework utilities menu for
 finer control
In-Reply-To: <1467773719-10013-1-git-send-email-casantos@datacom.ind.br>
References: <1275872201.8394962.1467773032223.JavaMail.zimbra@datacom.ind.br>
 <1467773719-10013-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20160706215407.GF3763@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2016-07-05 23:55 -0300, Carlos Santos spake thusly:
> When even a single extra util-linux utility is enabled, the
> default build and install will install many more programs,
> including many that overlap with those offered by busybox.
> 
> Fix by reworking the install-utilies menu to take advantage
> of the new --disable-all-programs config option.  This option
> make it possible to disable the basic set of apps, and then
> enable only the desired apps.

Thanks for respining this patch.

I know this is already version 6 of the patch, yet, there are still
issues with this patch. It lacked more reviews so far becasue it is too
big.

First, it is too big because it groups together at least three different
changes:

  - cleanups in the libraries and tools selections: this should be a
    patch on its own (but see more comments below);

  - addition of new libs and tools: this should be a second, separate
    patch too;

  - addition of the biggish choice: this should be done as a separate
    third patch, on its own. Furthemore, it should default to installign
    everything (or at least, as much as possible), otherwise the
    autobuilders would default to installing nothing, and thus we would
    never exercise this package at all.

Basically, the idea is that each patch is a separate, autonomous, atomic
and semantically-unique change. In your big patch, there are things that
are not controversial (fixing dependencies, adding new libs and tools),
whiel the choice is more prone to discussion.

Having the non-controversial changes as separate patches means those can
be applied (relatively) quickly, thus reducing the amount of maintenance
of the changes on your side.

> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
[--SNIP--]
> diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
> index 429dfa7..3a56f7c 100644
> --- a/package/util-linux/Config.in
> +++ b/package/util-linux/Config.in
> @@ -12,22 +12,30 @@ menuconfig BR2_PACKAGE_UTIL_LINUX
>  if BR2_PACKAGE_UTIL_LINUX
>  
>  config BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> -	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> -	depends on BR2_USE_MMU # fork
>  	bool "libblkid"
> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> +	depends on BR2_USE_MMU # fork()

While you are at it, move the depends before the selects:

    config BR2_PACKAGE_UTIL_LINUX_LIBBLKID
        bool "libblkid"
        depends on BR2_USE_MMU # fork()
        select BR2_PACKAGE_UTIL_LINUX_LIBUUID

This kind of fixups should be in the first patch.

>  	help
>  	  Install libblkid.
>  
> -config BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
> +config BR2_PACKAGE_UTIL_LINUX_LIBFDISK

Here, you ar adding a new library: it should be part of the second
patch.

[--SNIP--]
> +choice
> +	prompt "Install utilities"
> +	default BR2_PACKAGE_UTIL_LINUX_NO_BINARIES
> +
> +config BR2_PACKAGE_UTIL_LINUX_NO_BINARIES
> +	bool "none"
> +	help
> +	  Disable all util-linux binaries.
> +
> +config BR2_PACKAGE_UTIL_LINUX_ALL_BINARIES
> +	bool "all"
>  	depends on BR2_USE_MMU # fork()
> -	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> -	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
> -	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
> -	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> +	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID     # findmnt, etc
> +	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT     # findmnt, etc
> +	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK     # fdisk, etc
> +	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS # findmnt, etc
> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID      # findmnt, etc
> +	select BR2_PACKAGE_LINUX_PAM  # login utils
> +	select BR2_PACKAGE_ZLIB  # cramfs
> +	select BR2_PACKAGE_NCURSES  # more, setterm, ul
> +	select BR2_PACKAGE_LIBCAP_NG  # setpriv
> +	help
> +	  Install the complete set of util-linux binaries.
> +
> +config BR2_PACKAGE_UTIL_LINUX_BINARIES
> +	bool "custom"
>  	help
> -	  Install the basic set of util-linux binaries.
> +	  Manually select which util-linux binaries to install.
> +
> +endchoice

As said above, this choice would default to "none", which is not nice
for the user (if util-linux is selected, surely the user wants things
from it). It laso means the autobuilders (which can't randomise the
choices) would never really test util-linux.

So, it should default to "all". And I think the entries should be
re-orderd, like that:

    all
    none
    custom

>  if BR2_PACKAGE_UTIL_LINUX_BINARIES
>  
> +config BR2_PACKAGE_UTIL_LINUX_BASIC_SET
> +	bool "Basic set"

Would it make sense to have this in the choice?

    all
    basic set
    none
    custom

> +	default y
> +	depends on BR2_USE_MMU # fork() (dmesg, flock, script, setsid, swapon)
> +	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID     # findmnt, etc
> +	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT     # findmnt, etc
> +	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK     # fdisk, etc
> +	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS # findmnt, etc
> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID      # findmnt, etc
> +	help
> +	  Install a basic set of util-linux binaries.
> +
> +	  blkdiscard, blkid, blockdev, chcpu, col, colcrt, colrm,
> +	  column, ctrlaltdel, dmesg, fdisk, findfs, findmnt, flock,
> +	  fsfreeze, fstrim, getopt, hexdump, ipcmk, isosize, ldattach,
> +	  look, lsblk, lscpu, lsipc, lslocks, lsns, mcookie, mkfs,
> +	  mkswap, namei, prlimit, readprofile, renice, rev, rtcwake,
> +	  script, scriptreplay, setarch, setsid, sfdisk, swaplabel,
> +	  swapoff, swapon, tailf, uuidgen, whereis, wipefs

Is this list supposed to change between version of util-linux?
I don't think we should assume it would not.

This will make it rather difficult to maintain that list when bumping to
a new version.

I would suggest that we do not mention that list at all (unless there is
a super-easy way to get it just by extracting the source of util-linux).

I've stopped reviewing here, becasue all the following changes are
partly due to each of the three changes your patch does.

Could you please split it on three, as explained above, and respin?

To be honest, I'm not sure if the biggish choice will eventually land,
but at least the fixups and the additions of new libs and tools will.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
