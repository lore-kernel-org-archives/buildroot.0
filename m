Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31279C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 22:03:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B6F46137A
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 22:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B6F46137A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gallagher.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1935E415DD;
	Tue, 28 Sep 2021 22:03:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mm49E8HV8WjS; Tue, 28 Sep 2021 22:03:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 570ED415D7;
	Tue, 28 Sep 2021 22:03:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 123C21BF5DA
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 22:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1D9760B89
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 22:03:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kCyMAernJezn for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 22:03:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.gallagher.co.nz (mail.gallagher.co.nz [203.167.229.98])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBA1260B88
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 22:03:07 +0000 (UTC)
Received: from gglnzdom1.gallagher.local (Not Verified[172.16.0.58]) by
 mail.gallagher.co.nz (using TLS: TLSv1.2, ECDHE-RSA-AES256-GCM-SHA384)
 id <B6153911a0000>; Wed, 29 Sep 2021 11:03:05 +1300
Received: from GNZ-PC2807.gallagher.local ([10.70.3.151])
 by gglnzdom1.gallagher.local with ESMTP id 2021092911030568-1083076 ;
 Wed, 29 Sep 2021 11:03:05 +1300 
From: Ankur Tyagi <ankur.tyagi@gallagher.com>
To: buildroot@buildroot.org
Date: Wed, 29 Sep 2021 11:03:00 +1300
Message-Id: <20210928220300.961-1-ankur.tyagi@gallagher.com>
MIME-Version: 1.0
X-TNEFEvaluated: 1
X-SEG-SpamProfiler-Analysis: v=2.3 cv=A8gSwJeG c=1 sm=1 tr=0
 a=qhWWnufYDz1ULA0Yxl8pUQ==:117 a=7QKq2e-ADPsA:10 a=uwzVE2XeAAAA:8
 a=3gMZq0sycSoF5YAW8rcA:9 a=56Ks2SYG_ayP3Q2IVBAz:22
X-SEG-SpamProfiler-Score: 0
Subject: [Buildroot] [PATCH 1/1] package/libgpiod: compile with -fPIC when
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
 Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Otherwise build fails with following error:
Toolchain wrapper executing: '/tools/aarch64-linux-gnu/bin//aarch64-linux-gnu-g++' '--sysroot' '/home/user/work/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot' '-mabi=lp64' '-fstack-protector-strong' '-fstack-clash-protection' '-mcpu=cortex-a35' '-fPIE' '-Wl,-z,now' '-Wl,-z,relro' '-shared' '-nostdlib' '/home/user/work/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/../lib64/crti.o' '/tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/crtbeginS.o' '.libs/libgpiodcxx_la-chip.o' '.libs/libgpiodcxx_la-iter.o' '.libs/libgpiodcxx_la-line.o' '.libs/libgpiodcxx_la-line_bulk.o' '-Wl,-rpath' '-Wl,/home/user/work/buildroot/output/build/libgpiod-1.4.5/lib/.libs' '/home/user/work/buildroot/output/build/libgpiod-1.4.5/lib/.libs/libgpiod.so' '-L../../lib' '-L/tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0' '-L/tools/aarch64-linux-gnu/bin/../lib/gcc' '-L/tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-
 gnu/lib/../lib64' '-L/home/user/work/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/lib/../lib64' '-L/home/user/work/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/../lib64' '-L/tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/lib' '-L/home/user/work/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/lib' '-L/home/user/work/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib' '-lstdc++' '-lm' '-lc' '-lgcc_s' '/tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/crtendS.o' '/home/user/work/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/../lib64/crtn.o' '-Os' '-g2' '-Wl,-soname' '-Wl,libgpiodcxx.so.1' '-o' '.libs/libgpiodcxx.so.1.0.5'
/tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: .libs/libgpiodcxx_la-chip.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `_ZNSt14_Function_base13_Base_managerIPFP10gpiod_chipRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE10_M_managerERSt9_Any_dataRKSE_St18_Manager_operation' which may bind externally can not be used when making a shared object; recompile with -fPIC
.libs/libgpiodcxx_la-chip.o: in function `std::function<gpiod_chip* (std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>::function<gpiod_chip* (*)(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&), void, void>(gpiod_chip* (*)(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&))':
/tools/aarch64-linux-gnu/aarch64-linux-gnu/include/c++/8.3.0/bits/std_function.h:676:(.text.startup+0x48): dangerous relocation: unsupported relocation
/tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: .libs/libgpiodcxx_la-line_bulk.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `_ZNSt3mapIiiSt4lessIiESaISt4pairIKiiEEED1Ev' which may bind externally can not be used when making a shared object; recompile with -fPIC
.libs/libgpiodcxx_la-line_bulk.o: in function `__static_initialization_and_destruction_0':
/home/user/work/buildroot/output/build/libgpiod-1.4.5/bindings/cxx/line_bulk.cpp:20:(.text.startup+0x188): dangerous relocation: unsupported relocation
collect2: error: ld returned 1 exit status
Makefile:499: recipe for target 'libgpiodcxx.la' failed
make[6]: *** [libgpiodcxx.la] Error 1

Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
---
 package/libgpiod/libgpiod.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index 35d003fa33..2161e68e62 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -41,4 +41,10 @@ else
 LIBGPIOD_CONF_OPTS += --disable-bindings-python
 endif
 
+ifeq ($(BR2_PIC_PIE),y)
+LIBGPIOD_CFLAGS += -fPIC
+LIBGPIOD_CXXFLAGS += -fPIC
+LIBGPIOD_CONF_OPTS += CFLAGS="$(LIBGPIOD_CFLAGS)" CXXFLAGS="$(LIBGPIOD_CXXFLAGS)"
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
