Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B5AC433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 19:41:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 793BE60FE3
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 19:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 793BE60FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 424EA83B01;
	Fri, 15 Oct 2021 19:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VeHALwXEa0V5; Fri, 15 Oct 2021 19:41:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D2AD839D8;
	Fri, 15 Oct 2021 19:41:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F0691BF41F
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 19:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EEE460726
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 19:40:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T227E1dg4HH5 for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 19:40:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E99DA605E5
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 19:40:35 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id v17so28155271wrv.9
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 12:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KN10GBF0RFFujynjGbiSAQhZGPJXA8GkczWBmc8SqA0=;
 b=fhtrv6qOHSBXhDph/HYGN8OREzgw44FZA52Vr4QvQVXG+qv4LYv7rAybefB2tqirdN
 zX23PuBSgMO/AgiyohlJJtxHK+194DsWLzOt+FfiC4Xp5hrlobVxCMLTBRJ4kdss9YSU
 R8MrmrMKq84SZjU1+6pW/jgWLCfP6a4A/ytScE8DZbRZD6gGFejEkLnyeiEeMbsT9pFZ
 2pcjpzjCwVnNZkrYU9ciBkm4mnHrsajiUtnmh7G1LHauatW76zNUqRKISWgZW/ougsz4
 iywLkkGWWhEabWfvMSFFl/LEl93iv8sCkQsdqq4MHK44qBhz0CbQO5t2g8E8Fek4m/TS
 t1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KN10GBF0RFFujynjGbiSAQhZGPJXA8GkczWBmc8SqA0=;
 b=VZLpbAGoyMtEqiVTRstnPdweV2DtcEB+Fw98cTNIwYBsVBrhaTwX2nUj6Ky030LFIK
 bIVZcM+Ab6IGU5ddW8ae3tywkTp2/7ChGK7larF0GNj7GG4dVEHnbucsHlkNMNkZKYjQ
 OP/oD8s4hKCSKniHMQvqlh3DTVagxU08GIt7ZTTBRoTjqJzCf+2XomavqUV/8agWoqQU
 Md05Y+oJXXUJA7kHJQClyz2//54zvgZiEFmw+5FjMptkiAwcC5pXBwUS33KYHWzxRnAN
 6uQJMsw9ok4pIXJEcQhRq01dN69WTBjv+x0lNhz4c5c5QJdgoVBG6smeEJ6JI1Xn0G/u
 Jdqw==
X-Gm-Message-State: AOAM533C8j7OId+HLCB7MLdfTsjGsYs1cYi2CEHAbeTvo434dgle3sWQ
 V7UVuOg6LC+1AM1QUppKJitOXOc24+U=
X-Google-Smtp-Source: ABdhPJxgf9Wu/5xyp+RWIy2nl0xQv5HudM8WJx/buvyjljN2cJJpngH808sjdurmJPftbVc43YZDNQ==
X-Received: by 2002:adf:f190:: with SMTP id h16mr4453589wro.250.1634326833906; 
 Fri, 15 Oct 2021 12:40:33 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id x21sm11223829wmc.14.2021.10.15.12.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 12:40:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 21:39:01 +0200
Message-Id: <20211015193901.1543587-4-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211015193901.1543587-1-fontaine.fabrice@gmail.com>
References: <20211015193901.1543587-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/4] package/python-ujson: fix xtensa build
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the follownig build failure on xtensa since bump to version 4.1.0 in
commit a47f332a20bf3f79ef4903c8ddd2b7917217e354 and
https://github.com/ultrajson/ultrajson/commit/eb7d894f225bb89d269188ba6ec559b914a71b8a:

In file included from ./deps/double-conversion/double-conversion/bignum-dtoa.h:31,
                 from ./deps/double-conversion/double-conversion/bignum-dtoa.cc:30:
./deps/double-conversion/double-conversion/utils.h:92:2: error: #error Target architecture was not detected as supported by Double-Conversion.
   92 | #error Target architecture was not detected as supported by Double-Conversion.
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/c75157538d7784809d935aefcb166e89c137c9b7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...4-Pseiderer-add-nios2-and-xtensa-001.patch | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 package/python-ujson/0004-Pseiderer-add-nios2-and-xtensa-001.patch

