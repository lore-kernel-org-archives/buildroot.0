Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BB1CAC5AE
	for <buildroot@archiver.kernel.org>; Wed, 24 Sep 2025 20:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2C8961028;
	Wed, 24 Sep 2025 20:52:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LyTN_h61t2kI; Wed, 24 Sep 2025 20:52:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3303661023
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3303661023;
	Wed, 24 Sep 2025 20:52:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 669D712D
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 20:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5821C61022
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 20:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s9Xya1QRbYb0 for <buildroot@buildroot.org>;
 Wed, 24 Sep 2025 20:52:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A826261023
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A826261023
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 20:52:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A1881863E7; Wed, 24 Sep 2025 20:52:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 24 Sep 2025 22:23:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f2c94578197f06bd84a9e3d70c080fa3430d3906
X-Git-Newrev: d40c1725b2010c4daf568dc8e04ffaafd47bcd2f
X-Patchwork-Hint: ignore
Message-Id: <20250924205233.A1881863E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc-bare-metal: decouple from gcc
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=d40c1725b2010c4daf568dc8e04ffaafd47bcd2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch decouples the gcc-bare-metal package from the gcc package to avoid
potential build issues when bumping the version of one package before the
other.

Such as the build issue example here:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11026775160

Since the gcc-bare-metal package does not currently require the gcc 15.2.0
downstream patches, this patch simply deletes the link for patching
gcc-bare-metal 15.2.0 with patches that are not needed for bare-metal apps.

As for the hash link, this patch creates a new file called gcc-bare-metal.hash
which has the same hashes in the gcc.hash file.  But by having its own hash
file, hashes from the gcc package can be removed when version bumping without
causing build errors for the gcc-bare-metal package.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gcc-bare-metal/15.2.0              | 1 -
 package/gcc-bare-metal/gcc-bare-metal.hash | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/gcc-bare-metal/15.2.0 b/package/gcc-bare-metal/15.2.0
deleted file mode 120000
index d3d1bbdefa..0000000000
--- a/package/gcc-bare-metal/15.2.0
+++ /dev/null
@@ -1 +0,0 @@
-../gcc/15.2.0
\ No newline at end of file
diff --git a/package/gcc-bare-metal/gcc-bare-metal.hash b/package/gcc-bare-metal/gcc-bare-metal.hash
deleted file mode 120000
index d417b0dc77..0000000000
--- a/package/gcc-bare-metal/gcc-bare-metal.hash
+++ /dev/null
@@ -1 +0,0 @@
-../gcc/gcc.hash
\ No newline at end of file
diff --git a/package/gcc-bare-metal/gcc-bare-metal.hash b/package/gcc-bare-metal/gcc-bare-metal.hash
new file mode 100644
index 0000000000..19678dec30
--- /dev/null
+++ b/package/gcc-bare-metal/gcc-bare-metal.hash
@@ -0,0 +1,8 @@
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-15.2.0/sha512.sum
+sha512  89047a2e07bd9da265b507b516ed3635adb17491c7f4f67cf090f0bd5b3fc7f2ee6e4cc4008beef7ca884b6b71dffe2bb652b21f01a702e17b468cca2d10b2de  gcc-15.2.0.tar.xz
+
+# Locally calculated
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
+sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING3.LIB
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
