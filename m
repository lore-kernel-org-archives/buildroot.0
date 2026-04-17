Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3516CF43685
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 09:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFC8560DFB;
	Fri, 17 Apr 2026 09:00:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kfo0ZphbEbM4; Fri, 17 Apr 2026 09:00:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D829960E00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776416407;
	bh=OJ9QRyT0uCwkaW7Qq815ehZq7DhOc5Arr5tRGUHxQqE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pVaGvPEa2gcUU5JkUC3NAtk70QLzMgNk8AtQdAs9mlNW1xvXP1X+/Gc8xlDMW4qiX
	 oRrSENxwebrcOSwHtkQ5kn9Bp9zDLbG+PXD720pANeY3rPx90JhJqsMzYENGHCuVEy
	 2TgjbEccpYLRBlAVIUFgtSkD6YVkrl000H7zBLYgDyxPLoumD15XAKeUpJ/40szhoD
	 weJSriE7XGS/XIBLeeu9SXbO5gdjUFrCxTvbtjkBD+GumUT2AEPGJRmxmLwRrW4PrV
	 IxZWkuAVSubE1klDhsTWka50Ip0JSCicp/U2my+OwKI5e/0DjWyENjk7lhErZbmIlg
	 WaLVssHnHsH+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D829960E00;
	Fri, 17 Apr 2026 09:00:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0561A259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD81B404F7
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tUVXf2KGsdJS for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 08:59:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A28BC40291
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A28BC40291
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A28BC40291
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:55 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-488afb0427eso5571855e9.1
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 01:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776416393; x=1777021193;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ze1ZKR2n2zVbx+yBeqR0SeW759Uec0fqAlbPd3KU8Ro=;
 b=ij7kXKfen9s2zQ6JZ57xCKjEDU1XHLZWzDNfnL58M9/iYN8K1DO64U7nG2ZSzZDRHP
 8RYIS7odhxcNJGq0d/7IOoHh97EAyUClz2GKgVbXlfxvlWD16RDUL4i7waxo9vTg2iwT
 DN4uXqSk6k7mbyuXsqjv4Q+UsHtE2CJVmBxn9i7GSnz12UXkA1uivaMcBXsFlobCppzR
 227EplJPr4tzn62e6TxkNQaniKoDG8sO6TtYrvAzXxGnbwEpRD6qC5MneLIumiumn53T
 5kaQNWhdKafFxh1ThaynoWY1NNLYSMB4tEvcQ50bl3Y4Zz67KIU9dSmW8YtvJFsDHARc
 jZqw==
X-Gm-Message-State: AOJu0Ywqt7t1ddbwJ3XndNJbPe6BEBzsYoWR75qwmJ+1c4W90NwKNPSN
 6fEquJEYil2xfvOZLN+ugpvyUADhyY+KDOkSZBKaAeNLrXR4YV2TUFQlwvUi4owUj7Zu5Wpxnaa
 D92Yf/PM=
X-Gm-Gg: AeBDiesTjok/Cl1UdlVvkgJEA8r8zw/kv7j5AV2pYBha2mpjU3+5JLNOMkf8Y67klKa
 oeq0gyIgbcnXXV2ghdeAqrunXR3Okl6ambk4V6Fnf0F+g8aT7Sb5RPkTHSh9kI6Pn5TtmWfLH36
 XQxsKgATpH8ksS7Qr+s1rGUG1qMFD2RXkKeGC22osdAc46cijzOI/tH73moKTGXkfeam5G35KiK
 htFIpmYCmxbNVhTxHjEqwjOBsZ9utpw5U5L4/3WhO4L0jYga2YZOl5OLWAWURmmI7MD/eJt9FbH
 pSrUMhmHT7ZdbUsnIcOG7JiyuQUk7BN1b7R2aAxujRrQc8FGJG3UArkDkkDYDh70HQQuj83MT3u
 haQz56s3KmjqiM4ym9i3CN2EHjL/TeVbeq6hAQwCg9fVOf8wr9GPoMa0yMclS5JRGMwx94Hof8R
 JC9lQJjW9BqKf89qkXtu6OFJ26ZeUItxe8ardyZ4NI+wTOnsKXMfkQvYBz6ClQEdKyPN7MvCRwA
 KQxD2kqc0mwxfOzoHFyHkeYSNE45cgNDe3TLXJ0eg==
