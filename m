Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF569D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 09:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 772FA60B67;
	Sun,  7 Dec 2025 09:28:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DRprCXEGPh-O; Sun,  7 Dec 2025 09:28:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4CE060B93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765099708;
	bh=5A5eB1zvbuoYuxkCIkP3A/j1yBz2dIRhX7cr2O15tPM=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=T9tLYq3aVXo8Ji2Cgzq3qKbIY+idts9AdPkroYUUVYYptqYTKZb2c6ann1kgHQuK7
	 fxBfVaZ6HLHralEzTUmvjYNGHutfv+2nqX+1ma2Fb9xNsZcodtkvmp4itX1MkjtU5i
	 lOW/z/6IsAuMH0Sbi76vGzwxSBrBHNYxrMakvuHEEb1qpUN0Lz7ccIJMIopQCKfjpR
	 YiL7o3Tnw5MyeMEbPiEY4/T0e6khYk33v7EB889AcGK8yg/azYcySoq6lu1muis3yO
	 Aj1FW8X7rci7qBQkhEg9RJDMoHCZIATVO6BGoQpA7IxDfS4VWKyfGPToVVctOPaadh
	 Ai3ZqIiKjchyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4CE060B93;
	Sun,  7 Dec 2025 09:28:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A1D642F0
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 09:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 885C383145
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 09:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yV90foWpVHLx for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 09:28:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5DD1A83104
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DD1A83104
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DD1A83104
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 09:28:25 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-64162c04f90so6342217a12.0
 for <buildroot@buildroot.org>; Sun, 07 Dec 2025 01:28:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765099703; x=1765704503;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Kz+W4/4lsTbpEhgp2/EQSuoFoT1e8SOV36oj/yIxvTk=;
 b=RRLMarqhNpQm7c4h3RICBfRclXC+VHQMkMV6MReo+uqxVJCHCRHlxkJp9606zSQb0I
 0jRWFSJbRz65A8BI5E7gE1iJ6tWLPyhdEwVBaZMYeRY3brYuFMurnBmlwVbZeAuXW2/6
 GLI7GONu8sDshxo0bnyVTe1j9UZx5mkfj3QfypNUlvxyv0Zno+yx9A/iYwPXMhPr10EN
 JAQMx8VehI/ghbl4gWvtMWDnu8OqzcQfLidRav0wXG6ohcDm/dhEIWQeByjTSEr6S1t2
 an2OGJBULFILtejkROhFFbsp+gllWzlFl3vpVYt2VKEr1KkAT8bMFs4hhiFDSJsG1KKJ
 iOUg==
X-Gm-Message-State: AOJu0Yxbi5OjJ0xFJIzzyYtnw6BK4tTgnHyVTg1BYnLVIU5Woruy+xua
 /lrXTAAHochtYMOFcwn0vT6I9rHgq27oC3NwiKxlCWtb/1Bjza6jmbjJ+08kWpzdFoET/eQZjb2
 +0XPonZI=
X-Gm-Gg: ASbGnctwttyMCfd7d0XY9vNcE+/Gwm9H0Cuf/u+K+ri3sPEQsuleZ1gjlgUdQra6Xli
 k6YKAwXPuY7NU/S3c0JQGWhcWfWM/Wk+qKzMUs+bCFCt3m91Wa/gJbEqav3o2XCdz4XgbOtm2BT
 3WA7MvF2es1lErhk4WJFqj0A9o4d7RWSkZkEMw0pD9EFiRUwtJR21QWuu370JkEjXWqQ+Pf2xUs
 mAFuWOjoQvcBAKQSZ9CeCDxeRqtijqzvnZ1oewOrJuiEnWo3D+j6axq2VAuAk7TeYxBtPD2Ln+u
 pItFkQPRRowzOwmEw5tscj5LdQzw+GG20C3K0XxdiYQm4sjL1m8aPDp8Ns3ZBtCRzBrj7Av/5Er
 ETbxPwDNpf/slYKLM2qAfRZmJ5VbyEgtSpcKu1wbsrBuyNm2qQq2GvgHR8SUon5wZ0rjG2z5Wiw
 vA2BR+
