Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE89C52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 09:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 802FA40654;
	Wed,  7 Aug 2024 09:24:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s5s35VXZbyVN; Wed,  7 Aug 2024 09:24:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8E7A40647
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8E7A40647;
	Wed,  7 Aug 2024 09:24:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 00B1C1BF982
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 09:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF9F9404F8
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 09:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1kIldivImUqg for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 09:24:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D984840A7F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D984840A7F
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 09:24:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6AA8843E7; Wed,  7 Aug 2024 09:24:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Aug 2024 10:57:41 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 40b20e5feb582f3c330f3713c4803f5af5e58ffa
X-Git-Newrev: 35381a360a244cee266c17873678097a65a48dd2
X-Patchwork-Hint: ignore
Message-Id: <20240807092425.C6AA8843E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libarchive: add
 bsdunzip option
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

commit: https://git.buildroot.net/buildroot/commit/?id=35381a360a244cee266c17873678097a65a48dd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Add bsdunzip option to avoid the following build failure raised since
bump to version 3.7.1 in commit 7991d2c48a859f9c0333ade8192868c21b1a8a31 and
https://github.com/libarchive/libarchive/commit/c157e4ce8eb170a92945cc2d292fd7106bdfcce1:

  CCLD     bsdunzip
/home/autobuild/autobuild/instance-4/output-1/host/lib/gcc/powerpc-buildroot-linux-musl/12.3.0/../../../../powerpc-buildroot-linux-musl/bin/ld: cannot find -lz: No such file or directory

By handling it explicitly, we can specify whether the dynamic or static
library should be used, according to what we actually have available.

Fixes:
 - http://autobuild.buildroot.org/results/aaf7fdefa0b7bd7e5ac743487c197544c1a2ce6f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit bbc08b15ae60c3008fb8cbff59dc329d8357c563)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libarchive/Config.in     |  6 ++++++
 package/libarchive/libarchive.mk | 10 ++++++++++
 2 files changed, 16 insertions(+)

diff --git a/package/libarchive/Config.in b/package/libarchive/Config.in
index ffa4cff7b3..2c8d813ccb 100644
--- a/package/libarchive/Config.in
+++ b/package/libarchive/Config.in
@@ -30,4 +30,10 @@ config BR2_PACKAGE_LIBARCHIVE_BSDCAT
 	  The 'bsdcat' program is a simple replacement tool
 	  for zcat, bzcat, xzcat, and such.
 
+config BR2_PACKAGE_LIBARCHIVE_BSDUNZIP
+	bool "bsdunzip"
+	help
+	  The 'bsdunzip' program is a simple replacement tool
+	  for Info-ZIP.
+
 endif
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 1a50b0472d..7d58b5c69f 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -46,6 +46,16 @@ else
 LIBARCHIVE_CONF_OPTS += --disable-bsdcat
 endif
 
+ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDUNZIP),y)
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBARCHIVE_CONF_OPTS += --enable-bsdunzip=static
+else
+LIBARCHIVE_CONF_OPTS += --enable-bsdunzip=shared
+endif
+else
+LIBARCHIVE_CONF_OPTS += --disable-bsdunzip
+endif
+
 ifeq ($(BR2_PACKAGE_ACL),y)
 LIBARCHIVE_DEPENDENCIES += acl
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
