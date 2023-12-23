Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EF8C46CD3
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 10:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 964F360BED;
	Sat, 23 Dec 2023 10:27:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 964F360BED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OjbdYmvc-r85; Sat, 23 Dec 2023 10:27:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E08B760B9E;
	Sat, 23 Dec 2023 10:27:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E08B760B9E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 25AB21BF408
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 10:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0468F827FD
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 10:27:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0468F827FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vW85GZJrMiep for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 10:27:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C281827BA
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 10:27:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C281827BA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB58087BC2; Sat, 23 Dec 2023 10:26:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 10:58:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e59346f7db276852d40618ec04fd012bedf2e245
X-Git-Newrev: af8c0e5c746b11872b57e660afc2118e882f7722
X-Patchwork-Hint: ignore
Message-Id: <20231223102659.EB58087BC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibc: add proper CPE ID version
 detail
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

commit: https://git.buildroot.net/buildroot/commit/?id=af8c0e5c746b11872b57e660afc2118e882f7722
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/glibc/glibc.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 0b71530310..32e6516c7f 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -20,6 +20,22 @@ GLIBC_LICENSE = GPL-2.0+ (programs), LGPL-2.1+, BSD-3-Clause, MIT (library)
 GLIBC_LICENSE_FILES = COPYING COPYING.LIB LICENSES
 GLIBC_CPE_ID_VENDOR = gnu
 
+# Extract the base version (e.g. 2.38) from GLIBC_VERSION) in order to
+# allow proper matching with the CPE database.
+GLIBC_CPE_ID_VERSION = $(word 1, $(subst -,$(space),$(GLIBC_VERSION)))
+
+# Fixed by b25508dd774b617f99419bdc3cf2ace4560cd2d6, which is between
+# 2.38 and the version we're really using
+GLIBC_IGNORE_CVES += CVE-2023-4527
+
+# Fixed by 750a45a783906a19591fb8ff6b7841470f1f5710, which is between
+# 2.38 and the version we're really using.
+GLIBC_IGNORE_CVES += CVE-2023-4911
+
+# Fixed by 5ee59ca371b99984232d7584fe2b1a758b4421d3, which is between
+# 2.38 and the version we're really using.
+GLIBC_IGNORE_CVES += CVE-2023-5156
+
 # glibc is part of the toolchain so disable the toolchain dependency
 GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