X-Google-Smtp-Source: AGHT+IFSAhjJ+MI4kNAh0ZPTK2CHanOtVSwdQLI7JHY698P9tic8U0aeG2TrcxItu2Bp9Vg4UIngPw==
X-Received: by 2002:a05:6402:27c9:b0:641:2a61:7da2 with SMTP id
 4fb4d7f45d1cf-6491a432fccmr3794321a12.17.1765099702269; 
 Sun, 07 Dec 2025 01:28:22 -0800 (PST)
Received: from arch ([79.132.236.244]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b2edf54asm8319025a12.10.2025.12.07.01.28.21
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Dec 2025 01:28:22 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 10:28:20 +0100
Message-ID: <20251207092820.109515-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251207092820.109515-1-thomas.perale@mind.be>
References: <20251207092820.109515-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1765099703; x=1765704503; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kz+W4/4lsTbpEhgp2/EQSuoFoT1e8SOV36oj/yIxvTk=;
 b=M1qcxmHvIPv1Ti9RWvLtvhRNjRP9ISJgF7/1zXqZh73ioIQ3vf9jlr0uYWQtXjukx+
 RwlnyeZBR2aYK+S4xqVmljZ2MLm/3VI/ZnVVHnE6LcW0IuMS3XOrI65PoGK0DbEJZdRC
 OHbDR7GtiLAy5wrREs3DnLqu1xJ8Qp7tvZf6mR8IwFP04BFKuxEczQM1sSAaYvS7VaTX
 mVnoJqLG+ExYaLFXn9gEJJ20eLtTy6WFd7XOx/rQv1DHEHyzejbX75oy52y91tlV68Ko
 yM6cyK3grD8WUJTM56fqau8Wkcw+tLA4Y1SyNQaYTMKtHWUao76+pAijBLdCsflW5M+2
 mwSA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=M1qcxmHv
Subject: [Buildroot] [PATCH 2/2] support/scripts/cve-check: don't fail with
 unknown CVE
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

The NVD database has CVE entries that are not present but may be
referenced in other security trackers.

For instance the CVE-2024-12455 is documented in the Debian security
tracker [1]. However, the NVD page is empty [2] and this entry is not
present in the NVD database mirror.

The following command would make the script fail:

```
echo '{
  "vulnerabilities": [
    {
      "id": "CVE-2024-12455"
    }
  ]
}' | support/scripts/cve-check --enrich-only
```

No CVEs present in Buildroot ignored CVEs are affected. But when
enriching an SBOM with legitimate CVE not present on NVD, the script
will fail.

This patch change the behavior to just log to stderr unknown CVEs
instead of making the script fail.

[1] https://security-tracker.debian.org/tracker/CVE-2024-12455
[2] https://nvd.nist.gov/vuln/detail/CVE-2024-12455

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/scripts/cve-check | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/support/scripts/cve-check b/support/scripts/cve-check
index a72547ab38..71f93afe64 100755
--- a/support/scripts/cve-check
+++ b/support/scripts/cve-check
@@ -271,10 +271,13 @@ def enrich_vulnerabilities(nvd_path: Path, sbom):
         if vuln_id is None or not vuln_id.upper().startswith("CVE-"):
             continue
 
-        cve = cvecheck.CVE.read_nvd_entry(nvd_path, vuln["id"])
+        cve = cvecheck.CVE.read_nvd_entry(nvd_path, vuln_id)
 
-        vulnerability = nvd_cve_to_cdx_vulnerability(cve.nvd_cve)
+        if cve is None:
+            print(f"The CVE: '{vuln_id}' doesn't exist on NVD database.", file=sys.stderr)
+            continue
 
+        vulnerability = nvd_cve_to_cdx_vulnerability(cve.nvd_cve)
         vuln_append_or_update_affects_if_exists(vulnerabilities, vulnerability)
 
 
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
