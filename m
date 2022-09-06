Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8D7C38145
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 20:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A157F610D9;
	Tue,  6 Sep 2022 20:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A157F610D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aTcgNJRdehAo; Tue,  6 Sep 2022 20:01:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CD4260BC4;
	Tue,  6 Sep 2022 20:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CD4260BC4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B55F11BF57C
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 20:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90FB460BC4
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 20:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90FB460BC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pjF_MVCU8mfm for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 20:01:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB2DC60BAF
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 20:01:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB2DC60BAF
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D3C57821E6; Tue,  6 Sep 2022 19:46:00 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 6 Sep 2022 21:58:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4124d47b0b517c13d55e3ec738070f3cd24d1ac8
X-Git-Newrev: 485aa2d6914c0ddb91d832c349c29e2037aa2a34
X-Patchwork-Hint: ignore
Message-Id: <20220906194600.D3C57821E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: add mxs-bootlets
 custom handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=485aa2d6914c0ddb91d832c349c29e2037aa2a34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add custom cases to make sure that a random configuration with an empty
git or tarball location for mxs-bootlets doesn't fail. It reverts to
BR2_TARGET_MXS_BOOTLETS_FREESCALE in that case.

Fixes:
 - http://autobuild.buildroot.org/results/dcbeb73d152c79c18b1fa3bef3b4fa07635d7b36
 - http://autobuild.buildroot.org/results/f61cf3fc58db9ded5ec42ebf4a9847584700698d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 utils/genrandconfig | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 54146a99de..7fd17239c5 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -543,6 +543,20 @@ def fixup_config(sysinfo, configfile):
         if 'BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT=y\n' in configlines:
             return False
 
+    if 'BR2_TARGET_MXS_BOOTLETS=y\n' in configlines and \
+       'BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT=y\n' in configlines and \
+       'BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT_URL=""\n' in configlines:
+        configlines.remove('BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT=y\n')
+        configlines.append('BR2_TARGET_MXS_BOOTLETS_FREESCALE=y\n')
+        configlines.remove('BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT_URL=""\n')
+
+    if 'BR2_TARGET_MXS_BOOTLETS=y\n' in configlines and \
+       'BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL=y\n' in configlines and \
+       'BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL_URL=""\n' in configlines:
+        configlines.remove('BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL=y\n')
+        configlines.append('BR2_TARGET_MXS_BOOTLETS_FREESCALE=y\n')
+        configlines.remove('BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL_URL=""\n')
+
     if 'BR2_TARGET_OPENSBI=y\n' in configlines and \
        'BR2_TARGET_OPENSBI_CUSTOM_GIT=y\n' in configlines and \
        'BR2_TARGET_OPENSBI_CUSTOM_REPO_URL=""\n' in configlines:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
