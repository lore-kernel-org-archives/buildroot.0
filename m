Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5E2C98315
	for <buildroot@archiver.kernel.org>; Sun, 18 Jan 2026 22:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35DD740663;
	Sun, 18 Jan 2026 22:50:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lfifNDbYIfOA; Sun, 18 Jan 2026 22:50:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D985940667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768776657;
	bh=DQ2heYt7T9EGZpmTPcPYyCnezKj0/EIYnamX3Jv6MTQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lwC/6fpMacFYxWMSWrMAY3V7qQQTdHsLo7WoKoxAVNMliyNw4vFveMeNLCMV4LGdz
	 Fm4aywM6Vky0CQ4ZQYyR8W+Xctd7RfiPDPcJW/hVI2Tt+rkf41noi4v0c10QZd4ZRV
	 Dki0pHENhTHxrD8PBlCeHymNsXEoh5tnMhbI+0ckDVO9zsltJXldKzEIfJNbBwKl5F
	 BEZWqWzEmaUOfap0Tb0YWVcSn7eRA/Yjnx19GZ2jEDzfM4RcxXlqYJZB0YVNP/xzMi
	 chJIH1MCBUbqoao9TsORr6ahN1SSbaICpuX0PWOzyveOEaXseDiFJA1EtBliYkk8Ti
	 Pp79ogAfr+1tA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D985940667;
	Sun, 18 Jan 2026 22:50:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 173BD2A8
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 22:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0723A40667
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 22:50:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d1xNlIb26BaI for <buildroot@buildroot.org>;
 Sun, 18 Jan 2026 22:50:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3CB6040663
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CB6040663
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CB6040663
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 22:50:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c7cb.dip0.t-ipconnect.de [79.214.199.203])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DC825A4C47AA
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 23:49:49 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vhbae-000000001R1-3eC3
 for buildroot@buildroot.org; Sun, 18 Jan 2026 22:49:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 18 Jan 2026 23:49:46 +0100
Message-ID: <20260118224947.3879017-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260118224947.3879017-1-bernd@kuhls.net>
References: <20260118224947.3879017-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768776589;
 bh=iNrxYiDC+xQP959fYCej3PiElnM3gvnQrReWUBiZhE8=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=J4BQnw41WLfpGPghA2cPAij7gkBCYYXnkxh+sgkoCsvSakL8W5v6YsMchXQ0Qh1VJ
 2rUpXoqFE53OCD5BWH2xxlf9kP5AcO+NLNfmAB8tiMNcK5YK/1fUSuMoFMFPrgGHlD
 HCGLou7QMXgCYU/sKlHLLTWmDcTuRB1LfAPujao+BYp7rdiXnUwaZEwdCIKsHh+ePj
 A4oMaNcMAe+nxChfbeHz59rZjYMf1dbHycYV9Yw9qLv9fFF0NI4S3dNSd9Cnk0fuFU
 RwwJbdwIG5BZ8d1hLJD0+KICboKNR9FvgX176lHZnT1IFZY57KqeJcfsmxpFRM2wMk
 bLZgD2Ozi1qxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=J4BQnw41
Subject: [Buildroot] [PATCH 5/6] package/php-zmq: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Building php-zmq is broken with php 8.5.

Although some pull requests exist upstream to fix php 8.5 support:
https://github.com/zeromq/php-zmq/pulls

they do not fix other bugs like broken build with gcc 15.x which was the
cause for the its removal by Debian:
https://tracker.debian.org/news/1668817/php-zmq-removed-from-testing/
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1097580

According to various sources the package is unmaintained:
https://pecl.php.net/package/zmq
https://lists.zeromq.org/pipermail/zeromq-dev/2019-August/033109.html
https://github.com/zeromq/php-zmq/pull/240#issuecomment-3684566367

