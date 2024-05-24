Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BABBC25B74
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 12:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DBF18332A;
	Fri, 24 May 2024 12:55:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QO5_NNDI8VoG; Fri, 24 May 2024 12:55:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0BDC832DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0BDC832DC;
	Fri, 24 May 2024 12:55:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1EC1F1CF9A4
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 12:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 093474082B
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 12:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EDTiqdyrbo-K for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 12:55:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E58D4055A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E58D4055A
 for <buildroot@buildroot.org>; Fri, 24 May 2024 12:55:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E6382875D6; Fri, 24 May 2024 12:55:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 24 May 2024 14:51:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7b83645b65e84a7947479706f2d82ba7cb6e053
X-Git-Newrev: 8b16603aa91080a36d27e9c7c0a63e94d98327fc
X-Patchwork-Hint: ignore
Message-Id: <20240524125522.E6382875D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lmdb: fix CFLAGS handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b16603aa91080a36d27e9c7c0a63e94d98327fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By passing TARGET_CONFIGURE_OPTS to make, the following usptream CFLAGS
are completely overridden:

CFLAGS	= $(THREADS) $(OPT) $(W) $(XCFLAGS)

As a result, setting XCFLAGS is a no-op and -pthread is not passed
resulting in the following build failure since the addition of the
package in commit eb60c4054c25129d78651a66d1e7554aff04767f:

//binhome//.buildroot.//autobuildlib//rungcc//instancepowerpc64--3buildroot/-outputlinux--1gnu//host9.3.0//opt./.ext/-.toolchain.//bin./../../.lib//powerpc64gcc-/buildrootpowerpc64--linuxbuildroot--gnulinux/-bingnu//ld9.3.0:/ .mdb.c.:/(...text/+.0x1a44.)/:. .undefined/ powerpc64reference- buildrootto `pthread_setspecific'

Fixes: eb60c4054c25129d78651a66d1e7554aff04767f
 - http://autobuild.buildroot.org/results/d67c5a99b7d58826e544f1210fa36bb3bc180739

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lmdb/lmdb.mk | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/lmdb/lmdb.mk b/package/lmdb/lmdb.mk
index 06c8f6bbb1..86d72e1abc 100644
--- a/package/lmdb/lmdb.mk
+++ b/package/lmdb/lmdb.mk
@@ -18,15 +18,21 @@ else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 LMDB_ILBIBS +=  liblmdb.a liblmdb.so
 endif
 
+LMDB_MAKE_OPTS += \
+	AR="$(TARGET_AR)" \
+	CC="$(TARGET_CC)" \
+	ILIBS="$(LMDB_ILBIBS)" \
+	LDFLAGS="$(TARGET_LDFLAGS)" \
+	OPT="" \
+	XCFLAGS="$(TARGET_CFLAGS)"
+
 define LMDB_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/libraries/liblmdb \
-		ILIBS="$(LMDB_ILBIBS)" \
-		XCFLAGS="$(TARGET_CFLAGS)"
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libraries/liblmdb $(LMDB_MAKE_OPTS)
 endef
 
 define LMDB_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libraries/liblmdb \
-		ILIBS="$(LMDB_ILBIBS)" \
+		$(LMDB_MAKE_OPTS) \
 		DESTDIR="$(STAGING_DIR)" \
 		prefix=/usr \
 		install
@@ -34,7 +40,7 @@ endef
 
 define LMDB_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libraries/liblmdb \
-		ILIBS="$(LMDB_ILBIBS)" \
+		$(LMDB_MAKE_OPTS) \
 		DESTDIR="$(TARGET_DIR)" \
 		prefix=/usr \
 		install
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
