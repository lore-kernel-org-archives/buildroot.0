Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15C4C433EF
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 07:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44ED440C7F;
	Wed, 30 Mar 2022 07:14:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tjdZoMKY-LqW; Wed, 30 Mar 2022 07:14:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32C9F40B3E;
	Wed, 30 Mar 2022 07:14:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D07091BF9D1
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 07:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDABA60ACB
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 07:13:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Izaw4K74ah8K for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 07:13:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC3E660A71
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 07:13:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A0D1D85FB8; Wed, 30 Mar 2022 07:04:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 30 Mar 2022 08:50:49 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 01b2a04486d56f78fc166a164e8efb2d3c9fbc21
X-Git-Newrev: b2992d27bd63adc3d1c6f265b57e07746f0761f5
X-Patchwork-Hint: ignore
Message-Id: <20220330070437.A0D1D85FB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/qt5/qt5base:
 remove leftover patch
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
Content-Type: multipart/mixed; boundary="===============0580903697072565432=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0580903697072565432==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b2992d27bd63adc3d1c6f265b57e07746f0761f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

CVE-2021-38593 fixes originally missed a usecase that was covered by the
to-be-removed patch. However, this patch was incorrect and added some
issues on its own, which was then fixed by now-removed
0012-Refix-for-avoiding-huge-number-of-tiny-dashes.patch.

Unfortunately for us, the to-be-removed patch (fixed by
0012-Refix-for-avoiding-huge-number-of-tiny-dashes.patch) can actually
be applied (with fuzz; by `patch` only) on top of the now-removed patch.
When the move to KDE Qt fork was made, some patches were removed as they
were already part of the new git fork. However, the to-be-removed patch
was not. This means the
0012-Refix-for-avoiding-huge-number-of-tiny-dashes.patch was actually
undone when Buildroot patched qt5base.

Let's remove this patch to fix this oversight.

As a reference:
e7ea2ed27c Improve fix for avoiding huge number of tiny dashes
fixed by
65b3aa6a1c Refix for avoiding huge number of tiny dashes
in the git repo.

Fixes: 5770a645a3a49 "package/qt5: bump packages to latest kde submodule versions"
Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
[Arnout: renumber patches 0007 and 0008]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 3857bccca5e59dfe90fc5b5823bfe672a1847cd5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...scv32.patch => 0006-Fix-build-on-riscv32.patch} |  0
 ...x-for-avoiding-huge-number-of-tiny-dashes.patch | 37 ----------------------
 ...-configure.json-fix-atomicfptr-detection.patch} |  0
 3 files changed, 37 deletions(-)

diff --git a/package/qt5/qt5base/0007-Fix-build-on-riscv32.patch b/package/qt5/qt5base/0006-Fix-build-on-riscv32.patch
similarity index 100%
rename from package/qt5/qt5base/0007-Fix-build-on-riscv32.patch
rename to package/qt5/qt5base/0006-Fix-build-on-riscv32.patch
diff --git a/package/qt5/qt5base/0006-Improve-fix-for-avoiding-huge-number-of-tiny-dashes.patch b/package/qt5/qt5base/0006-Improve-fix-for-avoiding-huge-number-of-tiny-dashes.patch
deleted file mode 100644
index 16e0f20200..0000000000
--- a/package/qt5/qt5base/0006-Improve-fix-for-avoiding-huge-number-of-tiny-dashes.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 856d11f695fb6effe26a359f9ad0efdf24067085 Mon Sep 17 00:00:00 2001
-From: Eirik Aavitsland <eirik.aavitsland@qt.io>
-Date: Fri, 23 Jul 2021 15:53:56 +0200
-Subject: [PATCH] Improve fix for avoiding huge number of tiny dashes
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Some pathological cases were not caught by the previous fix.
-
-Fixes: QTBUG-95239
-Pick-to: 6.2 6.1 5.15
-Change-Id: I0337ee3923ff93ccb36c4d7b810a9c0667354cc5
-Reviewed-by: Robert Löhning <robert.loehning@qt.io>
-(cherry picked from commit 6b400e3147dcfd8cc3a393ace1bd118c93762e0c)
-[Retrieved from: https://invent.kde.org/qt/qt/qtbase/-/commit/fed5713eeba5bf8e0ee413cb4e77109bfa7c2bce]
-Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
----
- src/gui/painting/qpaintengineex.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/gui/painting/qpaintengineex.cpp b/src/gui/painting/qpaintengineex.cpp
-index 55fdb0c2a0..19e4b23423 100644
---- a/src/gui/painting/qpaintengineex.cpp
-+++ b/src/gui/painting/qpaintengineex.cpp
-@@ -426,7 +426,7 @@ void QPaintEngineEx::stroke(const QVectorPath &path, const QPen &inPen)
-             patternLength *= pen.widthF();
-         if (qFuzzyIsNull(patternLength)) {
-             pen.setStyle(Qt::NoPen);
--        } else if (extent / patternLength > 10000) {
-+        } else if (qFuzzyIsNull(extent) || extent / patternLength > 10000) {
-             // approximate stream of tiny dashes with semi-transparent solid line
-             pen.setStyle(Qt::SolidLine);
-             QColor color(pen.color());
--- 
-2.34.1
-
diff --git a/package/qt5/qt5base/0008-src-corelib-configure.json-fix-atomicfptr-detection.patch b/package/qt5/qt5base/0007-src-corelib-configure.json-fix-atomicfptr-detection.patch
similarity index 100%
rename from package/qt5/qt5base/0008-src-corelib-configure.json-fix-atomicfptr-detection.patch
rename to package/qt5/qt5base/0007-src-corelib-configure.json-fix-atomicfptr-detection.patch

--===============0580903697072565432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0580903697072565432==--
