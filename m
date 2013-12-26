From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 26 Dec 2013 14:33:44 +0100
Subject: [Buildroot] [PATCH] Add Armadeus systems APF51 SOM basic
	support.
In-Reply-To: <52BC23C9.3070308@free.fr>
References: <1388051094-3666-1-git-send-email-julien.boibessot@free.fr>
 <20131226105121.4694c243@skate> <52BC23C9.3070308@free.fr>
Message-ID: <20131226133344.GA3398@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

On 2013-12-26 13:40 +0100, Julien Boibessot spake thusly:
> On 12/26/2013 10:51 AM, Thomas Petazzoni wrote:
> > On Thu, 26 Dec 2013 10:44:54 +0100, julien.boibessot at free.fr wrote:
> >> From: Julien Boibessot <julien.boibessot@armadeus.com>
> >>
> >> Buildroot uClibc toolchain, UBIFS rootfs, linux kernel (board is mainlined).
> >>
> >> Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
[--SNIP--]
> >> --- /dev/null
> >> +++ b/board/armadeus/post-image.sh
> >> @@ -0,0 +1,20 @@
> >> +#!/bin/sh
> >> +#
> >> +# arg1: BR images dir
> >> +# arg2: board name
> >> +# arg3: i.MX processor type
> >> +
> >> +# images renaming according to board name
> >> +if [ "$2" != "" ]; then
> >> +	for rootfstype in ubi ubifs tar jffs2; do
> >> +		if [ -f "$1/rootfs.$rootfstype" ]; then
> >> +			mv -u $1/rootfs.$rootfstype $1/$2-rootfs.$rootfstype
> >> +		fi
> >> +	done
> >> +	if [ -f "$1/uImage" ]; then
> >> +		mv -u $1/uImage $1/$2-linux.bin
> >> +	fi
> >> +	if [ -f "$1/$3-$2dev.dtb" ]; then
> >> +		mv -u $1/$3-$2dev.dtb $1/$2.dtb
> >> +	fi
> >> +fi
> > Why do we want this? We don't do this for any of the boards in
> > Buildroot, and I'm not sure to see why the apf51 should be different
> > here.
[--SNIP--]
> yes but images still all have the same name and we have accustomed our
> (non expert) users to recognize their board images with their name
> prefix. Our U-Boot update scripts are common to all of our boards and
> require the images are prefixed with board name. (For example, our
> U-Boot look after /tftpboot/apf27-linux.bin instead of
> /tftpboot/apf27/uimage.)
> 
> I you don't want us to rename images automatically, I can keep the
> instructions in our installation documentation and remove post-image.sh.
> Let me know and I will submit a v2 of the patch.

Since you describe this as a site-specific behaviour, there is no reason
for it to be upstream Buildroot.

You can however add a board/armadeus/README with a little explanations
that all boards will be named the same.

If you really need that script, you can carry it in your local tree, or
even better yet, in your BR2_EXTERNAL tree, and have your own armadeus
deconfigs that reference that script, as:
BR2_ROOTFS_POST_IMAGE_SCRIPT="$(BR2_EXTERNAL)/board/armadeus/post-image.sh"

> But just one more question: what is the purpose of
> BR2_ROOTFS_POST_IMAGE_SCRIPT, if it isn't meant to move/rename images to
> fit targeted boards ?

It is mostly for site-local customisations, that can't really be
upstreamed in Buildroot since they are not generic.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
