Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0E8E8FDD5
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 11:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90CDF4068F;
	Sat, 27 Dec 2025 11:08:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KOVgDVzd_6Ao; Sat, 27 Dec 2025 11:08:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF32140631
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766833736;
	bh=JC1vDuftGoIRHfFytRPUQMsM0zZpM6/PKlRrI66/ppA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q9D5Ab1xjgvfUZhTvP+EYd30/KXH5bdmpO7veUBYfuY+yn+RFQWsrJ/DBWdhiNDOM
	 hm37jWFdx+7Iu8jlRn6r722nqfH/b9+J341GYt9Y8JDtOOfipqN/yRYfuq59vFajdx
	 6hPrsrUJ85GjoWKwUu0EwPcJ3/ezvd51HLBZkAu/qvIZUsCy+Iq3xP8W4d0spYP2HR
	 FNXfxOoJ8Ev37ECJq/0CN4z7k6gnDXnxbBU4HKjjvcSRmZ+r2N7IC1zPPB2PEuvjeQ
	 35Fj06+OK+DAVCaPJ6oXIirO6xuV4YUROsgl4n/MtQAcCKlVHrjYSedBSiB/mbsHZJ
	 KzsFm5juxuFtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF32140631;
	Sat, 27 Dec 2025 11:08:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 005AF119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAE6860663
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B71Jba61_4Cm for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 11:08:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F4E86060A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F4E86060A
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:08:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 26A2387687; Sat, 27 Dec 2025 11:08:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 12:00:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 070ba987b1dc43be934bb486d23c92d6a8979298
X-Git-Newrev: b0c4b595e0f8cd7415d1c65facd09bf446140f0e
X-Patchwork-Hint: ignore
Message-Id: <20251227110854.26A2387687@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/musepack: fix build with CMake 4
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

commit: https://git.buildroot.net/buildroot/commit/?id=b0c4b595e0f8cd7415d1c65facd09bf446140f0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No autobuilder issues, as this problem was hidden by the libcuefile
CMake 4 build issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...eLists.txt-fix-compatibility-with-CMake-4.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/musepack/0007-CMakeLists.txt-fix-compatibility-with-CMake-4.patch b/package/musepack/0007-CMakeLists.txt-fix-compatibility-with-CMake-4.patch
new file mode 100644
index 0000000000..ed8988a337
--- /dev/null
+++ b/package/musepack/0007-CMakeLists.txt-fix-compatibility-with-CMake-4.patch
@@ -0,0 +1,35 @@
+From 72267961bc3dafecdd6ce1d5bbdffaa6f7120004 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 16 Dec 2025 10:32:58 +0100
+Subject: [PATCH] CMakeLists.txt: fix compatibility with CMake 4
+
+Fixes:
+
+CMake Error at CMakeLists.txt:1 (CMAKE_MINIMUM_REQUIRED):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+  to tell CMake that the project requires at least <min> but has been updated
+  to work with policies introduced by <max> or earlier.
+
+  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+
+Upstream: N/A, dead
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index b13f78c..0764198 100755
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-CMAKE_MINIMUM_REQUIRED(VERSION 2.4)
++CMAKE_MINIMUM_REQUIRED(VERSION 3.5)
+ cmake_policy(SET CMP0003 NEW)
+ include(TestBigEndian)
+ 
+-- 
+2.52.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
