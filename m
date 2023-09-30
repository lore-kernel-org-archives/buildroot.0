Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D93E77376
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 15:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 546C041589;
	Sat, 30 Sep 2023 15:15:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 546C041589
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZVNyNCFQCPlF; Sat, 30 Sep 2023 15:15:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20EC941590;
	Sat, 30 Sep 2023 15:15:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20EC941590
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6ADEC1BF5F6
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 116B260F27
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 116B260F27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QCuCEnsnBmkg for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 15:15:08 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48B6160E1D
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 15:15:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48B6160E1D
Received: by mail.gandi.net (Postfix) with ESMTPA id D98CBFF803;
 Sat, 30 Sep 2023 15:15:04 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Sat, 30 Sep 2023 17:15:02 +0200
Message-ID: <20230930151502.650185-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696086905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=b65eDB0t2SBZDx8OBF4GYN5hoHTPW7yjqiKPSg1e2hE=;
 b=OxcCsibYQ/FP3lz44oK2/ABV37NAvlwxGrZA0OjUVNOttKga6vZKgOorK4F+dmW0N/v+dw
 E/ZNfmOWCTqgkxySIeTpO+un3110zpUYzGdn67w3zghzp1xrRqL58LnEO0qcn753K1oIjE
 SM2ic0eUuJwJnwb6c1d0sPYiv3JcBaVpul2Ph7x4seL3hW9IqlsxUaby5YoSzVPIEiuU8d
 E3+/yUGxoGMirAtDXTBu0P6Vry1IT+BkveXoGCGS7/qaDF6pm0capk1cCrcfVBEty3ucJS
 mCz/j2rTzsB7hrJO4lGnfFekejszktHtv7CLr9JiJOmn9wfEcp97LKCWjp0qTg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OxcCsibY
Subject: [Buildroot] [PATCH] package/gcc/gcc-final: only install libgcc_s
 for shared library builds
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In commit
55e83008fc82cf621d94d60ab4401a4848880bc2 ("package/gcc/gcc-final:
rework installation of libgcc_s/libatomic"), we reworked the libgcc_s
installation. In the previous code, libgcc_s was installed to
STAGING_DIR/TARGET_DIR unconditionally, but a "-cp" command was used,
which means that any failure was ignored. As we are now more picky, it
has become clear that this in fact wasn't entirely correct: libgcc_s
only exists for shared builds. For static builds, only libgcc.a is
available, but it doesn't need to be installed to STAGING_DIR (for
some reason, and as it was never installed by Buildroot, it has always
worked without libgcc.a in STAGING_DIR).

So long story short: we change the code to only install libgcc_s when
BR2_STATIC_LIBS is disabled. This fixes the following build failure on
BR2_STATIC_LIBS=y builds:

cp -dpf /home/thomas/buildroot/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/lib*/libgcc_s* /home/thomas/buildroot/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/lib/
cp: cannot stat '/home/thomas/buildroot/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/lib*/libgcc_s*': No such file or directory

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/gcc-final/gcc-final.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 11104167af..edb9b2f73a 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -144,7 +144,11 @@ HOST_GCC_FINAL_POST_INSTALL_HOOKS += TOOLCHAIN_WRAPPER_INSTALL
 # -cc symlink to the wrapper is not created.
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
 
-GCC_FINAL_LIBS = libgcc_s libatomic
+GCC_FINAL_LIBS = libatomic
+
+ifeq ($(BR2_STATIC_LIBS),)
+GCC_FINAL_LIBS += libgcc_s
+endif
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 GCC_FINAL_USR_LIBS += libstdc++
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