so we drop the package from buildroot.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |   3 -
 Config.in.legacy                              |   7 +
 package/Config.in                             |   1 -
 .../0001-updates-for-php7.4-and-php8.0.patch  | 230 ------------------
 package/php-zmq/0002-fix-for-php-7.3.patch    |  43 ----
 .../php-zmq/0003-fix-for-php-8.0.0beta2.patch |  40 ---
 package/php-zmq/Config.in                     |  12 -
 package/php-zmq/php-zmq.hash                  |   3 -
 package/php-zmq/php-zmq.mk                    |  25 --
 9 files changed, 7 insertions(+), 357 deletions(-)
 delete mode 100644 package/php-zmq/0001-updates-for-php7.4-and-php8.0.patch
 delete mode 100644 package/php-zmq/0002-fix-for-php-7.3.patch
 delete mode 100644 package/php-zmq/0003-fix-for-php-8.0.0beta2.patch
 delete mode 100644 package/php-zmq/Config.in
 delete mode 100644 package/php-zmq/php-zmq.hash
 delete mode 100644 package/php-zmq/php-zmq.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index b843a14882..76be145bbd 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -777,9 +777,6 @@ package/perl-xml-libxml/0001-Makefile-PL.patch lib_patch.Upstream
 package/php-geoip/0001-add-build-support-for-php8.patch lib_patch.Upstream
 package/php-lua/0001-ZEND_ACC_ALLOW_STATIC-ZEND_ACC_STATIC-for-static-met.patch lib_patch.Upstream
 package/php-lua/0002-php8-explicitly-declare-arginfo.patch lib_patch.Upstream
-package/php-zmq/0001-updates-for-php7.4-and-php8.0.patch lib_patch.Upstream
-package/php-zmq/0002-fix-for-php-7.3.patch lib_patch.Upstream
-package/php-zmq/0003-fix-for-php-8.0.0beta2.patch lib_patch.Upstream
 package/php/0001-acinclude.m4-don-t-unset-variables.patch lib_patch.Upstream
 package/php/0002-iconv-tweak-iconv-detection.patch lib_patch.Upstream
 package/php/0003-configure-disable-the-phar-tool.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 4502963b24..6be70dace8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_PHP_ZMQ
+	bool "php-zmq removed"
+	select BR2_LEGACY
+	help
+	  php-zmq was no longer maintained upstream, broken with php 8.5,
+	  so it has been dropped.
+
 config BR2_PACKAGE_LOCKDEV
 	bool "lockdev removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 6ce16bce0a..94ea56b297 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -947,7 +947,6 @@ menu "External php extensions"
 	source "package/php-ssh2/Config.in"
 	source "package/php-xdebug/Config.in"
 	source "package/php-yaml/Config.in"
-	source "package/php-zmq/Config.in"
 endmenu
 endif
 if BR2_STATIC_LIBS
