Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A26C47074
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 22:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA33560EAB;
	Sun,  7 Jan 2024 22:29:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA33560EAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8pqHm1kjReBi; Sun,  7 Jan 2024 22:29:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39D1D605B3;
	Sun,  7 Jan 2024 22:29:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39D1D605B3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CB1731BF33F
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 22:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B16CE60E91
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 22:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B16CE60E91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YlkYKec8FvUu for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 22:29:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB4B7605B3
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 22:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB4B7605B3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB31A84906; Sun,  7 Jan 2024 22:29:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Jan 2024 23:23:51 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: c01b8fd38aacb983599ad63cffd26bb5131e7fb5
X-Git-Newrev: 2fdf355b2a208af3a6f30a243e71561bd30c3ba1
X-Patchwork-Hint: ignore
Message-Id: <20240107222903.DB31A84906@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/glibc: add proper
 CPE ID version detail
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

commit: https://git.buildroot.net/buildroot/commit/?id=2fdf355b2a208af3a6f30a243e71561bd30c3ba1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

As reported in bug 15895, the GLIBC_VERSION field having a value
looking like 2.38-27-g750a45a783906a19591fb8ff6b7841470f1f5701, it
prevents the CPE/CVE matching with the NVD database to work correctly.

This commit fixes that by defining GLIBC_CPE_ID_VERSION, derived from
GLIBC_VERSION, by extracting the base version.

Also, we update GLIBC_IGNORE_CVES to account for the CVEs that have
clearly been fixed between 2.38 and
2.38-27-g750a45a783906a19591fb8ff6b7841470f1f5701. There are a number
of other CVEs still affecting the glibc package, but they are not
related to this
2.38...2.38-27-g750a45a783906a19591fb8ff6b7841470f1f5701 range.

Fixes: #15895

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit af8c0e5c746b11872b57e660afc2118e882f7722)
[Peter: adjust for glibc 2.36.x on 2023.02.x]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.mk | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index a3a84e86ec..8a31779afb 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -20,6 +20,30 @@ GLIBC_LICENSE = GPL-2.0+ (programs), LGPL-2.1+, BSD-3-Clause, MIT (library)
 GLIBC_LICENSE_FILES = COPYING COPYING.LIB LICENSES
 GLIBC_CPE_ID_VENDOR = gnu
 
+# Extract the base version (e.g. 2.36) from GLIBC_VERSION in order to
+# allow proper matching with the CPE database.
+GLIBC_CPE_ID_VERSION = $(word 1, $(subst -,$(space),$(GLIBC_VERSION)))
+
+# Fixed by b0e7888d1fa2dbd2d9e1645ec8c796abf78880b9, which is between
+# 2.36 and the version we're really using
+GLIBC_IGNORE_CVES += CVE-2022-39046
+
+# Fixed by 4ea972b7edd7e36610e8cde18bf7a8149d7bac4f, which is between
+# 2.36 and the version we're really using
+GLIBC_IGNORE_CVES += CVE-2023-4527
+
+# Fixed by a9728f798ec7f05454c95637ee6581afaa9b487d, which is between
+# 2.36 and the version we're really using
+GLIBC_IGNORE_CVES += CVE-2023-4806
+
+# Fixed by 22955ad85186ee05834e47e665056148ca07699c, which is between
+# 2.36 and the version we're really using.
+GLIBC_IGNORE_CVES += CVE-2023-4911
+
+# Fixed by 856bac55f98dc840e7c27cfa82262b933385de90, which is between
+# 2.36 and the version we're really using.
+GLIBC_IGNORE_CVES += CVE-2023-5156
+
 # glibc is part of the toolchain so disable the toolchain dependency
 GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
