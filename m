Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DA2CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 19:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 298F080D46;
	Thu, 14 Aug 2025 19:56:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5jHyxEr6xXqH; Thu, 14 Aug 2025 19:56:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E96A180D8A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E96A180D8A;
	Thu, 14 Aug 2025 19:56:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CF73228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F3CE402E0
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y41dPdpbhv7O for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 19:56:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64B0E402B5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64B0E402B5
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55892875ED; Thu, 14 Aug 2025 19:56:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:26:31 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b83b90c50b501202e69f338ce44e2625cb0b113e
X-Git-Newrev: b5a5b12cbb476db32da73914d9f043bb061ec969
X-Patchwork-Hint: ignore
Message-Id: <20250814195612.55892875ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/php-pecl-dbus:
 fix build with PHP8
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7767873961021307101=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7767873961021307101==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b5a5b12cbb476db32da73914d9f043bb061ec969
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The php-pecl-dbus encouters two build issues in both buildroot 2025.02.x
and master branch, both related to PHP8 and GCC14:

/home/alexis/src/buildroot/php/build/php-pecl-dbus-b147624d480c3353e6c700e9a2d0c6f14d853941/dbus.c:465:56:
error: assignment to ‘zend_object_get_properties_t’ {aka ‘struct
_zend_array * (*)(struct _zend_object *)’} from incompatible pointer
type ‘HashTable * (*)(zval *)’ {aka ‘struct _zend_array * (*)(struct
_zval_str
uct *)’} [-Wincompatible-pointer-types]
  465 |         dbus_object_handlers_dbus_array.get_properties =
dbus_array_get_properties;
      |                                                        ^
[...]

The build failure can be reproduced with this minimal defconfig:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_NEON=y
BR2_ARM_ENABLE_VFP=y
BR2_ARM_FPU_NEON=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_PHP=y
BR2_PACKAGE_PHP_PECL_DBUS=y

This build failure is the result of two events/conditions:
- the update to PHP8 has changed the prototype for
  zend_object_read_property_t and zend_hash_get_current_key(see [1]).
  But at this time, php-dbus just generated a new warning
  (-Wincompatible-pointer-types)
- using bootlin bleeding-edge toolchain brings in GCC14, which now turns
  this warning into a systematic error (see [2])

Bring the relevant patches to fix this build.

The first patch comes from an already opened PR on the upstream source.
The second patch has been written during the build failure
investigation, and has been sent upstream as well.

Fixes: https://autobuild.buildroot.net/results/e9892bbefa781b403fd3d834b6c48527c8e078ba
Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 0ae37b712f454975f1b18ac0557c2a371ceefa37)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...e-use-zend_objects-or-zval-depending-upon.patch | 751 +++++++++++++++++++++
 ...mpatibility-for-DBUS_ZEND_HASH_GET_CURREN.patch |  51 ++
 2 files changed, 802 insertions(+)

