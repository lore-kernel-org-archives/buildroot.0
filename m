Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584B6C25B48
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 09:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 075EB41760;
	Thu, 26 Oct 2023 09:30:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 075EB41760
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jTbUWeqFzrsJ; Thu, 26 Oct 2023 09:30:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B85B441709;
	Thu, 26 Oct 2023 09:30:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B85B441709
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 664301BF2B8
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41AF38399E
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41AF38399E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gug9chgkTy48 for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 09:27:19 +0000 (UTC)
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 506CE839BF
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 09:27:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 506CE839BF
Received: by mail-ed1-x542.google.com with SMTP id
 4fb4d7f45d1cf-53d8320f0easo1001726a12.3
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 02:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698312437; x=1698917237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NMEY1K+H+iKh8auVcpYjHARwxSXV52dbmbTdq6X0McE=;
 b=pZ5ARkVXKV+GBHY6RPmYfdESLoSp9LAW8o5ixv6ixxDoetVf8/mMpNTgpXLFAhHdwJ
 +xUrTDG4ltld6Mw3n+kBdM7RWaQEzoxokCT+votWEcMiKOM/BjYsXL7TvoEDqZNF6lAb
 lWx0QJbTFEKrxNe6HYU4Blbo72oy5P2rWRw1grVOs5HOJjKiOkG3DrZb+YNhTfXkkiGT
 XEpAl9vAeelXDrPYERFN03/aE/IV/m06DM2O0sNcsBA3RKWW8oWJgINZQVcluV9HPoHW
 McE/KGhVz3QNqs7zmIGvm4ZinHVUdoEUahAHrk4j+Rou/SbiuWaK6Md04XW22125yOzq
 1sPA==
X-Gm-Message-State: AOJu0YzHzzNAbeoETrUxdbO5eo3+G+BM3tHxluPfqMn6MTZQKJhT25Im
 liGYljI4I8ISswyncIEWBnuLBE4pF1N/Z49cKgxr2+rs2UXj5nvy
X-Google-Smtp-Source: AGHT+IFz7Qwrb410904fkluCmAejPuhtWQQV2BGmMyWTIbKTsyO9si4IjWyPFQmEtM/vCa2ie8HD3A==
X-Received: by 2002:a17:906:794c:b0:9c6:4224:67d2 with SMTP id
 l12-20020a170906794c00b009c6422467d2mr17067611ejo.50.1698312437058; 
 Thu, 26 Oct 2023 02:27:17 -0700 (PDT)
Received: from fedora.. ([77.241.232.0]) by smtp.gmail.com with ESMTPSA id
 mb8-20020a170906eb0800b009b947f81c4asm11268438ejb.155.2023.10.26.02.27.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 02:27:16 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 11:26:44 +0200
Message-ID: <20231026092701.12345-14-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698312437; x=1698917237;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NMEY1K+H+iKh8auVcpYjHARwxSXV52dbmbTdq6X0McE=;
 b=kyiVYzR5K1KOJxz4dK9h3pHy8EICKno6bFMm3XkUUJg9YWXHCtXLEA7couFQ6jRroI
 1rchzShZKPchEwWvUE+rXeTngfZEaHdHtEKqv1BnJyISjw5SIvwdJwo9rZwBI0mr7idG
 1PTDMtLpHt4o2Ifo3MiX9foPI6TCw0l0P5mYs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=kyiVYzR5
Subject: [Buildroot] [PATCH 13/30] package/python3: update patch and partly
 use upstream build system to disable tk module
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
