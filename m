Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6B5C67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 20:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F8094117C;
	Mon,  8 Apr 2024 20:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 88lGn7rpvtHC; Mon,  8 Apr 2024 20:58:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53068408C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53068408C5;
	Mon,  8 Apr 2024 20:58:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 265751BF2A7
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 20:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1335F81094
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 20:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HtaxQS_TR3Vy for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 20:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E07180FB9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E07180FB9
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 20:58:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2955285C8E; Mon,  8 Apr 2024 20:58:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Apr 2024 22:54:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1a40adf355c1d03d643d7781d68009e7f67a60a2
X-Git-Newrev: 8c456a564643c49915a8c9ab5a9f0583d3a64ad9
X-Patchwork-Hint: ignore
Message-Id: <20240408205850.2955285C8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnpth: fix musl build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8c456a564643c49915a8c9ab5a9f0583d3a64ad9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following musl build failure raised since bump to version 1.7 in
commit 3ef4d24192b20bd1eb5e34c9fa2a6aa5bde91f91 and
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=npth.git;a=commit;h=575573b5b63e147b1906240f192dbe37a26ca4b9:

npth.c:392:21: error: unknown type name 'npth_rwlock_t'; did you mean 'npth_cond_t'?
  392 | npth_rwlock_rdlock (npth_rwlock_t *rwlock)
      |                     ^~~~~~~~~~~~~
      |                     npth_cond_t

Fixes: 3ef4d24192b20bd1eb5e34c9fa2a6aa5bde91f91
 - http://autobuild.buildroot.org/results/d986ba27b734679fd70b4e0f23278ebd38e13c5d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...SERT_EXPOSE_RWLOCK_API-for-musl-C-library.patch | 37 ++++++++++++++++++++++
 package/libnpth/libnpth.mk                         |  2 ++
 2 files changed, 39 insertions(+)

diff --git a/package/libnpth/0001-Fix-INSERT_EXPOSE_RWLOCK_API-for-musl-C-library.patch b/package/libnpth/0001-Fix-INSERT_EXPOSE_RWLOCK_API-for-musl-C-library.patch
new file mode 100644
index 0000000000..bc5ed70a9c
--- /dev/null
+++ b/package/libnpth/0001-Fix-INSERT_EXPOSE_RWLOCK_API-for-musl-C-library.patch
@@ -0,0 +1,37 @@
+From 417abd56fd7bf45cd4948414050615cb1ad59134 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Fri, 1 Mar 2024 13:53:52 +0900
+Subject: [PATCH] Fix INSERT_EXPOSE_RWLOCK_API for musl C library.
+
+* configure.ac: Add a case for musl system.
+
+--
+
+GnuPG-bug-id: 5664
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+
+Upstream: https://git.gnupg.org/cgi-bin/gitweb.cgi?p=npth.git;a=commit;h=417abd56fd7bf45cd4948414050615cb1ad59134
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c1091b1..576a26e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -381,7 +381,10 @@ fi
+ AC_SUBST(INSERT_NO_RWLOCK)
+ 
+ case "${host}" in
+-    *-*-linux*|*-*-gnu*)
++    *-*-linux-musl*)
++        INSERT_EXPOSE_RWLOCK_API="1"
++        ;;
++    *-*-linux-gnu*|*-*-gnu*)
+         INSERT_EXPOSE_RWLOCK_API="defined(__USE_UNIX98) || defined(__USE_XOPEN2K)"
+         ;;
+     *)
+-- 
+2.30.2
+
diff --git a/package/libnpth/libnpth.mk b/package/libnpth/libnpth.mk
index dc603b607f..46c8154021 100644
--- a/package/libnpth/libnpth.mk
+++ b/package/libnpth/libnpth.mk
@@ -10,5 +10,7 @@ LIBNPTH_SITE = https://www.gnupg.org/ftp/gcrypt/npth
 LIBNPTH_LICENSE = LGPL-2.0+
 LIBNPTH_LICENSE_FILES = COPYING.LIB
 LIBNPTH_INSTALL_STAGING = YES
+# 0001-Fix-INSERT_EXPOSE_RWLOCK_API-for-musl-C-library.patch
+LIBNPTH_AUTORECONF = YES
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
