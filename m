Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436ACC001DE
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 19:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C87EB4218F;
	Fri, 28 Jul 2023 19:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C87EB4218F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6xulCgkbdokG; Fri, 28 Jul 2023 19:47:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AACDC42095;
	Fri, 28 Jul 2023 19:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AACDC42095
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 183F81BF312
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5D4860B8E
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:46:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5D4860B8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tEpN-2OXR2xN for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 19:46:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28E7060AE4
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 19:46:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28E7060AE4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16187838CA; Fri, 28 Jul 2023 19:46:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 21:46:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 327b6000416919db034a645800bb700e2736addd
X-Git-Newrev: 3d4b54bb62d210327c7b5dfe5040590fb2657ae6
X-Patchwork-Hint: ignore
Message-Id: <20230728194657.16187838CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gupnp: fix build with meson 1.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3d4b54bb62d210327c7b5dfe5040590fb2657ae6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/10f/10f30e804b3b497d603afa93bdd2b02fc66646f4/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...uild-properly-spell-provide-in-wrap-files.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/gupnp/0002-build-properly-spell-provide-in-wrap-files.patch b/package/gupnp/0002-build-properly-spell-provide-in-wrap-files.patch
new file mode 100644
index 0000000000..0632469a98
--- /dev/null
+++ b/package/gupnp/0002-build-properly-spell-provide-in-wrap-files.patch
@@ -0,0 +1,30 @@
+From 884639bd29323cbb8fbd36bc69d08097a2ae2cd1 Mon Sep 17 00:00:00 2001
+From: Jan Beich <jbeich@FreeBSD.org>
+Date: Sun, 9 Jul 2023 03:30:47 +0000
+Subject: [PATCH] build: properly spell [provide] in *.wrap files
+
+meson.build:1:0: ERROR: Unexpected "[provides]" section, did you mean "[provide]"?
+
+Upstream: https://gitlab.gnome.org/GNOME/gupnp/-/commit/884639bd29323cbb8fbd36bc69d08097a2ae2cd1
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Bernd: backported to branch gupnp-1.4]
+---
+ subprojects/gssdp-1.6.wrap | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/subprojects/gssdp-1.6.wrap b/subprojects/gssdp-1.6.wrap
+index b0b6504..8adc1a2 100644
+--- a/subprojects/gssdp-1.2.wrap
++++ b/subprojects/gssdp-1.2.wrap
+@@ -3,6 +3,6 @@ url = https://gitlab.gnome.org/GNOME/gssdp.git
+ revision = gssdp-1.4
+ depth = 1
+  
+-[provides]
++[provide]
+ dependency_name = gssdp-1.2
+ 
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
