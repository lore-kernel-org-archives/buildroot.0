Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E22CD4849
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 21:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B19C94091C;
	Wed, 12 Nov 2025 21:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qpJKlNPIZ3R2; Wed, 12 Nov 2025 21:06:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79DC040900
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79DC040900;
	Wed, 12 Nov 2025 21:06:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E0F10186
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 21:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D15A64004A
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 21:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ctCSh7_1BSAi for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 21:06:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C9F5040098
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9F5040098
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9F5040098
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 21:06:45 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47778b23f64so1001955e9.0
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 13:06:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762981603; x=1763586403;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DrMkg7lpsqh7Fnsos2oWxKYF7ZF2U+sTpTUtJMmp2YQ=;
 b=mQ7G3MZ0rNSnu5ctsbkOEN84yTwgchOd/zZcv+gmgcJphriaxZld7n+RbtTLapZ/Cs
 LJnMphron5uB6mVlG9Duli8AMEWQxk7dnxqxktFvUgpwghOycwJRQRuQ1lZaG/8UagXY
 3aIpgneiJKGIolNpgZE0w4dMuK139ngB/+iGhd+1pnj2eqtwh8z/tTFneHbld/0fU63D
 6jcJzcyZMKwZaIg6Ou5hyWuLYsEmK6QXyLnRnI6/5V59xCrfEGwAiJn0udNYFZgpkC62
 C0vS37vmVkZOmxt4l4E/rnDbscBCq5+zEaLLWob0Qxa98MV+xBgdamYtpWK8dbb9wutS
 3w2w==
X-Gm-Message-State: AOJu0Yx2vpByG/3G+qPbbM+sR12KnUC1Q5xwRa54oLKKFTEuR1aqoZuY
 3BckDE19uqnAcrvgSfEOuPJtDOrLiUo4zMuFcqBgbG+Xfpddfb3JqzJjDObLlU77zM33dh4Q8KG
 OjdMbyyo=
X-Gm-Gg: ASbGnctvYzoG3tN/XYqL12N5YZu8oEBhtz3nL8VMrS+atoWjOGWPnr+OXwqcqeqgpKE
 YAXQrdCPRXgvMYzXbfw+nhQrR0klgLTHF4ibnMGojaiSZJJolWTtZrViU8H/6ycYgUhcJc9763C
 YG3Mc5ozvJaw/arCl6Fi+jEi0SvfvvH1UBYNyyTWw+G/6383sw06wJM2bbmHLYoLSGwg/iNRwRZ
 1t1+Oz5dE5lrRczll0bK/Fivz9B1zWuRVh0Zf7A3vuEXHOFNBCKcikC+TLtfpmNa8Y18KBJI0Ta
 1+CyydUjYlUDUYTJpJTMtPIbrm2hObzRpEQGoYTRrKPee6kFHzIKa7FZXO6l1ApX0hlC1KSMaM9
 Jb05tnKDThhk6mQODIDPPUbFrgHWJe5zNk/azFKprTz52Dry4pmoKdAljLFrodMDx+0MVXAXNqV
 f5x55Lax5Z8Kjm5pnth+fbSC0bF1OUD9EMegP8
X-Google-Smtp-Source: AGHT+IFY+j3xdvMPTJcd151ILjoMknLcE2QOu2kkK6+qS8erYEXjrj04wmmamzuWywpVSMDOO4RF5Q==
X-Received: by 2002:a05:600c:450d:b0:46e:2cfe:971c with SMTP id
 5b1f17b1804b1-47787001e9dmr33186735e9.0.1762981602831; 
 Wed, 12 Nov 2025 13:06:42 -0800 (PST)
Received: from arch (77.109.92.201.static.edpnet.net. [77.109.92.201])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47789ffea1esm32135355e9.13.2025.11.12.13.06.42
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Nov 2025 13:06:42 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 12 Nov 2025 22:06:41 +0100
Message-ID: <20251112210641.161073-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1762981603; x=1763586403; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=DrMkg7lpsqh7Fnsos2oWxKYF7ZF2U+sTpTUtJMmp2YQ=;
 b=IpwWf9mbasY2lIvS6R5HbnvuMrNETabeXDkXQA8rL9U9aZZFHxra6uF0f08BXk8jEa
 6WA41OzMv+GAuOm9eVmzp5QaBczlGJbWHz4yp1vPdsoos09Xk4Du04ddzUihccUJVBc8
 h2nMNOdJeIvRz/FNVPCrSWwVXVYjeUfU64JPOVmfsA18Hg7Sfoq2VfJVsutb79K43MXZ
 us5S/qShIEi3N+MQ6fcQRUtvYi7L897IbVH6c7s3oK3oGGOJmPPTksJvyfM74gZzEsEm
 ldYEfG4MKIwPaDYkdqNAQ5cM1GW2GBWINrWaNW8kSrzbTK37RMaO5J/FymzWj4JEVr7y
 maeQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=IpwWf9mb
Subject: [Buildroot] [PATCH] package/tpm2-tss: security bump to v3.2.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For more information about the release, see:
 - https://github.com/tpm2-software/tpm2-tss/releases/tag/3.2.3

Fixes the following vulnerability:

- CVE-2024-29040

The JSON Quote Info returned by Fapi_Quote has to be deserialized by
Fapi_VerifyQuote to the TPM Structure `TPMS_ATTEST`. For the field
`TPM2_GENERATED magic` of this structure any number can be used in the
JSON structure. The verifier can receive a state which does not
represent the actual, possibly malicious state of the device under test.
The malicious device might get access to data it shouldn't, or can use
services it shouldn't be able to.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/cve-2024-29040
  - https://github.com/tpm2-software/tpm2-tss/security/advisories/GHSA-837m-jw3m-h9p6

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/tpm2-tss/tpm2-tss.hash | 2 +-
 package/tpm2-tss/tpm2-tss.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-tss/tpm2-tss.hash b/package/tpm2-tss/tpm2-tss.hash
index c9fa4e6ae0..d8730ba0e1 100644
--- a/package/tpm2-tss/tpm2-tss.hash
+++ b/package/tpm2-tss/tpm2-tss.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  ba9e52117f254f357ff502e7d60fce652b3bfb26327d236bbf5ab634235e40f1  tpm2-tss-3.2.2.tar.gz
+sha256  6279a9a1983ea6ffe41925067b7f0de3a6ed95020a30e7c97d80fa2754259534  tpm2-tss-3.2.3.tar.gz
 sha256  18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index 81a1a0e59b..095b57baea 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_TSS_VERSION = 3.2.2
+TPM2_TSS_VERSION = 3.2.3
 TPM2_TSS_SITE = https://github.com/tpm2-software/tpm2-tss/releases/download/$(TPM2_TSS_VERSION)
 TPM2_TSS_LICENSE = BSD-2-Clause
 TPM2_TSS_LICENSE_FILES = LICENSE
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
