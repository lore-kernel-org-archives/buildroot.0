From: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
Date: Fri, 11 Aug 2017 16:09:38 -0400 (EDT)
Subject: [Buildroot] [PATCH v2 1/1] configs: add defconfig for TS-7680
In-Reply-To: <20170811153934.5efac50e@windsurf>
References: <20170810221411.4324-1-julien.grossholtz@savoirfairelinux.com>
 <20170811153934.5efac50e@windsurf>
Message-ID: <1579641247.257204.1502482178572.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

----- Mail original -----
> De: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> ?: "Julien Grossholtz" <julien.grossholtz@gmail.com>
> Cc: "Julien Grossholtz" <julien.grossholtz@savoirfairelinux.com>, buildroot at buildroot.org
> Envoy?: Vendredi 11 Ao?t 2017 09:39:34
> Objet: Re: [Buildroot] [PATCH v2 1/1] configs: add defconfig for TS-7680

> Hello,
> 
> On Thu, 10 Aug 2017 18:14:11 -0400, Julien Grossholtz wrote:
> 
>>  board/technologic/ts7680/genimage.cfg              |  14 +
>>  ...LLVMLinux-use-static-inline-in-ARM-ftrace.patch |  52 +++
>>  ...ux-Change-extern-inline-to-static-inline-.patch |  59 ++++
>>  ...c-integrate-the-various-compiler-gcc-345-.patch | 367 +++++++++++++++++++++
> 
> What are the chances of getting these patches merged "upstream" by the
> board vendor ? It's not really nice if we have to keep these patches
> forever.

I will ask if it is OK for them.

> 
>> diff --git a/board/technologic/ts7680/post-image.sh
>> b/board/technologic/ts7680/post-image.sh
>> new file mode 100755
>> index 0000000..c3f5a4a
>> --- /dev/null
>> +++ b/board/technologic/ts7680/post-image.sh
>> @@ -0,0 +1,17 @@
>> +#!/bin/bash
>> +#
>> +# Copyright (C) 2017 Savoir-faire Linux, Inc.
>> +# Post image generation script.
>> +
>> +BOARD_DIR="$(dirname $0)"
>> +GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
>> +GENIMAGE_TMP=${BUILD_DIR}/.genimage_tmp
>> +
>> +rm -rf ${GENIMAGE_TMP}
>> +
>> +${HOST_DIR}/usr/bin/genimage \
>> +        --config ${GENIMAGE_CFG} \
>> +        --rootpath ${TARGET_DIR} \
>> +        --tmppath ${GENIMAGE_TMP} \
>> +        --inputpath $BINARIES_DIR \
>> +        --outputpath $BINARIES_DIR
> 
> This script is not needed, you can use support/scripts/genimage.sh
> instead.

I will do this, good to know.

> 
> 
>> diff --git a/configs/ts7680_defconfig b/configs/ts7680_defconfig
>> new file mode 100644
>> index 0000000..df4e8f3
>> --- /dev/null
>> +++ b/configs/ts7680_defconfig
>> @@ -0,0 +1,20 @@
>> +BR2_arm=y
>> +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> 
> Why do you select glibc, and leave Buildroot default ?

I can switch back to default config, there is no special need for the glibc.

> 
>> +BR2_KERNEL_HEADERS_VERSION=y
>> +BR2_DEFAULT_KERNEL_VERSION="3.14.28"
>> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
>> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/technologic/ts7680/post-image.sh"
> 
> As said above, you can use support/scripts/genimage.sh instead.
> 
> Thanks!
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Thank you for the review! I will send a new version once I know if it is possible to merge the
Linux patches into the Technologic Systems github repository.


Julien
