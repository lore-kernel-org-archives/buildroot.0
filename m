Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA363C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 23:08:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 388ED613A5
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 23:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 388ED613A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gallagher.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFD60415F5;
	Tue, 28 Sep 2021 23:08:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I_Sy8YabiTsF; Tue, 28 Sep 2021 23:08:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A6F2415F2;
	Tue, 28 Sep 2021 23:08:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 06E2B1BF2F3
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 23:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1CB460BA2
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 23:08:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uSWKVKytdRCF for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 23:08:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.gallagher.co.nz (mail.gallagher.co.nz [203.167.229.98])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E6DDB60BA1
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 23:08:20 +0000 (UTC)
Received: from gglnzdom1.gallagher.local (Not Verified[172.16.0.58]) by
 mail.gallagher.co.nz (using TLS: TLSv1.2, ECDHE-RSA-AES256-GCM-SHA384)
 id <B6153a0620000>; Wed, 29 Sep 2021 12:08:18 +1300
Received: from GNZ-PC2807.gallagher.local ([10.70.3.151])
 by gglnzdom1.gallagher.local with ESMTP id 2021092912081871-1084530 ;
 Wed, 29 Sep 2021 12:08:18 +1300 
From: Ankur Tyagi <ankur.tyagi@gallagher.com>
To: buildroot@buildroot.org
Date: Wed, 29 Sep 2021 12:08:13 +1300
Message-Id: <20210928230813.1112-1-ankur.tyagi@gallagher.com>
MIME-Version: 1.0
X-TNEFEvaluated: 1
X-SEG-SpamProfiler-Analysis: v=2.3 cv=A8gSwJeG c=1 sm=1 tr=0
 a=qhWWnufYDz1ULA0Yxl8pUQ==:117 a=7QKq2e-ADPsA:10 a=uwzVE2XeAAAA:8
 a=VIeezxuA3L7tdetxsesA:9 a=56Ks2SYG_ayP3Q2IVBAz:22
X-SEG-SpamProfiler-Score: 0
Subject: [Buildroot] [PATCH v2 1/1] package/libusb: compile with -fPIC when
 BR2_PIC_PIE is set
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
Cc: Ankur Tyagi <ankur.tyagi@gallagher.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Otherwise build fails with following error:
Toolchain wrapper executing: '/tools/arm-unknown-linux-gnueabi/bin//arm-unknown-linux-gnueabi-gcc' '--sysroot' '/home/user/work/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot' '-mabi=aapcs-linux' '-msoft-float' '-marm' '-fstack-protector-strong' '-march=armv5te' '-msoft-float' '-mfpu=vfp' '-mfloat-abi=soft' '-mcpu=arm926ej-s' '-fPIE' '-Wl,-z,now' '-Wl,-z,relro' '-shared' '.libs/core.o' '.libs/descriptor.o' '.libs/hotplug.o' '.libs/io.o' '.libs/strerror.o' '.libs/sync.o' 'os/.libs/events_posix.o' 'os/.libs/threads_posix.o' 'os/.libs/linux_usbfs.o' 'os/.libs/linux_netlink.o' '-lpthread' '-pthread' '-Os' '-g2' '-pthread' '-Wl,-soname' '-Wl,libusb-1.0.so.0' '-o' '.libs/libusb-1.0.so.0.3.0'
/tools/arm-unknown-linux-gnueabi/bin/../lib/gcc/arm-unknown-linux-gnueabi/7.3.0/../../../../arm-unknown-linux-gnueabi/bin/ld: os/.libs/threads_posix.o(.text+0x284): R_ARM_TLS_LE32 relocation not permitted in shared object
os/.libs/threads_posix.o: In function `usbi_get_tid':
/home/user/work/buildroot/output/build/libusb-1.0.24/libusb/os/threads_posix.c:129:(.text+0x284): dangerous relocation: unsupported relocation
collect2: error: ld returned 1 exit status
Makefile:584: recipe for target 'libusb-1.0.la' failed
make[4]: *** [libusb-1.0.la] Error 1

Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>

---
Changes v1 -> v2:
- Removed wrong config option

Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
---
 package/libusb/libusb.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 28efcadefc..2c07a0e2dc 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -34,5 +34,10 @@ endef
 LIBUSB_POST_INSTALL_TARGET_HOOKS += LIBUSB_INSTALL_TARGET_EXAMPLES
 endif
 
+ifeq ($(BR2_PIC_PIE),y)
+LIBUSB_CFLAGS += -fPIC
+LIBUSB_CONF_OPTS += CFLAGS="$(LIBUSB_CFLAGS)"
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.25.1

###########################################################################
This email is confidential and may contain information subject to legal 
privilege.  If you are not the intended recipient please advise us of our
error by return e-mail then delete this email and any attached files.  
You may not copy, disclose or use the contents in any way.  

The views expressed in this email may not be those of Gallagher Group 
Ltd or subsidiary companies thereof.
###########################################################################
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