diff --git a/package/php-zmq/0001-updates-for-php7.4-and-php8.0.patch b/package/php-zmq/0001-updates-for-php7.4-and-php8.0.patch
deleted file mode 100644
index 3c286e3923..0000000000
--- a/package/php-zmq/0001-updates-for-php7.4-and-php8.0.patch
+++ /dev/null
@@ -1,230 +0,0 @@
-From 4ad1b33e095924bd4ccf79295999dd54edaaac37 Mon Sep 17 00:00:00 2001
-From: Luca Boccassi <luca.boccassi@gmail.com>
-Date: Thu, 5 Mar 2020 22:51:22 +0000
-Subject: [PATCH] updates for php7.4 and php8.0 (#212)
-
-From upstream commit: 4ad1b33e095924bd4ccf79295999dd54edaaac37
-
-* travisci: enabled php7.4 and php8.0
-
-* updates for php7.4 and php8.0
-
-- travisci enabled php7.4 and php8.0
-- removed now unused references to TSRMLS_*
-  These flags were mostly already removed from the
-  php7 codebase but some instances were still present.
-  With php8 these produce compile errors.
-- fix tests for php8 and php7.4
-  New TypeErrors now get handled correctly in the test cases.
-- fix memory corruption in zmq.c
-  The conflicting line causes memory leaks on other php
-  version and causes a segfault on php8 and php7.4
-  The error was provocable with test case
-  021-callbackwarning.phpt. After removing of the line
-  valgrind showed no memory leak, so this line was probably
-  redundant. Also if you compare with zmqsocket constructor
-  this line is also not present.
-
-Signed-off-by: Luca Boccassi <luca.boccassi@gmail.com>
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- php_zmq_private.h                  |  4 ++--
- tests/016-callbackinvalidargs.phpt |  4 ++++
- tests/022-highwatermark.phpt       |  6 +++---
- tests/bug_gh_43.phpt               | 25 +++++++++++++++++--------
- zmq.c                              |  1 -
- zmq_device.c                       | 14 +++++++-------
- zmq_sockopt.c                      |  2 +-
- 7 files changed, 34 insertions(+), 22 deletions(-)
-
-diff --git a/php_zmq_private.h b/php_zmq_private.h
-index 49630e9..2e5cd3b 100644
---- a/php_zmq_private.h
-+++ b/php_zmq_private.h
-@@ -156,9 +156,9 @@ typedef struct _php_zmq_device_object  {
- 
- #define PHP_ZMQ_ERROR_HANDLING_INIT() zend_error_handling error_handling;
- 
--#define PHP_ZMQ_ERROR_HANDLING_THROW() zend_replace_error_handling(EH_THROW, php_zmq_socket_exception_sc_entry, &error_handling TSRMLS_CC);
-+#define PHP_ZMQ_ERROR_HANDLING_THROW() zend_replace_error_handling(EH_THROW, php_zmq_socket_exception_sc_entry, &error_handling);
- 
--#define PHP_ZMQ_ERROR_HANDLING_RESTORE() zend_restore_error_handling(&error_handling TSRMLS_CC);
-+#define PHP_ZMQ_ERROR_HANDLING_RESTORE() zend_restore_error_handling(&error_handling);
- 
- /* Compatibility macros between zeromq 2.x and 3.x */
- #ifndef ZMQ_DONTWAIT
-diff --git a/tests/016-callbackinvalidargs.phpt b/tests/016-callbackinvalidargs.phpt
-index a940e41..6bd0e75 100644
---- a/tests/016-callbackinvalidargs.phpt
-+++ b/tests/016-callbackinvalidargs.phpt
-@@ -10,6 +10,8 @@ try {
- 	echo "Fail\n";
- } catch (ZMQSocketException $e) {
- 	echo "OK\n";
-+} catch (TypeError $e) {
-+ 	echo "OK\n"; // on PHP8
- }
- 
- try {
-@@ -18,6 +20,8 @@ try {
- 	echo "Fail\n";
- } catch (ZMQSocketException $e) {
- 	echo "OK\n";
-+} catch (TypeError $e) {
-+ 	echo "OK\n"; // on PHP8
- }
- 
- --EXPECT--
-diff --git a/tests/022-highwatermark.phpt b/tests/022-highwatermark.phpt
-index 84be509..c1ff703 100644
---- a/tests/022-highwatermark.phpt
-+++ b/tests/022-highwatermark.phpt
-@@ -1,11 +1,11 @@
- --TEST--
- Test that high-watermark works
- --SKIPIF--
--<?php require_once(dirname(__FILE__) . '/skipif.inc'); ?>
--
-+<?php
-+require_once(dirname(__FILE__) . '/skipif.inc');
- if (!defined('ZMQ::SOCKOPT_LINGER'))
-     die ("Skip Not compiled against new enough version");
--
-+?>
- --FILE--
- <?php
- 
-diff --git a/tests/bug_gh_43.phpt b/tests/bug_gh_43.phpt
-index bdc274a..923d074 100644
---- a/tests/bug_gh_43.phpt
-+++ b/tests/bug_gh_43.phpt
-@@ -7,16 +7,25 @@ Test for Github issue #43
- --FILE--
- <?php
- 
-+error_reporting(0);
-+
- $context = new ZMQContext (1, false);
- 
- $sock1 = new ZMQSocket ($context, ZMQ::SOCKET_PUB);
- $sock2 = new ZMQSocket ($context, ZMQ::SOCKET_SUB);
- 
--$device = new ZMQDevice ($sock1, $sock1, $sock1, $sock1);
--
--echo "OK";
--?>
--
----EXPECTF--
--Warning: ZMQDevice::__construct() expects at most 3 parameters, 4 given in %s/bug_gh_43.php on line %d
--OK
-\ No newline at end of file
-+try {
-+    $device = new ZMQDevice ($sock1, $sock1, $sock1, $sock1);
-+    // on PHP7 and lower
-+    $lastError = error_get_last();
-+    if(strpos($lastError['message'], 'ZMQDevice::__construct() expects at most 3 parameters, 4 given') !== false)
-+     	echo "OK\n";
-+    else{
-+        echo "FAIL\n";
-+        print_r($lastError);
-+    }
-+}catch(TypeError $e){
-+ 	echo "OK\n"; // on PHP8
-+}
-+--EXPECT--
-+OK
-diff --git a/zmq.c b/zmq.c
-index 942e69b..66196ea 100644
---- a/zmq.c
-+++ b/zmq.c
-@@ -687,7 +687,6 @@ PHP_METHOD(zmqcontext, getsocket)
- 			if (!php_zmq_connect_callback(return_value, &fci, &fci_cache, persistent_id)) {
- 				php_zmq_socket_destroy(socket);
- 				interns->socket = NULL;
--				zval_dtor(return_value);
- 				return;
- 			}
- 		}
-diff --git a/zmq_device.c b/zmq_device.c
-index c7415c1..534f966 100644
---- a/zmq_device.c
-+++ b/zmq_device.c
-@@ -41,7 +41,7 @@
- ZEND_EXTERN_MODULE_GLOBALS(php_zmq)
- 
- static
--zend_bool s_invoke_device_cb (php_zmq_device_cb_t *cb, uint64_t current_ts TSRMLS_DC)
-+zend_bool s_invoke_device_cb (php_zmq_device_cb_t *cb, uint64_t current_ts)
- {
- 	zend_bool retval = 0;
- 	zval params[1];
-@@ -59,7 +59,7 @@ zend_bool s_invoke_device_cb (php_zmq_device_cb_t *cb, uint64_t current_ts TSRML
- 	if (zend_call_function(&(cb->fci), &(cb->fci_cache)) == FAILURE) {
- 		if (!EG(exception)) {
- 			char *func_name = php_zmq_printable_func(&cb->fci, &cb->fci_cache);
--			zend_throw_exception_ex(php_zmq_device_exception_sc_entry_get (), 0 TSRMLS_CC, "Failed to invoke device callback %s()", func_name);
-+			zend_throw_exception_ex(php_zmq_device_exception_sc_entry_get (), 0, "Failed to invoke device callback %s()", func_name);
- 			zval_ptr_dtor(&params[0]);
- 			efree(func_name);
- 		}
-@@ -94,7 +94,7 @@ int s_capture_message (void *socket, zmq_msg_t *msg, int more)
- }
- 
- static
--int s_calculate_timeout (php_zmq_device_object *intern TSRMLS_DC)
-+int s_calculate_timeout (php_zmq_device_object *intern)
- {
- 	int timeout = -1;
- 	uint64_t current = php_zmq_clock (ZMQ_G (clock_ctx));
-@@ -131,7 +131,7 @@ int s_calculate_timeout (php_zmq_device_object *intern TSRMLS_DC)
- }
- 
- 
--zend_bool php_zmq_device (php_zmq_device_object *intern TSRMLS_DC)
-+zend_bool php_zmq_device (php_zmq_device_object *intern)
- {
- 	int errno_;
- 	uint64_t last_message_received;
-@@ -186,7 +186,7 @@ zend_bool php_zmq_device (php_zmq_device_object *intern TSRMLS_DC)
- 		uint64_t current_ts = 0;
- 
- 		/* Calculate poll_timeout based on idle / timer cb */
--		int timeout = s_calculate_timeout (intern TSRMLS_CC);
-+		int timeout = s_calculate_timeout (intern);
- 
- 		rc = zmq_poll(&items [0], 2, timeout);
- 		if (rc < 0) {
-@@ -205,7 +205,7 @@ zend_bool php_zmq_device (php_zmq_device_object *intern TSRMLS_DC)
- 		if (intern->timer_cb.initialized && intern->timer_cb.timeout > 0) {
- 			/* Is it timer to call the timer ? */
- 			if (intern->timer_cb.scheduled_at <= current_ts) {
--				if (!s_invoke_device_cb (&intern->timer_cb, current_ts TSRMLS_CC)) {
-+				if (!s_invoke_device_cb (&intern->timer_cb, current_ts)) {
- 					zmq_msg_close (&msg);
- 					return 1;
- 				}
-@@ -217,7 +217,7 @@ zend_bool php_zmq_device (php_zmq_device_object *intern TSRMLS_DC)
- 			/* Is it timer to call the idle callback ? */
- 			if ((current_ts - last_message_received) >= intern->idle_cb.timeout &&
- 				intern->idle_cb.scheduled_at <= current_ts) {
--				if (!s_invoke_device_cb (&intern->idle_cb, current_ts TSRMLS_CC)) {
-+				if (!s_invoke_device_cb (&intern->idle_cb, current_ts)) {
- 					zmq_msg_close (&msg);
- 					return 1;
- 				}
-diff --git a/zmq_sockopt.c b/zmq_sockopt.c
-index 1357032..14b59f0 100644
---- a/zmq_sockopt.c
-+++ b/zmq_sockopt.c
-@@ -2036,7 +2036,7 @@ PHP_METHOD(zmqsocket, setsockopt)
-     long key;
-     zval *zv;
- 
--    if (zend_parse_parameters(ZEND_NUM_ARGS() TSRMLS_CC, "lz/", &key, &zv) == FAILURE) {
-+    if (zend_parse_parameters(ZEND_NUM_ARGS(), "lz/", &key, &zv) == FAILURE) {
-         return;
-     }
- 
--- 
-2.31.1
-
diff --git a/package/php-zmq/0002-fix-for-php-7.3.patch b/package/php-zmq/0002-fix-for-php-7.3.patch
deleted file mode 100644
index 3ca87582cb..0000000000
--- a/package/php-zmq/0002-fix-for-php-7.3.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From e0db82c3286da81fa8945894dd10125a528299e4 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Gr=C3=A9gory=20PLANCHAT?=
- <gplanchat@users.noreply.github.com>
-Date: Wed, 8 Jul 2020 10:09:38 +0200
-Subject: [PATCH] Fix for PHP 7.3 (#215)
-
-Co-authored-by: Remi Collet <remi@remirepo.net>
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- zmq.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/zmq.c b/zmq.c
-index 66196ea..879704f 100644
---- a/zmq.c
-+++ b/zmq.c
-@@ -235,7 +235,11 @@ php_zmq_context *php_zmq_context_get(zend_long io_threads, zend_bool is_persiste
- 		le.type = php_zmq_context_list_entry();
- 		le.ptr  = context;
- 
-+#if PHP_VERSION_ID < 70300
- 		GC_REFCOUNT(&le) = 1;
-+#else
-+		GC_SET_REFCOUNT(&le, 1);
-+#endif
- 
- 		/* plist_key is not a persistent allocated key, thus we use str_update here */
- 		if (zend_hash_str_update_mem(&EG(persistent_list), plist_key->val, plist_key->len, &le, sizeof(le)) == NULL) {
-@@ -535,7 +539,11 @@ void php_zmq_socket_store(php_zmq_socket *zmq_sock_p, zend_long type, zend_strin
- 	le.type = php_zmq_socket_list_entry();
- 	le.ptr  = zmq_sock_p;
- 
-+#if PHP_VERSION_ID < 70300
- 	GC_REFCOUNT(&le) = 1;
-+#else
-+	GC_SET_REFCOUNT(&le, 1);
-+#endif
- 
- 	plist_key = php_zmq_socket_plist_key(type, persistent_id, use_shared_ctx);
- 
--- 
-2.31.1
-
diff --git a/package/php-zmq/0003-fix-for-php-8.0.0beta2.patch b/package/php-zmq/0003-fix-for-php-8.0.0beta2.patch
deleted file mode 100644
index c5aab16ab7..0000000000
--- a/package/php-zmq/0003-fix-for-php-8.0.0beta2.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From f0993f1fe973c4d359323ad1897ed7aa74f7e015 Mon Sep 17 00:00:00 2001
-From: Remi Collet <remi@remirepo.net>
-Date: Mon, 24 Aug 2020 15:55:54 +0200
-Subject: [PATCH] fix for PHP 8.0.0beta2
-
-Signed-off-by: Remi Collet <remi@remirepo.net>
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- zmq.c        | 2 ++
- zmq_device.c | 2 ++
- 2 files changed, 4 insertions(+)
-
-diff --git a/zmq.c b/zmq.c
-index 89902f9..bd2401d 100644
---- a/zmq.c
-+++ b/zmq.c
-@@ -621,7 +621,9 @@ zend_bool php_zmq_connect_callback(zval *socket, zend_fcall_info *fci, zend_fcal
- 	fci->params         = params;
- 	fci->param_count    = 2;
- 	fci->retval         = &retval;
-+#if PHP_VERSION_ID < 80000
- 	fci->no_separation  = 1;
-+#endif
- 
- 	if (zend_call_function(fci, fci_cache) == FAILURE) {
- 		if (!EG(exception)) {
-diff --git a/zmq_device.c b/zmq_device.c
-index 534f966..1c6aa3e 100644
---- a/zmq_device.c
-+++ b/zmq_device.c
-@@ -53,7 +53,9 @@ zend_bool s_invoke_device_cb (php_zmq_device_cb_t *cb, uint64_t current_ts)
- 	cb->fci.param_count = 1;
- 
- 	/* Call the cb */
-+#if PHP_VERSION_ID < 80000
- 	cb->fci.no_separation  = 1;
-+#endif
- 	cb->fci.retval         = &fc_retval;
- 
- 	if (zend_call_function(&(cb->fci), &(cb->fci_cache)) == FAILURE) {
diff --git a/package/php-zmq/Config.in b/package/php-zmq/Config.in
deleted file mode 100644
index 37be17792a..0000000000
--- a/package/php-zmq/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-comment "php-zmq needs a toolchain w/ C++, threads"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
-
-config BR2_PACKAGE_PHP_ZMQ
-	bool "php-zmq"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_ZEROMQ
-	help
-	  ZeroMQ messaging bindings for PHP
-
-	  http://pecl.php.net/package/zmq
diff --git a/package/php-zmq/php-zmq.hash b/package/php-zmq/php-zmq.hash
deleted file mode 100644
index a4cca69878..0000000000
--- a/package/php-zmq/php-zmq.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  c492375818bd51b355352798fb94f04d6828c6aeda41ba813849624af74144ce  zmq-1.1.3.tgz
-sha256  0302303063d3612fc240032aeb6d70e9b7509fc17a4a9edf00eba091ed597514  LICENSE
diff --git a/package/php-zmq/php-zmq.mk b/package/php-zmq/php-zmq.mk
deleted file mode 100644
index fed71955b6..0000000000
--- a/package/php-zmq/php-zmq.mk
+++ /dev/null
@@ -1,25 +0,0 @@
-################################################################################
-#
-# php-zmq
-#
-################################################################################
-
-PHP_ZMQ_VERSION = 1.1.3
-PHP_ZMQ_SOURCE = zmq-$(PHP_ZMQ_VERSION).tgz
-PHP_ZMQ_SITE = https://pecl.php.net/get
-# phpize does the autoconf magic
-PHP_ZMQ_DEPENDENCIES = php zeromq host-autoconf host-pkgconf
-PHP_ZMQ_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config
-PHP_ZMQ_LICENSE = BSD-3-Clause
-PHP_ZMQ_LICENSE_FILES = LICENSE
-
-define PHP_ZMQ_PHPIZE
-	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
-		$(STAGING_DIR)/usr/bin/phpize)
-endef
-
-PHP_ZMQ_PRE_CONFIGURE_HOOKS += PHP_ZMQ_PHPIZE
-
-$(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
