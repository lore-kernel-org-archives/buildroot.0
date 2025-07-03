Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA31C83030
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 08:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 434C940FB1;
	Thu,  3 Jul 2025 08:39:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N2wurqsPFUO9; Thu,  3 Jul 2025 08:39:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2651B40FA4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2651B40FA4;
	Thu,  3 Jul 2025 08:39:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 88BD7128
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 08:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E92040F9D
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 08:39:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2gD8RKn9hH2f for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 08:39:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=tim.soubry@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3C5E640F88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C5E640F88
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C5E640F88
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 08:39:29 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ae36dc91dc7so903839066b.2
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 01:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751531967; x=1752136767;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A7p5v1vQQk/l80cj9dukjQgjxFQrvgtEuhMH0qArncg=;
 b=UH8KJ/0+4y5fXh2eTS5JDGI4CUenpVS25F48jZHYJTR+moWf5McINqgI6ehSYuP9j1
 yHUMN45dqx5GWaTXWMf6UedJ5VdYOnEXzeB8h1QJXcRCVgClOirIw+8e0WBAgLiY7UWe
 RR7C7526kG8vwOmWQt/Dcxs520xQmehsgqjELx0wrAjwYVbBlRHCYAPKY2/pdkwW40tV
 PXxkRQ4XVznB76BjuEPM2miCd3f8lQS87u+AJhgJP0ykiZngvH8dI1GIskELEYl9bkUe
 tmZqjMC2uv54aQkh2c6gtP6xfamVoMalZrg3N0CAxL6xUlr9MqiZh56YWw+U0KZfxeNa
 rI1A==
X-Gm-Message-State: AOJu0Yw4s5HNfG3X4vOdP8AVN+eeauZ9iqT3hqHhIK79Yo/FEVsNMaav
 7X5fCE4SbL1ElDbjD7B508bD+HnkoEsNDA4puZiC8s4Wx4C5eW07K4Xytsn/lNxqWHL8tF0qO5t
 Grt04AMw=
X-Gm-Gg: ASbGncu0/gfwxZ6apYh0lKokCpdxttQRad984HLiTLdhM1W3KTdcyBOvdtpb2YSdcg9
 aUm50DRiVSLZZfASglUHf04zMqbb8uuFiH8sUwNLV932sk5jpXaALpdcGQAoFR2E9TrFYMCrshF
 mu+Am06igBMIraPQFurUmA5dBeHHPaqgY8gA21ae3V1wOtJl1TRh+lhdSs1EB1YjQ5iZrhHb8Ne
 6CCl9/VQZXvVwSgj0UOvvijbQaNHznjv2YyEswWZeAxqmNSOaigt0vD8CWQ8hMBLdiiEG3vv/U/
 NA/2tmpiQj8iS+xuNOaUIi4vt5u2liYreYtE9TiIN0hsMckCg77Ukd5kVGlAdkJT269tbCd4R5Y
 FcA==
X-Google-Smtp-Source: AGHT+IFlGf3l3PNmYh2lGPjCIA91/6fEwg/YuZkkiLm6GreM7NrqBK0TlIu16kD3xN/fszMVp0wZEw==
X-Received: by 2002:a17:907:1c13:b0:aca:95e7:9977 with SMTP id
 a640c23a62f3a-ae3c2d2cfa9mr650619266b.28.1751531967357; 
 Thu, 03 Jul 2025 01:39:27 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:65ae:b800:1718:12a8:2587:721f])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60c83223583sm10408551a12.81.2025.07.03.01.39.26
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 01:39:27 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu,  3 Jul 2025 10:39:18 +0200
Message-Id: <20250703083918.30310-1-tim.soubry@mind.be>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751531967; x=1752136767; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=A7p5v1vQQk/l80cj9dukjQgjxFQrvgtEuhMH0qArncg=;
 b=CAEzBDX6tcLXKPqoYcpW4NDufGuCPVCGB8AzrOwrih9ZSGsouRkXqKLGk6/Cyme1Yt
 beyAw7O0WdtZAJPlWPfa1nE1eRCp1fDlFygyPSFQLQAPU43lujUMVR3OLiyph0vWAgET
 x4sgJGC6o6z8hvH3v2i0UITxQYVzTw0oYi4/KAVvfCPyt8aIF/GZC0LG8U6B7/R1p+BU
 cVQY4ICREyY7GyRT72J2XI3UgtAtcwx2ou3kuIJ7hXFakp4N2FYIyLLS/aAVARWeqhYD
 ECHWUq9SfDFBRKSeOpUT5G3xMRHUAu9bvcP94lHMgFxbUvvlHmcsBRJVpWX/HR4AX92d
 F6jw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=CAEzBDX6
Subject: [Buildroot] [PATCH 1/1] package/sox: ignore CVE-2023-34432
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
From: Tim Soubry via buildroot <buildroot@buildroot.org>
Reply-To: Tim Soubry <tim.soubry@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit [1] introduced a patch addressing CVE-2021-23159. Since then,
CVE-2023-34432 ([2]) remained the only unresolved CVE reported
against the sox package in pkg-stat.  This patch adds CVE-2023-34432
to the list of ignored CVEs for sox, based on the report from the
Debian Security Tracker ([3]) and the sox issue tracker ([4]), both
indicate that the patch introduced in [1] also resolves this CVE.

[1] e2f856d18d package/sox: add fix for CVE-2021-23159, CVE-2021-23172, CVE-2023-34318
[2] https://nvd.nist.gov/vuln/detail/CVE-2023-34432)
[3] https://security-tracker.debian.org/tracker/CVE-2023-34432
[4] https://sourceforge.net/p/sox/bugs/367/

Signed-off-by: Tim Soubry <tim.soubry@mind.be>
---
 package/sox/sox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index 3c9c939e8c..9fd3f2151c 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -67,7 +67,7 @@ SOX_IGNORE_CVES += CVE-2021-3643 CVE-2021-23210
 # 0007-hcom-validate-dictsize.patch
 # This entry is NOT stale, those CVEs are not reported by pkg-stats
 # due to the change of CPE ID to sox_project:sox in the NVD database
-SOX_IGNORE_CVES += CVE-2021-23159 CVE-2021-23172 CVE-2023-34318
+SOX_IGNORE_CVES += CVE-2021-23159 CVE-2021-23172 CVE-2023-34318 CVE-2023-34432
 
 # 0008-phere-avoid-integer-underflow.patch
 # This entry is NOT stale, those CVEs are not reported by pkg-stats
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
