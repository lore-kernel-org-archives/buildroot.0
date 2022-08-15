Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3790CC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 16:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B33E460C2A;
	Mon, 15 Aug 2022 16:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B33E460C2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JnB8WWnjgYxw; Mon, 15 Aug 2022 16:46:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25B39607FE;
	Mon, 15 Aug 2022 16:46:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25B39607FE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 841D41BF41C
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 16:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F800607FE
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 16:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F800607FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JtLahYbaeVtz for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 16:46:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40DAD6068D
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 16:46:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40DAD6068D
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8CE5387649; Mon, 15 Aug 2022 16:31:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 18:45:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e4040d0d8e1d3d3b77de582b8354eca641a0613d
X-Git-Newrev: 2bf6b0630808f8d195f1b9824492a8b072f2e3e3
X-Patchwork-Hint: ignore
Message-Id: <20220815163153.8CE5387649@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: add xenomai custom
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2bf6b0630808f8d195f1b9824492a8b072f2e3e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add custom cases to make sure that a random configuration with an empty
git, tarball location or version for xenomai doesn't fail. It reverts to
BR2_PACKAGE_XENOMAI_LATEST_VERSION in these cases.

Fixes:
 - http://autobuild.buildroot.org/results/19419759b4add0197b4e629d0b2216c2a07624b2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/genrandconfig | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 4846c316bb..b8ca628724 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -542,6 +542,27 @@ def fixup_config(sysinfo, configfile):
         configlines.append('BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION=y\n')
         configlines.remove('BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL=""\n')
 
+    if 'BR2_PACKAGE_XENOMAI=y\n' in configlines and \
+       'BR2_PACKAGE_XENOMAI_CUSTOM_GIT=y\n' in configlines and \
+       'BR2_PACKAGE_XENOMAI_REPOSITORY=""\n' in configlines:
+        configlines.remove('BR2_PACKAGE_XENOMAI_CUSTOM_GIT=y\n')
+        configlines.append('BR2_PACKAGE_XENOMAI_LATEST_VERSION=y\n')
+        configlines.remove('BR2_PACKAGE_XENOMAI_REPOSITORY=""\n')
+
+    if 'BR2_PACKAGE_XENOMAI=y\n' in configlines and \
+       'BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL=y\n' in configlines and \
+       'BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL_URL=""\n' in configlines:
+        configlines.remove('BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL=y\n')
+        configlines.append('BR2_PACKAGE_XENOMAI_LATEST_VERSION=y\n')
+        configlines.remove('BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL_URL=""\n')
+
+    if 'BR2_PACKAGE_XENOMAI=y\n' in configlines and \
+       'BR2_PACKAGE_XENOMAI_CUSTOM_VERSION=y\n' in configlines and \
+       'BR2_PACKAGE_XENOMAI_CUSTOM_VERSION_VALUE=""\n' in configlines:
+        configlines.remove('BR2_PACKAGE_XENOMAI_CUSTOM_VERSION=y\n')
+        configlines.append('BR2_PACKAGE_XENOMAI_LATEST_VERSION=y\n')
+        configlines.remove('BR2_PACKAGE_XENOMAI_CUSTOM_VERSION_VALUE=""\n')
+
     if 'BR2_PACKAGE_XVISOR=y\n' in configlines and \
        'BR2_PACKAGE_XVISOR_USE_CUSTOM_CONFIG=y\n' in configlines and \
        'BR2_PACKAGE_XVISOR_CUSTOM_CONFIG_FILE=""\n' in configlines:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
