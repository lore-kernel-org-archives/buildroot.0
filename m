Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB6EC02194
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 13:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30F95411FE;
	Sat, 14 Sep 2024 13:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AD5Eld8D8cm3; Sat, 14 Sep 2024 13:23:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3054940643
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3054940643;
	Sat, 14 Sep 2024 13:23:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0692F1BF3F9
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D91106068A
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:23:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cUtIx-Kj0lYZ for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 13:23:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 384EF60653
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 384EF60653
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 13:23:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24E4282B58; Sat, 14 Sep 2024 13:23:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 15:11:32 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: a9aa11544a1358609aee8446723898c6b5f22689
X-Git-Newrev: 3d15c9036cc5f1db972bfcef1ba4e0637a93b984
X-Patchwork-Hint: ignore
Message-Id: <20240914132311.24E4282B58@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/qt6/qt6base:
 backport fix for CVE-2023-33285
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
Content-Type: multipart/mixed; boundary="===============5988979207789002142=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5988979207789002142==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3d15c9036cc5f1db972bfcef1ba4e0637a93b984
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

This commit backports an upstream patch that fixes CVE-2023-33285.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Unix-make-sure-we-don-t-overflow-the-buff.patch | 106 +++++++++++++++++++++
 package/qt6/qt6base/qt6base.mk                     |   2 +
 2 files changed, 108 insertions(+)

diff --git a/package/qt6/qt6base/0001-QDnsLookup-Unix-make-sure-we-don-t-overflow-the-buff.patch b/package/qt6/qt6base/0001-QDnsLookup-Unix-make-sure-we-don-t-overflow-the-buff.patch
new file mode 100644
index 0000000000..f4e81b8576
--- /dev/null
+++ b/package/qt6/qt6base/0001-QDnsLookup-Unix-make-sure-we-don-t-overflow-the-buff.patch
@@ -0,0 +1,106 @@
+From fc233efad86101d49cd312b16c5a25e6a017e977 Mon Sep 17 00:00:00 2001
+From: Thiago Macieira <thiago.macieira@intel.com>
+Date: Thu, 11 May 2023 21:40:15 -0700
+Subject: [PATCH] QDnsLookup/Unix: make sure we don't overflow the buffer
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The DNS Records are variable length and encode their size in 16 bits
+before the Record Data (RDATA). Ensure that both the RDATA and the
+Record header fields before it fall inside the buffer we have.
+
+Additionally reject any replies containing more than one query records.
+
+[ChangeLog][QtNetwork][QDnsLookup] Fixed a bug that could cause a buffer
+overflow in Unix systems while parsing corrupt, malicious, or truncated
+replies.
+
+Pick-to: 5.15 6.2 6.5 6.5.1
+Change-Id: I3e3bfef633af4130a03afffd175e4b9547654b95
+Reviewed-by: Mårten Nordheim <marten.nordheim@qt.io>
+Reviewed-by: Jani Heikkinen <jani.heikkinen@qt.io>
+
+Fixes: https://security-tracker.debian.org/tracker/CVE-2023-33285
+Upstream: https://codereview.qt-project.org/gitweb?p=qt/qtbase.git;a=commitdiff;h=7dba2c87619d558a61a30eb30cc1d9c3fe6df94c
+[Thomas: changes needed to backport on 6.4.3: use local_dn_expand()
+instead of dn_expand(), since we didn't backport the changes in
+68b625901f9eb7c34e3d7aa302e1c0a454d3190b that are too invasive]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/network/kernel/qdnslookup_unix.cpp | 31 +++++++++++++++++++++-----
+ 1 file changed, 25 insertions(+), 6 deletions(-)
+
+diff --git a/src/network/kernel/qdnslookup_unix.cpp b/src/network/kernel/qdnslookup_unix.cpp
+index 75f7c6c440e..de0113494fc 100644
+--- a/src/network/kernel/qdnslookup_unix.cpp
++++ b/src/network/kernel/qdnslookup_unix.cpp
+@@ -193,7 +193,6 @@ void QDnsLookupRunnable::query(const int requestType, const QByteArray &requestN
+     // responseLength in case of error, we still can extract the
+     // exact error code from the response.
+     HEADER *header = (HEADER*)response;
+-    const int answerCount = ntohs(header->ancount);
+     switch (header->rcode) {
+     case NOERROR:
+         break;
+@@ -226,18 +225,31 @@ void QDnsLookupRunnable::query(const int requestType, const QByteArray &requestN
+         return;
+     }
+ 
+-    // Skip the query host, type (2 bytes) and class (2 bytes).
+     char host[PACKETSZ], answer[PACKETSZ];
+     unsigned char *p = response + sizeof(HEADER);
+-    int status = local_dn_expand(response, response + responseLength, p, host, sizeof(host));
+-    if (status < 0) {
++    int status;
++
++    if (ntohs(header->qdcount) == 1) {
++        // Skip the query host, type (2 bytes) and class (2 bytes).
++        status = local_dn_expand(response, response + responseLength, p, host, sizeof(host));
++        if (status < 0) {
++            reply->error = QDnsLookup::InvalidReplyError;
++            reply->errorString = tr("Could not expand domain name");
++            return;
++        }
++        if ((p - response) + status + 4 >= responseLength)
++            header->qdcount = 0xffff;   // invalid reply below
++        else
++            p += status + 4;
++    }
++    if (ntohs(header->qdcount) > 1) {
+         reply->error = QDnsLookup::InvalidReplyError;
+-        reply->errorString = tr("Could not expand domain name");
++        reply->errorString = tr("Invalid reply received");
+         return;
+     }
+-    p += status + 4;
+ 
+     // Extract results.
++    const int answerCount = ntohs(header->ancount);
+     int answerIndex = 0;
+     while ((p < response + responseLength) && (answerIndex < answerCount)) {
+         status = local_dn_expand(response, response + responseLength, p, host, sizeof(host));
+@@ -249,6 +261,11 @@ void QDnsLookupRunnable::query(const int requestType, const QByteArray &requestN
+         const QString name = QUrl::fromAce(host);
+ 
+         p += status;
++
++        if ((p - response) + 10 > responseLength) {
++            // probably just a truncated reply, return what we have
++            return;
++        }
+         const quint16 type = (p[0] << 8) | p[1];
+         p += 2; // RR type
+         p += 2; // RR class
+@@ -256,6 +273,8 @@ void QDnsLookupRunnable::query(const int requestType, const QByteArray &requestN
+         p += 4;
+         const quint16 size = (p[0] << 8) | p[1];
+         p += 2;
++        if ((p - response) + size > responseLength)
++            return;             // truncated
+ 
+         if (type == QDnsLookup::A) {
+             if (size != 4) {
+-- 
+2.46.0
+
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 211808d2af..a38edcf8ac 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -9,6 +9,8 @@ QT6BASE_SITE = $(QT6_SITE)
 QT6BASE_SOURCE = qtbase-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6BASE_VERSION).tar.xz
 QT6BASE_CPE_ID_VENDOR = qt
 QT6BASE_CPE_ID_PRODUCT = qt
+# 0001-QDnsLookup-Unix-make-sure-we-don-t-overflow-the-buff.patch
+QT6BASE_IGNORE_CVES += CVE-2023-33285
 
 QT6BASE_CMAKE_BACKEND = ninja
 

--===============5988979207789002142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5988979207789002142==--
