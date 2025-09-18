Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D192CAC592
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06429823C6;
	Fri, 19 Sep 2025 12:43:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zMmwK3JMO-9W; Fri, 19 Sep 2025 12:43:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACE5682387
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACE5682387;
	Fri, 19 Sep 2025 12:43:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C3E30273
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA37940C35
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:42:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Kg_baz6a9pd for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:42:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EB0B40C1E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EB0B40C1E
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:42:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6FD4D85E7F; Fri, 19 Sep 2025 12:42:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Sep 2025 10:20:36 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 49fd8ba6f35b79b4093a0ee97edc4dd1fc5584cf
X-Git-Newrev: 1428a6387d75c5981b9b805c8eb229cd82792838
X-Patchwork-Hint: ignore
Message-Id: <20250919124235.6FD4D85E7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/php-lua: fix
 build with PHP8/GCC14
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
Content-Type: multipart/mixed; boundary="===============6781541899551351384=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6781541899551351384==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1428a6387d75c5981b9b805c8eb229cd82792838
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

On both Buildroot 2025.02.x and master branch, php-lua build fails on
the following error:

lua.c:862:44: error: assignment to 'zend_object_write_property_t' {aka
'struct _zval_struct * (*)(struct _zend_object *, struct _zend_string *,
struct _zval_struct *, void **)'} from incompatible pointer type 'void
(*)(zval *, zval *, zval *, void **)' {aka 'void (*)(struct _zval_struct
*, struct _zval_struct *, struct _zval_struct *, void **)'}
[-Wincompatible-pointer-types]
  862 |         lua_object_handlers.write_property =
php_lua_write_property;
      |                                            ^
lua.c:863:44: error: assignment to 'zend_object_read_property_t' {aka
'struct _zval_struct * (*)(struct _zend_object *, struct _zend_string *,
int,  void **, struct _zval_struct *)'} from incompatible pointer type
'zval * (*)(zval *, zval *, int,  void **, zval *)' {aka 'struct
_zval_struct * (*)(struct _zval_struct *, struct _zval_struct *, int,
void **, struct _zval_struct *)'} [-Wincompatible-pointer-types]
  863 |         lua_object_handlers.read_property  =
php_lua_read_property;
      |                                            ^
make[2]: *** [Makefile:214: lua.lo] Error 1

The error can be reproduced with the following minimal defconfig:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_NEON=y
BR2_ARM_ENABLE_VFP=y
BR2_ARM_FPU_NEON=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_LUA=y
BR2_PACKAGE_PHP=y
BR2_PACKAGE_PHP_LUA=y

This build failure is the result of two events/conditions:
- the update to PHP8 has changed the prototype for
  zend_object_read_property_t (see [1]). But at this time, php-lua just
  generated a new warning (-Wincompatible-pointer-types)
- using bootlin bleeding-edge toolchain brings in GCC14, which now turns
  this warning into a systematic error (see [2])

This issue is still present on the upstream repository, but it has been
fixed on one of its forks. Bring the relevant patch from the fork to
allow building php-lua.

[1] https://github.com/php/php-src/commit/91ef4124e56
[2] https://gcc.gnu.org/gcc-14/porting_to.html#incompatible-pointer-types

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
[Romain: update Upstream link]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit b4d8147a9532cbe2abf25d69f58e0c73b82136fb)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-write-properly-read-property-was-changed.patch | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/package/php-lua/0003-php8-Signature-of-write-properly-read-property-was-changed.patch b/package/php-lua/0003-php8-Signature-of-write-properly-read-property-was-changed.patch
new file mode 100644
index 0000000000..82a6bbd0b2
--- /dev/null
+++ b/package/php-lua/0003-php8-Signature-of-write-properly-read-property-was-changed.patch
@@ -0,0 +1,77 @@
+From de1068d634519abf2461dac9427b5ff24b6603af Mon Sep 17 00:00:00 2001
+From: Mikhail Galanin <mikhail.galanin@team.bumble.com>
+Date: Tue, 24 Aug 2021 08:28:47 +0100
+Subject: [PATCH] php8: Signature of write_property/read_property was changed
+ in https://github.com/php/php-src/commit/91ef4124e56
+
+Upstream: upstream dead, taken from fork at https://github.com/badoo/php-lua/pull/8
+Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
+---
+ lua.c | 28 ++++++++++++++--------------
+ 1 file changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/lua.c b/lua.c
+index edc2868..32c1471 100755
+--- a/lua.c
++++ b/lua.c
+@@ -229,46 +229,46 @@ zend_object *php_lua_create_object(zend_class_entry *ce)
+ 
+ /** {{{ static zval * php_lua_read_property(zval *object, zval *member, int type)
+ */
+-zval *php_lua_read_property(zval *object, zval *member, int type, void **cache_slot, zval *rv){
+-	lua_State *L = (Z_LUAVAL_P(object))->L;
+-	zend_string *str_member;
++zval *php_lua_read_property(zend_object *object, zend_string *member, int type, void **cache_slot, zval *rv){
++	lua_State *L = php_lua_obj_from_obj(object)->L;
+ 
+ 	if (type != BP_VAR_R) {
+ 		ZVAL_NULL(rv);
+ 		return rv;
+ 	}
+ 
+-	str_member = zval_get_string(member);
+ #if (LUA_VERSION_NUM < 502)
+-	lua_getfield(L, LUA_GLOBALSINDEX, ZSTR_VAL(str_member));
++	lua_getfield(L, LUA_GLOBALSINDEX, ZSTR_VAL(member));
+ #else
+-	lua_getglobal(L, ZSTR_VAL(str_member));
++	lua_getglobal(L, ZSTR_VAL(member));
+ #endif
+-	zend_string_release(str_member);
+ 
+-	php_lua_get_zval_from_lua(L, -1, object, rv);
++	zval lua_zval_object;
++	ZVAL_OBJ(&lua_zval_object, object);
++
++	php_lua_get_zval_from_lua(L, -1, &lua_zval_object, rv);
+ 	lua_pop(L, 1);
++
+ 	return rv;
+ }
+ /* }}} */
+ 
+ /** {{{ static void php_lua_write_property(zval *object, zval *member, zval *value)
+ */
+-static void php_lua_write_property(zval *object, zval *member, zval *value, void ** key) {
+-	lua_State *L = (Z_LUAVAL_P(object))->L;
+-	zend_string *str_member = zval_get_string(member);
++static zval* php_lua_write_property(zend_object *object, zend_string *member, zval *value, void ** key) {
++	lua_State *L = php_lua_obj_from_obj(object)->L;
+ 
+ #if (LUA_VERSION_NUM < 502)
+-	php_lua_send_zval_to_lua(L, member);
++	lua_pushlstring(L, ZSTR_VAL(val), ZSTR_LEN(val));
+ 	php_lua_send_zval_to_lua(L, value);
+ 
+ 	lua_settable(L, LUA_GLOBALSINDEX);
+ #else
+ 	php_lua_send_zval_to_lua(L, value);
+-	lua_setglobal(L, Z_STRVAL_P(member));
++	lua_setglobal(L, ZSTR_VAL(member));
+ #endif
+ 
+-	zend_string_release(str_member);
++	return value;
+ }
+ /* }}} */
+ 

--===============6781541899551351384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6781541899551351384==--
