Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1B2FA3729
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5781381064;
	Fri,  2 Jan 2026 15:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4HM5GXEZbm0r; Fri,  2 Jan 2026 15:08:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7055380FB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767366488;
	bh=p0sH2uMdtMs4lJ7RGUEWwqnDCbx2KWPuSmhISjOv3zw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UQPrFW5d69I7LMTKlsaxlbgcjoyigurabJOHoGxvHDYxbXS/0GWvEPCaKVtfUdPPz
	 4zncS3DuSYm+7QO7Rv4h4G+FNcWO+jsIqWx4oan7rPI39RRATPSwD1PVVCaNUB4wCJ
	 WKJWnuqCr2mcjDimIdHEgMem4KBefWqSSYiuJfTvebf9AdvCrigTn4bc4nLF+yko6e
	 jd+/qNPgEAtH8lHvHwHJLeBA6SSRm78LE56bIgYtaI+8kjVXFNIBDHw9lksrRmBmKH
	 j6xSlvzJmHK9TOGDTucBbpvXU5R9PG6KcRlTxgN4UUBrolSHvEI5n4S1BiQ1MmJfxf
	 XcvSPQ2QowfDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7055380FB0;
	Fri,  2 Jan 2026 15:08:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 658A519D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58463400C2
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:08:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQVk8I5Uy8yW for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:08:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9752C400C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9752C400C1
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9752C400C1
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:08:04 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47d3ffa5f33so28020195e9.2
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 07:08:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767366482; x=1767971282;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6GX3aQfgx9PbFaO0YvaGtA22+iiB00Pa922IFSq3ux0=;
 b=uzGoz+jT+X6A9GOkA06NbLWtFxfqsMD+jJT8gd9vazZheqkUw1MmZ2snD8emFKFcmo
 XfUg//V3+TRfMSx4QkooY4RXnbtTZS3Z5GJlwGVMVaPyeQv6mNVzJ2yzbtbiuvXSf7js
 w7qFEZLWNIwHFPXbVeIxOtN2Tg+58Zy8v2bHGU386oP5Yv1I9Xt+iYYgzpnJ1Iz0QfSd
 FN1rZJDQKbyTWfcGnd4TIeSw2u7KUMQZuM/hbrc04VGymYeNTnzQu6Gwk9iNDVZqZqwU
 LISF9zGCrETn97QarCnYSxvijGMsDU72yTkvvbaVvEGkGH1O2tf0KapGS9ClDDrSwZsD
 ZtMA==
X-Gm-Message-State: AOJu0YwzBPzXTXZGbxBN27yeM8oeZfIBDwmuAjBKhVTHD1sJqjEp4ilc
 FHpHW9scioUJMsBwt+VSVmlw1jWjv5J9N5/sRS1kQBQCMJGFIXz2Q+pS+T6Plp+vT0SJlIukmxp
 lP87l
X-Gm-Gg: AY/fxX4eGFAIrT0/0/CH9cfyWdOt9DWzduPuiFFd1wUZacMvLNVIaDs03Irp7A8QHDJ
 vG3QlVpDXCKwD1LSPU6+xKb4JHO9r3I23ozrrnFfq95JehlB0SU1gZYbFblz2DEs0lf/qWZFOJQ
 iB1JVBrGTXuWE6Iu4X650o7Ycc9kJ/s6fZia31qJv3QbBcUZkRs+PYXieRL1hPxlJdvLlAKICEE
 djIjTu67LaXnaQ5wB2VOSsMsJpoKSPl/vUlm/wqoNKphEknNLpFsdXozuE+huOD8sSMpn97BgUO
 FzyE/VYRyVcg/gMp1lo7o2YOT2DfVgQL+/DTZ3MdZ5r/hX3xdAEoNyIrhaCOvg9z7fOACTWC6ah
 wgmiYNH3Xv2LqcmvmiJgFkKhZFfe+sBnSMTrPZHTxqiv/YMgVafY9BfuOex+xni7Jcjt4UejtFk
 1JvVlWjrxdoARZ8bcjGnDl8B9RCKSxIhBN4dUgwGI4XsSSoTeRMQtt+P+aDJFoeky14GBRser9V
 jb7Zahi29PP3YzptcA0b9wz1ckT
X-Google-Smtp-Source: AGHT+IHaUPZXzrFIwYdFFvTrNeH9Vax3L9bq0bG53mcrE/UzW2QIR6b4OImaWER8CF1wNRGrztu8sg==
X-Received: by 2002:a5d:5d88:0:b0:432:8537:8592 with SMTP id
 ffacd0b85a97d-432853785b1mr26751951f8f.4.1767366482217; 
 Fri, 02 Jan 2026 07:08:02 -0800 (PST)
Received: from FRSMI25-GRAVITY.idf.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab2721sm84629079f8f.39.2026.01.02.07.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 07:08:01 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Fri,  2 Jan 2026 16:07:56 +0100
Message-ID: <20260102150757.1480511-4-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260102150757.1480511-1-fabien.lehoussel@smile.fr>
References: <20260102150757.1480511-1-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1767366482; x=1767971282; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6GX3aQfgx9PbFaO0YvaGtA22+iiB00Pa922IFSq3ux0=;
 b=rs/hIK+Q+qSlgRaqUlTbTH/PxkoyzPX3zSVIZz9RhSjrAaXjOymqPqZAMcMmubAJkG
 dk/73QreOaQCYsn3qgcPAk9usO5a2pnzzVG4VDmKOo+IgfUiWc5yIamiahkTejgviAxV
 kIrtkITCPhEeeENeUxVBV7eEPrthN1DZ5/PQg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=rs/hIK+Q
Subject: [Buildroot] [PATCH 4/5] utils/generate-cyclonedx: remove unused
 Buildroot dependency
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

Buildroot is a build tool, not a component or package that should be included in the generated SBOM

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
---
 utils/generate-cyclonedx | 1 -
 1 file changed, 1 deletion(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 23176bc2c2..e47b6f2f6e 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -467,7 +467,6 @@ def main():
             cyclonedx_component(name, comp) for name, comp in filtered_show_info_dict.items()
         ],
         "dependencies": [
-            cyclonedx_dependency("buildroot", list(filtered_show_info_dict)),
             *[cyclonedx_dependency(ref, br2_parse_deps_recursively(ref, filtered_show_info_dict))
               for ref in filtered_show_info_dict],
         ],
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
