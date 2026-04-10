Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD10BF36B9A
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 01:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54ABC605FF;
	Fri, 10 Apr 2026 01:44:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0izH1qtn0mcv; Fri, 10 Apr 2026 01:44:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B9D960B8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775785461;
	bh=HSd4qSbCdfmMUFc1plBg8+dCODhVg6OvH5Pe90r2cUs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FNVAJOTHe/NwqsGSegJQzIPe5yxhL+eOdGX6Jdfv7OL96ghyOPQ2EjOb4roj2BZyw
	 LHy4j65R6EcEMD9OiQ6cIurIOPIgNoK9coYXHdAYU4Tavsh3sySPisZW7AGuIW4ZxX
	 n78tHoD7bimEu0QVaR6uJkzhakizefj2VegXRLmKBNzXAqvo+l/sFYJYG6yjpbbBUe
	 zYkGJAdEu46SssShbcafJUwZsbpiXx8JOPXMtN/adV2pFQ85A1XBYMtZtp3cRDkzAj
	 A5kQuA5itrwrM0eIf76n/zMzQtnMe3AH6Eg8g2w70hIacF8DyhLV7w3ZnBu8+iz5Yt
	 JZM0Xsodr8I1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B9D960B8A;
	Fri, 10 Apr 2026 01:44:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 071AD1F6
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 01:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1243400B5
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 01:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m1VHUC1gxO_T for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 01:44:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=64.142.111.50;
 helo=d.mail.sonic.net; envelope-from=sen@hastings.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AC1A6400AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC1A6400AD
Received: from d.mail.sonic.net (d.mail.sonic.net [64.142.111.50])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC1A6400AD
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 01:44:18 +0000 (UTC)
Received: from obsidian.. (syn-068-189-041-004.res.spectrum.com [68.189.41.4]
 (may be forged)) (authenticated bits=0)
 by d.mail.sonic.net (8.16.1/8.16.1) with ESMTPSA id 63A1iBVa003155
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 9 Apr 2026 18:44:17 -0700
From: Sen Hastings <sen@hastings.org>
To: buildroot@buildroot.org
Date: Thu,  9 Apr 2026 18:43:09 -0700
Message-ID: <20260410014309.18115-3-sen@hastings.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410014309.18115-2-sen@hastings.org>
References: <20260410014309.18115-2-sen@hastings.org>
MIME-Version: 1.0
X-Sonic-CAuth: UmFuZG9tSVa5ss/3gmBsLeI42P4VgyXJrua9qTgoHHpeJJPgHMM4HierdqUC4HPOSHmHJXx4g+15+1sGRoL/td8FXiEWvgIR
X-Sonic-ID: C;roTPxX408RGucKIf40Rrfg== M;8MhUyX408RGucKIf40Rrfg==
X-Sonic-Spam-Details: not scanned (too big) by cerberusd
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=hastings.org
Subject: [Buildroot] [PATCH 1/1] package/lua: re-add lua 5.2.4
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Sen Hastings <sen@hastings.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch basically reverts
https://lore.kernel.org/buildroot/20181209201557.77C178B686@busybox.osuosl.org/

while adopting the slight changes made to buildroots lua build
infrastructure since 2018.

Signed-off-by: Sen Hastings <sen@hastings.org>
---
 Config.in.legacy                              | 10 +--
 package/lua/5.2.4/0001-root-path.patch        | 17 ++++
 .../lua/5.2.4/0002-shared-libs-for-lua.patch  | 78 +++++++++++++++++++
 package/lua/5.2.4/0011-linenoise.patch        | 26 +++++++
 package/lua/5.2.4/lua.hash                    |  2 +
 package/lua/Config.in                         |  7 +-
 package/lua/lua.mk                            |  6 +-
 package/luainterpreter/Config.in              |  4 +
 package/mpv/mpv.mk                            |  2 +-
 9 files changed, 144 insertions(+), 8 deletions(-)
 create mode 100644 package/lua/5.2.4/0001-root-path.patch
 create mode 100644 package/lua/5.2.4/0002-shared-libs-for-lua.patch
 create mode 100644 package/lua/5.2.4/0011-linenoise.patch
 create mode 100644 package/lua/5.2.4/lua.hash

