Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A115C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 17:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08F5960F31;
	Sat,  4 Nov 2023 17:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08F5960F31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ANte9rXgFkv; Sat,  4 Nov 2023 17:35:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E7F160BA9;
	Sat,  4 Nov 2023 17:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E7F160BA9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B6791BF21A
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72D9F4014D
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:35:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72D9F4014D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kvhBFVair-oI for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 17:35:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63FEE400BD
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 17:35:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63FEE400BD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F3CD866A6; Sat,  4 Nov 2023 17:35:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 18:34:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 68de45491ba7d4b7aeff6f869934745440f88c00
X-Git-Newrev: 5f6e6080570d542852b416a72f04a07760808c7e
X-Patchwork-Hint: ignore
Message-Id: <20231104173502.4F3CD866A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-generic: auto-install selinux
 modules only for upstream refpolicy
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f6e6080570d542852b416a72f04a07760808c7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The description of REFPOLICY_CUSTOM_GIT states:

The custom refpolicy must define the full policy explicitly,
and must be a fork of the original refpolicy, to have the
same build system.  When this is selected, only the custom
policy definition are taken into account and all the modules
of the policy are built into the binary policy.

Currently, if a user definess their own policy, a package containing a selinux
directory would add to their custom policy, which is not what they would want.
Disable applying selinux policies in selinux/ directories for custom git
refpolicies.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 289fa552b4..943f8a08c0 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1227,8 +1227,11 @@ KEEP_PYTHON_PY_FILES += $$($(2)_KEEP_PY_FILES)
 ifneq ($$($(2)_SELINUX_MODULES),)
 PACKAGES_SELINUX_MODULES += $$($(2)_SELINUX_MODULES)
 endif
+
+ifeq ($(BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION),y)
 PACKAGES_SELINUX_EXTRA_MODULES_DIRS += \
 	$$(if $$(wildcard $$($(2)_PKGDIR)/selinux),$$($(2)_PKGDIR)/selinux)
+endif
 
 ifeq ($$($(2)_SITE_METHOD),svn)
 DL_TOOLS_DEPENDENCIES += svn
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
