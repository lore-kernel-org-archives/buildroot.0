Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B0BC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 20:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6322C40A6F;
	Sun,  5 Nov 2023 20:28:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6322C40A6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tCkDReHCI7Qo; Sun,  5 Nov 2023 20:27:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DC6740A7E;
	Sun,  5 Nov 2023 20:27:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DC6740A7E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 55A431BF48C
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C2BC81E62
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C2BC81E62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jtKq7k47NV_a for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 20:26:13 +0000 (UTC)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 843C981E53
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 20:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 843C981E53
Received: by mail-pl1-x644.google.com with SMTP id
 d9443c01a7336-1cc30bf9e22so30428495ad.1
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 12:26:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699215972; x=1699820772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CehJPwukihS+RXRBweF7B6AiDa4YXMB/KpaxE3RbgGo=;
 b=WmPb/VBYp3OXVhdwVLaZhI5jhHve61ird3Hu+2RqiUbG2Hul35Xkunc53ujN2IR4WZ
 4v2jR1LxZc/4FVhNONR9s+eahOKsu/wH5dwj36fDFwy2FIsc0NINSi+ONE9g5gQ5b7uK
 +yzAikktLdJdDL3eBcScJya3Hb6+f1Ss9IH6B1MtkYXoePvAg5CRCOUWG9St1ox6RjMx
 QLvIjbOkK+hL32qNtf90Mojp6qy8eM8JOw/VSqodzo3fwGjrRb2ZY+0IWSaRKA62sjyX
 QNmc4BBTS+Re3ZeIHV/iddBX/t24aL+iuiD4c7xez3238AVPNWDX1X/1PzhPYAMGx+v3
 3yqA==
X-Gm-Message-State: AOJu0YwLoGzbgaW0ICtb98LZg9/qmXE/k7ByQ57jo3kkfL06pVUM39tn
 aYe+5+qEzB5K6HkXo5mckBU1El+gAEtLtWu8WmOd1RRGGuI=
X-Google-Smtp-Source: AGHT+IE7fxybZv5Y5OFSDK5fPs6+bTbRdCD5v2J5qa+85sqkC2pTMdCO+joDCp33NEn47xuFzRFIYw==
X-Received: by 2002:a17:902:f548:b0:1cb:fcfb:61af with SMTP id
 h8-20020a170902f54800b001cbfcfb61afmr11648100plf.30.1699215972139; 
 Sun, 05 Nov 2023 12:26:12 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a170902ee1400b001c735421215sm4478175plb.216.2023.11.05.12.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 12:26:11 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 13:25:40 -0700
Message-ID: <20231105202555.359391-9-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
References: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699215972; x=1699820772;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CehJPwukihS+RXRBweF7B6AiDa4YXMB/KpaxE3RbgGo=;
 b=BaEYEZ6ez9kR9bgMQb95jGKAGwFGKDBqFH6TZ24fZfIeOKddEXBFYLRyfiBZ/nBReg
 wCZXm5YN/MrWHKPj92aswSJAqxxGUfmeR4bwdGc/0Z+sB4YQ0xWZHlupTILIDvQIXq7g
 AaPLjCPuzv6t+Re4RCH+6DcsVwfBtsMGO0wgQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=BaEYEZ6e
Subject: [Buildroot] [PATCH v2 09/24] package/python3: use upstream build
 system to disable decimal module
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
Cc: Adam Duskett <aduskett@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Bernd Kuhls <bernd@kuhls.net>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bernd Kuhls <bernd@kuhls.net>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Adam Duskett <aduskett@gmail.com>
Tested-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .checkpackageignore                           |  1 -
 ...021-Add-an-option-to-disable-decimal.patch | 54 -------------------
 package/python3/python3.mk                    |  4 +-
 3 files changed, 2 insertions(+), 57 deletions(-)
 delete mode 100644 package/python3/0021-Add-an-option-to-disable-decimal.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 9aada0e774..2d735a8f55 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1154,7 +1154,6 @@ package/python3/0014-Add-an-option-to-disable-the-tk-module.patch Upstream
 package/python3/0016-Add-an-option-to-disable-expat.patch Upstream
 package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch Upstream
 package/python3/0020-Add-an-option-to-disable-IDLE.patch Upstream
-package/python3/0021-Add-an-option-to-disable-decimal.patch Upstream
 package/python3/0026-python-config.sh-don-t-reassign-prefix.patch Upstream
 package/python3/0028-fix-building-on-older-distributions.patch Upstream
 package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch Upstream
diff --git a/package/python3/0021-Add-an-option-to-disable-decimal.patch b/package/python3/0021-Add-an-option-to-disable-decimal.patch
deleted file mode 100644
index d683565f94..0000000000
--- a/package/python3/0021-Add-an-option-to-disable-decimal.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 7091fdf77f612425c178a75148560f9c3514e8b8 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:51:31 +0100
-Subject: [PATCH] Add an option to disable decimal
-
-This patch replaces the existing --with-system-libmpdec option with a
---with-libmpdec={system,builtin,none} option, which allows to tell
-Python whether we want to use the system libmpdec (already installed),
-the libmpdec builtin the Python sources, or no libmpdec at all.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[aduskett@gmail.com: Update for python 3.7.0]
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
-[james.hilliard1@gmail.com: adapt to python 3.9]
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
----
- configure.ac | 19 +++++++++++++------
- 1 file changed, 13 insertions(+), 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5e6d72f7db..e6b1f1e9de 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3630,14 +3630,21 @@ fi
- AC_SUBST(LIBFFI_INCLUDEDIR)
- 
- # Check for use of the system libmpdec library
--AC_MSG_CHECKING(for --with-system-libmpdec)
--AC_ARG_WITH(system_libmpdec,
--            AS_HELP_STRING([--with-system-libmpdec], [build _decimal module using an installed libmpdec library, see Doc/library/decimal.rst (default is no)]),
-+AC_MSG_CHECKING(for --with-libmpdec)
-+AC_ARG_WITH(libmpdec,
-+            AS_HELP_STRING([--with-libmpdec], [select which libmpdec version to use: system, builtin, none]),
-             [],
--            [with_system_libmpdec="no"])
--AC_MSG_RESULT($with_system_libmpdec)
-+            [with_libmpdec="builtin"])
-+AC_MSG_RESULT($with_libmpdec)
-+if test "$with_libmpdec" != "none"; then
-+   MPDEC=yes
-+else
-+   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _decimal"
-+   MPDEC=no
-+fi
-+AC_SUBST(MPDEC)
- 
--AS_VAR_IF([with_system_libmpdec], [yes], [
-+AS_VAR_IF([with_libmpdec], [system], [
-   LIBMPDEC_CFLAGS=${LIBMPDEC_CFLAGS-""}
-   LIBMPDEC_LDFLAGS=${LIBMPDEC_LDFLAGS-"-lmpdec"}
-   LIBMPDEC_INTERNAL=
--- 
-2.34.1
-
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 7518edf104..284e059c63 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -95,9 +95,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_DECIMAL),y)
 PYTHON3_DEPENDENCIES += mpdecimal
-PYTHON3_CONF_OPTS += --with-libmpdec=system
+PYTHON3_CONF_OPTS += --with-system-libmpdec
 else
-PYTHON3_CONF_OPTS += --with-libmpdec=none
+PYTHON3_CONF_ENV += py_cv_module__decimal=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_PYEXPAT),y)
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
