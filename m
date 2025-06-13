Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB54AC71135
	for <buildroot@archiver.kernel.org>; Fri, 13 Jun 2025 11:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BAF140A4E;
	Fri, 13 Jun 2025 11:06:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RH1QZ-H_L3kg; Fri, 13 Jun 2025 11:06:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB432409D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB432409D2;
	Fri, 13 Jun 2025 11:06:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 113F21BD
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 11:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 038C44040E
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 11:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0xRsnZihPrPn for <buildroot@buildroot.org>;
 Fri, 13 Jun 2025 11:06:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 65B5E40059
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65B5E40059
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65B5E40059
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 11:06:07 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a5257748e1so1513527f8f.2
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 04:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749812765; x=1750417565;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/wZzI/2WDZCta1mGn/vPr+M4t1Y8kyAyXbp2UjKh3j8=;
 b=OBgpGM2ojK7MOxqRNEpGtKdOAFw505YziM6XxZlP+0dj94yUpNDdtObG9I7ACD/7so
 BipbPGqv6QemiSi5hVByvFQZl1AM77hVs0P++gVh9JqCmIOH9B6ycvWRUJWCAN2W8iiw
 hWtt2q2pDNFL9lLw+zFfJE2ZS9RLFRxJyzX6DBs7tTUunc335E+MBJtnzbjObicIKe7R
 EESCMZX/mvc4aNRMhqiIzf4GUOuZ3O5QX+t5AmmJiovpcPzka8L9h6T136356tQcZ1G2
 zTv+ToluxVrELtThrPDaT556SP015cEFzS7WdwHg1soqSVZFOFkLwpo87c+6NGZTc+V2
 DpbQ==
X-Gm-Message-State: AOJu0YzAQ+SbtlRimIZRtu7BI3qGVkZiCmuCBaaJT7Wfxxhd3dNjXwuG
 1LEchV9SIxBinHpL8AKtzNuevzYetIr7qwCsbj+326jnlzFZqt+9sLEmE7/96Ti2xSlSYEm0Y6b
 PpjeQ
X-Gm-Gg: ASbGncsMbTQpfHPtN8hr8ZAD9Sn5KPXsV5aEPJ4Ah/coT6+OJeOM6b2RCjniNYswJy7
 Jubv9kFht8nbYgw11v1cHjrkQrIf4hfLRKd1/IVFCvwm8JhnIlNF5bdiu7FSidfKZ21vpJJ/Pjs
 cvOGsuJyfqB6Jjy8cHoRObz5UgPojOq4w09vtrynOTrYdMZr9jaMwtWfyFzqaANbDnNbIxLhBIb
 xLLqCmNmCAz3DPxZ5C6P0w8130ncL4xsKdP6pOCPiJOu2LqTm52px9FFrgGkZ1WxF8C+oTA13GJ
 0a665I99LSKfcxpJMDLa1T9v97e6NVQEzdJXVKkvMTYLGu2nEgpie6D6xZ/LdCkjGZlYRhcRAdU
 =
X-Google-Smtp-Source: AGHT+IEdrAbQCM9zIl4W6twpW5J4308pMSzlAgdqm33D6iOKBSN3H2NvH3KJa0DW/UslE8eBYA9I+A==
X-Received: by 2002:a05:6000:4024:b0:3a4:eef9:818a with SMTP id
 ffacd0b85a97d-3a56875d38emr2593425f8f.27.1749812765057; 
 Fri, 13 Jun 2025 04:06:05 -0700 (PDT)
Received: from NV4XMB-ME-MZ.. ([2a01:e0a:943:83d0:e0a4:5913:a608:fb7f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568a7f8f9sm2060459f8f.42.2025.06.13.04.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 04:06:04 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Fri, 13 Jun 2025 13:05:58 +0200
Message-ID: <20250613110559.2665663-6-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613110559.2665663-1-fabien.lehoussel@smile.fr>
References: <20250613110559.2665663-1-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1749812765; x=1750417565; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/wZzI/2WDZCta1mGn/vPr+M4t1Y8kyAyXbp2UjKh3j8=;
 b=AbKSLjmJZJyzC8NDgEiBKg2Fbj2SNGt1TQznB+WTDqCa4QAnKtwuqcpKUV8IU32NeN
 t21r6RoeIChDgqYGNX8gOzuNxtot0b7mSa0tbIAT9lixrodOzy4ZoAF598PBCh2z1L69
 mBLVdhjzctDtH8P+2Kl6LI40qu3s637fP3wlY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=AbKSLjmJ
Subject: [Buildroot] [PATCH 6/7] utils/generate-cyclonedx: add source field
 to CVE entries
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
From: Fabien Lehoussel via buildroot <buildroot@buildroot.org>
Reply-To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adds the required source field to CVE entries in the generated SBOM.
This field is mandatory for compatibility with DependencyTrack and
other vulnerability tracking tools, ensuring proper integration with
security scanning workflows.

The generated SBOM has been validated with sbom-utility
(https://github.com/CycloneDX/sbom-utility) and DependencyTrack
(https://dependencytrack.org/) to ensure full compatibility.

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
---
 utils/generate-cyclonedx | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 1cbeca01ad..30c0d48857 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -229,6 +229,10 @@ def cyclonedx_vulnerabilities(show_info_dict):
 
     return [{
         "id": cve,
+        "source": {
+            "name": "NVD",
+            "url": "https://nvd.nist.gov/"
+        },
         "analysis": {
             "state": "in_triage",
             "detail": f"The CVE '{cve}' has been marked as ignored by Buildroot"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
