Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E613C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 20:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA92060AB8;
	Mon,  8 Aug 2022 20:49:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA92060AB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PIndBGvfd8F9; Mon,  8 Aug 2022 20:49:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00B71607E3;
	Mon,  8 Aug 2022 20:49:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00B71607E3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 89E3E1BF283
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62864408BA
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62864408BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O6td8jcwquy9 for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 20:48:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 224B140571
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 20:48:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 224B140571
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D937083840; Mon,  8 Aug 2022 20:34:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Aug 2022 22:48:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 309e75c3101f99262c49b918fe76fd922232062b
X-Git-Newrev: 0f3115b2ca9fbdcf7a4e02aba45104f2d423fdb8
X-Patchwork-Hint: ignore
Message-Id: <20220808203433.D937083840@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: add refpolicy custom
 git handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f3115b2ca9fbdcf7a4e02aba45104f2d423fdb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a custom case to make sure that a random configuration with an empty
git location for refpolicy doesn't fail. It reverts to
BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION in that case.

Fixes:
 - http://autobuild.buildroot.org/results/98da07a1f9b88e2e8a028a55c8cf76c6ebc28304

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 75757917c2..a56f03681a 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -535,6 +535,13 @@ def fixup_config(sysinfo, configfile):
         if 'BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT=y\n' in configlines:
             return False
 
+   if 'BR2_PACKAGE_REFPOLICY=y\n' in configlines and \
+       'BR2_PACKAGE_REFPOLICY_CUSTOM_GIT=y\n' in configlines and \
+       'BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL=""\n' in configlines:
+        configlines.remove('BR2_PACKAGE_REFPOLICY_CUSTOM_GIT=y\n')
+        configlines.append('BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION=y\n')
+        configlines.remove('BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL=""\n')
+
     if 'BR2_PACKAGE_XVISOR=y\n' in configlines and \
        'BR2_PACKAGE_XVISOR_USE_CUSTOM_CONFIG=y\n' in configlines and \
        'BR2_PACKAGE_XVISOR_CUSTOM_CONFIG_FILE=""\n' in configlines:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
