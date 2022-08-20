Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B32C25B08
	for <buildroot@archiver.kernel.org>; Sat, 20 Aug 2022 09:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D27A560E56;
	Sat, 20 Aug 2022 09:32:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D27A560E56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OENVtzykL5Oz; Sat, 20 Aug 2022 09:32:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AA4160E3A;
	Sat, 20 Aug 2022 09:32:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AA4160E3A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 826241BF2C5
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 09:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DE6B60E51
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 09:32:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DE6B60E51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HTvkx-VnjP72 for <buildroot@lists.busybox.net>;
 Sat, 20 Aug 2022 09:32:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F106660D88
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 09:32:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F106660D88
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8E94387038; Sat, 20 Aug 2022 09:17:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Aug 2022 11:31:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b826fba77c71ecf1d61062857e080aa15ef239d6
X-Git-Newrev: 2d3d130bc129cc36b88ff82c4a87e53a77874a50
X-Patchwork-Hint: ignore
Message-Id: <20220820091742.8E94387038@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: add opensbi custom
 handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d3d130bc129cc36b88ff82c4a87e53a77874a50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add custom cases to make sure that a random configuration with an empty
git, tarball location or version for opensbi doesn't fail. It reverts to
BR2_TARGET_OPENSBI_LATEST_VERSION in that case.

Fixes:
 - http://autobuild.buildroot.org/results/b31882b1a7119b2b590cc6dfed44fe515a63a6b8
 - http://autobuild.buildroot.org/results/61866e8941741c9746dcb2c60b6db3b0e5b9a47b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index b8ca628724..c6b3123feb 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -535,6 +535,27 @@ def fixup_config(sysinfo, configfile):
         if 'BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT=y\n' in configlines:
             return False
 
+    if 'BR2_TARGET_OPENSBI=y\n' in configlines and \
+       'BR2_TARGET_OPENSBI_CUSTOM_GIT=y\n' in configlines and \
+       'BR2_TARGET_OPENSBI_CUSTOM_REPO_URL=""\n' in configlines:
+        configlines.remove('BR2_TARGET_OPENSBI_CUSTOM_GIT=y\n')
+        configlines.append('BR2_TARGET_OPENSBI_LATEST_VERSION=y\n')
+        configlines.remove('BR2_TARGET_OPENSBI_CUSTOM_REPO_URL=""\n')
+
+    if 'BR2_TARGET_OPENSBI=y\n' in configlines and \
+       'BR2_TARGET_OPENSBI_CUSTOM_TARBALL=y\n' in configlines and \
+       'BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION=""\n' in configlines:
+        configlines.remove('BR2_TARGET_OPENSBI_CUSTOM_TARBALL=y\n')
+        configlines.append('BR2_TARGET_OPENSBI_LATEST_VERSION=y\n')
+        configlines.remove('BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION=""\n')
+
+    if 'BR2_TARGET_OPENSBI=y\n' in configlines and \
+       'BR2_TARGET_OPENSBI_CUSTOM_VERSION=y\n' in configlines and \
+       'BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE=""\n' in configlines:
+        configlines.remove('BR2_TARGET_OPENSBI_CUSTOM_VERSION=y\n')
+        configlines.append('BR2_TARGET_OPENSBI_LATEST_VERSION=y\n')
+        configlines.remove('BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE=""\n')
+
     if 'BR2_PACKAGE_REFPOLICY=y\n' in configlines and \
        'BR2_PACKAGE_REFPOLICY_CUSTOM_GIT=y\n' in configlines and \
        'BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL=""\n' in configlines:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
