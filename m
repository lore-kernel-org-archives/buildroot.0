Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504A810F9969
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 19:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A21D60FD3;
	Wed,  8 Apr 2026 19:34:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bzvGPPXdLZhK; Wed,  8 Apr 2026 19:34:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48E1260FBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775676847;
	bh=hYafktai1CixtKooFe0aKOJY0v2NIY24nv4ST52DrL8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l7Med/MrL1Krjdf6N6SzrMxo3fn6T9eVmRPRqXqGSwlVvRIYSd14J6DBECdSgdyze
	 I2oJf2z3nPBR4MNlpQwgIBDsH9eoZjdXqG2xgStEejeHDgfALP1972bE2gSCHSTIRm
	 Ym9Cj8CX/StW4yvTzgaFzdywgvzY0mO7tBfElIG1oo1BXnoW1UhwvYciKsd8yZpDUo
	 TDXDqBg8PAEWgMMFEwFqQ/CjSLGrPZxNRulClUKePPM9U1lCzEQ+6kJhlTMmsEmmZO
	 7NGtKcypiya9bEol/FiSq8Pu5/cZr0Neqg+E4VPSwpfB9JAsr51GInnyn3Hb1r4O5/
	 XpkKN+K6KHOdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48E1260FBB;
	Wed,  8 Apr 2026 19:34:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 508571F6
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 19:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40B214062C
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 19:34:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5MvuRtpEQGxC for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 19:34:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.56;
 helo=smtpcmd0756.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A808A4006F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A808A4006F
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A808A4006F
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 19:34:02 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id AYf2weC6stpTfAYf2wsLDy; Wed, 08 Apr 2026 21:34:00 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  8 Apr 2026 21:33:58 +0200
Message-ID: <20260408193359.4047938-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEBHeYAQSyY6FwWwXDmzpAxbpKxdC7UAuz9lHpu/wSxs6/x16WVGH8FqtZwa+zvYPmxY2lF8xmF8Eg1iImHfXo2oePBxtCDN+FgPJyP+FjY6I5+3XYwQ
 5ViOkVQ1IsuVmOSGsrtVk/FDCe+y0AqFqh6/9/a6E5z0MOFbGCD5NNhk63+NF5rQtkH1QmLVXDfW2OoPmPjyQUeKFSm+4oeQ6jgjQXv1OSalHkjdgJqPd2Qe
 aRKyHSsh4zfRyaiIQvejvZCGDT75f4745B0xZDkc543jSc0SEWDj8bPnlPVYUqvoN8lU0NdQsbrnNWiYTpyD7dLB99xBppm4Lo4D5p9Jj/yJG++3sNoMt6CH
 8ZHldZJE
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1775676840; bh=vHhsqmnnso5K4uBdod54mxX8un3L8h2ghjvCeNfhMC0=;
 h=From:To:Subject:Date:MIME-Version;
 b=oNVepnkgHh6i7qrLUCVQxlc6Hv5x+Htn21Gj25vvQKQzfXH7M1NPau/WNxMNB6xEz
 2nc9b2SelCZWp/2QfLMWrcXZIS10hiLLTdmuX2FK5z1vu6r7alJScFGjmgYtBrTo7G
 k0omJXKTysDqCHGrOC7Z5JEaMonWLnkbTL7R2WuxUH0He+PhNsZ86PEuk7Zarw+SY4
 Y7gQRpD6L0aU5pv339R1echQ6Os/J946orNXunpAleEXu88Necrp03xjaUkzhcJ0fF
 yH42KovcTnObFD95qI6ttHiL8YPulC3Qplc6f+tsYZvWBpWKmECxH+xc5tM4XPMxhP
 dY4RgacMs29bQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=oNVepnkg
Subject: [Buildroot] [PATCH v2 1/2] package/libnl: enable host package
 variant
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

host-libnl is needed for host-nfs-utils.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* drop HOST_LIBNL_INSTALL_STAGING = YES as pointed by Thomas Petazzoni
---
 package/libnl/libnl.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index a0441b7835..b1254d2ba0 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -13,6 +13,8 @@ LIBNL_CPE_ID_VALID = YES
 LIBNL_INSTALL_STAGING = YES
 LIBNL_DEPENDENCIES = host-bison host-flex host-pkgconf
 
+HOST_LIBNL_DEPENDENCIES = host-bison host-flex host-pkgconf
+
 ifeq ($(BR2_PACKAGE_LIBNL_TOOLS),y)
 LIBNL_CONF_OPTS += --enable-cli
 else
@@ -27,3 +29,4 @@ LIBNL_CONF_OPTS += --disable-unit-tests
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
