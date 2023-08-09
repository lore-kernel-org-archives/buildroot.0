Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F04AC001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 21:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0612461005;
	Wed,  9 Aug 2023 21:16:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0612461005
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TzB8qhGh_iga; Wed,  9 Aug 2023 21:16:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1263160FDB;
	Wed,  9 Aug 2023 21:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1263160FDB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BEE791BF28A
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A601040647
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:16:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A601040647
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X97UQ5jdGQ0B for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 21:16:32 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D063D400D9
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 21:16:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D063D400D9
Received: from fli4l.lan.fli4l (p4fd6c449.dip0.t-ipconnect.de [79.214.196.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C06AEA4C1115;
 Wed,  9 Aug 2023 23:14:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57460)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTqVH-0001EZ-1w;
 Wed, 09 Aug 2023 23:14:03 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 23:14:00 +0200
Message-Id: <20230809211401.3587177-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809211401.3587177-1-bernd@kuhls.net>
References: <20230809211401.3587177-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691615643;
 bh=RxtyjswjXZItm8Y5Ki5J59Rk47M4Oz/OEjSBjr928pI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iJ874yqQy8rn/ryHOyOMC0SmNSh6yqFZVrT7KYlRBKwQcdWY3+CYgxjbq+KwR+t9B
 4OCLFAwMtceMAZIy+AC18J+CRyeoDOCWWAps3gr/bpTHrjHgbpwzCdpVqyMtBg6Not
 7xGpjSPRFLPwziwSN9kFQWx6h3kelMNcUOFWQzQ4AQTvoln89vivf2SLSuutaEeams
 O7vzHDUemTXvR4hk0RvkdiJh6otIC1/6ZiX+2cpIvLcDVirjJFl2vU0u+luNhqmyDX
 jDgdufLdTA6yYFtLnHviKp5f4cZiy3B45zpeNTErHSXPYLtClAGyM/4qQuqGGatA8T
 WL5XShrKKvSCA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=iJ874yqQ
Subject: [Buildroot] [PATCH/next v3 13/14] package/python3: update patch and
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
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
index 215bbb6a03..87d8ccef75 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -46,6 +46,7 @@ HOST_PYTHON3_CONF_ENV += \
 	py_cv_module__codecs_kr=n/a \
 	py_cv_module__codecs_tw=n/a \
 	py_cv_module__sqlite3=n/a \
+	py_cv_module__tkinter=n/a \
 	py_cv_module__uuid=n/a \
 	ac_cv_prog_HAS_HG=/bin/false
 
@@ -179,6 +180,7 @@ PYTHON3_CONF_ENV += \
 	ac_cv_file__dev_ptc=yes \
 	ac_cv_working_tzset=yes \
 	py_cv_module_nis=n/a \
+	py_cv_module__tkinter=n/a \
 	ac_cv_prog_HAS_HG=/bin/false
 
 # GCC is always compliant with IEEE754
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