diff --git a/package/php-pecl-dbus/0001-PHP-8-update-use-zend_objects-or-zval-depending-upon.patch b/package/php-pecl-dbus/0001-PHP-8-update-use-zend_objects-or-zval-depending-upon.patch
new file mode 100644
index 0000000000..937cc3c62e
--- /dev/null
+++ b/package/php-pecl-dbus/0001-PHP-8-update-use-zend_objects-or-zval-depending-upon.patch
@@ -0,0 +1,751 @@
+From c3ecd25a755461009de64b9a3b74b4bad8442938 Mon Sep 17 00:00:00 2001
+From: Matt Saladna <msaladna@apisnetworks.com>
+Date: Sun, 5 Mar 2023 12:37:26 -0500
+Subject: [PATCH] PHP 8 update, use zend_objects or zval depending upon version
+ Refrain duplicating objects on __get()
+
+Upstream: https://github.com/derickr/pecl-dbus/pull/13
+Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
+---
+ dbus.c     | 223 +++++++++++++++++++++++++----------------------------
+ php_dbus.h |  22 ++++--
+ 2 files changed, 118 insertions(+), 127 deletions(-)
+
+diff --git a/dbus.c b/dbus.c
+index 57672cc10f56..c198a6c5c71a 100644
+--- a/dbus.c
++++ b/dbus.c
+@@ -267,22 +267,22 @@ static zend_object* dbus_object_new_dbus_set(zend_class_entry *class_type TSRMLS
+ static zend_object* dbus_object_new_dbus_struct(zend_class_entry *class_type TSRMLS_DC);
+ static zend_object* dbus_object_new_dbus_object_path(zend_class_entry *class_type TSRMLS_DC);
+ 
+-static HashTable *dbus_byte_get_properties(zval *object TSRMLS_DC);
+-static HashTable *dbus_bool_get_properties(zval *object TSRMLS_DC);
+-static HashTable *dbus_int16_get_properties(zval *object TSRMLS_DC);
+-static HashTable *dbus_uint16_get_properties(zval *object TSRMLS_DC);
+-static HashTable *dbus_int32_get_properties(zval *object TSRMLS_DC);
+-static HashTable *dbus_uint32_get_properties(zval *object TSRMLS_DC);
+-static HashTable *dbus_int64_get_properties(zval *object TSRMLS_DC);
+-static HashTable *dbus_uint64_get_properties(zval *object TSRMLS_DC);
+-static HashTable *dbus_double_get_properties(zval *object TSRMLS_DC);
+-
+-static HashTable *dbus_array_get_properties(zval *object TSRMLS_DC);
+-static HashTable *dbus_dict_get_properties(zval *object TSRMLS_DC);
+-static HashTable *dbus_variant_get_properties(zval *object TSRMLS_DC);
+-static HashTable *dbus_set_get_properties(zval *object TSRMLS_DC);
+-static HashTable *dbus_struct_get_properties(zval *object TSRMLS_DC);
+-static HashTable *dbus_object_path_get_properties(zval *object TSRMLS_DC);
++static HashTable *dbus_byte_get_properties(dbus_object_type *object TSRMLS_DC);
++static HashTable *dbus_bool_get_properties(dbus_object_type *object TSRMLS_DC);
++static HashTable *dbus_int16_get_properties(dbus_object_type *object TSRMLS_DC);
++static HashTable *dbus_uint16_get_properties(dbus_object_type *object TSRMLS_DC);
++static HashTable *dbus_int32_get_properties(dbus_object_type *object TSRMLS_DC);
++static HashTable *dbus_uint32_get_properties(dbus_object_type *object TSRMLS_DC);
++static HashTable *dbus_int64_get_properties(dbus_object_type *object TSRMLS_DC);
++static HashTable *dbus_uint64_get_properties(dbus_object_type *object TSRMLS_DC);
++static HashTable *dbus_double_get_properties(dbus_object_type *object TSRMLS_DC);
++
++static HashTable *dbus_array_get_properties(dbus_object_type *object TSRMLS_DC);
++static HashTable *dbus_dict_get_properties(dbus_object_type *object TSRMLS_DC);
++static HashTable *dbus_variant_get_properties(dbus_object_type *object TSRMLS_DC);
++static HashTable *dbus_set_get_properties(dbus_object_type *object TSRMLS_DC);
++static HashTable *dbus_struct_get_properties(dbus_object_type *object TSRMLS_DC);
++static HashTable *dbus_object_path_get_properties(dbus_object_type *object TSRMLS_DC);
+ 
+ static int dbus_variant_initialize(php_dbus_variant_obj *dbusobj, zval *data, char *signature TSRMLS_DC);
+ 
+@@ -548,7 +548,7 @@ static int dbus_object_compare_dbus(zval *d1, zval *d2 TSRMLS_DC)
+ 
+ static void dbus_object_free_storage_dbus(void *object TSRMLS_DC)
+ {
+-	php_dbus_obj *intern = DBUS_ZEND_ZOBJ_TO_OBJ(object, php_dbus_obj);
++	php_dbus_obj *intern = DBUS_GET_OBJECT(php_dbus_obj, object);
+ 
+ 	if (intern->con) {
+ 		dbus_connection_unref(intern->con);
+@@ -572,9 +572,10 @@ static zend_object* dbus_object_new_dbus_object(zend_class_entry *class_type TSR
+ 
+ static void dbus_object_free_storage_dbus_object(void *object TSRMLS_DC)
+ {
+-	php_dbus_object_obj *intern = DBUS_ZEND_ZOBJ_TO_OBJ(object, php_dbus_object_obj);
++	php_dbus_object_obj *intern = DBUS_GET_OBJECT(php_dbus_object_obj, object);
+ 
+ 	xmlFreeDoc(intern->introspect_xml_doc);
++
+ 	if (intern->destination) {
+ 		efree(intern->destination);
+ 	}
+@@ -584,6 +585,7 @@ static void dbus_object_free_storage_dbus_object(void *object TSRMLS_DC)
+ 	if (intern->interface) {
+ 		efree(intern->interface);
+ 	}
++
+ 	zend_object_std_dtor(&intern->std);
+ }
+ 
+@@ -601,7 +603,7 @@ static zend_object* dbus_object_new_dbus_signal(zend_class_entry *class_type TSR
+ 
+ static void dbus_object_free_storage_dbus_signal(void *object TSRMLS_DC)
+ {
+-	php_dbus_signal_obj *intern = DBUS_ZEND_ZOBJ_TO_OBJ(object, php_dbus_signal_obj);
++	php_dbus_signal_obj *intern = DBUS_GET_OBJECT(php_dbus_signal_obj, object);
+ 
+ 	dbus_message_unref(intern->msg);
+ 
+@@ -631,7 +633,7 @@ static zend_object* dbus_object_new_dbus_array(zend_class_entry *class_type TSRM
+ 
+ static void dbus_object_free_storage_dbus_array(void *object TSRMLS_DC)
+ {
+-	php_dbus_array_obj *intern = DBUS_ZEND_ZOBJ_TO_OBJ(object, php_dbus_array_obj);
++	php_dbus_array_obj *intern = DBUS_GET_OBJECT(php_dbus_array_obj, object);
+ 
+ 	if (intern->signature) {
+ 		efree(intern->signature);
+@@ -654,7 +656,7 @@ static zend_object* dbus_object_new_dbus_dict(zend_class_entry *class_type TSRML
+ 
+ static void dbus_object_free_storage_dbus_dict(void *object TSRMLS_DC)
+ {
+-	php_dbus_dict_obj *intern = DBUS_ZEND_ZOBJ_TO_OBJ(object, php_dbus_dict_obj);
++	php_dbus_dict_obj *intern = DBUS_GET_OBJECT(php_dbus_dict_obj, object);
+ 
+ 	if (intern->signature) {
+ 		efree(intern->signature);
+@@ -677,11 +679,14 @@ static zend_object* dbus_object_new_dbus_variant(zend_class_entry *class_type TS
+ 
+ static void dbus_object_free_storage_dbus_variant(void *object TSRMLS_DC)
+ {
+-	php_dbus_variant_obj *intern = DBUS_ZEND_ZOBJ_TO_OBJ(object, php_dbus_variant_obj);
++	php_dbus_variant_obj *intern = DBUS_GET_OBJECT(php_dbus_variant_obj, object);
+ 
+ 	if (intern->signature) {
+ 		efree(intern->signature);
+ 	}
++	if (intern->data) {
++		efree(intern->data);
++	}
+ 
+ 	zend_object_std_dtor(&intern->std);
+ }
+@@ -700,7 +705,7 @@ static zend_object* dbus_object_new_dbus_set(zend_class_entry *class_type TSRMLS
+ 
+ static void dbus_object_free_storage_dbus_set(void *object TSRMLS_DC)
+ {
+-	php_dbus_set_obj *intern = DBUS_ZEND_ZOBJ_TO_OBJ(object, php_dbus_set_obj);
++	php_dbus_set_obj *intern = DBUS_GET_OBJECT(php_dbus_set_obj, object);
+ 
+ 	if (intern->elements) {
+ 		int i;
+@@ -720,6 +725,7 @@ static void dbus_object_free_storage_dbus_set(void *object TSRMLS_DC)
+ static inline zend_object* dbus_object_new_dbus_struct_ex(zend_class_entry *class_type, php_dbus_struct_obj **ptr TSRMLS_DC)
+ {
+ 	php_dbus_struct_obj *intern;
++
+ 	DBUS_ZEND_OBJECT_INIT_RETURN(intern, class_type, dbus_struct);
+ }
+ 
+@@ -730,7 +736,7 @@ static zend_object* dbus_object_new_dbus_struct(zend_class_entry *class_type TSR
+ 
+ static void dbus_object_free_storage_dbus_struct(void *object TSRMLS_DC)
+ {
+-	php_dbus_struct_obj *intern = DBUS_ZEND_ZOBJ_TO_OBJ(object, php_dbus_struct_obj);
++	php_dbus_struct_obj *intern = DBUS_GET_OBJECT(php_dbus_struct_obj, object);
+ 
+ 	zend_object_std_dtor(&intern->std);
+ }
+@@ -749,7 +755,7 @@ static zend_object* dbus_object_new_dbus_object_path(zend_class_entry *class_typ
+ 
+ static void dbus_object_free_storage_dbus_object_path(void *object TSRMLS_DC)
+ {
+-	php_dbus_object_path_obj *intern = DBUS_ZEND_ZOBJ_TO_OBJ(object, php_dbus_object_path_obj);
++	php_dbus_object_path_obj *intern = DBUS_GET_OBJECT(php_dbus_object_path_obj, object);
+ 
+ 	zend_object_std_dtor(&intern->std);
+ }
+@@ -768,27 +774,19 @@ static void dbus_object_free_storage_dbus_object_path(void *object TSRMLS_DC)
+  \
+ 	static void dbus_object_free_storage_dbus_##t(void *object TSRMLS_DC) \
+ 	{ \
+-		php_dbus_##t##_obj *intern = DBUS_ZEND_ZOBJ_TO_OBJ(object, php_dbus_##t##_obj); \
++		php_dbus_##t##_obj *intern = DBUS_GET_OBJECT(php_dbus_##t##_obj, object); \
+  \
+ 		zend_object_std_dtor(&intern->std); \
+ 	} \
+  \
+-	static HashTable *dbus_##t##_get_properties(zval *object TSRMLS_DC) \
++	static HashTable *dbus_##t##_get_properties(dbus_object_type *object TSRMLS_DC) \
+ 	{ \
+ 		HashTable *props; \
+ 		zval *zv; \
+ 		php_dbus_##t##_obj *intern; \
+- \
+-		DBUS_ZEND_GET_ZVAL_OBJECT(object, intern, php_dbus_##t##_obj); \
+-		DBUS_ZEND_MAKE_STD_ZVAL(zv); \
+-		DBUS_ZEND_ZVAL_TYPE_P(zv) = pt; \
+-		(*zv).value.pf = intern->data; \
+- \
+-		props = intern->std.properties; \
+- \
+-		DBUS_ZEND_HASH_UPDATE(props, "value", &zv); \
+- \
+-		return props; \
++                                                \
++        props = zend_std_get_properties(object);\
++		return props;                                 \
+ 	}
+ 
+ 
+@@ -810,10 +808,6 @@ static zval * dbus_instantiate(zend_class_entry *pce, zval *object TSRMLS_DC)
+ 	}
+ 
+ 	object_init_ex(object, pce);
+-	Z_TYPE_INFO_P(object) = IS_OBJECT_EX;
+-	Z_SET_REFCOUNT_P(object, 1);
+-	if (Z_ISREF_P(object))
+-		ZVAL_UNREF(object);
+ 
+ 	return object;
+ }
+@@ -848,7 +842,7 @@ PHP_METHOD(Dbus, __construct)
+ 
+ 	dbus_set_error_handling(EH_THROW, NULL TSRMLS_CC);
+ 	if (SUCCESS == zend_parse_parameters(ZEND_NUM_ARGS() TSRMLS_CC, "|ll", &type, &introspect)) {
+-		DBUS_ZEND_GET_ZVAL_OBJECT(getThis(), dbus, php_dbus_obj);
++		dbus = DBUS_ZVAL_GET_OBJECT(php_dbus_obj, getThis());
+ 		dbus_initialize(dbus, type, introspect TSRMLS_CC);
+ 	}
+ 	dbus_set_error_handling(EH_NORMAL, NULL TSRMLS_CC);
+@@ -930,13 +924,13 @@ PHP_METHOD(DbusObject, __construct)
+ 
+ 	dbus_set_error_handling(EH_THROW, NULL TSRMLS_CC);
+ 	if (SUCCESS == zend_parse_parameters(ZEND_NUM_ARGS() TSRMLS_CC, "Osss!",
+-		&object, dbus_ce_dbus,
+-		&destination, &destination_len, &path, &path_len,
+-		&interface, &interface_len))
++										 &object, dbus_ce_dbus,
++										 &destination, &destination_len, &path, &path_len,
++										 &interface, &interface_len))
+ 	{
+ 		DBUS_ZEND_ADDREF_P(object);
+-		DBUS_ZEND_GET_ZVAL_OBJECT(object, dbus, php_dbus_obj);
+-		DBUS_ZEND_GET_ZVAL_OBJECT(getThis(), dbus_object, php_dbus_object_obj);
++		dbus = DBUS_ZVAL_GET_OBJECT(php_dbus_obj, object);
++		dbus_object = DBUS_ZVAL_GET_OBJECT(php_dbus_object_obj, getThis());
+ 		dbus_object_initialize(dbus_object, dbus, destination, path, interface TSRMLS_CC);
+ 		if (dbus->useIntrospection) {
+ 			php_dbus_introspect(dbus_object, dbus, destination, path, interface TSRMLS_CC);
+@@ -959,13 +953,13 @@ PHP_METHOD(Dbus, createProxy)
+ 
+ 	dbus_set_error_handling(EH_THROW, NULL TSRMLS_CC);
+ 	if (SUCCESS == zend_parse_parameters(ZEND_NUM_ARGS() TSRMLS_CC, "sss!",
+-		&destination, &destination_len, &path, &path_len,
+-		&interface, &interface_len))
++										 &destination, &destination_len, &path, &path_len,
++										 &interface, &interface_len))
+ 	{
+-		DBUS_ZEND_GET_ZVAL_OBJECT(object, dbus, php_dbus_obj);
++		dbus = DBUS_ZVAL_GET_OBJECT(php_dbus_obj, object);
+ 		DBUS_ZEND_ADDREF_P(object);
+ 		dbus_instantiate(dbus_ce_dbus_object, return_value TSRMLS_CC);
+-		DBUS_ZEND_GET_ZVAL_OBJECT(return_value, dbus_object, php_dbus_object_obj);
++		dbus_object = DBUS_ZVAL_GET_OBJECT(php_dbus_object_obj, return_value);
+ 		dbus_object_initialize(dbus_object, dbus, destination, path, interface TSRMLS_CC);
+ 		if (dbus->useIntrospection) {
+ 			php_dbus_introspect(dbus_object, dbus, destination, path, interface TSRMLS_CC);
+@@ -979,7 +973,7 @@ static void php_dbus_accept_incoming_signal(DBusMessage *msg, zval **return_valu
+ {
+ 	php_dbus_signal_obj *signalobj;
+ 	dbus_instantiate(dbus_ce_dbus_signal, *return_value TSRMLS_CC);
+-	DBUS_ZEND_GET_ZVAL_OBJECT(*return_value, signalobj, php_dbus_signal_obj);
++	signalobj = DBUS_ZVAL_GET_OBJECT(php_dbus_signal_obj, *return_value);
+ 	signalobj->msg = msg;
+ 	signalobj->direction = PHP_DBUS_SIGNAL_IN;
+ }
+@@ -1114,7 +1108,7 @@ PHP_METHOD(Dbus, waitLoop)
+ 		RETURN_FALSE;
+ 	}
+ 
+-	DBUS_ZEND_GET_ZVAL_OBJECT(object, dbus, php_dbus_obj);
++	dbus = DBUS_ZVAL_GET_OBJECT(php_dbus_obj, object);
+ 
+ 	dbus_connection_read_write(dbus->con, timeout);
+ 	msg = dbus_connection_pop_message(dbus->con);
+@@ -1151,7 +1145,7 @@ PHP_METHOD(Dbus, requestName)
+ 		RETURN_FALSE;
+ 	}
+ 
+-	DBUS_ZEND_GET_ZVAL_OBJECT(object, dbus, php_dbus_obj);
++	dbus = DBUS_ZVAL_GET_OBJECT(php_dbus_obj, object);
+ 	dbus_error_init(&err);
+ 
+ 	/* request our name on the bus and check for errors */
+@@ -1180,7 +1174,7 @@ PHP_METHOD(Dbus, registerObject)
+ 		&class, &class_len)) {
+ 		RETURN_FALSE;
+ 	}
+-	DBUS_ZEND_GET_ZVAL_OBJECT(object, dbus, php_dbus_obj);
++	dbus = DBUS_ZVAL_GET_OBJECT(php_dbus_obj, object);
+ 
+ 	/* Create the key out of the path and interface */
+ 	spprintf(&key, 0, "%s:%s", path, interface ? interface : "(null)");
+@@ -1459,7 +1453,7 @@ PHP_DBUS_APPEND_TYPE_FUNC(uint64, UINT64);
+ #define PHP_DBUS_MARSHAL_TO_DBUS_CASE(t) \
+ 	if (obj->ce == dbus_ce_dbus_##t) { \
+ 		php_dbus_##t##_obj *_val = \
+-			DBUS_ZEND_ZOBJ_TO_OBJ(obj, php_dbus_##t##_obj); \
++			DBUS_GET_OBJECT(php_dbus_##t##_obj, obj); \
+ 		dbus_append_var_##t(iter, _val->data); \
+ 	}
+ 
+@@ -1506,27 +1500,27 @@ static int dbus_append_var(zval **val, DBusMessageIter *iter, char *type_hint TS
+ 			obj = Z_OBJ_P(*val);
+ 			if (obj->ce == dbus_ce_dbus_array) {
+ 				dbus_append_var_array(iter,
+-					DBUS_ZEND_ZOBJ_TO_OBJ(obj, php_dbus_array_obj) TSRMLS_CC);
++					DBUS_GET_OBJECT(php_dbus_array_obj, obj) TSRMLS_CC);
+ 			}
+ 			if (obj->ce == dbus_ce_dbus_dict) {
+ 				dbus_append_var_dict(iter,
+-					DBUS_ZEND_ZOBJ_TO_OBJ(obj, php_dbus_dict_obj) TSRMLS_CC);
++					DBUS_GET_OBJECT(php_dbus_dict_obj, obj) TSRMLS_CC);
+ 			}
+ 			if (obj->ce == dbus_ce_dbus_variant) {
+ 				dbus_append_var_variant(iter,
+-					DBUS_ZEND_ZOBJ_TO_OBJ(obj, php_dbus_variant_obj) TSRMLS_CC);
++					DBUS_GET_OBJECT(php_dbus_variant_obj, obj) TSRMLS_CC);
+ 			}
+ 			if (obj->ce == dbus_ce_dbus_set) {
+ 				dbus_append_var_set(iter,
+-					DBUS_ZEND_ZOBJ_TO_OBJ(obj, php_dbus_set_obj) TSRMLS_CC);
++					DBUS_GET_OBJECT(php_dbus_set_obj, obj) TSRMLS_CC);
+ 			}
+ 			if (obj->ce == dbus_ce_dbus_struct) {
+ 				dbus_append_var_struct(iter,
+-					DBUS_ZEND_ZOBJ_TO_OBJ(obj, php_dbus_struct_obj) TSRMLS_CC);
++					DBUS_GET_OBJECT(php_dbus_struct_obj, obj) TSRMLS_CC);
+ 			}
+ 			if (obj->ce == dbus_ce_dbus_object_path) {
+ 				dbus_append_var_object_path(iter,
+-					DBUS_ZEND_ZOBJ_TO_OBJ(obj, php_dbus_object_path_obj) TSRMLS_CC);
++					DBUS_GET_OBJECT(php_dbus_object_path_obj, obj) TSRMLS_CC);
+ 			}
+ 			PHP_DBUS_MARSHAL_TO_DBUS_CASE(byte);
+ 			PHP_DBUS_MARSHAL_TO_DBUS_CASE(bool);
+@@ -1599,7 +1593,7 @@ static zval *php_dbus_to_zval(DBusMessageIter *args, zval **key TSRMLS_DC)
+ 					if (new_key) {
+ 						if (!init) {
+ 							dbus_instantiate(dbus_ce_dbus_dict, return_value TSRMLS_CC);
+-							DBUS_ZEND_GET_ZVAL_OBJECT(return_value, dictobj, php_dbus_dict_obj);
++							dictobj = DBUS_ZVAL_GET_OBJECT(php_dbus_dict_obj, return_value);
+ 							dictobj->type = php_dbus_fetch_child_type(val TSRMLS_CC);
+ 							DBUS_ZEND_ALLOC_ZVAL(dictobj->elements);
+ 							array_init(dictobj->elements);
+@@ -1611,7 +1605,7 @@ static zval *php_dbus_to_zval(DBusMessageIter *args, zval **key TSRMLS_DC)
+ 						} else if (val && Z_TYPE_P(new_key) == IS_OBJECT) {
+ 							zend_object *obj = Z_OBJ_P(new_key);
+ 							if (obj->ce == dbus_ce_dbus_object_path) {
+-								php_dbus_object_path_obj *intern = DBUS_ZEND_ZOBJ_TO_OBJ(obj, php_dbus_object_path_obj);
++								php_dbus_object_path_obj *intern = DBUS_GET_OBJECT(php_dbus_object_path_obj, obj);
+ 								add_assoc_zval_ex(dictobj->elements, intern->path, strlen(intern->path), val);
+ 							}
+ 						} else if (val && Z_TYPE_P(new_key) == IS_LONG) {
+@@ -1620,7 +1614,7 @@ static zval *php_dbus_to_zval(DBusMessageIter *args, zval **key TSRMLS_DC)
+ 					} else {
+ 						if (!init) {
+ 							dbus_instantiate(dbus_ce_dbus_array, return_value TSRMLS_CC);
+-							DBUS_ZEND_GET_ZVAL_OBJECT(return_value, arrayobj, php_dbus_array_obj);
++							arrayobj = DBUS_ZVAL_GET_OBJECT(php_dbus_array_obj, return_value);
+ 							arrayobj->type = val ? php_dbus_fetch_child_type(val TSRMLS_CC) : DBUS_TYPE_INVALID;
+ 							DBUS_ZEND_ALLOC_ZVAL(arrayobj->elements);
+ 							array_init(arrayobj->elements);
+@@ -1655,7 +1649,7 @@ static zval *php_dbus_to_zval(DBusMessageIter *args, zval **key TSRMLS_DC)
+ 				val = php_dbus_to_zval(&subiter, &new_key TSRMLS_CC);
+ 
+ 				dbus_instantiate(dbus_ce_dbus_variant, return_value TSRMLS_CC);
+-				DBUS_ZEND_GET_ZVAL_OBJECT(return_value, variantobj, php_dbus_variant_obj);
++				variantobj = DBUS_ZVAL_GET_OBJECT(php_dbus_variant_obj, return_value);
+ 				variantobj->data = val;
+ 			}
+ 			break;
+@@ -1664,7 +1658,7 @@ static zval *php_dbus_to_zval(DBusMessageIter *args, zval **key TSRMLS_DC)
+ 				php_dbus_struct_obj *structobj;
+ 
+ 				dbus_instantiate(dbus_ce_dbus_struct, return_value TSRMLS_CC);
+-				DBUS_ZEND_GET_ZVAL_OBJECT(return_value, structobj, php_dbus_struct_obj);
++				structobj = DBUS_ZVAL_GET_OBJECT(php_dbus_struct_obj, return_value);
+ 				DBUS_ZEND_ALLOC_ZVAL(structobj->elements);
+ 				array_init(structobj->elements);
+ 
+@@ -1682,7 +1676,7 @@ static zval *php_dbus_to_zval(DBusMessageIter *args, zval **key TSRMLS_DC)
+ 				dbus_int64_t stat;
+ 
+ 				dbus_instantiate(dbus_ce_dbus_object_path, return_value TSRMLS_CC);
+-				DBUS_ZEND_GET_ZVAL_OBJECT(return_value, object_pathobj, php_dbus_object_path_obj);
++				object_pathobj = DBUS_ZVAL_GET_OBJECT(php_dbus_object_path_obj, return_value);
+ 				dbus_message_iter_get_basic(args, &stat);
+ 				object_pathobj->path = estrdup((char*) stat);
+ 			}
+@@ -1766,7 +1760,7 @@ static int php_dbus_handle_reply(zval *return_value, DBusMessage *msg, int alway
+ 			size_t i = 0;
+ 
+ 			dbus_instantiate(dbus_ce_dbus_set, return_value TSRMLS_CC);
+-			DBUS_ZEND_GET_ZVAL_OBJECT(return_value, set, php_dbus_set_obj);
++			set = DBUS_ZVAL_GET_OBJECT(php_dbus_set_obj, return_value);
+ 			set->elements = (zval **) safe_emalloc(sizeof(zval*), 64, 0);
+ 
+ 			do {
+@@ -1806,7 +1800,8 @@ PHP_METHOD(DbusObject, __call)
+ 		"Osz", &object, dbus_ce_dbus_object, &name, &name_len, &data)) {
+ 		RETURN_FALSE;
+ 	}
+-	DBUS_ZEND_GET_ZVAL_OBJECT(object, dbus_object, php_dbus_object_obj);
++
++	dbus_object = DBUS_ZVAL_GET_OBJECT(php_dbus_object_obj, object);
+ 
+ 	dbus_set_error_handling(EH_THROW, NULL TSRMLS_CC);
+ 
+@@ -1859,7 +1854,7 @@ PHP_METHOD(Dbus, addWatch)
+ 		"O|ss", &object, dbus_ce_dbus, &interface, &interface_len, &member, &member_len)) {
+ 		RETURN_FALSE;
+ 	}
+-	DBUS_ZEND_GET_ZVAL_OBJECT(object, dbus, php_dbus_obj);
++	dbus = DBUS_ZVAL_GET_OBJECT(php_dbus_obj, object);
+ 
+ 	dbus_set_error_handling(EH_THROW, NULL TSRMLS_CC);
+ 
+@@ -1912,8 +1907,8 @@ PHP_METHOD(DbusSignal, __construct)
+ 		&signal, &signal_len))
+ 	{
+ 		DBUS_ZEND_ADDREF_P(object);
+-		DBUS_ZEND_GET_ZVAL_OBJECT(object, dbus, php_dbus_obj);
+-		DBUS_ZEND_GET_ZVAL_OBJECT(getThis(), signal_object, php_dbus_signal_obj);
++		dbus = DBUS_ZVAL_GET_OBJECT(php_dbus_obj, object);
++		signal_object = DBUS_ZVAL_GET_OBJECT(php_dbus_signal_obj, getThis());
+ 		dbus_signal_initialize(signal_object, dbus, object_name, interface, signal TSRMLS_CC);
+ 	}
+ 	dbus_set_error_handling(EH_NORMAL, NULL TSRMLS_CC);
+@@ -1933,7 +1928,7 @@ PHP_METHOD(DbusSignal, matches)
+ 		"Oss", &object, dbus_ce_dbus_signal, &interface, &interface_len, &method, &method_len)) {
+ 		RETURN_FALSE;
+ 	}
+-	DBUS_ZEND_GET_ZVAL_OBJECT(object, signal_obj, php_dbus_signal_obj);
++	signal_obj = DBUS_ZVAL_GET_OBJECT(php_dbus_signal_obj, object);
+ 
+ 	if (dbus_message_is_signal(signal_obj->msg, interface, method)) {
+ 		RETURN_TRUE;
+@@ -1950,7 +1945,7 @@ PHP_METHOD(DbusSignal, getData)
+ 		"O", &object, dbus_ce_dbus_signal)) {
+ 		RETURN_FALSE;
+ 	}
+-	DBUS_ZEND_GET_ZVAL_OBJECT(object, signal_obj, php_dbus_signal_obj);
++	signal_obj = DBUS_ZVAL_GET_OBJECT(php_dbus_signal_obj, object);
+ 
+ 	if (signal_obj->direction == PHP_DBUS_SIGNAL_OUT) {
+ 		php_error_docref(NULL TSRMLS_CC, E_WARNING, "This signal is outgoing, and therefore does not have data.");
+@@ -1969,7 +1964,7 @@ PHP_METHOD(DbusSignal, send)
+ 	dbus_uint32_t serial = 0;
+ 
+ 	dbus_set_error_handling(EH_THROW, NULL TSRMLS_CC);
+-	DBUS_ZEND_GET_ZVAL_OBJECT(getThis(), signal_obj, php_dbus_signal_obj);
++	signal_obj = DBUS_ZVAL_GET_OBJECT(php_dbus_signal_obj, getThis());
+ 
+ 	if (signal_obj->direction == PHP_DBUS_SIGNAL_IN) {
+ 		php_error_docref(NULL TSRMLS_CC, E_WARNING, "This signal is incoming, and therefore can not be send.");
+@@ -2015,15 +2010,15 @@ static int dbus_array_initialize(php_dbus_array_obj *dbusobj, long type, zval *e
+ 	return 1;
+ }
+ 
+-static HashTable *dbus_array_get_properties(zval *object TSRMLS_DC)
++static HashTable *dbus_array_get_properties(dbus_object_type *object TSRMLS_DC)
+ {
+ 	HashTable *props;
+ 	php_dbus_array_obj *array_obj;
+ 	zval *sig;
+ 
+-	DBUS_ZEND_GET_ZVAL_OBJECT(object, array_obj, php_dbus_array_obj);
++	array_obj = DBUS_OBJ_WRAPPER(php_dbus_array_obj, object);
+ 
+-	props = array_obj->std.properties;
++	props = zend_std_get_properties(object);
+ 	if (array_obj->signature) {
+ 		DBUS_ZEND_MAKE_STD_ZVAL(sig);
+ 		DBUS_ZVAL_STRING(sig, array_obj->signature, 1);
+@@ -2051,7 +2046,7 @@ PHP_METHOD(DbusArray, __construct)
+ 
+ 	dbus_set_error_handling(EH_THROW, NULL TSRMLS_CC);
+ 	if (SUCCESS == zend_parse_parameters(ZEND_NUM_ARGS() TSRMLS_CC, "la|s", &type, &array, &signature, &signature_len)) {
+-		DBUS_ZEND_GET_ZVAL_OBJECT(getThis(), array_obj, php_dbus_array_obj);
++		array_obj = DBUS_ZVAL_GET_OBJECT(php_dbus_array_obj, getThis());
+ 		dbus_array_initialize(array_obj, type, array, signature TSRMLS_CC);
+ 	}
+ 	dbus_set_error_handling(EH_NORMAL, NULL TSRMLS_CC);
+@@ -2067,7 +2062,7 @@ PHP_METHOD(DbusArray, getData)
+ 		"O", &object, dbus_ce_dbus_array)) {
+ 		RETURN_FALSE;
+ 	}
+-	DBUS_ZEND_GET_ZVAL_OBJECT(object, array_obj, php_dbus_array_obj);
++	array_obj = DBUS_ZVAL_GET_OBJECT(php_dbus_array_obj, object);
+ 	*return_value = *array_obj->elements;
+ 	zval_copy_ctor(return_value);
+ }
+@@ -2085,15 +2080,15 @@ static int dbus_dict_initialize(php_dbus_dict_obj *dbusobj, long type, zval *ele
+ 	return 1;
+ }
+ 
+-static HashTable *dbus_dict_get_properties(zval *object TSRMLS_DC)
++static HashTable *dbus_dict_get_properties(dbus_object_type *object TSRMLS_DC)
+ {
+ 	HashTable *props;
+ 	php_dbus_dict_obj *dict_obj;
+ 	zval *sig;
+ 
+-	DBUS_ZEND_GET_ZVAL_OBJECT(object, dict_obj, php_dbus_dict_obj);
++	dict_obj = DBUS_OBJ_WRAPPER(php_dbus_dict_obj, object);
+ 
+-	props = dict_obj->std.properties;
++	props = zend_std_get_properties(object);
+ 
+ 	if (dict_obj->signature) {
+ 		DBUS_ZEND_MAKE_STD_ZVAL(sig);
+@@ -2120,7 +2115,7 @@ PHP_METHOD(DbusDict, __construct)
+ 
+ 	dbus_set_error_handling(EH_THROW, NULL TSRMLS_CC);
+ 	if (SUCCESS == zend_parse_parameters(ZEND_NUM_ARGS() TSRMLS_CC, "la|s", &type, &dict, &signature, &signature_len)) {
+-		DBUS_ZEND_GET_ZVAL_OBJECT(getThis(), dict_obj, php_dbus_dict_obj);
++		dict_obj = DBUS_ZVAL_GET_OBJECT(php_dbus_dict_obj, getThis());
+ 		dbus_dict_initialize(dict_obj, type, dict, signature TSRMLS_CC);
+ 	}
+ 	dbus_set_error_handling(EH_NORMAL, NULL TSRMLS_CC);
+@@ -2136,7 +2131,7 @@ PHP_METHOD(DbusDict, getData)
+ 		"O", &object, dbus_ce_dbus_dict)) {
+ 		RETURN_FALSE;
+ 	}
+-	DBUS_ZEND_GET_ZVAL_OBJECT(object, dict_obj, php_dbus_dict_obj);
++	dict_obj = DBUS_ZVAL_GET_OBJECT(php_dbus_dict_obj, object);
+ 	*return_value = *dict_obj->elements;
+ 	zval_copy_ctor(return_value);
+ }
+@@ -2152,17 +2147,12 @@ static int dbus_variant_initialize(php_dbus_variant_obj *dbusobj, zval *data, ch
+ 	return 1;
+ }
+ 
+-static HashTable *dbus_variant_get_properties(zval *object TSRMLS_DC)
++static HashTable *dbus_variant_get_properties(dbus_object_type *object TSRMLS_DC)
+ {
+ 	HashTable *props;
+ 	php_dbus_variant_obj *variant_obj;
+ 
+-	DBUS_ZEND_GET_ZVAL_OBJECT(object, variant_obj, php_dbus_variant_obj);
+-
+-	props = variant_obj->std.properties;
+-
+-	DBUS_ZEND_ADDREF_P(variant_obj->data);
+-	DBUS_ZEND_HASH_UPDATE(props, "variant", &variant_obj->data);
++	props = zend_std_get_properties(object);
+ 
+ 	return props;
+ }
+@@ -2179,9 +2169,10 @@ PHP_METHOD(DbusVariant, __construct)
+ 
+ 	dbus_set_error_handling(EH_THROW, NULL TSRMLS_CC);
+ 	if (SUCCESS == zend_parse_parameters(ZEND_NUM_ARGS() TSRMLS_CC, "z|s", &data, &signature, &signature_len)) {
+-		DBUS_ZEND_GET_ZVAL_OBJECT(getThis(), variant_obj, php_dbus_variant_obj);
++		variant_obj = DBUS_ZVAL_GET_OBJECT(php_dbus_variant_obj, getThis());
+ 		dbus_variant_initialize(variant_obj, data, signature TSRMLS_CC);
+ 	}
++
+ 	dbus_set_error_handling(EH_NORMAL, NULL TSRMLS_CC);
+ }
+ /* }}} */
+@@ -2196,8 +2187,9 @@ PHP_METHOD(DbusVariant, getData)
+ 		RETURN_FALSE;
+ 	}
+ 
+-	DBUS_ZEND_GET_ZVAL_OBJECT(object, variant_obj, php_dbus_variant_obj);
++	variant_obj = DBUS_ZVAL_GET_OBJECT(php_dbus_variant_obj, object);
+ 	*return_value = *variant_obj->data;
++
+ 	zval_copy_ctor(return_value);
+ }
+ 
+@@ -2219,14 +2211,14 @@ static int dbus_set_initialize(php_dbus_set_obj *dbusobj, zval **data, int eleme
+ 	return 1;
+ }
+ 
+-static HashTable *dbus_set_get_properties(zval *object TSRMLS_DC)
++static HashTable *dbus_set_get_properties(dbus_object_type *object TSRMLS_DC)
+ {
+ 	int i;
+ 	HashTable *props;
+ 	php_dbus_set_obj *set_obj;
+ 	zval *set_contents;
+ 
+-	DBUS_ZEND_GET_ZVAL_OBJECT(object, set_obj, php_dbus_set_obj);
++	set_obj = DBUS_OBJ_WRAPPER(php_dbus_set_obj, object);
+ 
+ 	props = set_obj->std.properties;
+ 
+@@ -2255,7 +2247,7 @@ PHP_METHOD(DbusSet, __construct)
+ 	zval *data = NULL;
+ 	data = (zval *) safe_emalloc(elements, sizeof(zval), 1);
+ 	if (SUCCESS == zend_get_parameters_array_ex(elements, data)) {
+-		DBUS_ZEND_GET_ZVAL_OBJECT(getThis(), set_obj, php_dbus_set_obj);
++		set_obj = DBUS_ZVAL_GET_OBJECT(php_dbus_set_obj, getThis());
+ 		dbus_set_initialize(set_obj, &data, elements TSRMLS_CC);
+ 	}
+ 	efree(data);
+@@ -2273,7 +2265,7 @@ PHP_METHOD(DbusSet, getData)
+ 		"O", &object, dbus_ce_dbus_set)) {
+ 		RETURN_FALSE;
+ 	}
+-	DBUS_ZEND_GET_ZVAL_OBJECT(object, set_obj, php_dbus_set_obj);
++	set_obj = DBUS_ZVAL_GET_OBJECT(php_dbus_set_obj, object);
+ 	array_init(return_value);
+ 	for (i = 0; i < set_obj->element_count; i++) {
+ 		DBUS_ZEND_ADDREF_P(set_obj->elements[i]);
+@@ -2290,18 +2282,14 @@ static int dbus_struct_initialize(php_dbus_struct_obj *dbusobj, char *signature,
+ 	return 1;
+ }
+ 
+-static HashTable *dbus_struct_get_properties(zval *object TSRMLS_DC)
++static HashTable *dbus_struct_get_properties(dbus_object_type *object TSRMLS_DC)
+ {
+ 	HashTable *props;
+ 	php_dbus_struct_obj *struct_obj;
+ 
+-	DBUS_ZEND_GET_ZVAL_OBJECT(object, struct_obj, php_dbus_struct_obj);
+-
+-	props = struct_obj->std.properties;
+-
+-	DBUS_ZEND_ADDREF_P(struct_obj->elements);
+-	DBUS_ZEND_HASH_UPDATE(props, "struct", &struct_obj->elements);
++	struct_obj = DBUS_OBJ_WRAPPER(php_dbus_struct_obj, object);
+ 
++	props = zend_std_get_properties(object);
+ 	return props;
+ }
+ 
+@@ -2317,7 +2305,7 @@ PHP_METHOD(DbusStruct, __construct)
+ 
+ 	dbus_set_error_handling(EH_THROW, NULL TSRMLS_CC);
+ 	if (SUCCESS == zend_parse_parameters(ZEND_NUM_ARGS() TSRMLS_CC, "sa", &signature, &signature_len, &array)) {
+-		DBUS_ZEND_GET_ZVAL_OBJECT(getThis(), struct_obj, php_dbus_struct_obj);
++		struct_obj = DBUS_ZVAL_GET_OBJECT(php_dbus_struct_obj, getThis());
+ 		dbus_struct_initialize(struct_obj, signature, array TSRMLS_CC);
+ 	}
+ 	dbus_set_error_handling(EH_NORMAL, NULL TSRMLS_CC);
+@@ -2333,7 +2321,7 @@ PHP_METHOD(DbusStruct, getData)
+ 		"O", &object, dbus_ce_dbus_struct)) {
+ 		RETURN_FALSE;
+ 	}
+-	DBUS_ZEND_GET_ZVAL_OBJECT(object, struct_obj, php_dbus_struct_obj);
++	struct_obj = DBUS_ZVAL_GET_OBJECT(php_dbus_struct_obj, object);
+ 	*return_value = *struct_obj->elements;
+ 	zval_copy_ctor(return_value);
+ }
+@@ -2345,20 +2333,15 @@ static int dbus_object_path_initialize(php_dbus_object_path_obj *dbusobj, char *
+ 	return 1;
+ }
+ 
+-static HashTable *dbus_object_path_get_properties(zval *object TSRMLS_DC)
++static HashTable *dbus_object_path_get_properties(dbus_object_type *object TSRMLS_DC)
+ {
+ 	HashTable *props;
+ 	php_dbus_object_path_obj *object_path_obj;
+ 	zval *path;
+ 
+-	DBUS_ZEND_GET_ZVAL_OBJECT(object, object_path_obj, php_dbus_object_path_obj);
+-
+-	props = object_path_obj->std.properties;
+-
+-	DBUS_ZEND_MAKE_STD_ZVAL(path);
+-	DBUS_ZVAL_STRING(path, object_path_obj->path, 1);
+-	DBUS_ZEND_HASH_UPDATE(props, "path", &path);
++	object_path_obj = DBUS_OBJ_WRAPPER(php_dbus_object_path_obj, object);
+ 
++	props = zend_std_get_properties(object);
+ 	return props;
+ }
+ 
+@@ -2373,7 +2356,7 @@ PHP_METHOD(DbusObjectPath, __construct)
+ 
+ 	dbus_set_error_handling(EH_THROW, NULL TSRMLS_CC);
+ 	if (SUCCESS == zend_parse_parameters(ZEND_NUM_ARGS() TSRMLS_CC, "s", &path, &path_len)) {
+-		DBUS_ZEND_GET_ZVAL_OBJECT(getThis(), object_path_obj, php_dbus_object_path_obj);
++		object_path_obj = DBUS_ZVAL_GET_OBJECT(php_dbus_object_path_obj, getThis());
+ 		dbus_object_path_initialize(object_path_obj, path TSRMLS_CC);
+ 	}
+ 	dbus_set_error_handling(EH_NORMAL, NULL TSRMLS_CC);
+@@ -2389,7 +2372,7 @@ PHP_METHOD(DbusObjectPath, getData)
+ 		"O", &object, dbus_ce_dbus_object_path)) {
+ 		RETURN_FALSE;
+ 	}
+-	DBUS_ZEND_GET_ZVAL_OBJECT(object, object_path_obj, php_dbus_object_path_obj);
++	object_path_obj = DBUS_ZVAL_GET_OBJECT(php_dbus_object_path_obj, object);
+ 
+ 	RETURN_STRING(object_path_obj->path);
+ }
+@@ -2407,7 +2390,7 @@ PHP_METHOD(DbusObjectPath, getData)
+ 		dbus_set_error_handling(EH_THROW, NULL TSRMLS_CC); \
+ 		if (SUCCESS == zend_parse_parameters(ZEND_NUM_ARGS() TSRMLS_CC, "l", &data)) { \
+ 			php_dbus_##s##_obj *dbusobj = NULL; \
+-			DBUS_ZEND_GET_ZVAL_OBJECT(getThis(), dbusobj, php_dbus_##s##_obj); \
++			dbusobj = DBUS_ZVAL_GET_OBJECT(php_dbus_##s##_obj, getThis()); \
+ 			dbus_##s##_initialize(dbusobj, (t)data TSRMLS_CC); \
+ 		} \
+ 		dbus_set_error_handling(EH_NORMAL, NULL TSRMLS_CC); \
+diff --git a/php_dbus.h b/php_dbus.h
+index a080159c407d..fe93dd3a6a1f 100644
+--- a/php_dbus.h
++++ b/php_dbus.h
+@@ -27,13 +27,23 @@
+ 
+ #include "Zend/zend_hash.h"
+ 
+-#define PHP_DBUS_VERSION "0.2.0"
++#define PHP_DBUS_VERSION "0.3.x-dev"
+ 
+ #if PHP_VERSION_ID >= 80000
+ # define TSRMLS_DC
+ # define TSRMLS_CC
+ # define TSRMLS_D void
+ # define TSRMLS_C
++# define dbus_object_type zend_object
++# define dbus_object_handlers_dbus_object dbus_object_handlers_zend_object
++#define DBUS_OBJ_WRAPPER DBUS_GET_OBJECT
++
++# define dbus_strip_obj
++#else
++# define dbus_object_type zval
++# define dbus_object_handlers_dbus_object dbus_object_handlers_zval
++# define dbus_strip_obj(o) Z_OBJ_P(o)
++#define DBUS_OBJ_WRAPPER DBUS_ZVAL_GET_OBJECT
+ #endif
+ 
+ # define DBUS_ZEND_OBJECT_PROPERTIES_INIT(_objPtr, _ce) \
+@@ -75,6 +85,10 @@
+         } \
+     } while(0)
+ 
++#define DBUS_GET_OBJECT(class_entry, o) (class_entry *)((char *)o - XtOffsetOf(class_entry, std))
++#define DBUS_ZVAL_GET_OBJECT(class_entry, z) DBUS_GET_OBJECT(class_entry, Z_OBJ_P(z))
++
++
+ # define DBUS_ZEND_HASH_ADD_PTR(_ht, _key, _ptr, _ptrSz) \
+     zend_hash_str_add_ptr(_ht, _key, strlen(_key), _ptr)
+ 
+@@ -120,12 +134,6 @@
+         } \
+     } while (0)
+ 
+-# define DBUS_ZEND_ZOBJ_TO_OBJ(_zObj, _objType) \
+-    (_objType *) ((char *) _zObj - XtOffsetOf(_objType, std))
+-
+-# define DBUS_ZEND_GET_ZVAL_OBJECT(_zval, _objPtr, _objType) \
+-    _objPtr = DBUS_ZEND_ZOBJ_TO_OBJ(Z_OBJ_P(_zval), _objType)
+-
+ # define DBUS_ZEND_MAKE_STD_ZVAL(_zval) \
+     { \
+         zval tmp; \
+-- 
+2.50.0
+
diff --git a/package/php-pecl-dbus/0002-Fix-PHP8-compatibility-for-DBUS_ZEND_HASH_GET_CURREN.patch b/package/php-pecl-dbus/0002-Fix-PHP8-compatibility-for-DBUS_ZEND_HASH_GET_CURREN.patch
new file mode 100644
index 0000000000..6c2f7321ec
--- /dev/null
+++ b/package/php-pecl-dbus/0002-Fix-PHP8-compatibility-for-DBUS_ZEND_HASH_GET_CURREN.patch
@@ -0,0 +1,51 @@
+From 46a6aa1308b32549625fd7bc265ad011091b3992 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
+Date: Tue, 1 Jul 2025 17:12:32 +0200
+Subject: [PATCH] Fix PHP8 compatibility for
+ DBUS_ZEND_HASH_GET_CURRENT_KEY_INFO
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+php-pecl-dbus currently does not build with PHP8 because of the
+following error:
+
+  In file included from dbus.c:27:
+  dbus.c: In function 'dbus_append_var_dict':
+  php_dbus.h:108:64: error: passing argument 3 of 'zend_hash_get_current_key' from incompatible pointer type [-Wincompatible-pointer-types]
+    108 |         _info.type = zend_hash_get_current_key(_ht, &tmp_info, &_idx); \
+  dbus.c:1295:17: note: in expansion of macro 'DBUS_ZEND_HASH_GET_CURRENT_KEY_INFO'
+   1295 | DBUS_ZEND_HASH_GET_CURRENT_KEY_INFO(Z_ARRVAL_P(obj->elements), num_index, key);
+        |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+  In file included from ../../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/php/Zend/zend.h:33,
+                   from ../../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/php/main/php.h:31,
+                   from dbus.c:21:
+  ../../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/php/Zend/zend_hash.h:269:115: note: expected 'zend_ulong *' {aka 'unsigned int *'} but argument is of type 'ulong *' {aka 'long unsigned int *'}
+    269 | static zend_always_inline int zend_hash_get_current_key(const HashTable *ht, zend_string **str_index, zend_ulong *num_index) {
+        |                                                                                                       ~~~~~~~~~~~~^~~~~~~~~
+
+Fix the build error by explicitely casting the passed index pointer to
+(zend_ulong *)
+
+Upstream: https://github.com/derickr/pecl-dbus/pull/15
+Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
+---
+ php_dbus.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/php_dbus.h b/php_dbus.h
+index a080159c407d..68aec7bc3c42 100644
+--- a/php_dbus.h
++++ b/php_dbus.h
+@@ -105,7 +105,7 @@
+ # define DBUS_ZEND_HASH_GET_CURRENT_KEY_INFO(_ht, _idx, _info) \
+     do { \
+         zend_string *tmp_info = NULL; \
+-        _info.type = zend_hash_get_current_key(_ht, &tmp_info, &_idx); \
++        _info.type = zend_hash_get_current_key(_ht, &tmp_info, (zend_ulong *)&_idx); \
+         if (tmp_info) { \
+             _info.name = ZSTR_VAL(tmp_info); \
+             _info.length = ZSTR_LEN(tmp_info); \
+-- 
+2.50.0
+

--===============7767873961021307101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7767873961021307101==--
