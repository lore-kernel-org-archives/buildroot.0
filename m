Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78887C7EE39
	for <buildroot@archiver.kernel.org>; Sun, 29 Jun 2025 16:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC31B40A22;
	Sun, 29 Jun 2025 16:57:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ZJST-kDnIGY; Sun, 29 Jun 2025 16:57:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1FB440A0D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1FB440A0D;
	Sun, 29 Jun 2025 16:56:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ED4C71C5
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 16:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF44460A79
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 16:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nbryq1GZaWG3 for <buildroot@buildroot.org>;
 Sun, 29 Jun 2025 16:56:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B35E60A4D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B35E60A4D
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 16:56:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BBC884BCD; Sun, 29 Jun 2025 16:56:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 29 Jun 2025 15:57:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4686ab975b97ddd534ef195c87081b930271d616
X-Git-Newrev: ed75eaa6ee8f05ef9bdd77b0628e282f4c8b1615
X-Patchwork-Hint: ignore
Message-Id: <20250629165657.1BBC884BCD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/skopeo: use
 containers-image-config files
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ed75eaa6ee8f05ef9bdd77b0628e282f4c8b1615
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... and extend the skopeo runtime test to make use of those.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/skopeo/Config.in                     |  1 +
 support/testing/tests/package/test_skopeo.py | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/package/skopeo/Config.in b/package/skopeo/Config.in
index f1acc3a50f..0de9b16047 100644
--- a/package/skopeo/Config.in
+++ b/package/skopeo/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_SKOPEO
 	depends on !BR2_STATIC_LIBS  # lvm2
 	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_BTRFS_PROGS
+	select BR2_PACKAGE_CONTAINERS_IMAGE_CONFIG  # runtime
 	select BR2_PACKAGE_LIBGPGME
 	select BR2_PACKAGE_LVM2
 	help
diff --git a/support/testing/tests/package/test_skopeo.py b/support/testing/tests/package/test_skopeo.py
index 79c3da8b3d..99ba978de2 100644
--- a/support/testing/tests/package/test_skopeo.py
+++ b/support/testing/tests/package/test_skopeo.py
@@ -32,6 +32,20 @@ class TestSkopeo(infra.basetest.BRTest):
         bb_info = json.loads("".join(output))
         self.assertEqual(bb_info["Name"], "docker.io/library/busybox")
 
+        # Then check we can retrieve the image from the default registry
+        # Copy all archs in the image to check we can enumerate those (inspect
+        # does not enumerate all archs)
+        self.assertRunOk(
+            "skopeo copy -a docker://busybox:latest oci-archive:busybox-latest.oci",
+            timeout=120,
+        )
+
+        # Check we can inspect a local OCI archive
+        self.assertRunOk(
+            "skopeo inspect oci-archive:busybox-latest.oci",
+            timeout=30,
+        )
+
         # Now, check we can reach an arbitrary registry: quay.io
         output, _ = self.emulator.run(
             "skopeo inspect docker://quay.io/quay/busybox:latest",
@@ -39,3 +53,9 @@ class TestSkopeo(infra.basetest.BRTest):
         )
         skopeo_info = json.loads("".join(output))
         self.assertEqual(skopeo_info["Name"], "quay.io/quay/busybox")
+
+        # Finally check we can retrieve the image from an arbitrary registry
+        self.assertRunOk(
+            "skopeo copy docker://quay.io/quay/busybox:latest oci-archive:busybox-quay.io-latest.oci",
+            timeout=120,
+        )
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
