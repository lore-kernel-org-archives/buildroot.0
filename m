Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94087C5AD2C
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 09:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 954C080F78;
	Sat,  8 Aug 2026 09:07:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3lwPwWsm4Q8h; Sat,  8 Aug 2026 09:07:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42C4180F66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786180020;
	bh=zK5glw868Ku7EgmKOLIT7ONQ2XDDN4XYzfBRZKM453U=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=S1qVSe1qtq0uMTkalFcBMzIM4h4hhxWBuG3IE5FuhHzZZCPCm5xfr4+zhLWOUxtu9
	 4SVasc/5f3IhMVKWGyIyUoQ8PTdsFqJTD6ve7wwMJBxqyftVDbcgVktEaarpz0H84D
	 SRGRgIrcZVxqFHcKKlkL3BrHHrqbSkO2V8jIH4K4tUd++5sLJ3+26H4mv4O4voIgvf
	 JhroofTj59CVf6rYfGgQbVAsxQ5/j+8lfmCmLOc/c47xbLHwrC6ffGc1N9r18fVtkE
	 yCRh1rKEQoxxG11HhiMx2hriaVcguQV1wOkJfd7FSqzd9F17C9WoQPOcDzyfxA53JC
	 KIkWqc84590Yw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42C4180F66;
	Sat,  8 Aug 2026 09:07:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C5BF2144
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 09:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB55280F66
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 09:06:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hHNcunCceDve for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 09:06:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA11880F5D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA11880F5D
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA11880F5D
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 09:06:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 96F694E41158
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 09:06:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 671F36045E
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 09:06:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 274E611C48371; 
 Sat,  8 Aug 2026 11:06:48 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  8 Aug 2026 11:06:40 +0200
Message-ID: <20260808090642.785882-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786180009; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=ptmbYN+2iHjyR2ANm4WbZoqEfLkdKafnRQBmq7HjdsA=;
 b=cvKiHqXHi2xK6M4MJorDYD6fMAPd1a0PTsSRWdbdnCFeziXE3+0k7kNO4+uw0JzgCoNEF/
 izdgo37gUprizo2usqpiFO3TfVG5geDfQJAFnMTsXVA4THUkaZVBKicdeS6y3BDMsE1w5D
 CFojOuNKu9BhhH06mRMU75Euzr2a+5jv1IWvYqcwZtWFOy+EYsZfU78ZGqTpJOd2DEctiC
 64AalWFmFiSWVYHXlhcvZSiYSFh0puteiQ6OExqHuteTVZVB3Ml/4BNITt6Jb7t+Nl/CTt
 nG3dFmvMkg47pCrTrnlZhidcomQ1/m97cljD+FvTWNPRcRcyr41vBMTKG/ASyw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=cvKiHqXH
Subject: [Buildroot] [PATCH 1/2] package/tpm2-tools: propagate
 BR2_PACKAGE_TPM2_TSS_FAPI dependencies
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In commit 5394df6400912efa7da4f97c7ea68a81a9f77c1d ("package/tpm2-tss:
add Mbed-TLS crypto backend support"), a depends on
!BR2_PACKAGE_MBEDTLS was added to BR2_PACKAGE_TPM2_TSS_FAPI, but this
new dependency was not properly propagated to the reverse
dependencies, causing kconfig warnings such as:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_TPM2_TSS_FAPI
  Depends on [n]: BR2_PACKAGE_TPM2_TSS [=y] && BR2_TOOLCHAIN_HAS_SYNC_4 [=y] && !BR2_PACKAGE_MBEDTLS [=y]
  Selected by [y]:
  - BR2_PACKAGE_TPM2_TOOLS_FAPI [=y] && BR2_PACKAGE_TPM2_TOOLS [=y] && BR2_TOOLCHAIN_HAS_SYNC_4 [=y]

This commit properly propagates this new dependency to
BR2_PACKAGE_TPM2_TOOLS_FAPI, fixing the kconfig warning.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tpm2-tools/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/tpm2-tools/Config.in b/package/tpm2-tools/Config.in
index 0dcf176dfd..abe6aa5689 100644
--- a/package/tpm2-tools/Config.in
+++ b/package/tpm2-tools/Config.in
@@ -26,11 +26,16 @@ if BR2_PACKAGE_TPM2_TOOLS
 config BR2_PACKAGE_TPM2_TOOLS_FAPI
 	bool "fapi tools"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_PACKAGE_MBEDTLS # tss-fapi
 	select BR2_PACKAGE_TPM2_TSS_FAPI
 	help
 	  This option enables Feature API (FAPI) support in
 	  tpm2-tools. The FAPI tools are prefixed with tss2_.
 
+comment "fapi-tools not supported with Mbed TLS backend"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_PACKAGE_MBEDTLS
+
 endif
 
 comment "tpm2-tools needs a glibc or musl toolchain w/ dynamic library, wchar"
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
