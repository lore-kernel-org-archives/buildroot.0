Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B861D3E773
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 21:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0054280FEF;
	Tue,  5 Nov 2024 21:35:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dP3sv7Vb66sI; Tue,  5 Nov 2024 21:35:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B83380F91
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B83380F91;
	Tue,  5 Nov 2024 21:35:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 19001B8
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 21:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11C0140653
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 21:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ku_XzAQfV7wQ for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 21:35:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 455CE40638
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 455CE40638
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 455CE40638
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 21:35:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id C0C7A60137;
 Tue,  5 Nov 2024 22:35:22 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:60050])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 05 Nov 2024 22:35:22 +0100
MIME-Version: 1.0
Date: Tue, 05 Nov 2024 22:35:22 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20241105095744.60477-2-vjardin@free.fr>
References: <20241105095744.60477-1-vjardin@free.fr>
 <20241105095744.60477-2-vjardin@free.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <aedee4f5789c42dae10d18bc9f9f7c61@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730842523;
 bh=jELw7fu/FtqiSZCUnIvJsuUu1DoZCS3rM13TRqYSJWs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YZeciKUcOC8lxH9qMaKjcrTQwsmNIHYvD7oHp/8pwYO3p149K4k32UV+8P2yt9Yo7
 d2Ug+MKm4g5YZ6RrZDgqZGupJf+WAW6CY8iDCtNXlV5Ucd6TUDrnNWJICqQ2F8r3UB
 /TXyF9RQVYPdRXqwCP+YctclVouJ6WnQd0j3AdiMygprRnOnAe0vc6QUmAFkcW+Ri/
 82v8JACI5iJywK/DJTdxDVEnPq+zoaCKkNLFTutHaSQV+jaK5XHZ4AbLhe6IZBakcv
 xK1bJ7+VqOYxu8DSjZHjfFTARHwISGP3uB22wFCA1DE+TQ89eDM11x0Xa4TrXnTu97
 n4uVmtc6/J2hw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YZeciKUc
Subject: Re: [Buildroot] [PATCH v0 1/1] package/bfscripts: add 3.9.7-1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vincent,

Thanks for this new contribution!

In Buildroot, for new packages the commit log one liner is generally
in the form of:
"package/bfscripts: new package"

Could you reword to that, please?


On 05/11/2024 10:57, Vincent Jardin wrote:
> Bootstrap the installation of Mellanox/NVIDIA Bluefield scripts
> that can be run either on the host CPU or on the onboard ARM64 CPU.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  DEVELOPERS                       |  1 +
>  configs/nvidia_bf3_defconfig     |  3 +++
>  package/Config.in                |  1 +
>  package/bfscripts/Config.in      |  7 +++++++
>  package/bfscripts/S99bfup        | 17 +++++++++++++++++
>  package/bfscripts/bfscripts.hash |  3 +++
>  package/bfscripts/bfscripts.mk   | 29 +++++++++++++++++++++++++++++
>  7 files changed, 61 insertions(+)
>  create mode 100644 package/bfscripts/Config.in
>  create mode 100644 package/bfscripts/S99bfup
>  create mode 100644 package/bfscripts/bfscripts.hash
>  create mode 100644 package/bfscripts/bfscripts.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index edf823b34b..a11e4e580e 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3273,6 +3273,7 @@ 
> F:	support/testing/tests/core/test_root_password.py
>  N:	Vincent Jardin <vjardin@free.fr>
>  F:	board/nvidia/bf3/
>  F:	configs/nvidia_bf3_defconfig
> +F:	package/bfscripts/
>  F:	package/dpdk/
> 
>  N:	Vincent Prince <vincent.prince.fr@gmail.com>
> diff --git a/configs/nvidia_bf3_defconfig 
> b/configs/nvidia_bf3_defconfig
> index 3f958c0062..95054d5b15 100644
> --- a/configs/nvidia_bf3_defconfig
> +++ b/configs/nvidia_bf3_defconfig
> @@ -10,3 +10,6 @@ 
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/nvidia/bf3/linux.config"
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  BR2_TARGET_ROOTFS_INITRAMFS=y
>  # BR2_TARGET_ROOTFS_TAR is not set
> +BR2_PACKAGE_BASH=y
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +BR2_PACKAGE_BFSCRIPTS=y

This commit should only introduce the package. The
nvidia_bf3_defconfig should also remain as it is. The defconfig
files in Buildroot are kept minimal.

I believe this package is not necessary to boot Linux on this board.

Therefore, the selection of this package should be left to the end
user, in his configuration.

Could you remove all the changes in configs/nvidia_bf3_defconfig?

> 
  diff --git a/package/Config.in b/package/Config.in