diff --git a/Config.in.legacy b/Config.in.legacy
index 518251c816..0051ac1bde 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -4201,11 +4201,11 @@ config BR2_PACKAGE_FFTW_PRECISION_QUAD
 	  This option has been removed in favor of
 	  BR2_PACKAGE_FFTW_QUAD.
 
-config BR2_PACKAGE_LUA_5_2
-	bool "Lua 5.2.x version removed"
-	select BR2_LEGACY
-	help
-	  The Lua 5.2.x version was removed.
+#config BR2_PACKAGE_LUA_5_2
+#	bool "Lua 5.2.x version removed"
+#	select BR2_LEGACY
+#	help
+#	  The Lua 5.2.x version was removed.
 # Note: BR2_PACKAGE_LUA_5_2 is still referenced from package/lua/Config.in
 
 config BR2_TARGET_GENERIC_PASSWD_MD5
diff --git a/package/lua/5.2.4/0001-root-path.patch b/package/lua/5.2.4/0001-root-path.patch
new file mode 100644
index 0000000000..c6f242c20e
--- /dev/null
+++ b/package/lua/5.2.4/0001-root-path.patch
@@ -0,0 +1,17 @@
+Adjust installation location to /usr.
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/src/luaconf.h
+===================================================================
+--- a/src/luaconf.h
++++ b/src/luaconf.h
+@@ -100,7 +100,7 @@
+ #else			/* }{ */
+ 
+ #define LUA_VDIR	LUA_VERSION_MAJOR "." LUA_VERSION_MINOR "/"
+-#define LUA_ROOT	"/usr/local/"
++#define LUA_ROOT	"/usr/"
+ #define LUA_LDIR	LUA_ROOT "share/lua/" LUA_VDIR
+ #define LUA_CDIR	LUA_ROOT "lib/lua/" LUA_VDIR
+ #define LUA_PATH_DEFAULT  \
diff --git a/package/lua/5.2.4/0002-shared-libs-for-lua.patch b/package/lua/5.2.4/0002-shared-libs-for-lua.patch
new file mode 100644
index 0000000000..3cf3b24848
--- /dev/null
+++ b/package/lua/5.2.4/0002-shared-libs-for-lua.patch
@@ -0,0 +1,78 @@
+Add the compilation of a shared library.
+Compile the lua binary with the shared library.
+And install the shared library.
+The variable BUILDMODE allows to switch between static and dynamic mode.
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/Makefile
+===================================================================
+--- a/Makefile
++++ b/Makefile
+@@ -42,6 +42,7 @@
+ TO_BIN= lua luac
+ TO_INC= lua.h luaconf.h lualib.h lauxlib.h lua.hpp
+ TO_LIB= liblua.a
++TO_SOLIB = liblua.so.$(R)
+ TO_MAN= lua.1 luac.1
+ 
+ # Lua version and release.
+@@ -60,6 +61,8 @@
+ install: dummy
+ 	cd src && $(MKDIR) $(INSTALL_BIN) $(INSTALL_INC) $(INSTALL_LIB) $(INSTALL_MAN) $(INSTALL_LMOD) $(INSTALL_CMOD)
+ 	cd src && $(INSTALL_EXEC) $(TO_BIN) $(INSTALL_BIN)
++	test -f src/$(TO_SOLIB) && cd src && $(INSTALL_EXEC) $(TO_SOLIB) $(INSTALL_LIB) || :
++	test -f src/$(TO_SOLIB) && ln -sf $(TO_SOLIB) $(INSTALL_LIB)/liblua.so || :
+ 	cd src && $(INSTALL_DATA) $(TO_INC) $(INSTALL_INC)
+ 	cd src && $(INSTALL_DATA) $(TO_LIB) $(INSTALL_LIB)
+ 	cd doc && $(INSTALL_DATA) $(TO_MAN) $(INSTALL_MAN)
+Index: b/src/Makefile
+===================================================================
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -29,6 +29,7 @@
+ PLATS= aix ansi bsd freebsd generic linux macosx mingw posix solaris
+ 
+ LUA_A=	liblua.a
++LUA_SO=	liblua.so
+ CORE_O=	lapi.o lcode.o lctype.o ldebug.o ldo.o ldump.o lfunc.o lgc.o llex.o \
+ 	lmem.o lobject.o lopcodes.o lparser.o lstate.o lstring.o ltable.o \
+ 	ltm.o lundump.o lvm.o lzio.o
+@@ -43,8 +44,13 @@
+ LUAC_O=	luac.o
+ 
+ ALL_O= $(BASE_O) $(LUA_O) $(LUAC_O)
++ifneq (dynamic,$(BUILDMODE))
+ ALL_T= $(LUA_A) $(LUA_T) $(LUAC_T)
++else
++ALL_T= $(LUA_A) $(LUA_SO) $(LUA_T) $(LUAC_T)
++endif
+ ALL_A= $(LUA_A)
++ALL_SO= $(LUA_SO)
+ 
+ # Targets start here.
+ default: $(PLAT)
+@@ -55,12 +61,23 @@
+ 
+ a:	$(ALL_A)
+ 
++so:	$(ALL_SO)
++
+ $(LUA_A): $(BASE_O)
+ 	$(AR) $@ $(BASE_O)
+ 	$(RANLIB) $@
+ 
++$(LUA_SO): $(CORE_O) $(LIB_O)
++	$(CC) -o $@.$(PKG_VERSION) -shared -Wl,-soname="$@.$(PKG_VERSION)" $?
++	ln -fs $@.$(PKG_VERSION) $@
++
++ifneq (dynamic,$(BUILDMODE))
+ $(LUA_T): $(LUA_O) $(LUA_A)
+ 	$(CC) -o $@ $(LDFLAGS) $(LUA_O) $(LUA_A) $(LIBS)
++else
++$(LUA_T): $(LUA_O) $(LUA_SO)
++	$(CC) -o $@ -L. $(LDFLAGS) $(LUA_O) -llua $(LIBS)
++endif
+ 
+ $(LUAC_T): $(LUAC_O) $(LUA_A)
+ 	$(CC) -o $@ $(LDFLAGS) $(LUAC_O) $(LUA_A) $(LIBS)
diff --git a/package/lua/5.2.4/0011-linenoise.patch b/package/lua/5.2.4/0011-linenoise.patch
new file mode 100644
index 0000000000..b1f228cd49
--- /dev/null
+++ b/package/lua/5.2.4/0011-linenoise.patch
@@ -0,0 +1,26 @@
+Add support of linenoise (replace readline)
+
+see discussion, http://lua-users.org/lists/lua-l/2010-03/msg00879.html
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/src/lua.c
+===================================================================
+--- a/src/lua.c
++++ b/src/lua.c
+@@ -72,6 +72,15 @@
+           add_history(lua_tostring(L, idx));  /* add it to history */
+ #define lua_freeline(L,b)	((void)L, free(b))
+ 
++#elif defined(LUA_USE_LINENOISE)
++
++#include <linenoise.h>
++#define lua_readline(L,b,p)	((void)L, ((b)=linenoise(p)) != NULL)
++#define lua_saveline(L,idx) \
++	if (lua_rawlen(L,idx) > 0)  /* non-empty line? */ \
++	  linenoiseHistoryAdd(lua_tostring(L, idx));  /* add it to history */
++#define lua_freeline(L,b)	((void)L, free(b))
++
+ #elif !defined(lua_readline)
+ 
+ #define lua_readline(L,b,p) \
diff --git a/package/lua/5.2.4/lua.hash b/package/lua/5.2.4/lua.hash
new file mode 100644
index 0000000000..8b8bed6f24
--- /dev/null
+++ b/package/lua/5.2.4/lua.hash
@@ -0,0 +1,2 @@
+md5 913fdb32207046b273fdb17aad70be13           lua-5.2.4.tar.gz
+sha1 ef15259421197e3d85b7d6e4871b8c26fd82c1cf  lua-5.2.4.tar.gz
diff --git a/package/lua/Config.in b/package/lua/Config.in
index 888c34b21d..97d782c5ed 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -14,7 +14,8 @@ config BR2_PACKAGE_PROVIDES_LUAINTERPRETER
 
 choice
 	prompt "Lua Version"
