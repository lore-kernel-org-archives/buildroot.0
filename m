Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63D9C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 20:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5163740A7F;
	Sun,  5 Nov 2023 20:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5163740A7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZLSKemK7w0RD; Sun,  5 Nov 2023 20:27:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E807D40A7E;
	Sun,  5 Nov 2023 20:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E807D40A7E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 00A6C1BF48C
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDBA0418A7
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDBA0418A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cIDg2Jzo5L33 for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 20:26:12 +0000 (UTC)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 286C7418A6
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 20:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 286C7418A6
Received: by mail-pl1-x643.google.com with SMTP id
 d9443c01a7336-1cc2fc281cdso27565015ad.0
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 12:26:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699215971; x=1699820771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3dKQsJH8I1W/vGUNEw8gfnQcHBb6K/aGQY7Ejf9R/tc=;
 b=QOrHc8dAQcQM+U8+KgnrZTn5xH4Sf3mSYwX1/b7/4u3ripnqst1X4DkLEWA8JHJL0i
 GxgH6PtXeG0VOmJpEJ5wCCjD1rc+4YuziNeSC2LceWSK2DURfag+jJ3MFaGtcHYNC7/W
 vkb9Anx73oVVhQ/P4qtDDzN6pX3GkzbV+WUhciqK6hRMOv84I4Vgqf96fFWjg70ZhK/9
 oJcr0UVdowUrq+PTfelnPa/gl0DqLaLfc4qGp01EYJEGLlHWvlVSyy9Jfgo1XaruomPD
 rYxJMRKLXe1oUB271qtF1VInEvUK7xU3zBfSswGlmSLNBEa8oZWQFVr5nv0mNXjl9wDy
 Aeig==
X-Gm-Message-State: AOJu0Ywa6zkKltcsWN+y1yLHf3xQtkv7ZQzGGRQG9wbmiUiEouC3eMjq
 ushSmTwltFl/ME8Y0wZwpvymNOiE9C42SumdCzWd2xlDyzw=
X-Google-Smtp-Source: AGHT+IEuyRgmMPX6p6aAwuIjuNL8TGKg5VxktRwUvFbzFIPyD951gY83coOGarWz4wRVfhOkylt/hg==
X-Received: by 2002:a17:903:1d2:b0:1cc:6fa1:c991 with SMTP id
 e18-20020a17090301d200b001cc6fa1c991mr15808599plh.10.1699215970735; 
 Sun, 05 Nov 2023 12:26:10 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a170902ee1400b001c735421215sm4478175plb.216.2023.11.05.12.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 12:26:09 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 13:25:39 -0700
Message-ID: <20231105202555.359391-8-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
References: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699215971; x=1699820771;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3dKQsJH8I1W/vGUNEw8gfnQcHBb6K/aGQY7Ejf9R/tc=;
 b=PwV4Fvjte68RvJrUwnxWvJruWEW04bMsmqdSHB2XJ5V7CL7Eeg7MpTpIt3Lc0THw/A
 MHaQILGRAFPfqhzJwTmhbFR3fkyf4arjkTv45cl80lKd/LOpU6Bgjd+mMJXQ9CekGWhq
 NgIpi6C0numCFAqbOX66Yt+u5h6WkZBtXC294=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=PwV4Fvjt
Subject: [Buildroot] [PATCH v2 08/24] package/python3: use upstream build
 system to disable nis module
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
 .../0018-Add-an-option-to-disable-NIS.patch   | 33 -------------------
 package/python3/python3.mk                    |  4 +--
 3 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 package/python3/0018-Add-an-option-to-disable-NIS.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 31f4d4f7e3..9aada0e774 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1153,7 +1153,6 @@ package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch Upstream
 package/python3/0014-Add-an-option-to-disable-the-tk-module.patch Upstream
 package/python3/0016-Add-an-option-to-disable-expat.patch Upstream
 package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch Upstream
-package/python3/0018-Add-an-option-to-disable-NIS.patch Upstream
 package/python3/0020-Add-an-option-to-disable-IDLE.patch Upstream
 package/python3/0021-Add-an-option-to-disable-decimal.patch Upstream
 package/python3/0026-python-config.sh-don-t-reassign-prefix.patch Upstream
diff --git a/package/python3/0018-Add-an-option-to-disable-NIS.patch b/package/python3/0018-Add-an-option-to-disable-NIS.patch
deleted file mode 100644
index 977955d1cb..0000000000
--- a/package/python3/0018-Add-an-option-to-disable-NIS.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 09fc9f72ebe60bb65e80732a6bd4f12a84159f6d Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:50:11 +0100
-Subject: [PATCH] Add an option to disable NIS
-
-NIS is not necessarily available in uClibc, so we need an option to
-not compile support for it.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index ecdd7dbc07..1bdde7f69d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4194,6 +4194,12 @@ AC_ARG_ENABLE(codecs-cjk,
- 		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
- 	fi])
- 
-+AC_ARG_ENABLE(nis,
-+	AS_HELP_STRING([--disable-nis], [disable NIS]),
-+	[ if test "$enableval" = "no"; then
-+    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
-+  	  fi])
-+
- AC_SUBST(TK)
- AC_ARG_ENABLE(tk,
- 	AS_HELP_STRING([--disable-tk], [disable tk]),
--- 
-2.34.1
-
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 7c0473c1b0..7518edf104 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -23,7 +23,6 @@ HOST_PYTHON3_CONF_OPTS += \
 	--disable-tk \
 	--with-expat=system \
 	--disable-codecs-cjk \
-	--disable-nis \
 	--disable-test-modules \
 	--disable-idle3 \
 	--disable-ossaudiodev
@@ -37,6 +36,7 @@ HOST_PYTHON3_CONF_ENV += \
 	LDFLAGS="$(HOST_LDFLAGS) -Wl,--enable-new-dtags" \
 	py_cv_module__curses=n/a \
 	py_cv_module__curses_panel=n/a \
+	py_cv_module_nis=n/a \
 	py_cv_module_unicodedata=yes \
 	py_cv_module__uuid=n/a \
 	ac_cv_prog_HAS_HG=/bin/false
@@ -164,6 +164,7 @@ PYTHON3_CONF_ENV += \
 	ac_cv_file__dev_ptmx=yes \
 	ac_cv_file__dev_ptc=yes \
 	ac_cv_working_tzset=yes \
+	py_cv_module_nis=n/a \
 	ac_cv_prog_HAS_HG=/bin/false
 
 # GCC is always compliant with IEEE754
@@ -191,7 +192,6 @@ PYTHON3_CONF_OPTS += \
 	--disable-pydoc \
 	--disable-test-modules \
 	--disable-tk \
-	--disable-nis \
 	--disable-idle3 \
 	--disable-pyc-build
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
