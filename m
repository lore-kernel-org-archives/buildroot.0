Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B004CCD4849
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 21:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B09840A65;
	Wed, 12 Nov 2025 21:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bnnEDFaDTU2e; Wed, 12 Nov 2025 21:07:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 816BF40A76
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 816BF40A76;
	Wed, 12 Nov 2025 21:07:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3403E158
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 21:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2521740098
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 21:07:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UGemUEAH374a for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 21:07:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 34BB94004A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34BB94004A
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34BB94004A
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 21:07:11 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-42b2a0c18caso76462f8f.1
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 13:07:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762981630; x=1763586430;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DrMkg7lpsqh7Fnsos2oWxKYF7ZF2U+sTpTUtJMmp2YQ=;
 b=QXftocVH5L7FyO2eoBv46/pfWp4BxiqnctFsHHF5j1JZ9o1W8Jj6+tbNyGO5jWEbTh
 jZFRlMxbBOYi3YmKcjOP7X+xwRxFc24ihKJwclBqgfNh82yV+VlEe72M3E8IOB/0NhG+
 q90M//sD/H3kZxtMazJ8hBaGajLMpy1qbjK+57vm/iNVa/+8U++Pd70Lx3NndxvKPzqd
 R6sDL13uqsCrAvliwPJKFC69ORLXDv8FmpvxWsye8nZTaIGRX8rZ6lcuNCCtyXUv2yei
 Lzx2xrVZqrMzeXaMRQeN2t0VAR15knNjOvLkMM2Xrjln9A6PV/TtXcqWjfIy2sJDojfC
 OEfw==
X-Gm-Message-State: AOJu0YwJERtuyScEBThiQhuyAEKDug6Z2U2RMeEKdf2IEly9665QbeyG
 9I12g7wK5w7NBagdiioXDg8iBkAgd4VxQP5WONiTI4LecJjCifCilV2WtxJrWl4YzkuLXezvPrt
 rZhwIQ7s=
X-Gm-Gg: ASbGnctqXrL52vXKL7jfxQZu9MKePlLoi6LnYNVTqleMtXxI8OeoRoSxrFY++fmvi5y
 3HSLms8jbaREqNxO2bcFoD3HMu/f/jSUunScS7bwpNIPaEZ/lXu7mw4rmH6WISZFYsC8T+P5P/b
 EXGutEuO+/asqmdwv/LD1bHKA5L7ru5nZzN0BRtbjDm04VOGiXVgJC1KGK7Z/zevHuVnY8gR7bO
 fzEpHb18kQrY4LN4LO1iLvvDcEjh9tygqghDWRwmpBCMoZ4GGm9VUjRvFGaJ6WDn/QWrlF6YAOL
 2FedzbJGqnIUz0aVGbHxuDzNn/O4jsfiy4/aAe9+KyJ7L5qkJx8GjDpQZ8g5fGlhktWaoXdRh6m
 BW73ITwOOC6P8Yx+Vz7Ul6XIAXZx0+bYdyVBJhBIg9Q/OJi7PKUXL7WRMtRJQv3tlqJcYOVsNax
 Vt6m+MClWcGYNOTsxAo/JTRQA03g==
X-Google-Smtp-Source: AGHT+IGVQ2B7XNjVyr7pI3JDB8UnDNZGZ4nJnkoZOgPEJ+1KkWg6TTneu6+E+k1sPN0jGqO9LhNMrg==
X-Received: by 2002:a05:6000:22c9:b0:42b:2a41:f1a with SMTP id
 ffacd0b85a97d-42b4bba566dmr4770496f8f.26.1762981629854; 
 Wed, 12 Nov 2025 13:07:09 -0800 (PST)
Received: from arch (77.109.92.201.static.edpnet.net. [77.109.92.201])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42abe63e131sm36623434f8f.20.2025.11.12.13.07.09
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Nov 2025 13:07:09 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 12 Nov 2025 22:07:09 +0100
Message-ID: <20251112210709.161454-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1762981630; x=1763586430; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=DrMkg7lpsqh7Fnsos2oWxKYF7ZF2U+sTpTUtJMmp2YQ=;
 b=Qcc0Ha0frbloWD10Gk9zHsNM4SFeNkV0Am3M2NfPJ3RvvLZE1ZRV4XyyrPFO+z16up
 IHootAGy/74OGAXztREqtOBdzMVzFFnfjgKjOFDZEjoqpuXx3xQWnSI1Sa5kBEucn/EY
 vLy4vd6y4bCHggt1DoIQy0kK4vnizEzi1ZytarTP5FXcS7uf2TRMmdPuhqAgg7bpySUe
 j7kiv7QR0O0HcPdNu3TrEC3NELvOfkx7golxiVYdpBqs92ZBbubaQiocZ3wULoL0Ejuy
 vEvUavFQivqs85U8ugY10yM5osAXaM1u2BWCkQhErrfZldZ/DlbG+ZMpaaKhRGJadyGT
 i7Jw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Qcc0Ha0f
Subject: [Buildroot] [2025.02.x,
 PATCH] package/tpm2-tss: security bump to v3.2.3
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
