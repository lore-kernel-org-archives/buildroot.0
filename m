Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27BBCA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 21:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD38C847DC;
	Thu, 21 Aug 2025 21:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7-tfXei4eg8P; Thu, 21 Aug 2025 21:21:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDC7A847D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDC7A847D7;
	Thu, 21 Aug 2025 21:21:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F06E91C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 21:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1E07847D7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 21:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Uu9O2PEH8r9 for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 21:21:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FE80847D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FE80847D1
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 21:21:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2ACD887A2D; Thu, 21 Aug 2025 21:21:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 23:20:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a80b13fc633dc593e1015de4ab4a8e6822185e15
X-Git-Newrev: a5da7ee5a8f972a7f08616b521f51c83132140d2
X-Patchwork-Hint: ignore
Message-Id: <20250821212130.2ACD887A2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libjwt: require openssl
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a5da7ee5a8f972a7f08616b521f51c83132140d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ever since upstream commit 01dd6da ("Rework the entire API"), first
introduced as part of release v3.0.0, openssl is a hard requirement for
building libjwt. As such, "-DWITH_OPENSSL=ON" also has become a no-op.

In Buildroot, this has been masked somewhat by the implicit select when
gnutls is disabled, but a failure can be reproduced using test-pkg with
a config like:

BR2_PACKAGE_GNUTLS=y
BR2_PACKAGE_LIBJWT=y

Fix this by requiring openssl. Furthermore, building against libressl
does not work because libjwt requires API surface that is not present
there[1], so we need to force libopenssl.

[1] https://autobuild.buildroot.org/results/463/4638a7d46c149ca0f46d3fe5f5f90dc5ee9d1e03

Signed-off-by: Florian Larysch <fl@n621.de>
[Peter: drop gnutls logic support for simplicity]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libjwt/Config.in |  3 ++-
 package/libjwt/libjwt.mk | 12 ++----------
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/package/libjwt/Config.in b/package/libjwt/Config.in
index 39d1665e0e..47eb0882a3 100644
--- a/package/libjwt/Config.in
+++ b/package/libjwt/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBJWT
 	bool "libjwt"
-	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	select BR2_PACKAGE_JANSSON
 	help
 	  JSON Web Tokens are an open, industry standard RFC 7519
diff --git a/package/libjwt/libjwt.mk b/package/libjwt/libjwt.mk
index 29ca9cebf4..d20067de24 100644
--- a/package/libjwt/libjwt.mk
+++ b/package/libjwt/libjwt.mk
@@ -7,21 +7,13 @@
 LIBJWT_VERSION = 3.2.0
 LIBJWT_SITE = https://github.com/benmcollins/libjwt/releases/download/v$(LIBJWT_VERSION)
 LIBJWT_SOURCE = libjwt-$(LIBJWT_VERSION).tar.xz
-LIBJWT_DEPENDENCIES = host-pkgconf jansson
+LIBJWT_DEPENDENCIES = host-pkgconf jansson openssl
 LIBJWT_INSTALL_STAGING = YES
 LIBJWT_LICENSE = MPL-2.0
 LIBJWT_LICENSE_FILES = LICENSE
 LIBJWT_CPE_ID_VENDOR = bencollins
 LIBJWT_CPE_ID_PRODUCT = jwt_c_library
 
-LIBJWT_CONF_OPTS += -DWITH_TESTS=OFF
-
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LIBJWT_CONF_OPTS += -DWITH_OPENSSL=ON
-LIBJWT_DEPENDENCIES += openssl
-else
-LIBJWT_CONF_OPTS += -DWITH_GNUTLS=ON
-LIBJWT_DEPENDENCIES += gnutls
-endif
+LIBJWT_CONF_OPTS += -DWITH_TESTS=OFF -DWITH_GNUTLS=OFF
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
