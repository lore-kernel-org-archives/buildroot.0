From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Jul 2021 21:56:51 +0200
Subject: [Buildroot] [git commit] package/php-zmq: add upstream php8
 compatibility patches
Message-ID: <20210703192906.CB2C582B2C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23f8a58e9a8974be095b8cbca4cb685228e1ac26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These patches are necessary for compiling against php8. These patches also
retain the ability to compile against PHP7.2 and should be removed during the
next version bump.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-PHP-7.3-compatibility-and-bugfixes.patch  | 271 ---------------------
 .../0001-updates-for-php7.4-and-php8.0.patch       | 230 +++++++++++++++++
 package/php-zmq/0002-fix-for-php-7.3.patch         |  43 ++++
 package/php-zmq/0003-fix-for-php-8.0.0beta2.patch  |  40 +++
 4 files changed, 313 insertions(+), 271 deletions(-)

diff --git a/package/php-zmq/0001-PHP-7.3-compatibility-and-bugfixes.patch b/package/php-zmq/0001-PHP-7.3-compatibility-and-bugfixes.patch
deleted file mode 100644
index 83cdb04530..0000000000
--- a/package/php-zmq/0001-PHP-7.3-compatibility-and-bugfixes.patch
+++ /dev/null
@@ -1,271 +0,0 @@
-From 6ea688eff5157785267d2b671cf62d296288847f Mon Sep 17 00:00:00 2001
-From: Alex/AT <alex@alex-at.net>
-Date: Mon, 10 Dec 2018 06:02:27 +0300
-Subject: [PATCH] PHP 7.3 compatibility and bugfixes
-
-- Define new GC_ADDREF/DELREF/SET_REFCOUNT macros for older PHP versions and use them instead of direct GC reference counter access
-
-- Fixup all necessary 'long' type parameters to 'zend_long', PHP 7.3 makes it mandatory, also fixup some direct function implementations to accept the same
-
-- In php_zmq_recv(), zend_string_init() was wrongly called with third parameter as '1', marking new string with IS_STR_PERSISTENT, this caused heap corruption and/or segfaults with PHP 7.3 and could possibly cause other sorts of bugs under any 7.x version
-  With ZVAL_STRINGL macro, this last '1' parameter meant to copy the string and was seemingly erroneously moved to zend_string_init(). zend_string_init() copies string by default, and last parameter has totally different meaning here
-
-- In poll(), flag ZVAL separation on passed arrays (PHP 7.3 makes it mandatory)
-
-- Test 19 (exception on connect callback with forced reference parameter): skip on PHP 7.1 and higher, PHP >= 7.1 started to fallback to passing argument by value instead of failing
-
-- Test 21 (warning generation from callback): it is ok, but PHP 7.3 uses 'int' instead of 'integer' for constants, so allow any word in place of the word 'integer'
-
-[Frank: backport from upstream PR https://github.com/mkoppanen/php-zmq/pull/195]
-Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
----
- php_zmq.h                               |  6 ++++
- tests/019-callbackinvalidsignature.phpt |  3 +-
- tests/021-callbackwarning.phpt          |  2 +-
- zmq.c                                   | 40 ++++++++++++-------------
- zmq_sockopt.c                           |  4 +--
- 5 files changed, 30 insertions(+), 25 deletions(-)
-
-diff --git a/php_zmq.h b/php_zmq.h
-index ef50bfb..3833967 100644
---- a/php_zmq.h
-+++ b/php_zmq.h
-@@ -44,6 +44,12 @@
- 
- #include "php.h"
- 
-+#if PHP_VERSION_ID < 70300
-+#define GC_ADDREF(p)              ++GC_REFCOUNT(p)
-+#define GC_DELREF(p)              --GC_REFCOUNT(p)
-+#define GC_SET_REFCOUNT(p, rc)    GC_REFCOUNT(p) = rc
-+#endif
-+
- extern zend_module_entry zmq_module_entry;
- #define phpext_zmq_ptr &zmq_module_entry
- 
-diff --git a/tests/019-callbackinvalidsignature.phpt b/tests/019-callbackinvalidsignature.phpt
-index 753de31..b5bb20c 100644
---- a/tests/019-callbackinvalidsignature.phpt
-+++ b/tests/019-callbackinvalidsignature.phpt
-@@ -1,7 +1,8 @@
- --TEST--
- Test callback edge-cases
- --SKIPIF--
--<?php require_once(dirname(__FILE__) . '/skipif.inc'); ?>
-+<?php require_once(dirname(__FILE__) . '/skipif.inc');
-+if (PHP_VERSION_ID >= 70100) die("skip PHP 7.1 and higher fallback to passing argument by value even when forced to reference"); ?>
- --FILE--
- <?php
- 
-diff --git a/tests/021-callbackwarning.phpt b/tests/021-callbackwarning.phpt
-index 435743e..eba2ecf 100644
---- a/tests/021-callbackwarning.phpt
-+++ b/tests/021-callbackwarning.phpt
-@@ -13,5 +13,5 @@ function generate_warning($a, $b)
- $socket = new ZMQSocket(new ZMQContext(), ZMQ::SOCKET_REQ, 'persistent_socket', 'generate_warning');
- 
- --EXPECTF--
--Warning: in_array() expects parameter 2 to be array, integer given in %s on line %d
-+Warning: in_array() expects parameter 2 to be array, %s given in %s on line %d
- 
-diff --git a/zmq.c b/zmq.c
-index 942e69b..57ebd11 100644
---- a/zmq.c
-+++ b/zmq.c
-@@ -235,7 +235,7 @@ php_zmq_context *php_zmq_context_get(zend_long io_threads, zend_bool is_persiste
- 		le.type = php_zmq_context_list_entry();
- 		le.ptr  = context;
- 
--		GC_REFCOUNT(&le) = 1;
-+		GC_SET_REFCOUNT(&le, 1);
- 
- 		/* plist_key is not a persistent allocated key, thus we use str_update here */
- 		if (zend_hash_str_update_mem(&EG(persistent_list), plist_key->val, plist_key->len, &le, sizeof(le)) == NULL) {
-@@ -369,7 +369,7 @@ PHP_METHOD(zmq, curvekeypair)
- PHP_METHOD(zmqcontext, __construct)
- {
- 	php_zmq_context_object *intern;
--	long io_threads = 1;
-+	zend_long io_threads = 1;
- 	zend_bool is_persistent = 1;
- 
- 	if (zend_parse_parameters(ZEND_NUM_ARGS(), "|lb", &io_threads, &is_persistent) == FAILURE) {
-@@ -495,7 +495,7 @@ PHP_METHOD(zmqcontext, getOpt)
- 	Create a new zmq socket
- */
- static
--php_zmq_socket *php_zmq_socket_new(php_zmq_context *context, int type, zend_bool is_persistent)
-+php_zmq_socket *php_zmq_socket_new(php_zmq_context *context, zend_long type, zend_bool is_persistent)
- {
- 	php_zmq_socket *zmq_sock;
- 
-@@ -503,7 +503,7 @@ php_zmq_socket *php_zmq_socket_new(php_zmq_context *context, int type, zend_bool
- 	zmq_sock->z_socket    = zmq_socket(context->z_ctx, type);
- 	zmq_sock->pid         = getpid();
- 	zmq_sock->ctx         = context;
--    zmq_sock->socket_type = type;
-+	zmq_sock->socket_type = type;
- 
- 	if (!zmq_sock->z_socket) {
- 		pefree(zmq_sock, is_persistent);
-@@ -535,7 +535,7 @@ void php_zmq_socket_store(php_zmq_socket *zmq_sock_p, zend_long type, zend_strin
- 	le.type = php_zmq_socket_list_entry();
- 	le.ptr  = zmq_sock_p;
- 
--	GC_REFCOUNT(&le) = 1;
-+	GC_SET_REFCOUNT(&le, 1);
- 
- 	plist_key = php_zmq_socket_plist_key(type, persistent_id, use_shared_ctx);
- 
-@@ -796,7 +796,7 @@ PHP_METHOD(zmqsocket, __construct)
- 
- /* {{{ static zend_bool php_zmq_send(php_zmq_socket_object *intern, char *message_param, long flags)
- */
--static zend_bool php_zmq_send(php_zmq_socket_object *intern, zend_string *message_param, long flags)
-+static zend_bool php_zmq_send(php_zmq_socket_object *intern, zend_string *message_param, zend_long flags)
- {
- 	int rc, errno_;
- 	zmq_msg_t message;
-@@ -828,7 +828,7 @@ static void php_zmq_sendmsg_impl(INTERNAL_FUNCTION_PARAMETERS)
- {
- 	php_zmq_socket_object *intern;
- 	zend_string *message_param;
--	long flags = 0;
-+	zend_long flags = 0;
- 	zend_bool ret;
- 
- 	if (zend_parse_parameters(ZEND_NUM_ARGS(), "S|l", &message_param, &flags) == FAILURE) {
-@@ -890,7 +890,7 @@ PHP_METHOD(zmqsocket, sendmulti)
- 	zval *messages;
- 	php_zmq_socket_object *intern;
- 	int to_send, ret = 0;
--	long flags = 0;
-+	zend_long flags = 0;
- 
- 	if (zend_parse_parameters(ZEND_NUM_ARGS(), "a|l", &messages, &flags) == FAILURE) {
- 		return;
-@@ -910,7 +910,7 @@ PHP_METHOD(zmqsocket, sendmulti)
- /* {{{ static zend_bool php_zmq_recv(php_zmq_socket_object *intern, long flags, zval *return_value)
- */
- static
--zend_string *php_zmq_recv(php_zmq_socket_object *intern, long flags)
-+zend_string *php_zmq_recv(php_zmq_socket_object *intern, zend_long flags)
- {
- 	int rc, errno_;
- 	zmq_msg_t message;
-@@ -933,7 +933,7 @@ zend_string *php_zmq_recv(php_zmq_socket_object *intern, long flags)
- 		return NULL;
- 	}
- 
--	str = zend_string_init(zmq_msg_data(&message), zmq_msg_size(&message), 1);
-+	str = zend_string_init(zmq_msg_data(&message), zmq_msg_size(&message), 0);
- 	zmq_msg_close(&message);
- 	return str;
- }
-@@ -943,7 +943,7 @@ static void php_zmq_recvmsg_impl(INTERNAL_FUNCTION_PARAMETERS)
- {
- 	zend_string *str = NULL;
- 	php_zmq_socket_object *intern;
--	long flags = 0;
-+	zend_long flags = 0;
- 
- 	if (zend_parse_parameters(ZEND_NUM_ARGS(), "|l", &flags) == FAILURE) {
- 		return;
-@@ -974,7 +974,7 @@ PHP_METHOD(zmqsocket, recvmulti)
- {
- 	php_zmq_socket_object *intern;
- 	size_t value_len;
--	long flags = 0;
-+	zend_long flags = 0;
- #if ZMQ_VERSION_MAJOR < 3
- 	int64_t value;
- #else
-@@ -1303,7 +1303,7 @@ PHP_METHOD(zmqpoll, add)
- {
- 	php_zmq_poll_object *intern;
- 	zval *object;
--	long events;
-+	zend_long events;
- 	int error;
- 	zend_string *key;
- 
-@@ -1423,10 +1423,10 @@ PHP_METHOD(zmqpoll, poll)
- 	php_zmq_poll_object *intern;
- 	zval *r_array, *w_array;
- 
--	long timeout = -1;
-+	zend_long timeout = -1;
- 	int rc;
- 
--	if (zend_parse_parameters(ZEND_NUM_ARGS(), "a!a!|l", &r_array, &w_array, &timeout) == FAILURE) {
-+	if (zend_parse_parameters(ZEND_NUM_ARGS(), "a!/a!/|l", &r_array, &w_array, &timeout) == FAILURE) {
- 		return;
- 	}
- 
-@@ -1592,7 +1592,7 @@ void s_clear_device_callback (php_zmq_device_cb_t *cb)
- }
- 
- static
--void s_init_device_callback (php_zmq_device_cb_t *cb, zend_fcall_info *fci, zend_fcall_info_cache *fci_cache, long timeout, zval *user_data)
-+void s_init_device_callback (php_zmq_device_cb_t *cb, zend_fcall_info *fci, zend_fcall_info_cache *fci_cache, zend_long timeout, zval *user_data)
- {
- 	memcpy (&cb->fci, fci, sizeof (zend_fcall_info));
- 	memcpy (&cb->fci_cache, fci_cache, sizeof (zend_fcall_info_cache));
-@@ -1615,7 +1615,7 @@ void s_init_device_callback (php_zmq_device_cb_t *cb, zend_fcall_info *fci, zend
- PHP_METHOD(zmqdevice, setidletimeout)
- {
- 	php_zmq_device_object *intern;
--	long timeout;
-+	zend_long timeout;
- 
- 	if (zend_parse_parameters(ZEND_NUM_ARGS(), "l", &timeout) == FAILURE) {
- 		return;
-@@ -1644,7 +1644,7 @@ PHP_METHOD(zmqdevice, getidletimeout)
- PHP_METHOD(zmqdevice, settimertimeout)
- {
- 	php_zmq_device_object *intern;
--	long timeout;
-+	zend_long timeout;
- 
- 	if (zend_parse_parameters(ZEND_NUM_ARGS(), "l", &timeout) == FAILURE) {
- 		return;
-@@ -1676,7 +1676,7 @@ PHP_METHOD(zmqdevice, setidlecallback)
- 	zval *user_data = NULL;
- 	zend_fcall_info fci;
- 	zend_fcall_info_cache fci_cache;
--	long timeout = 0;
-+	zend_long timeout = 0;
- 
- 	if (ZEND_NUM_ARGS() == 2) {
- 		php_error_docref(NULL, E_DEPRECATED, "The signature for setIdleCallback has changed, please update your code");
-@@ -1718,7 +1718,7 @@ PHP_METHOD(zmqdevice, settimercallback)
- 	zval *user_data = NULL;
- 	zend_fcall_info fci;
- 	zend_fcall_info_cache fci_cache;
--	long timeout;
-+	zend_long timeout;
- 
- 	if (zend_parse_parameters(ZEND_NUM_ARGS(), "fl|z!", &fci, &fci_cache, &timeout, &user_data) == FAILURE) {
- 		return;
-diff --git a/zmq_sockopt.c b/zmq_sockopt.c
-index 1357032..3a00421 100644
---- a/zmq_sockopt.c
-+++ b/zmq_sockopt.c
-@@ -1,5 +1,3 @@
--
--
- /*
- +-----------------------------------------------------------------------------------+
- |  ZMQ extension for PHP                                                            |
-@@ -2033,7 +2031,7 @@ PHP_METHOD(zmqsocket, getsockopt)
- PHP_METHOD(zmqsocket, setsockopt)
- {
-     php_zmq_socket_object *intern;
--    long key;
-+    zend_long key;
-     zval *zv;
- 
-     if (zend_parse_parameters(ZEND_NUM_ARGS() TSRMLS_CC, "lz/", &key, &zv) == FAILURE) {
--- 
-2.17.1
-
diff --git a/package/php-zmq/0001-updates-for-php7.4-and-php8.0.patch b/package/php-zmq/0001-updates-for-php7.4-and-php8.0.patch
new file mode 100644
index 0000000000..3c286e3923
--- /dev/null
+++ b/package/php-zmq/0001-updates-for-php7.4-and-php8.0.patch
@@ -0,0 +1,230 @@
+From 4ad1b33e095924bd4ccf79295999dd54edaaac37 Mon Sep 17 00:00:00 2001
+From: Luca Boccassi <luca.boccassi@gmail.com>
+Date: Thu, 5 Mar 2020 22:51:22 +0000
+Subject: [PATCH] updates for php7.4 and php8.0 (#212)
+
+From upstream commit: 4ad1b33e095924bd4ccf79295999dd54edaaac37
+
+* travisci: enabled php7.4 and php8.0
+
+* updates for php7.4 and php8.0
+
+- travisci enabled php7.4 and php8.0
+- removed now unused references to TSRMLS_*
+  These flags were mostly already removed from the
+  php7 codebase but some instances were still present.
+  With php8 these produce compile errors.
+- fix tests for php8 and php7.4
+  New TypeErrors now get handled correctly in the test cases.
+- fix memory corruption in zmq.c
+  The conflicting line causes memory leaks on other php
+  version and causes a segfault on php8 and php7.4
+  The error was provocable with test case
+  021-callbackwarning.phpt. After removing of the line
+  valgrind showed no memory leak, so this line was probably
+  redundant. Also if you compare with zmqsocket constructor
+  this line is also not present.
+
+Signed-off-by: Luca Boccassi <luca.boccassi@gmail.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ php_zmq_private.h                  |  4 ++--
+ tests/016-callbackinvalidargs.phpt |  4 ++++
+ tests/022-highwatermark.phpt       |  6 +++---
+ tests/bug_gh_43.phpt               | 25 +++++++++++++++++--------
+ zmq.c                              |  1 -
+ zmq_device.c                       | 14 +++++++-------
+ zmq_sockopt.c                      |  2 +-
+ 7 files changed, 34 insertions(+), 22 deletions(-)
+
+diff --git a/php_zmq_private.h b/php_zmq_private.h
+index 49630e9..2e5cd3b 100644
+--- a/php_zmq_private.h
++++ b/php_zmq_private.h
+@@ -156,9 +156,9 @@ typedef struct _php_zmq_device_object  {
+ 
+ #define PHP_ZMQ_ERROR_HANDLING_INIT() zend_error_handling error_handling;
+ 
+-#define PHP_ZMQ_ERROR_HANDLING_THROW() zend_replace_error_handling(EH_THROW, php_zmq_socket_exception_sc_entry, &error_handling TSRMLS_CC);
++#define PHP_ZMQ_ERROR_HANDLING_THROW() zend_replace_error_handling(EH_THROW, php_zmq_socket_exception_sc_entry, &error_handling);
+ 
+-#define PHP_ZMQ_ERROR_HANDLING_RESTORE() zend_restore_error_handling(&error_handling TSRMLS_CC);
++#define PHP_ZMQ_ERROR_HANDLING_RESTORE() zend_restore_error_handling(&error_handling);
+ 
+ /* Compatibility macros between zeromq 2.x and 3.x */
+ #ifndef ZMQ_DONTWAIT
+diff --git a/tests/016-callbackinvalidargs.phpt b/tests/016-callbackinvalidargs.phpt
+index a940e41..6bd0e75 100644
+--- a/tests/016-callbackinvalidargs.phpt
++++ b/tests/016-callbackinvalidargs.phpt
+@@ -10,6 +10,8 @@ try {
+ 	echo "Fail\n";
+ } catch (ZMQSocketException $e) {
+ 	echo "OK\n";
++} catch (TypeError $e) {
++ 	echo "OK\n"; // on PHP8
+ }
+ 
+ try {
+@@ -18,6 +20,8 @@ try {
+ 	echo "Fail\n";
+ } catch (ZMQSocketException $e) {
+ 	echo "OK\n";
++} catch (TypeError $e) {
++ 	echo "OK\n"; // on PHP8
+ }
+ 
+ --EXPECT--
+diff --git a/tests/022-highwatermark.phpt b/tests/022-highwatermark.phpt
+index 84be509..c1ff703 100644
+--- a/tests/022-highwatermark.phpt
++++ b/tests/022-highwatermark.phpt
+@@ -1,11 +1,11 @@
+ --TEST--
+ Test that high-watermark works
+ --SKIPIF--
+-<?php require_once(dirname(__FILE__) . '/skipif.inc'); ?>
+-
++<?php
++require_once(dirname(__FILE__) . '/skipif.inc');
+ if (!defined('ZMQ::SOCKOPT_LINGER'))
+     die ("Skip Not compiled against new enough version");
+-
++?>
+ --FILE--
+ <?php
+ 
+diff --git a/tests/bug_gh_43.phpt b/tests/bug_gh_43.phpt
+index bdc274a..923d074 100644
+--- a/tests/bug_gh_43.phpt
++++ b/tests/bug_gh_43.phpt
+@@ -7,16 +7,25 @@ Test for Github issue #43
+ --FILE--
+ <?php
+ 
++error_reporting(0);
++
+ $context = new ZMQContext (1, false);
+ 
+ $sock1 = new ZMQSocket ($context, ZMQ::SOCKET_PUB);
+ $sock2 = new ZMQSocket ($context, ZMQ::SOCKET_SUB);
+ 
+-$device = new ZMQDevice ($sock1, $sock1, $sock1, $sock1);
+-
+-echo "OK";
+-?>
+-
+---EXPECTF--
+-Warning: ZMQDevice::__construct() expects at most 3 parameters, 4 given in %s/bug_gh_43.php on line %d
+-OK
+\ No newline at end of file
++try {
++    $device = new ZMQDevice ($sock1, $sock1, $sock1, $sock1);
++    // on PHP7 and lower
++    $lastError = error_get_last();
++    if(strpos($lastError['message'], 'ZMQDevice::__construct() expects at most 3 parameters, 4 given') !== false)
++     	echo "OK\n";
++    else{
++        echo "FAIL\n";
++        print_r($lastError);
++    }
++}catch(TypeError $e){
++ 	echo "OK\n"; // on PHP8
++}
++--EXPECT--
++OK
+diff --git a/zmq.c b/zmq.c
+index 942e69b..66196ea 100644
+--- a/zmq.c
++++ b/zmq.c
+@@ -687,7 +687,6 @@ PHP_METHOD(zmqcontext, getsocket)
+ 			if (!php_zmq_connect_callback(return_value, &fci, &fci_cache, persistent_id)) {
+ 				php_zmq_socket_destroy(socket);
+ 				interns->socket = NULL;
+-				zval_dtor(return_value);
+ 				return;
+ 			}
+ 		}
+diff --git a/zmq_device.c b/zmq_device.c
+index c7415c1..534f966 100644
+--- a/zmq_device.c
++++ b/zmq_device.c
+@@ -41,7 +41,7 @@
+ ZEND_EXTERN_MODULE_GLOBALS(php_zmq)
+ 
+ static
+-zend_bool s_invoke_device_cb (php_zmq_device_cb_t *cb, uint64_t current_ts TSRMLS_DC)
++zend_bool s_invoke_device_cb (php_zmq_device_cb_t *cb, uint64_t current_ts)
+ {
+ 	zend_bool retval = 0;
+ 	zval params[1];
+@@ -59,7 +59,7 @@ zend_bool s_invoke_device_cb (php_zmq_device_cb_t *cb, uint64_t current_ts TSRML
+ 	if (zend_call_function(&(cb->fci), &(cb->fci_cache)) == FAILURE) {
+ 		if (!EG(exception)) {
+ 			char *func_name = php_zmq_printable_func(&cb->fci, &cb->fci_cache);
+-			zend_throw_exception_ex(php_zmq_device_exception_sc_entry_get (), 0 TSRMLS_CC, "Failed to invoke device callback %s()", func_name);
++			zend_throw_exception_ex(php_zmq_device_exception_sc_entry_get (), 0, "Failed to invoke device callback %s()", func_name);
+ 			zval_ptr_dtor(&params[0]);
+ 			efree(func_name);
+ 		}
+@@ -94,7 +94,7 @@ int s_capture_message (void *socket, zmq_msg_t *msg, int more)
+ }
+ 
+ static
+-int s_calculate_timeout (php_zmq_device_object *intern TSRMLS_DC)
++int s_calculate_timeout (php_zmq_device_object *intern)
+ {
+ 	int timeout = -1;
+ 	uint64_t current = php_zmq_clock (ZMQ_G (clock_ctx));
+@@ -131,7 +131,7 @@ int s_calculate_timeout (php_zmq_device_object *intern TSRMLS_DC)
+ }
+ 
+ 
+-zend_bool php_zmq_device (php_zmq_device_object *intern TSRMLS_DC)
++zend_bool php_zmq_device (php_zmq_device_object *intern)
+ {
+ 	int errno_;
+ 	uint64_t last_message_received;
+@@ -186,7 +186,7 @@ zend_bool php_zmq_device (php_zmq_device_object *intern TSRMLS_DC)
+ 		uint64_t current_ts = 0;
+ 
+ 		/* Calculate poll_timeout based on idle / timer cb */
+-		int timeout = s_calculate_timeout (intern TSRMLS_CC);
++		int timeout = s_calculate_timeout (intern);
+ 
+ 		rc = zmq_poll(&items [0], 2, timeout);
+ 		if (rc < 0) {
+@@ -205,7 +205,7 @@ zend_bool php_zmq_device (php_zmq_device_object *intern TSRMLS_DC)
+ 		if (intern->timer_cb.initialized && intern->timer_cb.timeout > 0) {
+ 			/* Is it timer to call the timer ? */
+ 			if (intern->timer_cb.scheduled_at <= current_ts) {
+-				if (!s_invoke_device_cb (&intern->timer_cb, current_ts TSRMLS_CC)) {
++				if (!s_invoke_device_cb (&intern->timer_cb, current_ts)) {
+ 					zmq_msg_close (&msg);
+ 					return 1;
+ 				}
+@@ -217,7 +217,7 @@ zend_bool php_zmq_device (php_zmq_device_object *intern TSRMLS_DC)
+ 			/* Is it timer to call the idle callback ? */
+ 			if ((current_ts - last_message_received) >= intern->idle_cb.timeout &&
+ 				intern->idle_cb.scheduled_at <= current_ts) {
+-				if (!s_invoke_device_cb (&intern->idle_cb, current_ts TSRMLS_CC)) {
++				if (!s_invoke_device_cb (&intern->idle_cb, current_ts)) {
+ 					zmq_msg_close (&msg);
+ 					return 1;
+ 				}
+diff --git a/zmq_sockopt.c b/zmq_sockopt.c
+index 1357032..14b59f0 100644
+--- a/zmq_sockopt.c
++++ b/zmq_sockopt.c
+@@ -2036,7 +2036,7 @@ PHP_METHOD(zmqsocket, setsockopt)
+     long key;
+     zval *zv;
+ 
+-    if (zend_parse_parameters(ZEND_NUM_ARGS() TSRMLS_CC, "lz/", &key, &zv) == FAILURE) {
++    if (zend_parse_parameters(ZEND_NUM_ARGS(), "lz/", &key, &zv) == FAILURE) {
+         return;
+     }
+ 
+-- 
+2.31.1
+
diff --git a/package/php-zmq/0002-fix-for-php-7.3.patch b/package/php-zmq/0002-fix-for-php-7.3.patch
new file mode 100644
index 0000000000..3ca87582cb
--- /dev/null
+++ b/package/php-zmq/0002-fix-for-php-7.3.patch
@@ -0,0 +1,43 @@
+From e0db82c3286da81fa8945894dd10125a528299e4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Gr=C3=A9gory=20PLANCHAT?=
+ <gplanchat@users.noreply.github.com>
+Date: Wed, 8 Jul 2020 10:09:38 +0200
+Subject: [PATCH] Fix for PHP 7.3 (#215)
+
+Co-authored-by: Remi Collet <remi@remirepo.net>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ zmq.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/zmq.c b/zmq.c
+index 66196ea..879704f 100644
+--- a/zmq.c
++++ b/zmq.c
+@@ -235,7 +235,11 @@ php_zmq_context *php_zmq_context_get(zend_long io_threads, zend_bool is_persiste
+ 		le.type = php_zmq_context_list_entry();
+ 		le.ptr  = context;
+ 
++#if PHP_VERSION_ID < 70300
+ 		GC_REFCOUNT(&le) = 1;
++#else
++		GC_SET_REFCOUNT(&le, 1);
++#endif
+ 
+ 		/* plist_key is not a persistent allocated key, thus we use str_update here */
+ 		if (zend_hash_str_update_mem(&EG(persistent_list), plist_key->val, plist_key->len, &le, sizeof(le)) == NULL) {
+@@ -535,7 +539,11 @@ void php_zmq_socket_store(php_zmq_socket *zmq_sock_p, zend_long type, zend_strin
+ 	le.type = php_zmq_socket_list_entry();
+ 	le.ptr  = zmq_sock_p;
+ 
++#if PHP_VERSION_ID < 70300
+ 	GC_REFCOUNT(&le) = 1;
++#else
++	GC_SET_REFCOUNT(&le, 1);
++#endif
+ 
+ 	plist_key = php_zmq_socket_plist_key(type, persistent_id, use_shared_ctx);
+ 
+-- 
+2.31.1
+
diff --git a/package/php-zmq/0003-fix-for-php-8.0.0beta2.patch b/package/php-zmq/0003-fix-for-php-8.0.0beta2.patch
new file mode 100644
index 0000000000..c5aab16ab7
--- /dev/null
+++ b/package/php-zmq/0003-fix-for-php-8.0.0beta2.patch
@@ -0,0 +1,40 @@
+From f0993f1fe973c4d359323ad1897ed7aa74f7e015 Mon Sep 17 00:00:00 2001
+From: Remi Collet <remi@remirepo.net>
+Date: Mon, 24 Aug 2020 15:55:54 +0200
+Subject: [PATCH] fix for PHP 8.0.0beta2
+
+Signed-off-by: Remi Collet <remi@remirepo.net>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ zmq.c        | 2 ++
+ zmq_device.c | 2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/zmq.c b/zmq.c
+index 89902f9..bd2401d 100644
+--- a/zmq.c
++++ b/zmq.c
+@@ -621,7 +621,9 @@ zend_bool php_zmq_connect_callback(zval *socket, zend_fcall_info *fci, zend_fcal
+ 	fci->params         = params;
+ 	fci->param_count    = 2;
+ 	fci->retval         = &retval;
++#if PHP_VERSION_ID < 80000
+ 	fci->no_separation  = 1;
++#endif
+ 
+ 	if (zend_call_function(fci, fci_cache) == FAILURE) {
+ 		if (!EG(exception)) {
+diff --git a/zmq_device.c b/zmq_device.c
+index 534f966..1c6aa3e 100644
+--- a/zmq_device.c
++++ b/zmq_device.c
+@@ -53,7 +53,9 @@ zend_bool s_invoke_device_cb (php_zmq_device_cb_t *cb, uint64_t current_ts)
+ 	cb->fci.param_count = 1;
+ 
+ 	/* Call the cb */
++#if PHP_VERSION_ID < 80000
+ 	cb->fci.no_separation  = 1;
++#endif
+ 	cb->fci.retval         = &fc_retval;
+ 
+ 	if (zend_call_function(&(cb->fci), &(cb->fci_cache)) == FAILURE) {
