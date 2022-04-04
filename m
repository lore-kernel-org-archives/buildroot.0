Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DD1C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 18:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64BB181882;
	Mon,  4 Apr 2022 18:04:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id be4hV1LT3fgz; Mon,  4 Apr 2022 18:04:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7402081291;
	Mon,  4 Apr 2022 18:04:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B1171BF35C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69C268293F
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:03:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 83-j_v5M1E-c for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 18:03:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2A91828B3
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 18:03:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 62E508124D; Mon,  4 Apr 2022 17:53:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 19:51:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e4b62f63084907b5dd6079b2c5360016a4eb6d3c
X-Git-Newrev: e3b8d098e4809f4cf20d88cce3d00479da25bfa6
X-Patchwork-Hint: ignore
Message-Id: <20220404175353.62E508124D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgresql: fix pkg-config without
 openssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=e3b8d098e4809f4cf20d88cce3d00479da25bfa6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with libdbi-drivers raised since bump to
version 14.1 in commit c9bd02911565819789120370178e82da5dfbacc0 and
https://git.postgresql.org/gitweb/?p=postgresql.git;a=commit;h=beff361bc1edc24ee5f8b2073a1e5e4c92ea66eb:

configure: error: Package requirements (libpq) were not met:

Package 'libssl', required by 'libpq', not found
Package 'libcrypto', required by 'libpq', not found

Fixes:
 - http://autobuild.buildroot.org/results/415cb61a58b928a42623ed90b0b60c59032f0a4e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...0001-libpq-Fix-pkg-config-without-OpenSSL.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/postgresql/0001-libpq-Fix-pkg-config-without-OpenSSL.patch b/package/postgresql/0001-libpq-Fix-pkg-config-without-OpenSSL.patch
new file mode 100644
index 0000000000..90b0577a20
--- /dev/null
+++ b/package/postgresql/0001-libpq-Fix-pkg-config-without-OpenSSL.patch
@@ -0,0 +1,34 @@
+From 465ab24296c27502c81c8c197725cba728b9b057 Mon Sep 17 00:00:00 2001
+From: Peter Eisentraut <peter@eisentraut.org>
+Date: Fri, 1 Apr 2022 17:12:56 +0200
+Subject: [PATCH] libpq: Fix pkg-config without OpenSSL
+
+Do not add OpenSSL dependencies to libpq pkg-config file if OpenSSL is
+not enabled.  Oversight in beff361bc1edc24ee5f8b2073a1e5e4c92ea66eb.
+
+Author: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Discussion: https://www.postgresql.org/message-id/flat/20220331163759.32665-1-fontaine.fabrice%40gmail.com
+[Retrieved from:
+https://git.postgresql.org/gitweb/?p=postgresql.git;a=commit;h=465ab24296c27502c81c8c197725cba728b9b057]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/interfaces/libpq/Makefile | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/interfaces/libpq/Makefile b/src/interfaces/libpq/Makefile
+index 89bf5e0126..b5fd72a4ac 100644
+--- a/src/interfaces/libpq/Makefile
++++ b/src/interfaces/libpq/Makefile
+@@ -95,7 +95,9 @@ SHLIB_PREREQS = submake-libpgport
+ 
+ SHLIB_EXPORTS = exports.txt
+ 
++ifeq ($(with_ssl),openssl)
+ PKG_CONFIG_REQUIRES_PRIVATE = libssl libcrypto
++endif
+ 
+ all: all-lib libpq-refs-stamp
+ 
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
