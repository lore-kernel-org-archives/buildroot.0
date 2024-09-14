Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33369C02198
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 13:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF632405C8;
	Sat, 14 Sep 2024 13:23:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wyo4kGIkpzns; Sat, 14 Sep 2024 13:23:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9918A405A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9918A405A0;
	Sat, 14 Sep 2024 13:23:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D5DA1BF3F9
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B251406F3
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bEl3IqglA0cY for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 13:23:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35CD1406E2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35CD1406E2
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 13:23:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FC2782B5C; Sat, 14 Sep 2024 13:23:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 15:11:41 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 3d15c9036cc5f1db972bfcef1ba4e0637a93b984
X-Git-Newrev: 61b4095409c84aa94f4f4b503cf2014a9d3cf83d
X-Patchwork-Hint: ignore
Message-Id: <20240914132311.2FC2782B5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/qt6/qt6base:
 backport fix for CVE-2023-32762
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

commit: https://git.buildroot.net/buildroot/commit/?id=61b4095409c84aa94f4f4b503cf2014a9d3cf83d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

This commit backports an upstream patch that fixes CVE-2023-32762.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...sts-match-header-names-case-insensitively.patch | 57 ++++++++++++++++++++++
 package/qt6/qt6base/qt6base.mk                     |  2 +
 2 files changed, 59 insertions(+)

diff --git a/package/qt6/qt6base/0002-Hsts-match-header-names-case-insensitively.patch b/package/qt6/qt6base/0002-Hsts-match-header-names-case-insensitively.patch
new file mode 100644
index 0000000000..16332d7914
--- /dev/null
+++ b/package/qt6/qt6base/0002-Hsts-match-header-names-case-insensitively.patch
@@ -0,0 +1,57 @@
+From 5e8697e3aa4e92643c52d34aacfa26890e7d417d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?M=C3=A5rten=20Nordheim?= <marten.nordheim@qt.io>
+Date: Fri, 5 May 2023 11:07:26 +0200
+Subject: [PATCH] Hsts: match header names case insensitively
+
+Header field names are always considered to be case-insensitive.
+
+Pick-to: 6.5 6.5.1 6.2 5.15
+Fixes: QTBUG-113392
+Change-Id: Ifb4def4bb7f2ac070416cdc76581a769f1e52b43
+Reviewed-by: Qt CI Bot <qt_ci_bot@qt-project.org>
+Reviewed-by: Edward Welbourne <edward.welbourne@qt.io>
+Reviewed-by: Volker Hilsheimer <volker.hilsheimer@qt.io>
+
+Fixes: https://security-tracker.debian.org/tracker/CVE-2023-32762
+Upstream: https://github.com/qt/qtbase/commit/1b736a815be0222f4b24289cf17575fc15707305
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/network/access/qhsts.cpp                 | 4 ++--
+ tests/auto/network/access/hsts/tst_qhsts.cpp | 6 ++++++
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/network/access/qhsts.cpp b/src/network/access/qhsts.cpp
+index 39905f35480..82deede1729 100644
+--- a/src/network/access/qhsts.cpp
++++ b/src/network/access/qhsts.cpp
+@@ -327,8 +327,8 @@ quoted-pair    = "\" CHAR
+ bool QHstsHeaderParser::parse(const QList<QPair<QByteArray, QByteArray>> &headers)
+ {
+     for (const auto &h : headers) {
+-        // We use '==' since header name was already 'trimmed' for us:
+-        if (h.first == "Strict-Transport-Security") {
++        // We compare directly because header name was already 'trimmed' for us:
++        if (h.first.compare("Strict-Transport-Security", Qt::CaseInsensitive) == 0) {
+             header = h.second;
+             // RFC6797, 8.1:
+             //
+diff --git a/tests/auto/network/access/hsts/tst_qhsts.cpp b/tests/auto/network/access/hsts/tst_qhsts.cpp
+index 252f5e8f579..97a2d2889e5 100644
+--- a/tests/auto/network/access/hsts/tst_qhsts.cpp
++++ b/tests/auto/network/access/hsts/tst_qhsts.cpp
+@@ -216,6 +216,12 @@ void tst_QHsts::testSTSHeaderParser()
+     QVERIFY(parser.expirationDate() > QDateTime::currentDateTimeUtc());
+     QVERIFY(parser.includeSubDomains());
+ 
++    list.pop_back();
++    list << Header("strict-transport-security", "includeSubDomains;max-age=1000");
++    QVERIFY(parser.parse(list));
++    QVERIFY(parser.expirationDate() > QDateTime::currentDateTimeUtc());
++    QVERIFY(parser.includeSubDomains());
++
+     list.pop_back();
+     // Invalid (includeSubDomains twice):
+     list << Header("Strict-Transport-Security", "max-age = 1000 ; includeSubDomains;includeSubDomains");
+-- 
+2.46.0
+
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index a38edcf8ac..9143a36d9e 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -11,6 +11,8 @@ QT6BASE_CPE_ID_VENDOR = qt
 QT6BASE_CPE_ID_PRODUCT = qt
 # 0001-QDnsLookup-Unix-make-sure-we-don-t-overflow-the-buff.patch
 QT6BASE_IGNORE_CVES += CVE-2023-33285
+# 0002-Hsts-match-header-names-case-insensitively.patch
+QT6BASE_IGNORE_CVES += CVE-2023-32762
 
 QT6BASE_CMAKE_BACKEND = ninja
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
