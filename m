Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81CEE7718B
	for <buildroot@archiver.kernel.org>; Tue, 31 Dec 2024 16:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BBC9608A1;
	Tue, 31 Dec 2024 16:04:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yf0MIvXrcMrU; Tue, 31 Dec 2024 16:04:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9061608CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9061608CA;
	Tue, 31 Dec 2024 16:04:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FAA4968
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 16:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CC744087D
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 16:04:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SJbmdaFqGsVk for <buildroot@buildroot.org>;
 Tue, 31 Dec 2024 16:04:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82FA44087B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82FA44087B
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 16:04:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E62182BA0; Tue, 31 Dec 2024 16:04:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 31 Dec 2024 17:00:50 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 0980919b90d0f878c89166fdfd98c86eea587016
X-Git-Newrev: 498406cfdbf0f7bacd92bf93b04b2943a30d15fe
X-Patchwork-Hint: ignore
Message-Id: <20241231160405.6E62182BA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/qt6base: properly
 ignore CVE-2023-32573
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=498406cfdbf0f7bacd92bf93b04b2943a30d15fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

In commit
a9aa11544a1358609aee8446723898c6b5f22689 ("package/qt6/qt6svg:
backport fix for CVE-2023-32573"), a fix for security issue
CVE-2023-32573 was added to qt6svg, with the appropriate
QT6SVG_IGNORE_CVES entry.

However, all CVEs against Qt are reported by the NVD on the qt:qt
vendor/product CPE. For example:

  https://nvd.nist.gov/vuln/detail/CVE-2023-32573

Therefore, the QT6SVG_IGNORE_CVES entry added has no effect, and
CVE-2023-32573 continues to be reported against our qt6base package.

The only reasonable option is to collect all such CVE ignore entries
for Qt modules into the qt6base package, which is the one that matches
with the qt:qt CPE identifier. This commit does just that, with an
hopefully appropriate comment in qt6base.mk that explains what's going
on.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt6/qt6base/qt6base.mk | 8 ++++++++
 package/qt6/qt6svg/qt6svg.mk   | 2 --
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index ab6764cbbe..3d45079747 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -27,6 +27,14 @@ QT6BASE_IGNORE_CVES += CVE-2023-34410
 # 0016-HTTP2-Delay-any-communication-until-encrypted-can-be.patch
 QT6BASE_IGNORE_CVES += CVE-2024-39936
 
+# All Qt CVEs are reported by NVD against the qt:qt vendor/product
+# CPE, so from a Buildroot perspective, they will all show up reported
+# on qt6base. The ignore CVE entries below are for other Qt modules,
+# but they need to be listed here to be properly accounted for.
+
+# qt6svg/0001-QSvgFont-Initialize-used-member-remove-unused.patch
+QT6BASE_IGNORE_CVES += CVE-2023-32573
+
 QT6BASE_CMAKE_BACKEND = ninja
 
 QT6BASE_LICENSE = \
diff --git a/package/qt6/qt6svg/qt6svg.mk b/package/qt6/qt6svg/qt6svg.mk
index 4386556548..25e87dd208 100644
--- a/package/qt6/qt6svg/qt6svg.mk
+++ b/package/qt6/qt6svg/qt6svg.mk
@@ -9,8 +9,6 @@ QT6SVG_SITE = $(QT6_SITE)
 QT6SVG_SOURCE = qtsvg-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SVG_VERSION).tar.xz
 QT6SVG_INSTALL_STAGING = YES
 QT6SVG_SUPPORTS_IN_SOURCE_BUILD = NO
-# 0001-QSvgFont-Initialize-used-member-remove-unused.patch
-QT6SVG_IGNORE_CVES += CVE-2023-32573
 
 QT6SVG_CMAKE_BACKEND = ninja
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
