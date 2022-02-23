Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FF7C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 11:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1234D4150F;
	Wed, 23 Feb 2022 11:30:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DbS3gvGTvkfF; Wed, 23 Feb 2022 11:30:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C9AE410E1;
	Wed, 23 Feb 2022 11:30:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5AFB91BF9BA
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 11:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4899B82656
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 11:30:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fiedNOF7-Hm9 for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 11:30:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE4A782612
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 11:30:42 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id 97991CD241EF;
 Wed, 23 Feb 2022 12:30:40 +0100 (CET)
MIME-Version: 1.0
Date: Wed, 23 Feb 2022 11:30:40 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: William Tambe <tambewilliam@gmail.com>
In-Reply-To: <mailman.17975.1645600292.66748.buildroot@buildroot.org>
References: <mailman.17975.1645600292.66748.buildroot@buildroot.org>
Message-ID: <256f0da3b8d983a84ea84de250c56bb0@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.5 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] STAGING_DIR does not contain executables found in
 TARGET_DIR
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi William,

On 2022-02-23 07:11, William Tambe <tambewilliam@gmail.com> wrote:

> Please help determining why STAGING_DIR does not contain executables
> found in TARGET_DIR ?
> 
> I am expecting to find debug version of all executables in TARGET_DIR,
> but executables such as /bin/busybox are missing from STAGING_DIR .

If you look at your packages' definition (.mk) files, you will find a 
few with *_INSTALL_STAGING = YES. This is responsible for the 
(additional) installation in STAGING_DIR. The reason for this is that 
some packages need to provide information during the build process, that 
is not needed later for operation on the target. To save space on the 
target system, a two-stage approach is used.

Example: your configuration includes zlib-ng: the library itself is 
present both in STAGING_DIR and in TARGET_DIR, header and 
ldconfig-related files will be found in STAGING_DIR only.  On the other 
hand, Busybox is not referenced by other packages (it does not export 
any interfaces), so it does not have an installation in STAGING_DIR.

Your target binaries will be stripped of symbols, unless you prevent 
this via BR2_STRIP_EXCLUDE_{FILE, DIRS} ...

Remote debugging has less impact on your target installation. For this 
you would need BR2_PACKAGE_HOST_GDB and BR2_PACKAGE_GDB_SERVER [1].

Kind regards,
Andreas

> I am using 2021.08.3
> 
> Full config is as follow
> ```
> BR2_pu32=y
> BR2_ENABLE_DEBUG=y
> BR2_DEBUG_3=y
> BR2_STATIC_LIBS=y
> BR2_FORTIFY_SOURCE_NONE=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_PATH="/opt/pu32-toolchain/"
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="$(ARCH)-elf"
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_5=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_SSP is not set
> # BR2_TOOLCHAIN_EXTERNAL_INET_RPC is not set
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_TARGET_GENERIC_ISSUE=""
> BR2_ROOTFS_MERGED_USR=y
> BR2_TARGET_GENERIC_ROOT_PASSWD="root"
> BR2_SYSTEM_BIN_SH_BASH=y
> BR2_TARGET_GENERIC_GETTY_TERM="linux"
> BR2_TARGET_GENERIC_GETTY_OPTIONS="-n -l /bin/-bash"
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> BR2_PACKAGE_GDB=y
> BR2_PACKAGE_ZLIB=y
> BR2_PACKAGE_ZLIB_NG=y
> BR2_PACKAGE_DHCP=y
> BR2_PACKAGE_DHCP_CLIENT=y
> BR2_PACKAGE_IPROUTE2=y
> BR2_PACKAGE_LRZSZ=y
> BR2_PACKAGE_SOCAT=y
> BR2_PACKAGE_HTOP=y
> BR2_PACKAGE_NANO=y
> # BR2_PACKAGE_NANO_TINY is not set
> BR2_TARGET_ROOTFS_EXT2=y
> BR2_TARGET_ROOTFS_EXT2_4=y
> BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
> # BR2_TARGET_ROOTFS_TAR is not set
> ```

[1] https://sourceware.org/gdb/current/onlinedocs/gdb/Server.html#Server
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