> index 876b340a8a..d7430287b9 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -475,6 +475,7 @@ endmenu
>  	source "package/apcupsd/Config.in"
>  	source "package/avrdude/Config.in"
>  	source "package/bcache-tools/Config.in"
> +	source "package/bfscripts/Config.in"
>  	source "package/biosdevname/Config.in"
>  	source "package/brickd/Config.in"
>  	source "package/brltty/Config.in"
> diff --git a/package/bfscripts/Config.in b/package/bfscripts/Config.in
> new file mode 100644
> index 0000000000..bdfd45a4ed
> --- /dev/null
> +++ b/package/bfscripts/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_BFSCRIPTS
> +	bool "bfscripts"
> +	select BR2_PACKAGE_BASH
> +	help
> +	  Install bfscripts from Mellanox/NVIDIA.


This description does not give much information on what this package
is doing. Consider something like:
"""
Collection of scripts used for Mellanox/NVIDIA BlueField SoC
system management.
"""

I also see you decided to install a subset of all the available
scripts.

So you could also mention here:
"""
Install the scripts: bfcfg, bfrshlog and bfup.
"""

> +	  https://github.com/Mellanox/bfscripts
> diff --git a/package/bfscripts/S99bfup b/package/bfscripts/S99bfup
> new file mode 100644
> index 0000000000..63a2867dab
> --- /dev/null
> +++ b/package/bfscripts/S99bfup
> @@ -0,0 +1,17 @@
> +#!/bin/sh
> +#
> +# notify to the root PCIe (/dev/rshimN/misc) that Linux is up
> +# and that BF3 boardis ready

                       ^^ there is a missing space here.

> +
> +case "$1" in
> +  start)
> +	printf "bfup: "
> +	/usr/bin/bfup
> +	[ $? = 0 ] && echo "OK" || echo "FAIL"
> +	;;
> +  *)
> +	echo "Usage: $0 {start}"
> +	exit 1
> +esac
> +
> +exit $?

Here, this shell script generates warnings, when using the command
"utils/docker-run make check-package":

     package/bfscripts/S99bfup:7: should be indented with tabs 
(https://nightly.buildroot.org/#adding-packages-start-script)
     package/bfscripts/S99bfup:12: should be indented with tabs 
(https://nightly.buildroot.org/#adding-packages-start-script)
     package/bfscripts/S99bfup:0: DAEMON variable not defined 
(https://nightly.buildroot.org/#adding-packages-start-script)
     package/bfscripts/S99bfup:0: run 'shellcheck' and fix the warnings

Could you fix those, please?


> diff --git a/package/bfscripts/bfscripts.hash 
> b/package/bfscripts/bfscripts.hash
> new file mode 100644
> index 0000000000..05f2966ab9
> --- /dev/null
> +++ b/package/bfscripts/bfscripts.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  
> 92123fcaeb8eb9ba7f296e2457e82f56831c6fd19c1ad1a5949b7bc7d5d0a837  
> bfscripts-3.9.7-1.tar.gz
> +sha256  
> ab52bc4ac5e66e42e0ce14172c4d1d40969919db98cc0e11d2f6178dcc97bf4d  
> LICENSE
> diff --git a/package/bfscripts/bfscripts.mk 
> b/package/bfscripts/bfscripts.mk
> new file mode 100644
> index 0000000000..cb13defb8f
> --- /dev/null
> +++ b/package/bfscripts/bfscripts.mk
> @@ -0,0 +1,29 @@
> +################################################################################
> +#
> +# bfscripts
> +#
> +################################################################################
> +
> +BFSCRIPTS_VERSION = 3.9.7-1
> +BFSCRIPTS_SITE = $(call 
> github,Mellanox,bfscripts,$(BFSCRIPTS_VERSION))
> +BFSCRIPTS_DEPENDENCIES = bash

bash is a runtime dependency on target. BFSCRIPTS_DEPENDENCIES
should only list build dependencies. Since there is none, this line
can be removed.

> +BFSCRIPTS_LICENSE = BSD-2-Clause
> +BFSCRIPTS_LICENSE_FILES = LICENSE
> +
> +BFSCRIPTS_FILES_TO_INSTALL = bfcfg \

For readability, could you format as:

BFSCRIPTS_FILES_TO_INSTALL = \
	bfcfg \
	bfrshlog \
	bfup

> +	bfrshlog \
> +	bfup
> +
> +define BFSCRIPTS_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/bin

There is no need to create the /usr/bin. It should already be present
from the system skeleton. See:
https://gitlab.com/buildroot.org/buildroot/-/tree/master/system/skeleton/usr/bin

> +	$(foreach f,$(BFSCRIPTS_FILES_TO_INSTALL),\
> +		$(INSTALL) -D -m 0755 $(@D)/$(f) $(TARGET_DIR)/usr/bin/$(f)
> +	)
> +endef
> +
> +define BFSCRIPTS_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 755 package/bfscripts/S99bfup \
> +		$(TARGET_DIR)/etc/init.d/S99bfup
> +endef
> +
> +$(eval $(generic-package))
> --
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
