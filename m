Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B60C47258
	for <buildroot@archiver.kernel.org>; Sun, 28 Jan 2024 13:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67B1782798;
	Sun, 28 Jan 2024 13:21:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67B1782798
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jbSTbo9FTza4; Sun, 28 Jan 2024 13:21:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E0A1827E0;
	Sun, 28 Jan 2024 13:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E0A1827E0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE9F61BF2C7
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 13:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 900D28275A
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 13:21:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 900D28275A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GODhNhNu3IxM for <buildroot@lists.busybox.net>;
 Sun, 28 Jan 2024 13:21:02 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5020B8272C
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 13:21:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5020B8272C
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3392b12dd21so1864131f8f.0
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 05:21:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706448060; x=1707052860;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=375LByle7bRuzCORE7JZ7SFsQTDXJSxs1yus++5LgAA=;
 b=EsZZ+ghus+FVoPYjP5fU8T/YT+K00uEE9Ta/HZ4krhTq+1igD7LyPVoJ9Gn0c0bat3
 RK0X/Wp6mz+QMBgkx7R11bllMmP4zeVfbSeYHAwBKP+oYiVorhm6zyjcjUUr2+gsw36j
 N24KtXQRnkS/wwqev+gVSn+3JiA20+miCJmtLsXvgKZCLNYhNz7hG7MMKd44EQGGOO21
 NW4Lq7pArK6UBvPzQaL40QQIfnbyy5Xq4vHCm10pzzgYqe0qdas6L61A/3SikBIGpdwg
 EPPHrI+r1eHGQqJVOka39Wdm2BSfyU6Lq18F0fMorZ+6neyLLibG3Z1y0nN1ELfLsYLi
 lxIA==
X-Gm-Message-State: AOJu0YyEF2CK7GDBw1yiz0mwp3UYrS93nPa8R1D3MIwrpG/GncB7nErX
 yoPRf6JR5OAGK+WBsxbod9dF9XanUSDA2UD8vR5k4y4uzMrOa1uo0ltGEAmy
X-Google-Smtp-Source: AGHT+IFOGaFGRNKb5Or+Vylz+igbi4cC4WoCyBdz6gFWVrbiq4O0Erj2YigVYDb1i61qqhUQjmNf/w==
X-Received: by 2002:adf:f011:0:b0:337:c73f:db0f with SMTP id
 j17-20020adff011000000b00337c73fdb0fmr2467807wro.41.1706448059996; 
 Sun, 28 Jan 2024 05:20:59 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 bv25-20020a0560001f1900b0033aec64ba7dsm747778wrb.78.2024.01.28.05.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jan 2024 05:20:59 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 28 Jan 2024 14:20:50 +0100
Message-ID: <a1a293b6334f91a747159399e18c86adc90bf614.1706448055.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706448055.git.yann.morin.1998@free.fr>
References: <cover.1706448055.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706448060; x=1707052860; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=375LByle7bRuzCORE7JZ7SFsQTDXJSxs1yus++5LgAA=;
 b=RZBk+N1U6gKamxQe4tM08ri9FHM9M6F8f/MyE1Y6s6RWW0EFNPWm3rFmY29tBsQ6sv
 Tv+77GGZPfxHalvKCAS5w/5ASpQP+KUZD9O+JmCl9E9h75ct7DOt3ZMSTs1zjryzY7nP
 6U8XtyyYKAMgQhEvJnur4iwEY21niqZwqwkCkBlMXXN5qtl/g+XQn0nh6TKvbSR1hw5E
 LthgiNpttM/0DnohNzGiSr5K9dRvAsq0Xr/x3wwiL1TTqsNIVNTa3nr8MAOGIv++dT8X
 cpi5XwQyLefWgfAT8+f9PKvKTFqKTe98ddx1qon1VIN8q69uu51vwqus1QftOBTDGhh0
 LXtA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RZBk+N1U
Subject: [Buildroot] [PATCH 01/10] package/util-linux: propagate linux-pam
 dependencies
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit c77e25c3f113 (package/linux-pam: needs gcc >= 4.9) forgot to
propagate that new dependency to the util-linux runuser and su, yielding
unmet dependencies warnings (unfortunately, not errors), such as:

    $ KCONFIG_SEED=0x8AE589A3 make randconfig
    WARNING: unmet direct dependencies detected for BR2_PACKAGE_LINUX_PAM
      Depends on [n]: BR2_ENABLE_LOCALE [=y] && BR2_USE_WCHAR [=y] && !BR2_STATIC_LIBS [=n] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 [=n]
      Selected by [y]:
      - BR2_PACKAGE_UTIL_LINUX_RUNUSER [=y] && BR2_PACKAGE_UTIL_LINUX [=y] && BR2_ENABLE_LOCALE [=y] && BR2_USE_WCHAR [=y] && !BR2_STATIC_LIBS [=n] && !BR2_TOOLCHAIN_USES_MUSL [=n] && BR2_USE_MMU [=y]
      - BR2_PACKAGE_UTIL_LINUX_SU [=y] && BR2_PACKAGE_UTIL_LINUX [=y] && BR2_ENABLE_LOCALE [=y] && BR2_USE_WCHAR [=y] && !BR2_STATIC_LIBS [=n] && !BR2_TOOLCHAIN_USES_MUSL [=n] && BR2_USE_MMU [=y]

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/util-linux/Config.in | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index be87494b35..73fa11380e 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -88,13 +88,15 @@ config BR2_PACKAGE_UTIL_LINUX_CHFN_CHSH
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # linux-pam
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Change login shell, real user name and information
 
-comment "chfn/chsh needs a toolchain w/ wchar, locale, dynamic library"
+comment "chfn/chsh needs a toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS
+		|| BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_UTIL_LINUX_CHMEM
 	bool "chmem"
@@ -196,13 +198,16 @@ config BR2_PACKAGE_UTIL_LINUX_LOGIN
 	depends on !BR2_STATIC_LIBS # linux-pam
 	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
 	depends on BR2_USE_MMU # fork(), linux-pam
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Begin a session on the system
 
-comment "login needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
+comment "login needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
+		|| BR2_STATIC_LIBS \
+		|| BR2_TOOLCHAIN_USES_MUSL \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_UTIL_LINUX_LOSETUP
 	bool "losetup"
@@ -343,15 +348,18 @@ config BR2_PACKAGE_UTIL_LINUX_RUNUSER
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
 	depends on BR2_USE_MMU # fork(), linux-pam
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Run a command with substitute user and group ID (does not need
 	  to ask for a password, because it may be executed by the root
 	  user only)
 
-comment "runuser needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
+comment "runuser needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
+		|| BR2_STATIC_LIBS \
+		|| BR2_TOOLCHAIN_USES_MUSL \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
 	bool "scheduling utilities"
@@ -380,13 +388,16 @@ config BR2_PACKAGE_UTIL_LINUX_SU
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
 	depends on BR2_USE_MMU # fork(), linux-pam
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Run a command with substitute user and group ID
 
-comment "su needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
+comment "su needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
+		|| BR2_STATIC_LIBS \
+		|| BR2_TOOLCHAIN_USES_MUSL \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_UTIL_LINUX_SULOGIN
 	bool "sulogin"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
