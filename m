Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98303C02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 14:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 673D281156;
	Wed,  5 Feb 2025 14:10:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3z14Q-c14pkX; Wed,  5 Feb 2025 14:10:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74E9D810DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74E9D810DD;
	Wed,  5 Feb 2025 14:10:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 04B2ACD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E58C9810DA
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:10:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zmlSmMGbwV5D for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 14:10:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BE073810C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE073810C5
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE073810C5
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:10:15 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-385f06d0c8eso3738031f8f.0
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 06:10:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738764613; x=1739369413;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TqIhI1Mfk6Jw8BP1yjPo8BayRlmpRajxpG4Q5sag92w=;
 b=aepb716qmeU3fdiR+4GBNLPdVGyjAcb1U0R5RmBe8cDm3qzhfMEjCyD04+oOKH/Qcm
 M6Zo/HsOGKIRMoFaDjXf/vmF6ciTDtlgSg7/zmly4mJgaHew7tyZ2Ue6PSNHbc6hl/jL
 DHGye3fXzFCalsZVrKXLwa9li4wmrYw6vlrOgTNm43+0CIAa+4lrfvVDUVAK7cMBkeLm
 zgr+AxsbnNE5b5WfZBG4DK4rNxYoglYYwnr5YKDhnd3ZcGAD3d00bkmY9BYJW6/GGQIv
 6wCzNq4qWjpuBdGoQ08riqAgbC+nkCDWOmaMoWjj77bPe8DbuxyrbfIhLwkT0RoGPj/f
 ekrw==
X-Gm-Message-State: AOJu0Yys/yqhFV5b4XEY8G/aF2JsDqHGlEMMHxCThEwranC3Vp5IqIfe
 m6rGh43pgDAlrKdmOwToWnMwCDwHtLzlWk3bAt0MUWnv0Q0vVMNdG0aSVzvIXlByTMApYOPHsz/
 kBvw=
X-Gm-Gg: ASbGncsH7DeXn2Bq1hEKQfvnrTkmUqfkPmhx+QPA8CvRGHoBUCPrjUMQ4bifI3jSLgR
 We/h9g6nO/c1c26JdL5eC651pfuQH03uzHmOZ7/bFzCVyI3imUenctrvcSnpTmjq8BexX5/T4Pw
 ABO4NWRNTkU34I9d5/xp93ZVn3Fz+/QdMRXsON3B5qad+BgluR0ofVWeP9IxrTINU31nFTWPczm
 UMTRZzJggBTHk+Pzsikgaglnee0LDB50xerLN0TdGndgrZZ5NjgOpLAD+4kBzVmIoPX/XLxiftz
 Kg+xMorD2gpTVkjnXJRRYwx9bFkp8X3ZDaovczTV6whEqRN2W76DMNGehs9uixSb3Q==
X-Google-Smtp-Source: AGHT+IGW0Dss7qkHN70OXqjFlqZjt6IU4QTrtLUpLcC42xhRlcE9Mqs6RZmY2ibe/+tkp/PisgKYNg==
X-Received: by 2002:a5d:64a1:0:b0:38b:d824:df3 with SMTP id
 ffacd0b85a97d-38db48bb414mr2387477f8f.24.1738764612934; 
 Wed, 05 Feb 2025 06:10:12 -0800 (PST)
Received: from localhost.localdomain (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43907f19247sm34913945e9.1.2025.02.05.06.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2025 06:10:12 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  5 Feb 2025 15:09:45 +0100
Message-ID: <20250205140947.843661-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738764613; x=1739369413; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TqIhI1Mfk6Jw8BP1yjPo8BayRlmpRajxpG4Q5sag92w=;
 b=YoGrpPbP7YuygL2f9rkVEPW7kYGYssSkqBvwbblqXT9SQXRLqED2EXQiSsWR2Z5Xez
 dyLTt5g/tSBrJdf7borKGEd/GuGjckdQ03dqkhgkHdyx9Z+OPaA7xtSPYgbpHOHUoxOM
 dHvj9KMjfvE0ZVv9Sknqqj+sxdInaGmqurJVWK9YZAzCn4Emy6juC5ViTqmPxG8BFiqx
 8DaHbCLwZSmN7ZyIRPN8vN+r4eXMCdcBGX7ArxMokQY9+WBa1jHvzBmq2oVE2ONNzYJq
 27ufzWZiO6BcBsFdjVU2MtqBi59Xeeb07HHkXD+2QjWMK0WrK8kDRW46H8CcSrbKT1ry
 6HYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YoGrpPbP
Subject: [Buildroot] [v2,RFC,PATCH 0/2] Support CycloneDX SBOM
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
Cc: Matthias Swiggers <matthias.swiggers@mind.be>,
 Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This RFC patch series propose to add support for the CycloneDX
SBOM format.

It's the second version of a patch series sent in April 2024
https://lore.kernel.org/buildroot/Zhb8vKs-ltd8ghUR@landeda/T/
from which it was agreed to parse the content of the `show-info` JSON
output with a python script instead of generating the SBOM from the makefile.

The DependencyTrack instance is still available at https://dependencytrack-lqgs7zhwmq-ew.a.run.app/
for you to test CycloneDX and see the possibility.
Login with username `buildroot` and password `buildroot`.

To generate a CycloneDX SBOM you can run the following command:

```
make show-info | utils/generate-cyclonedx.py | jq '.'
```

Thomas Perale (2):
  package/pkg-utils.mk: add patches to show-info json
  support/scripts/generate-cyclonedx.py: add script to generate
    CycloneDX-style SBOM

 package/pkg-utils.mk        |  20 +++
 utils/generate-cyclonedx.py | 307 ++++++++++++++++++++++++++++++++++++
 2 files changed, 327 insertions(+)
 create mode 100755 utils/generate-cyclonedx.py

-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