-	default BR2_PACKAGE_LUA_5_3 if BR2_PACKAGE_LUA_5_2 # legacy
+	default BR2_PACKAGE_LUA_5_2
+	default BR2_PACKAGE_LUA_5_3
 	default BR2_PACKAGE_LUA_5_4
 	help
 	  Select the version of Lua API/ABI you wish to use.
@@ -25,6 +26,10 @@ config BR2_PACKAGE_LUA_5_1
 	select BR2_PACKAGE_LUA_CVT_N2S
 	select BR2_PACKAGE_LUA_CVT_S2N
 
+config BR2_PACKAGE_LUA_5_2
+	bool "Lua 5.2.x"
+	select BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_2
+
 config BR2_PACKAGE_LUA_5_3
 	bool "Lua 5.3.x"
 	select BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_3
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 269eafe4bb..09b79c53c5 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -8,13 +8,15 @@ ifeq ($(BR2_PACKAGE_LUA_5_4),y)
 LUA_VERSION = 5.4.8
 else ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUA_VERSION = 5.3.6
+else ifeq ($(BR2_PACKAGE_LUA_5_2),y)
+LUA_VERSION = 5.2.4
 else
 LUA_VERSION = 5.1.5
 endif
 LUA_SITE = https://www.lua.org/ftp
 LUA_INSTALL_STAGING = YES
 LUA_LICENSE = MIT