diff --git a/package/python-ujson/0004-Pseiderer-add-nios2-and-xtensa-001.patch b/package/python-ujson/0004-Pseiderer-add-nios2-and-xtensa-001.patch
new file mode 100644
index 0000000000..8648f93c1a
--- /dev/null
+++ b/package/python-ujson/0004-Pseiderer-add-nios2-and-xtensa-001.patch
@@ -0,0 +1,95 @@
+From a54561be5588ac9b16d3c20760b9b554168bb8aa Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <pseiderer@users.noreply.github.com>
+Date: Thu, 31 Oct 2019 21:26:27 +0100
+Subject: [PATCH] Pseiderer/add nios2 and xtensa 001 (#119)
+
+* double-conversion: enable for nios2
+
+Nios2 supports double conversion, tested using qemu:
+
+./main || echo "correct"
+correct
+uname -a
+Linux buildroot 4.19.16 #4 Sat Aug 3 14:46:48 CEST 2019 nios2 GNU/Linux
+
+Solves build error
+
+In file included from double-conversion.h:42:0,
+                 from number_decimalquantity.cpp:19:
+double-conversion-utils.h:119:2: error: #error Target architecture was not detected as supported by Double-Conversion.
+ #error Target architecture was not detected as supported by Double-Conversion.
+
+detected by buildroot autobuilders:
+http://autobuild.buildroot.net/results/91e/91eaec34708d91f8a05af189243be0b7cabce31b/
+
+Patch sent upstream: https://github.com/unicode-org/icu/pull/725
+Bug report: https://unicode-org.atlassian.net/browse/ICU-20751
+
+[Bernd: Fixed path]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Added Changelog entry]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+
+* double-conversion: enable for xtensa
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+
+[Retrieved (dand backported) from:
+https://github.com/google/double-conversion/commit/a54561be5588ac9b16d3c20760b9b554168bb8aa]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+Note:
+
+Double-conversion tested with:
+
+        $ cat div.c
+double Div_double(double x, double y) { return x / y; }
+
+        $ cat main.c
+double Div_double(double x, double y);
+
+int main(int argc, char** argv) {
+  double result = Div_double(89255.0, 1e22);
+  if (result == 89255e-22) {
+    printf("correct result %e\n", result);
+    return 1;
+  } else {
+    printf("wrong result %e\n", result);
+    return 0;
+  }
+}
+
+Tested for xtensa (using qemu_xtensa_lx60_defconfig plus BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE):
+
+        $ ./host/bin/xtensa-buildroot-linux-uclibc-gcc -c div.c
+        $ ./host/bin/xtensa-buildroot-linux-uclibc-gcc -c main.c
+        $ ./host/bin/xtensa-buildroot-linux-uclibc-gcc -o main main.o div.o
+
+        $ ./host/bin/qemu-xtensa -L staging main
+correct result 8.925500e-18
+---
+ Changelog                 | 4 ++++
+ double-conversion/utils.h | 3 ++-
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/deps/double-conversion/double-conversion/utils.h b/deps/double-conversion/double-conversion/utils.h
+index 221467f..98ec28b 100644
+--- a/deps/double-conversion/double-conversion/utils.h
++++ b/deps/double-conversion/double-conversion/utils.h
+@@ -94,6 +94,7 @@ int main(int argc, char** argv) {
+     defined(__ARMEL__) || defined(__avr32__) || defined(_M_ARM) || defined(_M_ARM64) || \
+     defined(__hppa__) || defined(__ia64__) || \
+     defined(__mips__) || \
++    defined(__nios2__) || \
+     defined(__powerpc__) || defined(__ppc__) || defined(__ppc64__) || \
+     defined(_POWER) || defined(_ARCH_PPC) || defined(_ARCH_PPC64) || \
+     defined(__sparc__) || defined(__sparc) || defined(__s390__) || \
+@@ -102,7 +103,7 @@ int main(int argc, char** argv) {
+     defined(__AARCH64EL__) || defined(__aarch64__) || defined(__AARCH64EB__) || \
+     defined(__riscv) || defined(__e2k__) || \
+     defined(__or1k__) || defined(__arc__) || \
+-    defined(__microblaze__)
++    defined(__microblaze__) || defined(__XTENSA__)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(__mc68000__)
+ #undef DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
