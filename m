Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEAAC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 20:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 447F440A71;
	Sun,  5 Nov 2023 20:28:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 447F440A71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hr_wGVMxDWL3; Sun,  5 Nov 2023 20:28:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DFCB40A6F;
	Sun,  5 Nov 2023 20:28:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DFCB40A6F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6316E1BF48C
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C1F381E9C
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C1F381E9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OUX9Kc-V6GE6 for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 20:26:19 +0000 (UTC)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8CD4C81E93
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 20:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CD4C81E93
Received: by mail-pl1-x641.google.com with SMTP id
 d9443c01a7336-1cc53d0030fso30716675ad.0
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 12:26:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699215978; x=1699820778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YgxmfjgBC9OAjDS2lgr/mX4wxbGnFI32+I9fNkD8+mw=;
 b=n9Fq9Y/oxGCO+KFuZ8I16cdPuc5xWx4Z2kyluAQqwg5kJPTSz4vi9E8iS8gcoihvYS
 6+N4Oob77/7q0cJ0AJpYaIb8xm3ei69nfK/u3QyWeFAMioHB6DZ0CAT2W/9VN770CnzD
 8SghQkzVbxYhoBq/AMnAukXLBhMjGqrx1gandeplqgseyf7mh2+lu/joQCP08/BEoemN
 C4TfxbC4x90cGNJvAZzOCgeTHwBV398o/j5p+Mq61fzjG2YFTRdXWrdcZT+cvXSQuert
 mkGSrdfW/F/mddZs2e4cukjAvWxiaYTL6XMHPII1UFk4Yb52aNppp9A2CvKur59KXWMk
 iDxw==
X-Gm-Message-State: AOJu0YyuTcjjXfKEV8kVsD9Mpv0pY6S3ikuzm0dGbWEAEFKOkkGyV5Q2
 zmL4W3bFatQd4Gpl2oGR/yuJ44W93s7j7IEJKJZe/9ugApg=
X-Google-Smtp-Source: AGHT+IGUsmDBSo4BgQcZy+wkxy1NK3XOQ1hPgqNvRtqBWgMqHCJylJ55BQD9HjblL/7clDp7UyQhrg==
X-Received: by 2002:a17:903:120c:b0:1cc:467a:338f with SMTP id
 l12-20020a170903120c00b001cc467a338fmr12987186plh.4.1699215978138; 
 Sun, 05 Nov 2023 12:26:18 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a170902ee1400b001c735421215sm4478175plb.216.2023.11.05.12.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 12:26:17 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 13:25:44 -0700
Message-ID: <20231105202555.359391-13-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
References: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699215978; x=1699820778;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YgxmfjgBC9OAjDS2lgr/mX4wxbGnFI32+I9fNkD8+mw=;
 b=N9PfigxAkVv/AvlvYocL9YnkJzPm9aucSHjUpfhxLy+QCnMe1E7J5qDNq2r4k/c154
 SjSl6/KSIAXU86l+BVQl8lVh+Rd8qif5SOXVrAcFxIBCYJj0jJ0yUaKQ1FoQQRfz5NYM
 xQANdiQKnOqIHZPVICKisAvw2Lnu6cp+tswnw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=N9PfigxA
Subject: [Buildroot] [PATCH v2 13/24] package/python3: update patch and
 partly use upstream build system to disable tk module
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
 ...d-an-option-to-disable-the-tk-module.patch | 33 +++++++------------
 package/python3/python3.mk                    |  2 ++
 2 files changed, 14 insertions(+), 21 deletions(-)

diff --git a/package/python3/0014-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0014-Add-an-option-to-disable-the-tk-module.patch
index b89e1d27bc..1ed8959dba 100644
--- a/package/python3/0014-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python3/0014-Add-an-option-to-disable-the-tk-module.patch
@@ -20,15 +20,15 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 9f4cdf14cf..4f83911200 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1920,7 +1920,6 @@ LIBSUBDIRS=	asyncio \
- 		multiprocessing multiprocessing/dummy \
+@@ -1921,7 +1921,6 @@
  		re \
  		site-packages \
+ 		sqlite3 \
 -		tkinter \
  		tomllib \
  		turtledemo \
  		unittest \
-@@ -2038,9 +2038,6 @@
+@@ -2039,12 +2038,15 @@
  		test/xmltestdata \
  		test/xmltestdata/c14n-20 \
  		test/ziptestdata \
@@ -37,10 +37,6 @@ index 9f4cdf14cf..4f83911200 100644
 -		tkinter/test/test_ttk \
  		unittest/test \
  		unittest/test/testmock
- ifeq (@PYDOC@,yes)
-@@ -2021,6 +2018,13 @@ ifeq (@SQLITE3@,yes)
- LIBSUBDIRS += sqlite3
- endif
  
 +ifeq (@TK@,yes)
 +LIBSUBDIRS += tkinter
@@ -48,30 +44,25 @@ index 9f4cdf14cf..4f83911200 100644
 +	tkinter/test/test_ttk
 +endif
 +
-+
- TEST_MODULES=@TEST_MODULES@
- libinstall:	all $(srcdir)/Modules/xxmodule.c
- 	@for i in $(SCRIPTDIR) $(LIBDEST); \
+ ifeq (@PYDOC@,yes)
+ LIBSUBDIRS += pydoc_data
+ endif
 diff --git a/configure.ac b/configure.ac
 index 4cc0951ab9..f4ce506801 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4180,6 +4180,15 @@ if test "$SQLITE3" = "no" ; then
-    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
- fi
+@@ -4202,6 +4202,11 @@
+ 	AS_HELP_STRING([--disable-pydoc], [disable pydoc]),
+ 	[ PYDOC="${enableval}" ], [ PYDOC=yes ])
  
 +AC_SUBST(TK)
 +AC_ARG_ENABLE(tk,
 +	AS_HELP_STRING([--disable-tk], [disable tk]),
 +	[ TK="${enableval}" ], [ TK=yes ])
 +
-+if test "$TK" = "no"; then
-+   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
-+fi
-+
- AC_SUBST(PYDOC)
- 
- AC_ARG_ENABLE(pydoc,
+ # Check for enable-ipv6
+ AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
+ AC_MSG_CHECKING([if --enable-ipv6 is specified])
 -- 
 2.34.1
 
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 8b06c28fde..04105289d6 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -43,6 +43,7 @@ HOST_PYTHON3_CONF_ENV += \
 	py_cv_module__codecs_kr=n/a \
 	py_cv_module__codecs_tw=n/a \
 	py_cv_module__sqlite3=n/a \
+	py_cv_module__tkinter=n/a \
 	py_cv_module__uuid=n/a \
 	ac_cv_prog_HAS_HG=/bin/false
 
@@ -176,6 +177,7 @@ PYTHON3_CONF_ENV += \
 	ac_cv_file__dev_ptc=yes \
 	ac_cv_working_tzset=yes \
 	py_cv_module_nis=n/a \
+	py_cv_module__tkinter=n/a \
 	ac_cv_prog_HAS_HG=/bin/false
 
 # GCC is always compliant with IEEE754
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
