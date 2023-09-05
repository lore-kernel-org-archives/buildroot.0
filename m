Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3D6CA0FFA
	for <buildroot@archiver.kernel.org>; Tue,  5 Sep 2023 18:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28068418B9;
	Tue,  5 Sep 2023 18:07:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28068418B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qXC5ljVDjSVJ; Tue,  5 Sep 2023 18:07:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96737418DF;
	Tue,  5 Sep 2023 18:07:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96737418DF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D790A1BF318
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 18:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B119160BEC
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 18:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B119160BEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SA6iR6hDOHwV for <buildroot@lists.busybox.net>;
 Tue,  5 Sep 2023 18:06:27 +0000 (UTC)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E84960BDD
 for <buildroot@buildroot.org>; Tue,  5 Sep 2023 18:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E84960BDD
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1bf1935f6c2so806555ad.1
 for <buildroot@buildroot.org>; Tue, 05 Sep 2023 11:06:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693937186; x=1694541986;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WCa8I+yBdSr2B9GR71GXJyU4B0ap1hPsVsALbsqqO64=;
 b=TNx9faWNRmke1C8FOU+WBrgO7I/+DwZcgNfCX7aBzbuQRq4dMuGdLYY/neauafGRwA
 TEWVdQ2VHcX54tm42DLb5KzB9U7P3EfVKKkP+1iCNf/i6QUK12hxx4k4Zq8wyAGoSRoE
 3rLtNSFeByauchl/4pQOwwQ1zXx+McFpTOUBO73xQvtlbyg/DUkqF4KSXNGMoouXLlRc
 9VxKKy1PIGr3GnuDYEo9g5umjjfOkyGGh9VBWf+aBF/d60SmqzQX6e9bsSCNuoJtCpHx
 J4sKh4lbgeVlLClOq7uRiEl/B1vmH26i/jHwnLR0yPeojWJ7WBNWUpvr63eo2KHy8nDS
 g4hQ==
X-Gm-Message-State: AOJu0YxINqegZCXr0otYruq7bDZB/Gi7x73feNjYPdwyhdKMRLXkXYov
 sMvGU9xqCn7OP9TfM1IJRvcTH8jH5H4=
X-Google-Smtp-Source: AGHT+IGSeWDOZKC0wnrIm7/ZRAFywr9Nu+rNELelUSaRRLiV08NvyHJH0wYimg0ECD3mreOe18psCg==
X-Received: by 2002:a17:902:d34b:b0:1b7:f64b:379b with SMTP id
 l11-20020a170902d34b00b001b7f64b379bmr13859465plk.17.1693937186356; 
 Tue, 05 Sep 2023 11:06:26 -0700 (PDT)
Received: from Adam-laptop.lan ([172.56.200.156])
 by smtp.gmail.com with ESMTPSA id
 ix21-20020a170902f81500b001bba7aab826sm9658143plb.163.2023.09.05.11.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 11:06:25 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Sep 2023 12:06:07 -0600
Message-Id: <20230905180610.1610778-7-aduskett@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905180610.1610778-1-aduskett@gmail.com>
References: <20230905180610.1610778-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693937186; x=1694541986; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WCa8I+yBdSr2B9GR71GXJyU4B0ap1hPsVsALbsqqO64=;
 b=WCkLgrKIGNShetWIW3QRyjwQ8Ck9/ASB21qvb9iPSJO4W1hoyKxPogcG4hNvZvU2eO
 6VZNm4O5fVV9hT2sS1xqcVCwI4craQIUcQJ6p57y4KIeCKP2X5WYr5lae1ePPDNjnxzy
 1krWAGSbuR13vhoh/XHoa8UW7bpjQw/i8U7WYkhp/dqJRhEUC4PUNg4+WKLsM28Eyflg
 dMxwOEk9h1cY+Kfu6g90JiAW4SJXcpOo9cY39BwAehW/CP4JpXP+G3g9CYVurv8Uz716
 mhKZGjCYgKEI4EUYI4JJUe2Ph+KaKvA2/mOESXlgEPFJ/rYQDi14cOk/EogEAaqahQhq
 K1jQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=WCkLgrKI
Subject: [Buildroot] [PATCH 07/10] package/php-pecl-dbus: bump version to
 b147624d480c3353e6c700e9a2d0c6f14d853941
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
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>, Adam Duskett <aduskett@gmail.comm>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Adam Duskett <aduskett@gmail.comm>

