Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCCBF01801
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 07:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EF6C41B74;
	Fri,  6 Mar 2026 07:41:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJ0gWbtPbP0b; Fri,  6 Mar 2026 07:41:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E31041B7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772782887;
	bh=xa54K1y48gFUoSJxKFMXXi6pKGdRr94wTBSepMcKM5E=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Le9KWZUEEVL43/dRc7BXObFqZQcfG9Luodxo+STGFO6V3b+AKDiDLly+XCvEAHRID
	 HWDprHcwIeuoo0dVckQtdKZAtfa4V7is3fHOfyadf7/+ETeA4Q6B+kGm2gF/Y13AwT
	 IvTUb5CPiLO9z2rCdI6ZrN//UuNDxC3TxA5csr1T5Flnu2VUUka8kpvdq48OMtVVkF
	 C/Aycj3I/yrKVfa7PEf2j3iMrjlnki9Eqao/DuvPXXcCUgCDyJYEDBpo8WT8GYr3ot
	 TsIG3DwExJWm6SiQk5acDrYLjDw9cr3lyjCsEMwfD5gkKYZGX/T2nx9uOKwsKBqmnD
	 7lFGTf3KJVXPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E31041B7E;
	Fri,  6 Mar 2026 07:41:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EA8F339
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 07:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C41C41BA6
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 07:41:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6kecwdFDVOlo for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 07:41:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9D6A041B74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D6A041B74
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D6A041B74
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 07:41:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DEC72A4C2EDD;
 Fri,  6 Mar 2026 08:41:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vyPo2-000000005YP-3c3l;
 Fri, 06 Mar 2026 07:41:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>
Date: Fri,  6 Mar 2026 08:41:05 +0100
Message-ID: <20260306074106.124068-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772782867;
 bh=b/toxAabRQKtuhCrW6O01Wlk04zREy+M5avGIf0OfBc=;
 h=From:To:Cc:Subject:Date:From;
 b=bmnnJs5rLqR/sbQ9SKzHRy3hMO/hdr5SgM4o2nK89BrxQ4lQzScNKXjfQcT1oU+2C
 kXhupM22ZxAvge4kb8aAg3senh0nLw9gPa5NhHdn2TKG1CZJIB2UuMyXR7x9bZq1Gc
 v3feyZFIIPiNu3UXMD8tO0d+4+iz2tx+gbBZaO9UDIPzfHz24EddFcfjQDknnNdhax
 FHicoyjHMhTauGZXRiLWtcA0BUkgp9fovaF9QOUgWqIvlaetcod3QA11W8M9dujHdL
 TESHBXOxQGUGcMHbcj+W9/lsfMkIn/H/vZaKVTBkcpdKJPIDjN08hOl66iFxF8jzn/
 ciaLa2wlM8ZQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=bmnnJs5r
Subject: [Buildroot] [PATCH 1/2] package/libtpms: fix build with host gcc >=
 15.x
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
https://autobuild.buildroot.net/results/7a6/7a6ea7c513e8f1dcc32d868108bfb2a907d6fe85/

The previous change to src/tpm_library.c dates back to 2024:
https://github.com/stefanberger/libtpms/commits/master/src/tpm_library.c
so a backport to buildroot LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ilation-error-in-TPMLIB_GetPlaintext.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/libtpms/0001-Fix-a-compilation-error-in-TPMLIB_GetPlaintext.patch

diff --git a/package/libtpms/0001-Fix-a-compilation-error-in-TPMLIB_GetPlaintext.patch b/package/libtpms/0001-Fix-a-compilation-error-in-TPMLIB_GetPlaintext.patch
new file mode 100644
index 0000000000..02c4df9668
--- /dev/null
+++ b/package/libtpms/0001-Fix-a-compilation-error-in-TPMLIB_GetPlaintext.patch
@@ -0,0 +1,40 @@
+From fc8820cfaa8b5e17328f731df93911f6ab92443b Mon Sep 17 00:00:00 2001
+From: Stefan Berger <stefanb@linux.ibm.com>
+Date: Fri, 2 Jan 2026 11:37:31 -0500
+Subject: [PATCH] Fix a compilation error in TPMLIB_GetPlaintext
+
+Fix a compilation error that newer gcc versions may complain about:
+
+tpm_library.c: In function 'TPMLIB_GetPlaintext':
+tpm_library.c:441:11: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
+  441 |     start = strstr(stream, starttag);
+      |           ^
+At top level:
+cc1: note: unrecognized command-line option '-Wno-self-assign' may have been intended to silence earlier diagnostics
+cc1: all warnings being treated as errors
+
+Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
+
+Upstream: https://github.com/stefanberger/libtpms/commit/fc8820cfaa8b5e17328f731df93911f6ab92443b
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/tpm_library.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/tpm_library.c b/src/tpm_library.c
+index f48f4fd3..7b2ea687 100644
+--- a/src/tpm_library.c
++++ b/src/tpm_library.c
+@@ -435,7 +435,7 @@ static unsigned char *TPMLIB_GetPlaintext(const char *stream,
+                                           const char *endtag,
+                                           size_t *length)
+ {
+-    char *start, *end;
++    const char *start, *end;
+     unsigned char *plaintext = NULL;
+ 
+     start = strstr(stream, starttag);
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
