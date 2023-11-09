Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48730C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 09:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03CB882258;
	Thu,  9 Nov 2023 09:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03CB882258
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bQFb1YbVsxjo; Thu,  9 Nov 2023 09:51:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C58B821B5;
	Thu,  9 Nov 2023 09:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C58B821B5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 714151BF40E
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 09:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BD196124B
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 09:50:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BD196124B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hdq45xAt0cmQ for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 09:50:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F3B3612BB
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 09:50:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F3B3612BB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D53686DCF; Thu,  9 Nov 2023 09:50:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Nov 2023 10:47:11 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 026baf3f25aa5a91ffa7bd36e3688a180ddbdc63
X-Git-Newrev: a1aead6bfee262420582c218d6a8c4c5aa4a8c60
X-Patchwork-Hint: ignore
Message-Id: <20231109095053.3D53686DCF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/pkg-generic:
 auto-install selinux modules only for upstream refpolicy
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1aead6bfee262420582c218d6a8c4c5aa4a8c60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
(cherry picked from commit 5f6e6080570d542852b416a72f04a07760808c7e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index e7f9b0f7fd..34e96c2d1c 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1220,8 +1220,11 @@ KEEP_PYTHON_PY_FILES += $$($(2)_KEEP_PY_FILES)
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
