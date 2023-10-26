Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E31C25B48
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 09:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B579641721;
	Thu, 26 Oct 2023 09:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B579641721
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zM__mV4rR54j; Thu, 26 Oct 2023 09:29:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAD914177B;
	Thu, 26 Oct 2023 09:29:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAD914177B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 985011BF2B8
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80EE3839BB
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80EE3839BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PvuS9JaZFMi9 for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 09:27:14 +0000 (UTC)
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8329B839B4
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 09:27:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8329B839B4
Received: by mail-ej1-x642.google.com with SMTP id
 a640c23a62f3a-9b9faf05f51so97445866b.2
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 02:27:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698312432; x=1698917232;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AWEZWT6Gzyz79pboFadRCyuS0zI5goUDjtY1OWBdOz0=;
 b=KjpCdqkJforKiUM0uRPjQ7oIFqkTKrVQcjCVb4FdzAypYM5EaQjBGQWrw3JLWZPifV
 QxEDIe9MBt/iXonrn8edHHeYUHXWrtdVINrBBFG9LxxEp5kisrFyg0VSsh9NUeo69wAh
 9MfTJotI4fmwVBvXJ8LEn1cWwsKNpbyFIajU9TvqWWhxjuzU7XIw1mO2McQWa8w0x0OB
 FmiyUVRFAaW/154TmhAYUyXUOBPh77wftVP0Doep1tsVNu9yqteUIqsbj38oqe4vlwrQ
 8R1frPkd+HVrLvmY4LixCECBsy+ZYcmkfeO6nLLMPJnfUHAUJaIqGA1ZLotuRmOI9NcM
 NktQ==
X-Gm-Message-State: AOJu0YzWN8G6txtnHXMeOHIwaX1d3SLwf4k7R9reP7M7F3ozBx5ARjsM
 08jrB2pC6vOHnN0SJA3seaVoAM8IhtXLWOpMbOYQFE6G21sskNiD
X-Google-Smtp-Source: AGHT+IFoLYajXOaUm8YU715RcsqTcX7Xpbn/047+klUYieqN8sihxCF8FsrtCu+XOei6U/Gcq0uTdQ==
X-Received: by 2002:a17:907:7f13:b0:9a1:c447:3c62 with SMTP id
 qf19-20020a1709077f1300b009a1c4473c62mr13070495ejc.49.1698312432561; 
 Thu, 26 Oct 2023 02:27:12 -0700 (PDT)
Received: from fedora.. ([77.241.232.0]) by smtp.gmail.com with ESMTPSA id
 mb8-20020a170906eb0800b009b947f81c4asm11268438ejb.155.2023.10.26.02.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 02:27:12 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 11:26:40 +0200
Message-ID: <20231026092701.12345-10-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698312432; x=1698917232;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AWEZWT6Gzyz79pboFadRCyuS0zI5goUDjtY1OWBdOz0=;
 b=UH6yZFsD+FA02rbEDfRjdxn9HIQQkKyyfaB6IiuxB2fxqmxY5HZES8PRrZBcxWMBoM
 F1xUl0PP8ve3rkRs/hVaDSMnioRk+Vjz6tbHvbDanKBdLwFCFjYWWK9nkscH+DrI1CWH
 mqcXdrVrJs7gwwCgiLjPSUDBvsDTjmZr0G5Sw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=UH6yZFsD
Subject: [Buildroot] [PATCH 09/30] package/python3: use upstream build
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Julien Olivain <ju.o@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bernd Kuhls <bernd@kuhls.net>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .checkpackageignore                           |  1 -
 ...021-Add-an-option-to-disable-decimal.patch | 54 -------------------
 package/python3/python3.mk                    |  4 +-
 3 files changed, 2 insertions(+), 57 deletions(-)
 delete mode 100644 package/python3/0021-Add-an-option-to-disable-decimal.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 1be6d393c6..8778c52ae2 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1168,7 +1168,6 @@ package/python3/0014-Add-an-option-to-disable-the-tk-module.patch Upstream
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
