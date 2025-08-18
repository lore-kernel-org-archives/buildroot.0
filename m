Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0419CA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 20:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6672D60671;
	Mon, 18 Aug 2025 20:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qi2AK3AZ1h-j; Mon, 18 Aug 2025 20:15:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D40560672
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D40560672;
	Mon, 18 Aug 2025 20:15:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D4EA5E2
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF74B60646
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:15:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Kg-by0UxZOs for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 20:15:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 68D886066B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68D886066B
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68D886066B
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:15:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E21104E40C02;
 Mon, 18 Aug 2025 20:15:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A7BE0606A6;
 Mon, 18 Aug 2025 20:15:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8541D1C22C561; 
 Mon, 18 Aug 2025 22:14:50 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 18 Aug 2025 22:14:43 +0200
Message-ID: <20250818201444.3210542-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755548103; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=2Sv1YcBTfXmrtIhfyG1Ko8o73xqS7K8S6lRFLXDE76k=;
 b=j9mXNussUrxELKsoR0zXinwV4Gjz4h24PV7qbJMhT6aj44cMhghMlnaiEbKQl+UJtI+YIE
 qkXEvcvxb3KoXQ2FXXh8SxFNYHLkonB1GfeKv6Xbq2BSJNRYvwvII/TLsmrzMRPd0ggOsX
 mE3Xtz086Bsw3Z/W4RkfKQd7vTCmDI3COcNqUzmxpFRuFogv/RSn0Lo8BjYawYDBBfyMoH
 ynUTu6jr7vVjcm1v92k1Dw7itVN38H9hGcCd2+jQ0FDmQXtm5y7UZE/4JJkuG9KXn+GfTi
 48DyOk2/KkxSulkHoeZQw5Xzf8MO0HwWVr7mMJyfSgfJzQ8nQxowZD//VsrbWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=j9mXNuss
Subject: [Buildroot] [PATCH] package/python3: drop !uclibc || headers 5.1
 dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Vincent Fazio <vfazio@xes-inc.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The following dependency:

  depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1

was added by commit d63e207eb869063f82c867658676c2903beb08cb, which
bumped python3 from 3.12.9 to 3.13.2.

The commit log states:

    The package selection logic has changed to require time64 support for
    uClibc by mirroring the logic from uclibc.mk (kernel headers >=5.1).

but doesn't provide any additional detail about the issue encountered.

The problem is that this dependency has not been propagated to reverse
dependencies, causing this kind of kconfig warnings:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON3
  Depends on [n]: BR2_USE_WCHAR [=y] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && !BR2_STATIC_LIBS [=n] && (!BR2_TOOLCHAIN_USES_UCLIBC [=y] || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 [=n])
  Selected by [y]:
  - BR2_PACKAGE_AVOCADO [=y] && BR2_USE_WCHAR [=y] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && !BR2_STATIC_LIBS [=n]
  - BR2_PACKAGE_LIBSIGROKDECODE [=y] && BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] && !BR2_STATIC_LIBS [=n]
  - BR2_PACKAGE_OPKG_UTILS [=y] && BR2_PACKAGE_BUSYBOX [=y] && BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && !BR2_STATIC_LIBS [=n]

However, propagating this dependency to all reverse dependencies of
python3 would be pretty annoying, especially as the dependency is kind
of "clunky". This made us question whether this dependency could be
dropped. And in fact, we could not reproduce any build failure, even
by using a 2018 uclibc toolchain, based on gcc 6.x, headers 4.1.x and
uClibc 1.0.28. This can be tested by building the following
configuration:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--stable-2018.02-1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_PYTHON3=y

It needs to be built in an environment that has libmpfr.so.4 installed
as the pre-built toolchain from that era did not include it. An easy
way to achieve this is to build this configuration under an old
Buildroot Docker container:

IMAGE=buildroot/base:20180205.0730 ./utils/docker-run make python3

Cc: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python3/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index 7491067140..cfc08bad86 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -1,6 +1,6 @@
-comment "python3 needs a toolchain w/ wchar, threads, dynamic library, time64 support"
+comment "python3 needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || (!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 && BR2_TOOLCHAIN_USES_UCLIBC)
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_PYTHON3
 	bool "python3"
@@ -9,7 +9,6 @@ config BR2_PACKAGE_PYTHON3
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libffi
 	depends on !BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1  # need time64 support in uclibc
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_BLUEZ5_UTILS_HEADERS if BR2_PACKAGE_BLUEZ5_UTILS
 	select BR2_PACKAGE_HOST_PYTHON3
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
