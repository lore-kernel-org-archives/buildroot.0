From: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Date: Sun, 14 Feb 2016 15:59:16 -0300
Subject: [Buildroot] [PATCH 2/3] board/firefly_rk3288: add new board
In-Reply-To: <874mdgs2ps.fsf@dell.be.48ers.dk>
References: <1453478020-311-1-git-send-email-ariel@vanguardiasur.com.ar>
 <1453478020-311-3-git-send-email-ariel@vanguardiasur.com.ar>
 <874mdgs2ps.fsf@dell.be.48ers.dk>
Message-ID: <56C0CE84.50009@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

El 10/02/16 a las 17:57, Peter Korsgaard escribi?:
>>>>>> "Ariel" == Ariel D'Alessandro <ariel@vanguardiasur.com.ar> writes:
> 
>  > More info about the board:
>  > http://en.t-firefly.com/en/firenow/firefly_rk3288/specifications/
> 
>  > Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
>  > ---
>  >  board/firefly/firefly-rk3288/build_sd_image.sh | 18 ++++++++++++
>  >  board/firefly/firefly-rk3288/extlinux.conf     |  6 ++++
>  >  board/firefly/firefly-rk3288/post-image.sh     |  6 ++++
>  >  board/firefly/firefly-rk3288/pre-image.sh      |  3 ++
>  >  board/firefly/firefly-rk3288/readme.txt        | 40 ++++++++++++++++++++++++++
>  >  board/firefly/firefly-rk3288/sd-image.cfg      | 22 ++++++++++++++
> 
> It imho makes sense to squash the defconfig patch together with this
> one.

OK, will squash these patches then.

> 
>>  6 files changed, 95 insertions(+)
>  >  create mode 100755 board/firefly/firefly-rk3288/build_sd_image.sh
>  >  create mode 100644 board/firefly/firefly-rk3288/extlinux.conf
>  >  create mode 100755 board/firefly/firefly-rk3288/post-image.sh
>  >  create mode 100755 board/firefly/firefly-rk3288/pre-image.sh
>  >  create mode 100644 board/firefly/firefly-rk3288/readme.txt
>  >  create mode 100644 board/firefly/firefly-rk3288/sd-image.cfg
> 
>  > diff --git a/board/firefly/firefly-rk3288/build_sd_image.sh b/board/firefly/firefly-rk3288/build_sd_image.sh
>  > new file mode 100755
>  > index 0000000..ae7fde1
>  > --- /dev/null
>  > +++ b/board/firefly/firefly-rk3288/build_sd_image.sh
>  > @@ -0,0 +1,18 @@
>  > +#!/bin/bash
>  > +
>  > +set -ue
>  > +
>  > +D=board/firefly/firefly-rk3288
>  > +CFG=${D}/sd-image.cfg
>  > +
>  > +T=$(mktemp -d)
>  > +mkdir -p $T/{root,tmp}
> 
> Other post-image scripts use ${BUILD_DIR}/genimage.tmp for the temporary
> directory, please do as well.

Will do.

> 
>> +
>  > +$HOST_DIR/usr/bin/genimage		\
>  > +	--rootpath $T/root/			\
>  > +	--tmppath $T/tmp/			\
>  > +	--inputpath $BINARIES_DIR/	\
>  > +	--outputpath $BINARIES_DIR/	\
>  > +	--config ${CFG}				\
>  > +
>  > +rm -rf $T
> 
> All our other defconfigs call genimage directly from post-image.sh, and
> as this is a very small script would prefer to do that here as well.

OK, will do that.

> 
> 
>> diff --git a/board/firefly/firefly-rk3288/extlinux.conf b/board/firefly/firefly-rk3288/extlinux.conf
>  > new file mode 100644
>  > index 0000000..65092d2
>  > --- /dev/null
>  > +++ b/board/firefly/firefly-rk3288/extlinux.conf
>  > @@ -0,0 +1,6 @@
>  > +default firefly-rk3288
>  > +
>  > +label firefly-rk3288
>  > +kernel /boot/uImage
>  > +devicetree /boot/rk3288-firefly.dtb
>  > +append console=ttyS2,115200n8 earlyprintk init=/sbin/init root=/dev/mmcblk0p1 rootwait
> 
> why the init=? Is earlyprintk really good to use by default?

None of these options are really needed, so I'll remove them.

> 
> 
>> diff --git a/board/firefly/firefly-rk3288/post-image.sh b/board/firefly/firefly-rk3288/post-image.sh
>  > new file mode 100755
>  > index 0000000..98c2778
>  > --- /dev/null
>  > +++ b/board/firefly/firefly-rk3288/post-image.sh
>  > @@ -0,0 +1,6 @@
>  > +board=board/firefly/firefly-rk3288
> 
> You can use $(dirname $0) instead of hardcoding this.

OK.

> 
> 
>> +MKIMAGE=$HOST_DIR/usr/bin/mkimage
>  > +
>  > +$MKIMAGE -n rk3288 -T rksd -d $BINARIES_DIR/u-boot-spl-dtb.bin $BINARIES_DIR/u-boot-spl-dtb.img
>  > +
>  > +${board}/build_sd_image.sh
>  > diff --git a/board/firefly/firefly-rk3288/pre-image.sh b/board/firefly/firefly-rk3288/pre-image.sh
> 
> Other boards calls this post-build.sh, please use that as well for
> consistency.

OK.

> 
> 
>> new file mode 100755
>  > index 0000000..7770f6b
>  > --- /dev/null
>  > +++ b/board/firefly/firefly-rk3288/pre-image.sh
>  > @@ -0,0 +1,3 @@
>  > +board=board/firefly/firefly-rk3288
> 
> dirname $0 as well here.

OK.

> 
>> +
>  > +install -m 0644 -D $board/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
> 
> You could simply put this in a rootfs overlay and point
> BR2_ROOTFS_OVERLAY to that directory instead of this explicit handling.

Well, if you're OK with this, I'd prefer keeping that as it is now
instead of the overlay.

> 
> Other than that it looks good.
> 

Thanks!

-- 
Ariel D'Alessandro, VanguardiaSur
www.vanguardiasur.com.ar
