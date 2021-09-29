Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E32C433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 00:07:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9170B613B1
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 00:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9170B613B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gallagher.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3279140004;
	Wed, 29 Sep 2021 00:07:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i3AQ1tofL2cS; Wed, 29 Sep 2021 00:07:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 386954045A;
	Wed, 29 Sep 2021 00:07:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 09BF11BF5AC
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 00:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED82D60B00
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 00:07:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pMxIfULF6Xel for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 00:07:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.gallagher.co.nz (mail.gallagher.co.nz [203.167.229.98])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B7DC60799
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 00:07:41 +0000 (UTC)
Received: from gglnzdom1.gallagher.local (Not Verified[172.16.0.58]) by
 mail.gallagher.co.nz (using TLS: TLSv1.2, ECDHE-RSA-AES256-GCM-SHA384)
 id <B6153ae4b0000>; Wed, 29 Sep 2021 13:07:39 +1300
Received: from GNZ-PC2807.gallagher.local ([10.70.3.151])
 by gglnzdom1.gallagher.local with ESMTP id 2021092913073865-1085693 ;
 Wed, 29 Sep 2021 13:07:38 +1300 
From: Ankur Tyagi <ankur.tyagi@gallagher.com>
To: buildroot@buildroot.org
Date: Wed, 29 Sep 2021 13:07:35 +1300
Message-Id: <20210929000735.1210-1-ankur.tyagi@gallagher.com>
MIME-Version: 1.0
X-TNEFEvaluated: 1
X-SEG-SpamProfiler-Analysis: v=2.3 cv=A8gSwJeG c=1 sm=1 tr=0
 a=qhWWnufYDz1ULA0Yxl8pUQ==:117 a=7QKq2e-ADPsA:10 a=uwzVE2XeAAAA:8
 a=LagCUVnbLj4cb_cBqrsA:9 a=56Ks2SYG_ayP3Q2IVBAz:22
X-SEG-SpamProfiler-Score: 0
Subject: [Buildroot] [PATCH 1/1] package/pcre: compile with -fPIC when
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

Otherwise build fails with following error:
Toolchain wrapper executing: '/tools/aarch64-linux-gnu/bin//aarch64-linux-gnu-g++' '--sysroot' '/home/user/work/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot' '-mabi=lp64' '-fstack-protector-strong' '-fstack-clash-protection' '-mcpu=cortex-a35' '-fPIE' '-Wl,-z,now' '-Wl,-z,relro' '-shared' '-nostdlib' '/home/user/work/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/../lib64/crti.o' '/tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/crtbeginS.o' '.libs/libpcrecpp_la-pcrecpp.o' '.libs/libpcrecpp_la-pcre_scanner.o' '.libs/libpcrecpp_la-pcre_stringpiece.o' '-Wl,-rpath' '-Wl,/home/user/work/buildroot/output/build/pcre-8.44/.libs' './.libs/libpcre.so' '-L/tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0' '-L/tools/aarch64-linux-gnu/bin/../lib/gcc' '-L/tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/lib/../lib64' '-L/home/user/work/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/
 lib/../lib64' '-L/home/user/work/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/../lib64' '-L/tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/lib' '-L/home/user/work/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/lib' '-L/home/user/work/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib' '-lstdc++' '-lm' '-lc' '-lgcc_s' '/tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/crtendS.o' '/home/user/work/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/../lib64/crtn.o' '-Os' '-g2' '-Wl,-soname' '-Wl,libpcrecpp.so.0' '-o' '.libs/libpcrecpp.so.0.0.2'
  CCLD     pcretest
  CCLD     pcregrep
/tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: warning: -z noexecheap ignored
/tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: .libs/libpcrecpp_la-pcrecpp.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `_ZN7pcrecpp3Arg10parse_nullEPKciPv' which may bind externally can not be used when making a shared object; recompile with -fPIC
.libs/libpcrecpp_la-pcrecpp.o: in function `pcrecpp::Arg::Arg(void*)':
/home/user/work/buildroot/output/build/pcre-8.44/./pcrecpparg.h:139:(.text.startup+0x4): dangerous relocation: unsupported relocation
collect2: error: ld returned 1 exit status
Makefile:1568: recipe for target 'libpcrecpp.la' failed
make[3]: *** [libpcrecpp.la] Error 1

Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
---
 package/pcre/pcre.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index 264eaa10c7..cbef01fc59 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -27,5 +27,11 @@ PCRE_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE_32),--enable-pcre32,--disable-pcre32)
 PCRE_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE_UTF),--enable-utf,--disable-utf)
 PCRE_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE_UCP),--enable-unicode-properties,--disable-unicode-properties)
 
+ifeq ($(BR2_PIC_PIE),y)
+PCRE_CFLAGS += -fPIC
+PCRE_CXXFLAGS += -fPIC
+PCRE_CONF_OPTS += CFLAGS="$(PCRE_CFLAGS)" CXXFLAGS="$(PCRE_CXXFLAGS)"
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
