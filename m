Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44ADBC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 20:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC83A40A90;
	Sun,  5 Nov 2023 20:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC83A40A90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xBI4VFMefwup; Sun,  5 Nov 2023 20:27:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AED1040A84;
	Sun,  5 Nov 2023 20:27:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AED1040A84
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E47341BF48C
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDC6481E10
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDC6481E10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K72n2MUN__2r for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 20:26:09 +0000 (UTC)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 146C181E00
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 20:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 146C181E00
Received: by mail-pj1-x1044.google.com with SMTP id
 98e67ed59e1d1-2802b744e52so3893858a91.0
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 12:26:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699215967; x=1699820767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NQZe8hMRyi6aklIK78ht/7IHMNJyig+YSNUNbnYq+QA=;
 b=sK245fPLOLDGCz5k0eBtqqmYM6qm3WLnPXd8mGDn5OMmoYwwBr0z6NSBFAFebscwS1
 mEHiu1LKE6ZiFgQt/Hs0uX+tKgqr3xTjure09jDDjFbUS/bctCprXPNF2uDD4BR3VnMY
 lvBUOqeUnc/jFTHADGnRjJhu2JxSJiWQJavCKNfECxNH9NzsQczncBPERaMTFBUTH2DR
 jaIx318SQvcQfH3RajNbG1S13CWFrmSvi4ygEksTlM2P4qhzPwjpgNMRnxiFUU/ODCGb
 tnncWgYfz945fGQWNJKa6pH5C6RnhI29QbaxXRUg0w/1zWGlxVUh8i5qySHUFbaKrqjZ
 Rd3A==
X-Gm-Message-State: AOJu0YwOeZ7PW9nYixMuy0gXBy7b2G1yfwqQaekVfZaD+NwTl8axQq6Y
 RwWT4KDGhQHwDhw44OK0vycM2qw+DBNYWZNfbway57V+0no=
X-Google-Smtp-Source: AGHT+IEdSCzM1o8yh0IDSOJ6+30pyW/Lc1V2A74FYFfOb9Y3oVmivNiKh/DSdwC6xZNWQMfbjwlFJw==
X-Received: by 2002:a17:90a:d997:b0:281:3a5:d2ec with SMTP id
 d23-20020a17090ad99700b0028103a5d2ecmr1028103pjv.8.1699215967473; 
 Sun, 05 Nov 2023 12:26:07 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a170902ee1400b001c735421215sm4478175plb.216.2023.11.05.12.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 12:26:06 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 13:25:37 -0700
Message-ID: <20231105202555.359391-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
References: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699215967; x=1699820767;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NQZe8hMRyi6aklIK78ht/7IHMNJyig+YSNUNbnYq+QA=;
 b=ia/7WUE5bvpHX5zGF7gQ/vGhf202H16Q0VrZ1OdnyXBjOjpT/f6CsKJxUyrAmmt0OS
 PydNlWTtZbMeru059rxlZrnw28I9pMDz8y6Bs51kIY/1oHMauYfqOPpEsisyI8Wpeld6
 OsiGr5JcfNon9l3uyf+158c+x9eUO4f5QG5ko=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ia/7WUE5
Subject: [Buildroot] [PATCH v2 06/24] package/python3: use upstream build
 system to disable ossaudiodev module
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
 ...on-to-disable-the-ossaudiodev-module.patch | 30 -------------------
 package/python3/python3.mk                    |  6 ++--
 3 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index bfa65f5a0a..97b1f2db1a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1157,7 +1157,6 @@ package/python3/0018-Add-an-option-to-disable-NIS.patch Upstream
 package/python3/0019-Add-an-option-to-disable-unicodedata.patch Upstream
 package/python3/0020-Add-an-option-to-disable-IDLE.patch Upstream
 package/python3/0021-Add-an-option-to-disable-decimal.patch Upstream
-package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch Upstream
 package/python3/0026-python-config.sh-don-t-reassign-prefix.patch Upstream
 package/python3/0028-fix-building-on-older-distributions.patch Upstream
 package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch Upstream
diff --git a/package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch b/package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch
deleted file mode 100644
index 56713a7f8f..0000000000
--- a/package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From d48d9da534cec7891ae444b4ab94a76ac67f5daa Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:51:58 +0100
-Subject: [PATCH] Add an option to disable the ossaudiodev module
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index e6b1f1e9de..db33d567ad 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3678,6 +3678,12 @@ fi
- 
- AC_MSG_RESULT($with_decimal_contextvar)
- 
-+AC_ARG_ENABLE(ossaudiodev,
-+	AS_HELP_STRING([--disable-ossaudiodev], [disable OSSAUDIODEV]),
-+	[ if test "$enableval" = "no"; then
-+	  DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ossaudiodev"
-+	  fi])
-+
- # Check for libmpdec machine flavor
- AC_MSG_CHECKING(for decimal libmpdec machine)
- AS_CASE([$ac_sys_system],
--- 
-2.34.1
-
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 79a89ca225..0033bec2bc 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -153,10 +153,8 @@ else
 PYTHON3_CONF_ENV += py_cv_module_zlib=n/a
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON3_OSSAUDIODEV),y)
-PYTHON3_CONF_OPTS += --enable-ossaudiodev
-else
-PYTHON3_CONF_OPTS += --disable-ossaudiodev
+ifneq ($(BR2_PACKAGE_PYTHON3_OSSAUDIODEV),y)
+PYTHON3_CONF_ENV += py_cv_module_ossaudiodev=n/a
 endif
 
 # Make python believe we don't have 'hg', so that it doesn't try to
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
