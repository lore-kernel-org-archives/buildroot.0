Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B435C47DA9
	for <buildroot@archiver.kernel.org>; Sun, 28 Jan 2024 13:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB1BD82779;
	Sun, 28 Jan 2024 13:21:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB1BD82779
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N56LJuUMFeWY; Sun, 28 Jan 2024 13:21:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 126158272C;
	Sun, 28 Jan 2024 13:21:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 126158272C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C6DE81BF86C
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 13:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9551260881
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 13:21:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9551260881
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZglG6SWd_7Yz for <buildroot@lists.busybox.net>;
 Sun, 28 Jan 2024 13:21:03 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2385F607B4
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 13:21:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2385F607B4
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-337cf4eabc9so1774736f8f.3
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 05:21:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706448061; x=1707052861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1QC2Oo6t0q+k3PPkQOj1PHo6NvjpVU+S66Pq/XOe4y4=;
 b=Gd2EA+Lj9jVDSp49QGLrl6XqSJllSTzLJte4LBchefS+/PNHv5szihVUvuxT2DPafa
 3GIewaiWlq8BANZ41o/T1Yutu9XDD+ZStEYealqVLmn3RnbVbQIcwbekc86pOnIlJn4I
 yoahJYyBFwX1nF0AZaAmvFQBTdIQ92E0Zjoz5TQ8QtKfoWB5w6ZarF+62+t0dAeUFjkQ
 uGK6Gm6i9O/A2QDk3xtQEOHluvSPX+2v4x8J5RC3LU6h7Gp5ZEPEWlub4hJxOoakPH8n
 h5E2sW2mz6yaJwfTRoysviM8S49SZDnDn51imQkQdMxHQw/saXcOJMTH2CrEV1e5kAiR
 gItA==
X-Gm-Message-State: AOJu0YyCEKgGmolpn7PyayrHOgsa9hyXdIhRvFL2+S50QCTec6F9SP58
 /qVQx3aGnmEltmYeiHrTTNZqWUSuYEJfIYWj/4YoamTw4fOk5uLcYrKrxAjS
X-Google-Smtp-Source: AGHT+IFDh/KJZ6sgVAaUp3BcHBQbcA+vpUwea5lqn9LQEmG+SEzx8XweWcJmre5+bD+EQCPtx5pLsQ==
X-Received: by 2002:a5d:644d:0:b0:33a:e639:2da1 with SMTP id
 d13-20020a5d644d000000b0033ae6392da1mr1540237wrw.65.1706448060844; 
 Sun, 28 Jan 2024 05:21:00 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 bv25-20020a0560001f1900b0033aec64ba7dsm747778wrb.78.2024.01.28.05.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jan 2024 05:21:00 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 28 Jan 2024 14:20:52 +0100
Message-ID: <0fab83c33d4c5d4afe807e78169f68d539bcf5af.1706448055.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706448055.git.yann.morin.1998@free.fr>
References: <cover.1706448055.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706448061; x=1707052861; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1QC2Oo6t0q+k3PPkQOj1PHo6NvjpVU+S66Pq/XOe4y4=;
 b=A08OcucVrtgr4jPwf75F+vPzr+KprHNbBKycOM42pCrG/ajBTJXvcgvRsBfQumnk4N
 eYHYIgWYiCc7QhMcYkLV65gNOciz64Cv31WMJ8C5Nws/OZ5sNlpEEHQQMf8NtWo1XYiN
 Z1HCqGcycBCz8MNtq4FObs+NPFmWV201cu+T3GW4wa+irtRCR+LVPmIF5E5C0xXYN3pc
 jKV7ehchKkeqz/NRArtO0mOdBBeQctpfdPcI8rL5+SYWaQGor2uz32kW62kQZ9oQgzYh
 7z0vO0WChFFSM39G/VW0cNcHocTnagVgK/X9LMvcP5g4PSXCiaX4ArDYkgmRX8wdQWQU
 UlbA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=A08OcucV
Subject: [Buildroot] [PATCH 03/10] package/openssh: fix dependencies with
 refpolicy
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 2c5a82a29ceb(package/openssh: select linux-pam if refpolicy
upstream is selected) did not account for the linux-pam dependencies
before selecting it, causing unmet dependencies warnings (unfortunately,
not errors), such as:

    $ KCONFIG_SEED=0x8D55903B make randconfig
    WARNING: unmet direct dependencies detected for BR2_PACKAGE_LIBABSEIL_CPP
      Depends on [n]: BR2_INSTALL_LIBSTDCPP [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_8 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && !BR2_STATIC_LIBS [=n] && BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS [=n]
      Selected by [y]:
      - BR2_PACKAGE_RE2 [=y] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_8 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y]

Propagate those dependencies, but only when they are required, i.e. only
when the upstreram refpolicy is used.

Transitively propagate those also to sshfs, for those two it did not
already have; we use a separate coment to cimplify the comment prompt.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/openssh/Config.in | 12 ++++++++++++
 package/sshfs/Config.in   |  7 +++++++
 2 files changed, 19 insertions(+)

diff --git a/package/openssh/Config.in b/package/openssh/Config.in
index a3038ba01f..0e9a84469b 100644
--- a/package/openssh/Config.in
+++ b/package/openssh/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_OPENSSH
 	bool "openssh"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_ENABLE_LOCALE || !BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION # linux-pam
+	depends on BR2_USE_WCHAR || !BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION # linux-pam
+	depends on !BR2_STATIC_LIBS || !BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION # linux-pam
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION # linux-pam
 	select BR2_PACKAGE_LINUX_PAM if BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
@@ -41,3 +45,11 @@ config BR2_PACKAGE_OPENSSH_SANDBOX
 	  This is normally preferable, but may cause seccomp problems
 	  for certain combinations of C libraries and kernel versions.
 endif
+
+comment "openssh w/ refpolicy needs a toolchain w/ gcc >= 4.9, locale, wchar, dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION
+	depends on !BR2_ENABLE_LOCALE \
+		|| !BR2_USE_WCHAR \
+		|| BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
index bc54b698d8..b778b62fa0 100644
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_SSHFS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse3, glib2
 	depends on BR2_USE_MMU # libfuse3, glib2
 	depends on !BR2_STATIC_LIBS # libfuse3
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION # openssh
+	depends on BR2_ENABLE_LOCALE || !BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION # openssh
 	select BR2_PACKAGE_LIBFUSE3
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
@@ -17,3 +19,8 @@ config BR2_PACKAGE_SSHFS
 comment "sshfs needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
+comment "sshfs w/ refpolicy needs a toolchain w/ gcc >= 4.9, locale"
+	depends on BR2_USE_MMU
+	depends on (!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 && BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION) \
+		|| (!BR2_ENABLE_LOCALE && BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
