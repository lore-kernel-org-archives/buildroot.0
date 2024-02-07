Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719D1C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 11:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D08281F5E;
	Wed,  7 Feb 2024 11:25:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hbzubc84-BYS; Wed,  7 Feb 2024 11:25:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3885E82121
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3885E82121;
	Wed,  7 Feb 2024 11:25:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B29A1BF599
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 157C3405B7
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:25:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EvVeMkgCYfWG for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 11:25:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E1B84050F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E1B84050F
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 11:25:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1663087559; Wed,  7 Feb 2024 11:25:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 12:25:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f4be5c41bdf296e6f5c7ad7b9811d34386f89ea
X-Git-Newrev: ef199d362985031d473754c42a64f7ab2e9e57d1
X-Patchwork-Hint: ignore
Message-Id: <20240207112532.1663087559@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeradius-server: fix python3
 build with -Ofast
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ef199d362985031d473754c42a64f7ab2e9e57d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following python3 build failure with -Ofast raised since commit
4513f5198a8f24af7bd24fdfc1ede143eb4e844a:

powerpc64-buildroot-linux-gnu-gcc.br_real: error: ast: linker input file not found: No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/904c43241b99a8d848c1891cb5af132a291311b4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...c-modules-rlm_python-fix-build-with-Ofast.patch | 49 ++++++++++++++++++++++
 package/freeradius-server/freeradius-server.mk     |  6 +++
 2 files changed, 55 insertions(+)

diff --git a/package/freeradius-server/0009-src-modules-rlm_python-fix-build-with-Ofast.patch b/package/freeradius-server/0009-src-modules-rlm_python-fix-build-with-Ofast.patch
new file mode 100644
index 0000000000..c92b4171d2
--- /dev/null
+++ b/package/freeradius-server/0009-src-modules-rlm_python-fix-build-with-Ofast.patch
@@ -0,0 +1,49 @@
+From 963edf3f87d34e274885d9cc448651d8a1601a6f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 11 Jan 2024 17:38:41 +0100
+Subject: [PATCH] src/modules/rlm_python: fix build with -Ofast
+
+Stripping logic wrongly translates -Ofast into ast resulting in the
+following build failure:
+
+configure: /home/fabrice/buildroot/output/host/powerpc64-buildroot-linux-gnu/sysroot/usr/bin/python3-config's cflags were "-I/home/fabrice/buildroot/output/host/powerpc64-buildroot-linux-gnu/sysroot/usr/include/python3.11 -I/home/fabrice/buildroot/output/host/powerpc64-buildroot-linux-gnu/sysroot/usr/include/python3.11  -Wsign-compare -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Ofast -g0 -D_FORTIFY_SOURCE=2 -DNDEBUG -g -fwrapv -O3 -Wall"
+configure: Sanitized cflags were " -isystem/home/fabrice/buildroot/output/host/powerpc64-buildroot-linux-gnu/sysroot/usr/include/python3.11 -isystem/home/fabrice/buildroot/output/host/powerpc64-buildroot-linux-gnu/sysroot/usr/include/python3.11   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  ast  -D_FORTIFY_SOURCE=2 -fwrapv  "
+
+[...]
+
+powerpc64-buildroot-linux-gnu-gcc.br_real: error: ast: linker input file not found: No such file or directory
+
+Fixes:
+ - http://autobuild.buildroot.org/results/904c43241b99a8d848c1891cb5af132a291311b4
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/FreeRADIUS/freeradius-server/pull/5263
+---
+ src/modules/rlm_python/configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/modules/rlm_python3/configure.ac b/src/modules/rlm_python3/configure.ac
+index e2f74574fb..ee30b324d9 100644
+--- a/src/modules/rlm_python3/configure.ac
++++ b/src/modules/rlm_python3/configure.ac
+@@ -59,7 +59,7 @@ else
+ 
+ 	dnl # Convert -I to -isystem to get rid of warnings about issues in Python headers
+ 	dnl # Strip -systemroot
+-	dnl # Strip optimisation flags (-O[0-9]?). We decide our optimisation level, not python.
++	dnl # Strip optimisation flags (-O[0-9|fast]?). We decide our optimisation level, not python.
+ 	dnl # -D_FORTIFY_SOURCE needs -O.
+ 	dnl # Strip debug symbol flags (-g[0-9]?). We decide on debugging symbols, not python
+ 	dnl # Strip -W*, we decide what warnings are important
+@@ -73,7 +73,7 @@ else
+ 	mod_cflags=`echo " $python_cflags" | sed -e '\
+ 		s/ -I/ -isystem/g;\
+ 		s/ -isysroot[[ =]]\{0,1\}[[^-]]*/ /g;\
+-		s/ -O[[^[[:blank:]]]]*/ /g;\
++		s/ -O[[^[[:blank:]]*]]*/ /g;\
+ 		s/ -Wp,-D_FORTIFY_SOURCE=[[[:digit:]]]/ /g;\
+ 		s/ -g[[^ ]]*/ /g;\
+ 		s/ -W[[^ ]]*/ /g;\
+-- 
+2.43.0
+
diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index 16a817b680..1b5751d753 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -21,6 +21,12 @@ define FREERADIUS_SERVER_RUN_KRB5_AUTORECONF
 endef
 FREERADIUS_SERVER_PRE_CONFIGURE_HOOKS += FREERADIUS_SERVER_RUN_KRB5_AUTORECONF
 
+# We're patching src/modules/rlm_python3/configure.ac
+define FREERADIUS_SERVER_RUN_PYTHON3_AUTORECONF
+	cd $(@D)/src/modules/rlm_python3; $(AUTORECONF) -I$(@D)/m4
+endef
+FREERADIUS_SERVER_PRE_CONFIGURE_HOOKS += FREERADIUS_SERVER_RUN_PYTHON3_AUTORECONF
+
 # some compiler checks are not supported while cross compiling.
 # instead of removing those checks, we cache the answers
 FREERADIUS_SERVER_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
