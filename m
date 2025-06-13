Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7C0C61DB2
	for <buildroot@archiver.kernel.org>; Fri, 13 Jun 2025 11:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0753240A89;
	Fri, 13 Jun 2025 11:06:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wNWWaaYyRprR; Fri, 13 Jun 2025 11:06:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CED5640A73
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CED5640A73;
	Fri, 13 Jun 2025 11:06:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F63E1BD
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 11:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28FD0409D2
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 11:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yFXyPQDnN3op for <buildroot@buildroot.org>;
 Fri, 13 Jun 2025 11:06:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 29042409D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29042409D3
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29042409D3
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 11:06:08 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so15187085e9.0
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 04:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749812766; x=1750417566;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O5egw11CHZbvZvY8Ckqzl1pxKLJAdRlIWoYVYrscnJA=;
 b=ofZwhPJd2cB0VC1uEQw8gnGgk6uQr0NNRzeadAm0DYB5ulLzEZe0cNfK10xObjOrBE
 GyyIcGQlBt1P/gHyt2JwwDgraVwnJspa+7EwCllz8coOyuH1SvfbMnPTyDjd/5cdo238
 cu9m4Td6o670J2bfRrXYiRaylOC87MEJCEfPGxBHD9f8kmmznNvSZXLRQrpn7T+YO1PL
 dUHQKKHpPqzX7TrARddJTaQJ86t2xfSbWKJl8uPKyvLCxy2d5SitmyfZC93LGXnWxMFA
 E7LeebrN7Xm6YvoAKFCjTMvfACDck6uBYwPXuwy5kgRUkfIGd14AE1J8/TwJMYqFvQo5
 S5Cw==
X-Gm-Message-State: AOJu0Yx682cJY3fQcF+LtDRWktx7J/mkSaAw9SYqv+AdxEDCI3H0mJPA
 i3kVELToN1eh+fTj+o3w18CZnQskY6Dclnw9u2aDT3m4e9Hx66DCRIWnErreeV6Cuu+MyJohsd4
 De4wH
X-Gm-Gg: ASbGncsHNMt5WTl4QEzsuFasBmDlqMZtXgoasDXG4dT9UGrigkL+uwL035U986UN9/e
 2saHXZJVxIAm+Limb/RLAPP6cmJVFJZaFdZ3KSn/B/oJC+J8ENMG+kuGU+hX3UPIK8Up7I12n4l
 ndOqGUy1/1BfNIhRV7/hptDTsz7jq65C72Prznj81u4DQrJSQ7O/aw1AYBtpCXbLO2gSNH4SizN
 iSOgQXZZfT4ntIrv8+A9wByJoLoy7Gsdwl6PCdYLpVrXCSFy2G9yb6F16bLoiWc2xsXzF/JWBnq
 rMCp+yghjuRzwZjWCwBDTEMcQUQbCfmPlZeGjPWOeGVF6n2JjN5QG+FckAwzlZI7ufevlX4lJVs
 =
X-Google-Smtp-Source: AGHT+IEIuEUbUgkC5GoVnLUKs/3ceVTjny9VGdph0i2tmFWHAKN+YR7rt0XivTRDxzsQXYWVz8qKtQ==
X-Received: by 2002:a05:600c:530d:b0:441:d4e8:76cd with SMTP id
 5b1f17b1804b1-45334b7be4cmr23447855e9.29.1749812765927; 
 Fri, 13 Jun 2025 04:06:05 -0700 (PDT)
Received: from NV4XMB-ME-MZ.. ([2a01:e0a:943:83d0:e0a4:5913:a608:fb7f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568a7f8f9sm2060459f8f.42.2025.06.13.04.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 04:06:05 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Fri, 13 Jun 2025 13:05:59 +0200
Message-ID: <20250613110559.2665663-7-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613110559.2665663-1-fabien.lehoussel@smile.fr>
References: <20250613110559.2665663-1-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1749812766; x=1750417566; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O5egw11CHZbvZvY8Ckqzl1pxKLJAdRlIWoYVYrscnJA=;
 b=ff9dufsGlNdbQzx/cdqEStpuysaKTsi96Em2vcAu3uldzoODlhoo+1KfakRvUT3SM8
 QpKT+bcngxX6LmI+z6jYv3bMsD2ZPJS7tu6bqTGa6CNLkraPWqR8IYOtrtQUeG2oBllJ
 Hlb8XbJhAAOnFYzC5/qMHest6aOuusuf/idD0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=ff9dufsG
Subject: [Buildroot] [PATCH 7/7] utils/generate-cyclonedx: mark CVEs as
 'resolved' instead of 'in-triage'
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

Changes the status of CVE entries in the generated SBOM from 'in-triage'
to 'resolved' to accurately reflect that these vulnerabilities have been
addressed through patches applied in Buildroot recipes.

This provides a more accurate security posture in vulnerability tracking
systems and reduces false positives during security scans.

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
---
 utils/generate-cyclonedx | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 30c0d48857..a9998e3fb6 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -234,8 +234,8 @@ def cyclonedx_vulnerabilities(show_info_dict):
             "url": "https://nvd.nist.gov/"
         },
         "analysis": {
-            "state": "in_triage",
-            "detail": f"The CVE '{cve}' has been marked as ignored by Buildroot"
+            "state": "resolved",
+            "detail": f"The CVE '{cve}' has been marked as resolved by Buildroot (patch applied)"
         },
         "affects": [
             {"ref": bomref} for bomref in components
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