-ifeq ($(BR2_PACKAGE_LUA_5_3)$(BR2_PACKAGE_LUA_5_4),y)
+ifeq ($(BR2_PACKAGE_LUA_5_2)$(BR2_PACKAGE_LUA_5_3)$(BR2_PACKAGE_LUA_5_4),y)
 LUA_LICENSE_FILES = doc/readme.html
 else
 LUA_LICENSE_FILES = COPYRIGHT
@@ -35,6 +37,8 @@ ifeq ($(BR2_PACKAGE_LUA_5_4),y)
 LUA_CFLAGS += -DLUA_COMPAT_5_3
 else ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUA_CFLAGS += -DLUA_COMPAT_5_2
+else ifeq ($(BR2_PACKAGE_LUA_5_2),y)
+LUA_CFLAGS += -DLUA_COMPAT_ALL
 endif
 
 ifeq ($(BR2_PACKAGE_LUA_CVT_N2S),)
diff --git a/package/luainterpreter/Config.in b/package/luainterpreter/Config.in
index 873fb345b9..6f4f0d76ab 100644
--- a/package/luainterpreter/Config.in
+++ b/package/luainterpreter/Config.in
@@ -8,12 +8,16 @@ config BR2_PACKAGE_PROVIDES_LUAINTERPRETER
 config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION
 	string
 	default "5.1" if BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
+	default "5.2" if BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_2
 	default "5.3" if BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_3
 	default "5.4" if BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_4
 
 config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
 	bool
 
+config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_2
+	bool
+
 config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_3
 	bool
 
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 29d4ebfaf7..24923c8136 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -128,7 +128,7 @@ endif
 
 # LUA support, only for lua51/lua52/luajit
 # This enables the controller (OSD) together with libass
-ifeq ($(BR2_PACKAGE_LUA_5_1)$(BR2_PACKAGE_LUAJIT),y)
+ifeq ($(BR2_PACKAGE_LUA_5_1)$(BR2_PACKAGE_LUA_5_2)$(BR2_PACKAGE_LUAJIT),y)
 MPV_CONF_OPTS += -Dlua=enabled
 MPV_DEPENDENCIES += luainterpreter
 else
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
