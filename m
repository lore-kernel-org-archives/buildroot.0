Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABBEC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE8204FC34;
	Fri, 28 Feb 2025 16:46:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rIGMpmKosDx2; Fri, 28 Feb 2025 16:46:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD3384FC41
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD3384FC41;
	Fri, 28 Feb 2025 16:46:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1176D68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F14742DAA
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6mEUcsGMCTtH for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3907142569
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3907142569
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E3D583D12; Fri, 28 Feb 2025 16:29:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Dec 2024 22:08:39 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ecea4d94ac676ae9e66ce3e8799c0ba7dc14cc96
X-Git-Newrev: 164053732ed432215fa8352521f6767518492622
X-Patchwork-Hint: ignore
Message-Id: <20250228162950.2E3D583D12@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt6: remove unneeded
 and problematic CONF_OPTS
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=164053732ed432215fa8352521f6767518492622
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In the qt6opcua and qt6declarative packages we don't follow the same
pattern for default CONF_OPTS as the other packages.

For these two packages we specify QT_HOST_PATH, which I don't see any
good reason for. On the contrary, in my experience, it causes build
failures, when bumping Qt6, if you don't rebuild everything. See:

 - https://doc.qt.io/qt-6/cmake-variable-qt-host-path.html

As for the other parameters, BUILD_WITH_PCH, QT_BUILD_EXAMPLES and
QT_BUILD_TESTS, I don't see a good enough reason for breaking the
the existing pattern for only these two packages.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6declarative/qt6declarative.mk | 6 ------
 package/qt6/qt6opcua/qt6opcua.mk             | 4 ----
 2 files changed, 10 deletions(-)

diff --git a/package/qt6/qt6declarative/qt6declarative.mk b/package/qt6/qt6declarative/qt6declarative.mk
index ecf14d3323..edec67649f 100644
--- a/package/qt6/qt6declarative/qt6declarative.mk
+++ b/package/qt6/qt6declarative/qt6declarative.mk
@@ -35,12 +35,6 @@ QT6DECLARATIVE_CONF_OPTS = \
 	-DQT_BUILD_EXAMPLES=OFF \
 	-DQT_BUILD_TESTS=OFF
 
-HOST_QT6DECLARATIVE_CONF_OPTS = \
-	-DQT_HOST_PATH=$(HOST_DIR) \
-	-DBUILD_WITH_PCH=OFF \
-	-DQT_BUILD_EXAMPLES=OFF \
-	-DQT_BUILD_TESTS=OFF
-
 HOST_QT6DECLARATIVE_DEPENDENCIES = \
 	host-qt6base
 
diff --git a/package/qt6/qt6opcua/qt6opcua.mk b/package/qt6/qt6opcua/qt6opcua.mk
index 6c8ff7af89..28771ba8a5 100644
--- a/package/qt6/qt6opcua/qt6opcua.mk
+++ b/package/qt6/qt6opcua/qt6opcua.mk
@@ -28,10 +28,6 @@ QT6OPCUA_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
 	-DBUILD_WITH_PCH=OFF
 
-HOST_QT6OPCUA_CONF_OPTS = \
-	-DQT_HOST_PATH=$(HOST_DIR) \
-	-DBUILD_WITH_PCH=OFF
-
 QT6OPCUA_DEPENDENCIES = \
 	qt6base \
 	host-qt6opcua
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
