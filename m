Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29EAC433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 18:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5425E40122;
	Tue, 12 Apr 2022 18:33:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mgq8lMEqwbSN; Tue, 12 Apr 2022 18:33:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F01DE41757;
	Tue, 12 Apr 2022 18:32:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D4A601BF95D
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2F3D82CCA
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:32:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BNwF24QFjmGy for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 18:32:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23C9083F68
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 18:32:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7613F83AFC; Tue, 12 Apr 2022 18:23:11 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 12 Apr 2022 20:16:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1fe5029122c8d6aba0194d6b9b0ddcd1fde2ee8d
X-Git-Newrev: 9e9d9b22797de25e5f6e1249a46258544ae6279f
X-Patchwork-Hint: ignore
Message-Id: <20220412182311.7613F83AFC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lsof: drop first and third patches
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

commit: https://git.buildroot.net/buildroot/commit/?id=9e9d9b22797de25e5f6e1249a46258544ae6279f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set LSOF_AR and LSOF_CC to be able to drop first patch which is not
upstreamable: https://github.com/lsof-org/lsof/issues/197

$(TARGET_CONFIGURE_OPTS) must also be removed to avoid overriding AR
and so we can drop LSOF_CFLAGS_OVERRIDE=1 and third patch

DEBUG="$(TARGET_CFLAGS)" can also be dropped from LSOF_BUILD_CMDS as it
is already set in LSOF_CONFIGURE_CMDS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Arnout: add quotes around TARGET_CC]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lsof/0001-makefile.patch                           | 14 --------------
 ...gacy-funcs.patch => 0001-remove-susvlegacy-funcs.patch} |  0
 package/lsof/0003-override-cflags.patch                    | 13 -------------
 package/lsof/lsof.mk                                       |  5 +++--
 4 files changed, 3 insertions(+), 29 deletions(-)

diff --git a/package/lsof/0001-makefile.patch b/package/lsof/0001-makefile.patch
deleted file mode 100644
index 65b1b2e2a7..0000000000
--- a/package/lsof/0001-makefile.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-diff -ru lsof_4.81.orig/lsof_4.81_src/lib/Makefile.skel lsof_4.81/lsof_4.81_src/lib/Makefile.skel
---- a/lib/Makefile.skel	2001-02-13 03:12:22.000000000 +0100
-+++ b/lib/Makefile.skel	2006-11-29 13:51:44.000000000 +0100
-@@ -21,8 +21,8 @@
- all:	${LIB}
- 
- ${LIB}:	${OBJ}
--	${AR}
--	${RANLIB}
-+	${AR} cr ${LIB} ${OBJ}
-+	${RANLIB} ${LIB}
- 
- clean:	FRC
- 	rm -f ${LIB} ${OBJ} errs Makefile.bak a.out core
diff --git a/package/lsof/0002-remove-susvlegacy-funcs.patch b/package/lsof/0001-remove-susvlegacy-funcs.patch
similarity index 100%
rename from package/lsof/0002-remove-susvlegacy-funcs.patch
rename to package/lsof/0001-remove-susvlegacy-funcs.patch
diff --git a/package/lsof/0003-override-cflags.patch b/package/lsof/0003-override-cflags.patch
deleted file mode 100644
index 135e599ac9..0000000000
--- a/package/lsof/0003-override-cflags.patch
+++ /dev/null
@@ -1,13 +0,0 @@
---- lsof_4.84/Configure	2008-10-21 18:21:45.000000000 +0200
-+++ lsof_4.84/Configure	2010-11-03 14:00:00.000000000 +0100
-@@ -5206,6 +5206,10 @@
-   cp $LSOF_MKFC ${LSOF_LIB}/$LSOF_LIBMKF
- fi	# }
- cat ./dialects/$LSOF_DIALECT_DIR/$LSOF_REST >> $LSOF_MKFC
-+if test "X$LSOF_CFLAGS_OVERRIDE" != "X"	# {
-+then
-+  sed -i -e 's/^CFLAGS=/override CFLAGS=/' $LSOF_MKFC
-+fi	# }
- if test "X$LSOF_LIB_NO" = "X"	# {
- then
- 
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index ff09d64345..feb6a744e0 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -33,7 +33,8 @@ endif
 define LSOF_CONFIGURE_CMDS
 	(cd $(@D) ; \
 		echo n | $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS)" \
-		LSOF_INCLUDE="$(STAGING_DIR)/usr/include" LSOF_CFLAGS_OVERRIDE=1 \
+		LSOF_AR="$(TARGET_AR) cr" LSOF_CC="$(TARGET_CC)" \
+		LSOF_INCLUDE="$(STAGING_DIR)/usr/include" \
 		LINUX_CLIB=-DGLIBCV=2 LSOF_CFGL="$(TARGET_LDFLAGS)" \
 		./Configure linux)
 	$(LSOF_CONFIGURE_WCHAR_FIXUPS)
@@ -41,7 +42,7 @@ define LSOF_CONFIGURE_CMDS
 endef
 
 define LSOF_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS)" -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define LSOF_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
