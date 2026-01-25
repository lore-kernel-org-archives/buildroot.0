Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4159FE63CA1
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 11:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B2B360ACA;
	Sun, 25 Jan 2026 11:43:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gelIaCewy1r1; Sun, 25 Jan 2026 11:43:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDBD960ACD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769341417;
	bh=6dObRintgK1rDneCSXM6PQrnuM2sXTxMZ+IfDG7eVtg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=HDRf6n4R8hSuDtL7dkEFJ5eghO9vbDCEEbWhikFEcyNoPTuQtBuqx05xAQMG0eTVx
	 FcAF66R5q8tFzZWbi49knkCEV9n5X1+9nQwtVCKBZbjXXjVhHTXS1D/58BKUwxzH+g
	 WZ50vm6qMJtDa2w6hU0gjfxJ1rT28tx3zD3WScHMdephhLVXBumfCqkw9zlam9QIsF
	 HPYF4YZ68LtI/LKERpKeBCNJDM1snyUbUryItoXJl9h8NT8sCxd/OMBbrhZ3sOYFNs
	 dG8itSM6gXhyX5K0BJhuGXU8btRmK2Ag15aZMr6CHUT42Pu6hIIjUNa5gWw+/lcas/
	 0OamYvBMoPjAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDBD960ACD;
	Sun, 25 Jan 2026 11:43:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6456A11B
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 11:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44548835F2
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 11:43:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pY7YlN6rYuDH for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 11:43:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A04BA835D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A04BA835D3
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A04BA835D3
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 11:43:34 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 0639A19F5A5;
 Sun, 25 Jan 2026 12:43:25 +0100 (CET)
To: buildroot@buildroot.org
Date: Sun, 25 Jan 2026 12:43:10 +0100
Message-ID: <20260125114310.246433-1-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769341411;
 bh=GHcE743GPIwmcrRMBTjore2XMP0YEc//hWnfkEsq40Q=;
 h=From:To:Cc:Subject:Date:From;
 b=dw85BAH1/NwsE82+l3q/9wCFL3VI2OzCpITxs8NNhp0X1iOh1SCXIsFx2Sm+L+aVY
 LqkCll1UMVso+Vvt22v4GD6bcytDhCB8fxaBBmj18CZYyV+l7OEWGBUho4CaziZURF
 hyVXAaKEkVMi+WY+8M5oYO3OdDtakYPinHTrTaDPJiIN9s9nrmNl+kgyTFqSCKFZNg
 EavZB975GxlPa98VdFd5Sz4GoDwjzYlrnxziOnG1GbzAQ9+HTI9hBE5O9bR3b1C8bV
 Oe8sC38NPuiGrOWqz99JcgSqNeEkKBf6x7CmWeI2n2gfzZfoegMcGm7ZpgKdaayz3m
 zWqpup/NzLXDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dw85BAH1
Subject: [Buildroot] [PATCH 1/1] package/glibc: add CVE-2025-15281
 CVE-2026-0861 CVE-2026-0915 to _IGNORE_CVES
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
Cc: Romain Naour <romain.naour@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit [1] bumped glibc from 2.42-3-gbc13db739 to 2.42-51-gcbf39c26b
to fix some CVEs, but forgot to add those CVEs to GLIBC_IGNORE_CVES.
This was needed because the GLIBC_CPE_ID_VERSION used for CVE checks
remains to the same value "2.42" which is marked as vulnerable to
those CVEs.

This commit adds those _IGNORE_CVES with the corresponding upstream
commit references, to make sure they will not be reported by the
"make pkg-stats" command.

Fixes:
- [1]

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/18de297a5ad3d1fc1b44f54ae69289ca10200ad5

Cc: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/glibc/glibc.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index e3453b8cc2..44bf9c4b06 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -28,6 +28,15 @@ GLIBC_CPE_ID_VERSION = $(word 1, $(subst -,$(space),$(GLIBC_VERSION)))
 # Fixed by glibc-2.41-64-g1e16d0096d80a6e12d5bfa8e0aafdd13c47efd65
 GLIBC_IGNORE_CVES += CVE-2025-8058
 
+# Fixed by glibc-2.42-49-gb0ec8fb689df862171f0f78994a3bdeb51313545
+GLIBC_IGNORE_CVES += CVE-2026-0861
+
+# Fixed by glibc-2.42-50-g453e6b8dbab935257eb0802b0c97bca6b67ba30e
+GLIBC_IGNORE_CVES += CVE-2026-0915
+
+# Fixed by glibc-2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125
+GLIBC_IGNORE_CVES += CVE-2025-15281
+
 # This CVE is considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
