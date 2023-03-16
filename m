Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E959C6FD1F
	for <buildroot@archiver.kernel.org>; Thu, 16 Mar 2023 21:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14C1841B45;
	Thu, 16 Mar 2023 21:36:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14C1841B45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SI2laz7464z8; Thu, 16 Mar 2023 21:36:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE08A41B42;
	Thu, 16 Mar 2023 21:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE08A41B42
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 09E2D1BF31B
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 21:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E53C4610AD
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 21:35:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E53C4610AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TgS9UPsS8TgX for <buildroot@lists.busybox.net>;
 Thu, 16 Mar 2023 21:35:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE11860AFB
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 21:35:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE11860AFB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ACAAF8747F; Thu, 16 Mar 2023 21:35:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 16 Mar 2023 22:32:26 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 68ed22329bc91b406afc6c6f2ad294be399be049
X-Git-Newrev: 2d73e7652304897e948b7e25c2d44247fc98cc5d
X-Patchwork-Hint: ignore
Message-Id: <20230316213546.ACAAF8747F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/audit: force arm
 mode instead of Thumb mode
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d73e7652304897e948b7e25c2d44247fc98cc5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Fix the following build failure:

/tmp/ccY5gl3z.s:2145: Error: selected processor does not support `mcr p15,0,r2,c7,c10,5' in Thumb mode

Fixes:
 - http://autobuild.buildroot.org/results/9d18a0d360b2e2f9e87c55daedda62d6ce198bb9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 53d70dbe40232a7539559f1a4f807b8022737ed8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/audit/audit.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index aa8ef515e6..77e7c24000 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -15,6 +15,13 @@ AUDIT_INSTALL_STAGING = YES
 
 AUDIT_CONF_OPTS = --without-python --without-python3 --disable-zos-remote
 
+# src/libev has some assembly function that is not present in Thumb mode:
+# Error: selected processor does not support `mcr p15,0,r3,c7,c10,5' in Thumb mode
+# so, we desactivate Thumb mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+AUDIT_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
 AUDIT_DEPENDENCIES += libcap-ng
 AUDIT_CONF_OPTS += --with-libcap-ng=yes
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
