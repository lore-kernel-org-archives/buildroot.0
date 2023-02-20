Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746E8C6379F
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 09:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DAB360F96;
	Mon, 20 Feb 2023 09:10:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DAB360F96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ytSiTbc3C6nQ; Mon, 20 Feb 2023 09:10:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3437460FDF;
	Mon, 20 Feb 2023 09:10:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3437460FDF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CB9B01BF403
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 09:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3D9C60F96
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 09:09:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3D9C60F96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9UUUdUWJhCZc for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 09:09:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A5E760FD1
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A5E760FD1
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 09:09:50 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id g7so1910425wrd.3
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 01:09:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hDNspG9v20Mtqc5PfpmfGsjS6+aPLks5tjff+Fv0EFs=;
 b=MT4F1NawiLMIZp8ehsyahZBNVCJZUhF5UziRdCaicn4ZX7QOoNLvSSsYt7tvatBdZn
 CSEG7wajdOE3wolkbcHlHTtspIciJcTh52Fu5CUj1TJyXaZsmuGqyN7QVyaDizmSfEBN
 QBr8fdFANYaK5DLFtKJ1AHkq7z4dIckvD7az4ZBBhb8aJ9PDnf9uHIhE53irGYxchUNI
 7rlqJz5g+0mo6ar56n1AHwqYwUY7JvWjBsnMSxghgjkNVAzTDiGcoVGxxakpl0SZ5zfT
 aKY6Er3xWhSlBdDTelG35RCctWCh6yXE8/yqNy4fyJ+HVAG6qUlOmYQ35Zy0LX9nEmT2
 WGXw==
X-Gm-Message-State: AO0yUKWOlatFzcsoFudTGH+fhJ5L6kvrMTLQwJCvvtw1hUti3l1+b6aD
 x8TSZPm9YzPycaF9MDa21OLXgGs0DeOd9r+O
X-Google-Smtp-Source: AK7set+QrThh6dCuOoPLw3vMpRMaxD/ACToOZfp/vV2Z0/26PT10Cc8hdboWNc2EIDNxPBmC68mB0w==
X-Received: by 2002:a5d:45cb:0:b0:2c5:8626:266a with SMTP id
 b11-20020a5d45cb000000b002c58626266amr1936639wrs.26.1676884188134; 
 Mon, 20 Feb 2023 01:09:48 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 p15-20020a1c544f000000b003dc4a47605fsm471897wmi.8.2023.02.20.01.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 01:09:47 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 10:09:23 +0100
Message-Id: <20230220090923.2155635-3-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230220090923.2155635-1-thomas.devoogdt@barco.com>
References: <20230220090923.2155635-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hDNspG9v20Mtqc5PfpmfGsjS6+aPLks5tjff+Fv0EFs=;
 b=XseBmuSCIeJu9jQ0Y6vLuH9b+miecIL+FuN6z1xVDInIsQJquIRyN6cb3alWFFYJSj
 pVhxbCNweSjXvgOGW0q7RpqzBRbfIpr3q8eoEEbU+FU8YrjyJ5EX5IflJjFcqX4jhpxn
 V2kpnDek3BRYQ7RGjabExauxdxpMWNZqwL6YtXIa3eFWVR8MIANnx//Oenqho+GCX7Wb
 q7z9cuIQ8Mbp0T5cHdHGJjjQORInvbvWYc4+745MDWVDpfuRrcrRe7SGehqut5AbxtUb
 SecsTCJoZNO7KxHL8pagO9b27uKIQFu/eMg4R2OY67mqnRJrEs54UzgHn3DeyevvzDdx
 xkdA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XseBmuSC
Subject: [Buildroot] [PATCH v1 3/3] package/webkitgtk: security bump to
 version 2.38.5
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@gmail.com>

Bugfix release, with many security fixes, including (but not limited to)
a patch for CVE-2023-23529.

Release notes:

  https://webkitgtk.org/2023/02/15/webkitgtk2.38.5-released.html

Accompanying security advisory:

  https://webkitgtk.org/security/WSA-2023-0002.html

Also raise the minimal GCC version to 8.3, which was already required since webkitgtk-2.36.4.
Similar to commit ec1ff802df9a0f17dd2b734ba536a5e206aa5aa4,
we do check on >= GCC 8, because we can't check on >= GCC 8.3.

  https://github.com/WebKit/WebKit/commit/f812c5db1ff22bcbe1070ca4ed613085cd36499b

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
---
 package/webkitgtk/Config.in      | 4 ++--
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index dc5d738dae..976341093e 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 7, host gcc >= 4.9"
+comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 8, host gcc >= 4.9"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
@@ -32,7 +32,7 @@ config BR2_PACKAGE_WEBKITGTK
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_USE_WCHAR # icu, libsoup
 	depends on BR2_PACKAGE_LIBGTK3
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 34fd19d3de..c771297b5a 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.38.4.tar.xz.sums
-md5  1c9ca83a0ad7e4ca9e933094572cb7d9  webkitgtk-2.38.4.tar.xz
-sha1  38b47df2be9bfb97d68fce8c7fa2819966a79036  webkitgtk-2.38.4.tar.xz
-sha256  4f47ea29a2d4d5f15eef3dc9e2d6c6f067e8de863a3f64455e1ccf9693cc1d36  webkitgtk-2.38.4.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.38.5.tar.xz.sums
+md5  de05d314a3ecb5fb3835e4d84f8f466d  webkitgtk-2.38.5.tar.xz
+sha1  1774390c628bb3a524d4ed76f11de4a878078db6  webkitgtk-2.38.5.tar.xz
+sha256  40c20c43022274df5893f22b1054fa894c3eea057389bb08aee08c5b0bb0c1a7  webkitgtk-2.38.5.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index a6974db926..3263f7fea0 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.38.4
+WEBKITGTK_VERSION = 2.38.5
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