Drop upstream patches.

Signed-off-by: Adam Duskett <aduskett@gmail.comm>
---
 package/php-pecl-dbus/0001-php8-compat.patch  | 158 ------------------
 ...lity-with-php8-call_user_function_ex.patch |  32 ----
 package/php-pecl-dbus/php-pecl-dbus.hash      |   2 +-
 package/php-pecl-dbus/php-pecl-dbus.mk        |   2 +-
 4 files changed, 2 insertions(+), 192 deletions(-)
 delete mode 100644 package/php-pecl-dbus/0001-php8-compat.patch
 delete mode 100644 package/php-pecl-dbus/0002-Fix-compatibility-with-php8-call_user_function_ex.patch

diff --git a/package/php-pecl-dbus/0001-php8-compat.patch b/package/php-pecl-dbus/0001-php8-compat.patch
deleted file mode 100644
index acca6e1d49..0000000000
--- a/package/php-pecl-dbus/0001-php8-compat.patch
+++ /dev/null
@@ -1,158 +0,0 @@
-From 7fde4dd4d26d2a4b7957a1010c6ea9e4b940fc62 Mon Sep 17 00:00:00 2001
-From: Stefan Saraev <stefan@saraev.ca>
-Date: Mon, 18 Jan 2021 23:22:52 +0200
-Subject: [PATCH] php8 compat
-
-Upstream: https://github.com/derickr/pecl-dbus/pull/8
-Signed-off-by: Herve Codina <herve.codina@bootlin.com>
----
- dbus.c     | 55 ++++++++++++++++++++++++++++++------------------------
- php_dbus.h | 10 ++++++++++
- 2 files changed, 41 insertions(+), 24 deletions(-)
-
-diff --git a/dbus.c b/dbus.c
-index 9fde647..a98e2ea 100644
---- a/dbus.c
-+++ b/dbus.c
-@@ -38,6 +38,9 @@
- #define Z_ADDREF_P(z) ((z)->refcount++)
- #endif
- 
-+ZEND_BEGIN_ARG_INFO_EX(arginfo_void, 0, 0, 0)
-+ZEND_END_ARG_INFO()
-+
- /* {{{ arginfo */
- ZEND_BEGIN_ARG_INFO_EX(arginfo_dbus_object___call, 0, 0, 2)
- 	ZEND_ARG_INFO(0, function_name)
-@@ -46,44 +49,44 @@ ZEND_END_ARG_INFO()
- /* }}} */
- 
- const zend_function_entry dbus_funcs_dbus[] = {
--	PHP_ME(Dbus, __construct, NULL, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
--	PHP_ME(Dbus, addWatch,    NULL, ZEND_ACC_PUBLIC)
--	PHP_ME(Dbus, waitLoop,    NULL, ZEND_ACC_PUBLIC)
--	PHP_ME(Dbus, requestName, NULL, ZEND_ACC_PUBLIC)
--	PHP_ME(Dbus, registerObject, NULL, ZEND_ACC_PUBLIC)
--	PHP_ME(Dbus, createProxy, NULL, ZEND_ACC_PUBLIC)
-+	PHP_ME(Dbus, __construct, arginfo_void, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
-+	PHP_ME(Dbus, addWatch,    arginfo_void, ZEND_ACC_PUBLIC)
-+	PHP_ME(Dbus, waitLoop,    arginfo_void, ZEND_ACC_PUBLIC)
-+	PHP_ME(Dbus, requestName, arginfo_void, ZEND_ACC_PUBLIC)
-+	PHP_ME(Dbus, registerObject, arginfo_void, ZEND_ACC_PUBLIC)
-+	PHP_ME(Dbus, createProxy, arginfo_void, ZEND_ACC_PUBLIC)
- 	PHP_FE_END
- };
- 
- const zend_function_entry dbus_funcs_dbus_object[] = {
--	PHP_ME(DbusObject, __construct, NULL, ZEND_ACC_CTOR|ZEND_ACC_PRIVATE)
-+	PHP_ME(DbusObject, __construct, arginfo_void, ZEND_ACC_CTOR|ZEND_ACC_PRIVATE)
- 	PHP_ME(DbusObject, __call,      arginfo_dbus_object___call, ZEND_ACC_PUBLIC)
- 	PHP_FE_END
- };
- 
- const zend_function_entry dbus_funcs_dbus_signal[] = {
--	PHP_ME(DbusSignal, __construct, NULL, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
--	PHP_ME(DbusSignal, matches,     NULL, ZEND_ACC_PUBLIC)
--	PHP_ME(DbusSignal, getData,     NULL, ZEND_ACC_PUBLIC)
--	PHP_ME(DbusSignal, send,        NULL, ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusSignal, __construct, arginfo_void, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusSignal, matches,     arginfo_void, ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusSignal, getData,     arginfo_void, ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusSignal, send,        arginfo_void, ZEND_ACC_PUBLIC)
- 	PHP_FE_END
- };
- 
- const zend_function_entry dbus_funcs_dbus_array[] = {
--	PHP_ME(DbusArray, __construct, NULL, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
--	PHP_ME(DbusArray, getData,     NULL, ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusArray, __construct, arginfo_void, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusArray, getData,     arginfo_void, ZEND_ACC_PUBLIC)
- 	PHP_FE_END
- };
- 
- const zend_function_entry dbus_funcs_dbus_dict[] = {
--	PHP_ME(DbusDict, __construct, NULL, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
--	PHP_ME(DbusDict, getData,     NULL, ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusDict, __construct, arginfo_void, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusDict, getData,     arginfo_void, ZEND_ACC_PUBLIC)
- 	PHP_FE_END
- };
- 
- #define PHP_DBUS_INT_WRAPPER_DEF(s,t) \
- 	const zend_function_entry dbus_funcs_dbus_##s[] = { \
--		PHP_ME(Dbus##t, __construct, NULL, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC) \
-+		PHP_ME(Dbus##t, __construct, arginfo_void, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC) \
- 		PHP_FE_END \
- 	};
- 
-@@ -98,26 +101,26 @@ PHP_DBUS_INT_WRAPPER_DEF(uint64,UInt64);
- PHP_DBUS_INT_WRAPPER_DEF(double, Double);
- 
- const zend_function_entry dbus_funcs_dbus_variant[] = {
--	PHP_ME(DbusVariant, __construct, NULL, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
--	PHP_ME(DbusVariant, getData,     NULL, ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusVariant, __construct, arginfo_void, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusVariant, getData,     arginfo_void, ZEND_ACC_PUBLIC)
- 	PHP_FE_END
- };
- 
- const zend_function_entry dbus_funcs_dbus_set[] = {
--	PHP_ME(DbusSet, __construct, NULL, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
--	PHP_ME(DbusSet, getData,     NULL, ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusSet, __construct, arginfo_void, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusSet, getData,     arginfo_void, ZEND_ACC_PUBLIC)
- 	PHP_FE_END
- };
- 
- const zend_function_entry dbus_funcs_dbus_struct[] = {
--	PHP_ME(DbusStruct, __construct, NULL, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
--	PHP_ME(DbusStruct, getData,     NULL, ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusStruct, __construct, arginfo_void, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusStruct, getData,     arginfo_void, ZEND_ACC_PUBLIC)
- 	PHP_FE_END
- };
- 
- const zend_function_entry dbus_funcs_dbus_object_path[] = {
--	PHP_ME(DbusObjectPath, __construct, NULL, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
--	PHP_ME(DbusObjectPath, getData,     NULL, ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusObjectPath, __construct, arginfo_void, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusObjectPath, getData,     arginfo_void, ZEND_ACC_PUBLIC)
- 	PHP_FE_END
- };
- 
-@@ -405,7 +408,11 @@ static void dbus_register_classes(TSRMLS_D)
- 	dbus_ce_dbus = zend_register_internal_class_ex(&ce_dbus, NULL);
- 	memcpy(&dbus_object_handlers_dbus, zend_get_std_object_handlers(), sizeof(zend_object_handlers));
- 	dbus_object_handlers_dbus.clone_obj = dbus_object_clone_dbus;
-+#if PHP_VERSION_ID < 80000
- 	dbus_object_handlers_dbus.compare_objects = dbus_object_compare_dbus;
-+#else
-+	dbus_object_handlers_dbus.compare = dbus_object_compare_dbus;
-+#endif
- 
- 	zend_declare_class_constant_long(dbus_ce_dbus, "BYTE", sizeof("BYTE")-1, DBUS_TYPE_BYTE TSRMLS_CC);
- 	zend_declare_class_constant_long(dbus_ce_dbus, "BOOLEAN", sizeof("BOOLEAN")-1, DBUS_TYPE_BOOLEAN TSRMLS_CC);
-diff --git a/php_dbus.h b/php_dbus.h
-index 8817544..1f0f551 100644
---- a/php_dbus.h
-+++ b/php_dbus.h
-@@ -25,6 +25,16 @@
- #include "config.h"
- #endif
- 
-+#if PHP_VERSION_ID >= 80000
-+#ifndef TSRMLS_D
-+#define TSRMLS_D void
-+#define TSRMLS_DC
-+#define TSRMLS_C
-+#define TSRMLS_CC
-+#define TSRMLS_FETCH()
-+#endif
-+#endif /* PHP_VERSION_ID >= 80000 */
-+
- #include "Zend/zend_hash.h"
- 
- #define PHP_DBUS_VERSION "0.2.0"
--- 
-2.31.1
-
diff --git a/package/php-pecl-dbus/0002-Fix-compatibility-with-php8-call_user_function_ex.patch b/package/php-pecl-dbus/0002-Fix-compatibility-with-php8-call_user_function_ex.patch
deleted file mode 100644
index 5babce94b4..0000000000
--- a/package/php-pecl-dbus/0002-Fix-compatibility-with-php8-call_user_function_ex.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 8cf66c4b5dd657ca14552b27a42901db0a5e9280 Mon Sep 17 00:00:00 2001
-From: Herve Codina <herve.codina@bootlin.com>
-Date: Mon, 4 Oct 2021 17:13:45 +0200
-Subject: [PATCH] Fix compatibility with php8 - call_user_function_ex
-
-This patch fixes compatibility with php8 replacing
-call_user_function_ex by call_user_function.
-
-Upstream: https://github.com/derickr/pecl-dbus/pull/8
-Signed-off-by: Herve Codina <herve.codina@bootlin.com>
----
- dbus.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/dbus.c b/dbus.c
-index a98e2ea..6fa9897 100644
---- a/dbus.c
-+++ b/dbus.c
-@@ -1015,8 +1015,8 @@ php_dbus_do_method_call(php_dbus_obj *dbus,
- 		method_args = safe_emalloc(sizeof(zval *), num_elems, 0);
- 	}
- 
--	if (call_user_function_ex(EG(function_table), object, &callback, &retval,
--				              num_elems, method_args, 0, NULL) == SUCCESS) {
-+	if (call_user_function(EG(function_table), object, &callback, &retval,
-+				              num_elems, method_args) == SUCCESS) {
- 		if (!Z_ISUNDEF(retval)) {
- 			reply = dbus_message_new_method_return(msg);
- 			php_dbus_append_parameters(reply, &retval, NULL,
--- 
-2.31.1
-
diff --git a/package/php-pecl-dbus/php-pecl-dbus.hash b/package/php-pecl-dbus/php-pecl-dbus.hash
index f43e2c8b51..122636913c 100644
--- a/package/php-pecl-dbus/php-pecl-dbus.hash
+++ b/package/php-pecl-dbus/php-pecl-dbus.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  c48761c645c6fa42b57af0e65d893217dc69bcd8d879ace74d6abbf1c5f73a8f  php-pecl-dbus-315d17558c7614d02e923d898231e51c86a25789.tar.gz
+sha256  652db988457479682ef1bbe00952d746b54150e77f06a4d75ffa3a696f5321ba  php-pecl-dbus-b147624d480c3353e6c700e9a2d0c6f14d853941.tar.gz
 sha256  ecc8b74820c32fb82ddee80446205408585d75d1632ac959fb3cdf8eaf3877b5  LICENSE
diff --git a/package/php-pecl-dbus/php-pecl-dbus.mk b/package/php-pecl-dbus/php-pecl-dbus.mk
index a70a2e7ae1..84cc373bb7 100644
--- a/package/php-pecl-dbus/php-pecl-dbus.mk
+++ b/package/php-pecl-dbus/php-pecl-dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_PECL_DBUS_VERSION = 315d17558c7614d02e923d898231e51c86a25789
+PHP_PECL_DBUS_VERSION = b147624d480c3353e6c700e9a2d0c6f14d853941
 PHP_PECL_DBUS_SITE = $(call github,derickr,pecl-dbus,$(PHP_PECL_DBUS_VERSION))
 PHP_PECL_DBUS_LICENSE = PHP-3.01
 PHP_PECL_DBUS_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
