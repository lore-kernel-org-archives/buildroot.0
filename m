Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F86CAC5A8
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3016382333;
	Fri, 19 Sep 2025 12:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NVsf83Kl-B5n; Fri, 19 Sep 2025 12:43:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CF5282347
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CF5282347;
	Fri, 19 Sep 2025 12:42:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F033E7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDB7A40C28
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:42:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a7Q0oWHKoUl3 for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:42:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87AAE40C23
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87AAE40C23
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:42:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79AB885E80; Fri, 19 Sep 2025 12:42:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Sep 2025 10:22:08 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1428a6387d75c5981b9b805c8eb229cd82792838
X-Git-Newrev: d4e1e1055b7076a9788b0cf63eacd19658bf9d10
X-Patchwork-Hint: ignore
Message-Id: <20250919124235.79AB885E80@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/php-lua: fix
 build with lua < 5.2
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
Content-Type: multipart/mixed; boundary="===============5475159760251407233=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5475159760251407233==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d4e1e1055b7076a9788b0cf63eacd19658bf9d10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

php-lua fails to build in buildroot 2025.08-rc3 on the following error:

in file included from [...]/usr/include/php/Zend/zend.h:32,
                 from [...]/usr/include/php/main/php.h:31,
                 from [...]/build/php-lua-2.0.7/lua.c:24:
[...]/build/php-lua-2.0.7/lua.c: In function ‘php_lua_write_property’:
[...]/build/php-lua-2.0.7/lua.c:247:37:
error: ‘val’ undeclared (first use in this function); did you mean
‘zval’?
  247 |         lua_pushlstring(L, ZSTR_VAL(val), ZSTR_LEN(val));
      |                                     ^~~
[...]/usr/include/php/Zend/zend_string.h:66:26:
note: in definition of macro ‘ZSTR_VAL’
   66 | #define ZSTR_VAL(zstr)  (zstr)->val
      |                          ^~~~
[...]/build/php-lua-2.0.7/lua.c:247:37:
note: each undeclared identifier is reported only once for each function
it appears in
  247 |         lua_pushlstring(L, ZSTR_VAL(val), ZSTR_LEN(val));
      |                                     ^~~
[...]/usr/include/php/Zend/zend_string.h:66:26:
note: in definition of macro ‘ZSTR_VAL’
   66 | #define ZSTR_VAL(zstr)  (zstr)->val
      |                          ^~~~
make[2]: *** [Makefile:214: lua.lo] Error 1

The issue triggers only if lua interpreter version is lower than 5.2. In
this case,  php_lua_write_property calls ZSTR_VAL on the wrong variable.

Fix php-lua build by calling ZSTR_VAL on the correct variable.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11271124501 (TestPhpLuaLuajit)

Suggested-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
[Romain: add link to failing TestPhpLuaLuajit]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit a1daf153bf962d1797598943f8c8709ed04e4642)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...a.c-fix-ZSTR_VAL-usage-when-using-lua-5.2.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/php-lua/0004-lua.c-fix-ZSTR_VAL-usage-when-using-lua-5.2.patch b/package/php-lua/0004-lua.c-fix-ZSTR_VAL-usage-when-using-lua-5.2.patch
new file mode 100644
index 0000000000..c5d99db7f5
--- /dev/null
+++ b/package/php-lua/0004-lua.c-fix-ZSTR_VAL-usage-when-using-lua-5.2.patch
@@ -0,0 +1,38 @@
+From 7bf334832ad36d1f2976406d680b35a168ffaa91 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
+Date: Mon, 8 Sep 2025 17:20:12 +0200
+Subject: [PATCH] lua.c: fix ZSTR_VAL usage when using lua < 5.2
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When using a lua interpreter with a version lower than 5.1, the
+php_lua_write_property ends up calling the ZSTR_VAL with the wrong
+variable (it is expected to receive "member", a zend_string variable,
+but it is "value" that is passed, which is a zval).
+
+Fix php-lua compatibility with interpreters < 5.2 by passing the correct
+variable
+
+Upstream: upstream dead, custom patch
+Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
+---
+ lua.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lua.c b/lua.c
+index a40e5da442a4..5889bc7f83ea 100755
+--- a/lua.c
++++ b/lua.c
+@@ -244,7 +244,7 @@ static zval* php_lua_write_property(zend_object *object, zend_string *member, zv
+ 	lua_State *L = php_lua_obj_from_obj(object)->L;
+ 
+ #if (LUA_VERSION_NUM < 502)
+-	lua_pushlstring(L, ZSTR_VAL(val), ZSTR_LEN(val));
++	lua_pushlstring(L, ZSTR_VAL(member), ZSTR_LEN(member));
+ 	php_lua_send_zval_to_lua(L, value);
+ 
+ 	lua_settable(L, LUA_GLOBALSINDEX);
+-- 
+2.51.0
+

--===============5475159760251407233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5475159760251407233==--
