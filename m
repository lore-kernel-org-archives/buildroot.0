From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 Jun 2013 23:30:02 +0200
Subject: [Buildroot] [PATCH 1/1] ti-gfx: add new package
In-Reply-To: <1372452103-14337-1-git-send-email-spenser@gillilanding.com>
References: <1372452103-14337-1-git-send-email-spenser@gillilanding.com>
Message-ID: <20130628213002.GE3165@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Spenser, All,

On 2013-06-28 15:41 -0500, Spenser Gilliland spake thusly:
> This is the first patch for the TI Graphics SDK in Buildroot.  Please review
> and try this on your own boards.

Just a very quick review with obvious comments.

[--SNIP--]
> diff --git a/package/ti-gfx/S80ti-gfx b/package/ti-gfx/S80ti-gfx
> new file mode 100644
> index 0000000..4e0b32b
> --- /dev/null
> +++ b/package/ti-gfx/S80ti-gfx
> @@ -0,0 +1,45 @@
> +#!/bin/sh
> +
> +case "$1" in 
> +start)
> +	echo "ti-gfx: starting pvr driver"
> +
> +	BITSPERPIXEL="$(fbset | grep geom | awk '{print $6}')"
> +	YRES="$(fbset | grep geom | awk '{print $3}')"

Why grep+awk?
	BITSPERPIXEL="$(fbset |awk '$0~/geom/ {print $6}')"
	YRES="$(fbset |awk '$0~/geom/ {print $3}')"

> +	# Set RGBA ordering to something the drivers like
> +	if [ "$BITSPERPIXEL" = "32" ] ; then
> +		fbset -rgba 8/16,8/8,8/0,8/24
> +	fi
> +	# Try to enable triple buffering when there's enough VRAM
> +	fbset -vyres $(expr $YRES \* 3)

Use shell maths, it's faster than spwaning 'expr':
        fbset -vyres $((YRES*3))

> +	modprobe omaplfb
> +	modprobe bufferclass_ti
> +
> +	pvr_maj=`grep "pvrsrvkm$" /proc/devices | cut -b1,2,3`
> +	bc_maj=`grep "bc" /proc/devices | cut -b1,2,3`

Easier with awk:
        pvr_maj=$( awk '$2=="pvrsrvkm" { print $1; }' )
Ditto bc_maj.

Are those two majors unpredictable?

If the majors are predicatble, then please, use TI_GFX_DEVICES, see:
        http://buildroot.net/downloads/manual/manual.html#generic-package-reference
and search for LIBFOO_DEVICES

Summarizing our discussion on IRC:
  - the device major is unpredictable
  - the device node in /dev is created automatically by udev/mdev/devtmpfs
  - the device node needs to be created at runtime for static /dev, as
    the major is unpredictable


You don't seem to do anything with bc_maj, BTW.

> + clean:
> + 	@find . -name "*.o" -exec rm -r {} \;
> + 	@find . -name "*.ko" -exec rm -r {} \;
> diff --git a/package/ti-gfx/ti-gfx-newclkapi.patch b/package/ti-gfx/ti-gfx-newclkapi.patch
> new file mode 100644
> index 0000000..6ace119
> --- /dev/null
> +++ b/package/ti-gfx/ti-gfx-newclkapi.patch

Please, add a commit log and your SoB-line.
If you're not the author, add the origin to the commit-log, and you
SoB-line anyway.

BTW, a SoB-line is not about authorship, it's about who the patch passed
through:
    http://elinux.org/Developer_Certificate_Of_Origin
    http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches#n297

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