X-Received: by 2002:a05:600c:45d1:b0:488:c14b:201b with SMTP id
 5b1f17b1804b1-488fb74fcd5mr26560505e9.10.1776416393302; 
 Fri, 17 Apr 2026 01:59:53 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7a0745sm15077795e9.9.2026.04.17.01.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 01:59:53 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri, 17 Apr 2026 10:59:32 +0200
Message-ID: <20260417085936.200528-18-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417085936.200528-1-dowan.gullient@smile.fr>
References: <20260417085936.200528-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1776416393; x=1777021193; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ze1ZKR2n2zVbx+yBeqR0SeW759Uec0fqAlbPd3KU8Ro=;
 b=Xx/UOdO2Q90AIhGvFwABW7oNv8Flfs/VhcnwubaMNBU+iYEPEtKaOc21RXE9RK4roG
 AIjN4u07KSsQGDSgrWDE5tHP8Owe/Bzgn7jiFbUaFO87Lxlxa+uTgxjBybSkQNaS2BIL
 wvgjAkUA1C/yH9HfShjKGSiP+Sp9wMA4xZSR0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=Xx/UOdO2
Subject: [Buildroot] [PATCH v1 17/21] support/testing : test_openjdk : Bump
 kernel version to last LTS (6.18)
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit bumps Linux kernel version to 6.18.21 in the test infrastructure
to ensure compatibility with the latest toolchain features.

This also Update the OpenJDK package from 21.0.4+7 to 21.0.9+8 to fix the
'unsigned int uabs(int)' was declared 'extern' and later 'static' error during
compilation, see: https://github.com/openjdk/jdk21u/commit/3445b99bedfba659da49d72a39979703969cfc91
backported from https://bugs.openjdk.org/browse/JDK-8354941
This error was due to the use of a new glibc version used in the updated toolchain.

Update the hash file to match the new tarball.

Fix OpenJDK test configuration:
    - Add BR2_PACKAGE_XORG7 and BR2_PACKAGE_XLIB_LIBX11 to satisfy
        build-time dependencies for the non-headless variant.
    - Enable BR2_PACKAGE_OPENJDK_X11 to ensure the package
        correctly detects X11 support during the configure stage.
    - Enable BR2_SHARED_LIBS as BR2_PACKAGE_XORG7 requires to disable static libraries.

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 package/openjdk/openjdk.hash                  | 2 +-
 package/openjdk/openjdk.mk                    | 4 ++--
 support/testing/tests/package/test_openjdk.py | 6 +++++-
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 209004a292..c0d7f9a905 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  b8b37fa6fcc284d91e7458c703ca4c893a1dd5a6e0f6b9e198e7d13cd8efd24d  openjdk-21.0.4+7.tar.gz
+sha256  1cd30b645104bbbfff2bafc6e6c27694a999b4fbe8a9e9a2d2adc4a9a04414b1  openjdk-21.0.9+8.tar.gz
 sha256  ccb7d37c24f9f5808f9d25419d93680570dc600f292e68944032338cb4b2c51e  openjdk-17.0.12+7.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 58b266c4e9..5a08ed4f47 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -6,8 +6,8 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
 OPENJDK_VERSION_MAJOR = 21
-OPENJDK_VERSION_MINOR = 0.4
-OPENJDK_VERSION_BUILD = 7
+OPENJDK_VERSION_MINOR = 0.9
+OPENJDK_VERSION_BUILD = 8
 
 else
 OPENJDK_VERSION_MAJOR = 17
diff --git a/support/testing/tests/package/test_openjdk.py b/support/testing/tests/package/test_openjdk.py
index 3bf89f9efe..800ed363e7 100644
--- a/support/testing/tests/package/test_openjdk.py
+++ b/support/testing/tests/package/test_openjdk.py
@@ -12,13 +12,17 @@ class TestOpenJdk(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.34"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
         BR2_TARGET_ROOTFS_CPIO=y
         BR2_TARGET_ROOTFS_CPIO_GZIP=y
         BR2_PACKAGE_OPENJDK=y
+        BR2_SHARED_LIBS=y
+        BR2_PACKAGE_XORG7=y
+        BR2_PACKAGE_XLIB_LIBX11=y
+        BR2_PACKAGE_OPENJDK_X11=y
         BR2_PACKAGE_OPENJDK_HELLO_WORLD=y
         BR2_PACKAGE_OPENJDK_JNI_TEST=y
         """
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
