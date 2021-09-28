Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8DEC433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 23:19:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C6DF613A9
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 23:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C6DF613A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gallagher.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D05CC40108;
	Tue, 28 Sep 2021 23:19:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LvfUkDuuhocE; Tue, 28 Sep 2021 23:19:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E660340636;
	Tue, 28 Sep 2021 23:19:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A51C1BF2F3
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 23:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3991841582
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 23:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TaavigGybYby for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 23:19:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.gallagher.co.nz (mail.gallagher.co.nz [203.167.229.98])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F65F4148C
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 23:19:44 +0000 (UTC)
Received: from gglnzdom1.gallagher.local (Not Verified[172.16.0.58]) by
 mail.gallagher.co.nz (using TLS: TLSv1.2, ECDHE-RSA-AES256-GCM-SHA384)
 id <B6153a30d0000>; Wed, 29 Sep 2021 12:19:41 +1300
Received: from GNZ-PC2807.gallagher.local ([10.70.3.151])
 by gglnzdom1.gallagher.local with ESMTP id 2021092912194135-1084728 ;
 Wed, 29 Sep 2021 12:19:41 +1300 
From: Ankur Tyagi <ankur.tyagi@gallagher.com>
To: buildroot@buildroot.org
Date: Wed, 29 Sep 2021 12:19:36 +1300
Message-Id: <20210928231936.1161-1-ankur.tyagi@gallagher.com>
MIME-Version: 1.0
X-TNEFEvaluated: 1
X-SEG-SpamProfiler-Analysis: v=2.3 cv=A8gSwJeG c=1 sm=1 tr=0
 a=qhWWnufYDz1ULA0Yxl8pUQ==:117 a=7QKq2e-ADPsA:10 a=uwzVE2XeAAAA:8
 a=Cj0rhF1uM9BG82e3gqUA:9 a=56Ks2SYG_ayP3Q2IVBAz:22
X-SEG-SpamProfiler-Score: 0
Subject: [Buildroot] [PATCH 1/1] package/pcsc-lite: compile with -fPIC when
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
Cc: Ankur Tyagi <ankur.tyagi@gallagher.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Otherwise build fails with following error:Toolchain wrapper executing: '/tools/arm-unknown-linux-gnueabi/bin//arm-unknown-linux-gnueabi-gcc' '--sysroot' '/home/user/work/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot' '-mabi=aapcs-linux' '-msoft-float' '-marm' '-fstack-protector-strong' '-march=armv5te' '-msoft-float' '-mfpu=vfp' '-mfloat-abi=soft' '-mcpu=arm926ej-s' '-fPIE' '-pie' '-Wl,-z,now' '-Wl,-z,relro' '-Wall' '-fno-common' '-D_LARGEFILE_SOURCE' '-D_LARGEFILE64_SOURCE' '-D_FILE_OFFSET_BITS=64' '-Os' '-g2' '-D_FORTIFY_SOURCE=1' '-o' 'pcsc-wirecheck-gen' 'pcsc-wirecheck-gen.o' '-ldl' '-lrt'
/tools/arm-unknown-linux-gnueabi/bin/../lib/gcc/arm-unknown-linux-gnueabi/7.3.0/../../../../arm-unknown-linux-gnueabi/bin/ld: .libs/libpcsclite_la-error.o(.text+0x3bc): R_ARM_TLS_LE32 relocation not permitted in shared object
.libs/libpcsclite_la-error.o: In function `pcsc_stringify_error':
/home/user/work/buildroot/output/build/pcsc-lite-1.9.1/src/error.c:98:(.text+0x3bc): dangerous relocation: unsupported relocation
collect2: error: ld returned 1 exit status
Makefile:703: recipe for target 'libpcsclite.la' failed
make[4]: *** [libpcsclite.la] Error 1

Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
---
 package/pcsc-lite/pcsc-lite.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index 94f38b3d85..510ed2c4a0 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -44,4 +44,9 @@ ifeq ($(PACKAGE_PCSC_LITE_EMBEDDED),y)
 PCSC_LITE_CONF_OPTS += --enable-embedded
 endif
 
+ifeq ($(BR2_PIC_PIE),y)
+PCSC_LITE_CFLAGS += -fPIC
+PCSC_LITE_CONF_OPTS += CFLAGS="$(PCSC_LITE_CFLAGS)"
+endif
+
 $(eval $(autotools-package))
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
