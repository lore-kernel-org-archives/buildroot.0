Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9211CD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 09:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F4D44225E;
	Fri, 29 May 2026 09:45:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-F9zpr1c91Z; Fri, 29 May 2026 09:45:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD53742294
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780047925;
	bh=c4VF1/+k+0EhfdEI3MZ3ccbyPEUwKdytxOb2ruta2A8=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=hAO8i7rNrp08lSlyltaw5nrRdTDczR4tJAzM91A4tebbQJhmyTmLmJzLn+2ZEMEpQ
	 f642TtCUoSWLxBwaYCk4CqVsd7XpRHl79ioLGcJaLwm7u1mXift6S5d7MBWqDJsCJx
	 JP4He74GOZ+WAxqOT6qdlLuyb0ru54f9gzeV4Azfvbmc/wUEJrBgAGZCrn0Z90K9XG
	 0tsrCFLpAM42MeNEIC5xsgqOK/5UKfWwqniC4OaEUZ01sSnmJNqGLvzijV5OX6wJe8
	 CGAy9dmFLAdwAapVWumGXcbV/1uMCJDjp3eCAY1Afzp7aGnm0qM+MwyhYrwFKH0Dvy
	 EEehyeMzaDFdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD53742294;
	Fri, 29 May 2026 09:45:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D3775D3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2AEC42209
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vzlsNTaGu5FC for <buildroot@buildroot.org>;
 Fri, 29 May 2026 09:45:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7748B4217E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7748B4217E
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7748B4217E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:45:19 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso88470025e9.1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 02:45:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780047917; x=1780652717;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rpWeWP4M8vhRwHs7F71/3VgHAY6zFqyyzJdaPaoL4Pg=;
 b=etP3gQFMs/sxL7dWpIY7YqcHhQAylWUp1ljS/zkSAQQ8X4g2ahsk3JXk8Ixu7OExt2
 L2u8IqXoMbz8OaasKNNvxLzLdlY9wIk5AAOPQFeU7aztldgcfLGquJ8w2grczcpgxNWv
 SA/HfoEC2YRlj7T6qdiqnaKJHdr2gCVPmKhyefb+KFoP3yCEaAMgQ9OFSOrWZneGqw16
 2tJpiGA28O6DFqWbD3F8IxJeefV1tI+geAASv7VPDJIeWi4X0d45xad/ahBLIkexMX8x
 S12ZDcnboSfasBVwPFH3VgOSuz4QSVNsT7PoARzFPgr3ErxZ6nmfT+PmVbwVtxy9Cjmn
 X7Tw==
X-Gm-Message-State: AOJu0YxcnNSUrIFabohDXl0hl7wYElzeHaH89t6faTV+1I/pEOThmujm
 G88FCrZLW+hGISh3GYF923+2//lDmyMvvLHsK/BeSYC42xwIQRfD4ZOp2lviaa8RBxxbCtzE00A
 EJDTN
X-Gm-Gg: Acq92OHUXafqWfV/+gvY5ntmvI4RNURbWLMuYBWi2MjWgZM4ep1L0Q4kPAUhm8NXVXn
 BeHw9COZzUNyOyzEEQ6S1gBLTVx1cBjZ8dNMl0dSZZSBLS+/QImlXmu/vg7p1pk2ch50oEfieXI
 APmfwxhdiibJ2vQSnQfFmy6KHXdvkLgulX1HW2yQUQsoLUhs9Wsehd/sIzXvbUEKWo/yigawnJc
 ynIHEz1N9m2c4OYq37T32v3XPWCZv7ywFi7db6J2OsgOKe5vFYonkjw9fLGm/AuWvef9cZMj9ki
 zvKfLexGvQyuJgC9Xkx+wafPMCCVVYZOK/jkcv8wik1RRoy5CnzPfW9y91aOlbCc0mid80tGPwb
 1jnAkW/Aj5tzC53ErRIZmP8cWfhC7PjdEytJF13gkmyevPf/tKT8SVt/JZXbYzXLaFjq/+jGB7Z
 yfddL6MH7xwdmwTyQ8yF5U8Q2yO23Faiqup7eMBIa9fg3HpCfzBabCZuzzHA==
X-Received: by 2002:a05:600c:8582:b0:48f:d1c0:721e with SMTP id
 5b1f17b1804b1-4909c08951cmr31629185e9.12.1780047916932; 
 Fri, 29 May 2026 02:45:16 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c1035ebsm14349985e9.5.2026.05.29.02.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 02:45:16 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 11:45:11 +0200
Message-ID: <20260529094514.178266-4-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529094514.178266-1-thomas.perale@mind.be>
References: <20260529094514.178266-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780047917; x=1780652717; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rpWeWP4M8vhRwHs7F71/3VgHAY6zFqyyzJdaPaoL4Pg=;
 b=fchqzMW8FQ0ZiFM7nCy28EaWv4OtS2LDwjtuYzieqDvbPGu7xosDCvqgd5Vcknv+6k
 C/mRdMljW/NkEHvoJ69LC3kj2ZRw26sVtdI4JhdiEiiXsLkdypOog8uJmMuPj2MqwNP3
 zwF1BWB5bHI/MG5vwBjKQnsLiH/SmJQ2qki5FaLJNFj6wDhBIbr4y7l8SQ5tlnGToByX
 yA4noIHWQEZovumefWZkAcz0sjOwJY4rDxRYGjbzr7seAYCKkg3C7MvcrI/GqM7aSTvp
 gxsorlfP2qNJ5+O6/MccUDSb/jMnEWXsxUbYpbnuIiHXtOiXzxe84DFKrpyOI40viQn0
 6dpg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=fchqzMW8
Subject: [Buildroot] [PATCH] package/cups-filter: update CPE vendor
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Daniel Price <daniel.price@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Olivier Schonken <olivier.schonken@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CPE "cpe:2.3:a:openprinting:cups-filters:*:*:*:*:*:*:*:*" is valid
for this pacakge.

See the GHSA [1] and the associated CVE [2].

[1] https://github.com/OpenPrinting/cups-filters/security/advisories/GHSA-893j-2wr2-wrh9
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-64503

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/cups-filters/cups-filters.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index dcfb2e9500..f2b85aa9d5 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -8,7 +8,7 @@ CUPS_FILTERS_VERSION = 1.28.17
 CUPS_FILTERS_SITE = https://github.com/OpenPrinting/cups-filters/releases/download/$(CUPS_FILTERS_VERSION)
 CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
 CUPS_FILTERS_LICENSE_FILES = COPYING
-CUPS_FILTERS_CPE_ID_VENDOR = linuxfoundation
+CUPS_FILTERS_CPE_ID_VENDOR = openprinting
 
 # 0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
 CUPS_FILTERS_IGNORE_CVES += CVE-2023-24805
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
