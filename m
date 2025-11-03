Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49ACECCFA03
	for <buildroot@archiver.kernel.org>; Mon,  3 Nov 2025 21:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0230040678;
	Mon,  3 Nov 2025 21:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uo3zGE6r1okH; Mon,  3 Nov 2025 21:11:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAD66406CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAD66406CE;
	Mon,  3 Nov 2025 21:11:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F213D462
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFB6481102
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:11:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sSxV2n9lXYMw for <buildroot@buildroot.org>;
 Mon,  3 Nov 2025 21:11:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5641E81100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5641E81100
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5641E81100
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:11:50 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4710665e7deso22702855e9.1
 for <buildroot@buildroot.org>; Mon, 03 Nov 2025 13:11:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762204308; x=1762809108;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3J3hQG5tre0ebXty9lYkVTASa1EOr6WHAVx+oWvU+i4=;
 b=J80xOeNCyYVLuzy7OnH0Rej8E4s/YGXi4wi6JW7Pa7OjAQQsFx7jt0MtXZHD/NXWPC
 reya6ekEcsOWwy1fDDo8j8ISNfkb+Uxmk5ZfyzzH835QWZo2LKrpaPm7XYzdGr5JKRXH
 u3uZtq+Nn8Ok6WAQ3PSJ2vWuPeCTriggUGLpFR81zBCAijq/ZfzlQEEs8H9IdMyU/Zc0
 YwzWXsG7qoBXKN+PDYD2DZrHGSTjhMbMdQEoAaHqGGyX0VI4/7pDwLBThsBR7CWVHWPu
 CQysRvCGE4KhQkEexwUFmxzo+GDiVObb8DzUK/3oKyPGv44hbqQE3mJ0VYTQMC4BgrsR
 a/WQ==
X-Gm-Message-State: AOJu0YxmuxRrrmxSDME4Fu/YpPQjSffUOIyw+hH60eHx66Dg7TCzYkVg
 WBu+dhvhaMXFCK+kZWrFZm0z7A5Ljnn0C+iXfYyMpu+UETN5zisFLQ+UWZeQ6tGd0v45T35vxUU
 t/q4F
X-Gm-Gg: ASbGncuekT2FngrXdB9+3JPCLu5SvhiYY7hSIj6FBmLQPGRYdIAdey97OkMUVFs5pLA
 XVK7Qh6X/g46KkIziBAGkue8mQgjv3oAAhEq1h7XjMrwFHPAt36DOSA/01MVLyiNa6Uq8UhHaHP
 WbPDjg5m9CNLx39ijH4TEgivtGKH+o3BfL3WISz3BcQFHImlIIBsANG4t1R0bkgtT/lUkdJakBh
 7qYfkPf+YX1JX3tKht6nc1VM/RBMUcJCEVrNiKDWaud/SZsrS9E2hpQQfrs/Y+8c7UjX/Fz/PCQ
 36B9KYlsy8fyVFNJHEx0P1zkLRlCeHGdXD4imMXIaoIZZeszt6wAyLQC2TRfcDreFxozUysjejn
 iGe2yy5Alxq5Terly5ff8Q7CdkfXZxM51mvazJsaa8n5NqOsOgKnDsb/8dC4qy/SYDq6lqDsAO+
 GSsdiF1dbqrVySquFb5t38Jmdkug==
X-Google-Smtp-Source: AGHT+IFjA8Tcl/luLgpJlQFakkxjSuro6GQh54BCdSdvj1xDOXFtUYBf9drbR4BwBKi2GV6UjVpF/Q==
X-Received: by 2002:a05:600c:6215:b0:46e:206a:78cc with SMTP id
 5b1f17b1804b1-477507f8c72mr39202265e9.28.1762204307324; 
 Mon, 03 Nov 2025 13:11:47 -0800 (PST)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c383b45sm179630745e9.9.2025.11.03.13.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 13:11:47 -0800 (PST)
To: buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>, Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  3 Nov 2025 22:11:40 +0100
Message-ID: <20251103211146.57344-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1762204308; x=1762809108; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3J3hQG5tre0ebXty9lYkVTASa1EOr6WHAVx+oWvU+i4=;
 b=bQHAJeA8bP14c3i7Sx6BCrSltRn5d01kJSQcc2/t0OWni54DIMmVT9mPlPbDZ/Ejtu
 bUswa0zDivRzZi6uQBoj6IcHMXwDLpnh9riURwEPKcdHxGhMYBxRlOFysibfW6JexLTH
 ATuVumMaxSnANhOVeYWoTr8Rkz12K1urpNRu3k0hCUMmPxzZzNawqHmvOASSIRwADNLg
 ahEZrt7ec+FBzV6lpBsUWxblsBN8UkJ0SC6TyvUZnz0QYQPeXhTurZZR7me9E+pVm4lE
 zxNBUTcDD8gAiXow1ft7F9e3N0tceXi2VZahChUyJb5mgVy5WphDk/L67kchhD8VrcdZ
 Drfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bQHAJeA8
Subject: [Buildroot] [PATCH 0/6] Fix CPE criteria matching
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

Hi,

The 'cve.py' library can be further improved to take into account the
operators between the cpeMatch nodes (AND, OR).

I ran the `cve-check` script on an SBOM containing every packages in
Buildroot before and after my changes to the 'cve.py' logic and then ran
a diff on the SBOM vulnerabilities.
I also did a comparison with the result given by DependencyTrack and
it's a really similar output.

This is the list of CVE this remove (it doesn't add any). I havn't
checked them all but it mostly removes CVE with criteria without
assigned version ('-').

- CVE-1999-0143
- CVE-1999-0289
- CVE-1999-0678
- CVE-1999-0713
- CVE-1999-1237
- CVE-1999-1412
- CVE-2007-0086
- CVE-2007-0450
- CVE-2007-2379
- CVE-2007-2728
- CVE-2007-3149
- CVE-2007-4596
- CVE-2007-5894
- CVE-2007-5902
- CVE-2007-6421
- CVE-2007-6422
- CVE-2007-6423
- CVE-2008-2168
- CVE-2009-0844
- CVE-2010-4176
- CVE-2011-1936
- CVE-2011-3346
- CVE-2011-3618
- CVE-2011-4613
- CVE-2012-0880
- CVE-2013-2018
- CVE-2013-4235
- CVE-2014-2580
- CVE-2014-4859
- CVE-2014-4860
- CVE-2014-8135
- CVE-2014-8136
- CVE-2014-8165
- CVE-2014-9278
- CVE-2014-9750
- CVE-2014-9751
- CVE-2014-9826
- CVE-2015-5313
- CVE-2015-7691
- CVE-2015-7692
- CVE-2015-7701
- CVE-2015-7702
- CVE-2015-7703
- CVE-2015-7704
- CVE-2015-7705
- CVE-2015-7848
- CVE-2015-7849
- CVE-2015-7850
- CVE-2015-7852
- CVE-2015-7853
- CVE-2015-7854
- CVE-2015-7855
- CVE-2015-7973
- CVE-2015-7974
- CVE-2015-8550
- CVE-2015-8553
- CVE-2016-0749
- CVE-2016-2102
- CVE-2016-2150
- CVE-2016-2518
- CVE-2016-3960
- CVE-2016-4953
- CVE-2016-4954
- CVE-2016-4955
- CVE-2016-4956
- CVE-2016-7092
- CVE-2016-7426
- CVE-2016-7434
- CVE-2016-7538
- CVE-2016-9079
- CVE-2017-5436
- CVE-2017-6458
- CVE-2017-7228
- CVE-2018-10893
- CVE-2018-18438
- CVE-2018-5748
- CVE-2018-6764
- CVE-2018-7170
- CVE-2018-7185
- CVE-2018-8897
- CVE-2019-10214
- CVE-2019-11331
- CVE-2019-12067
- CVE-2019-14553
- CVE-2019-14559
- CVE-2019-14562
- CVE-2019-14563
- CVE-2019-14575
- CVE-2019-14586
- CVE-2019-14587
- CVE-2019-8936
- CVE-2020-11868
- CVE-2020-13817
- CVE-2020-23331
- CVE-2020-23332
- CVE-2020-24490
- CVE-2020-25697
- CVE-2020-7694
- CVE-2021-28039
- CVE-2021-28711
- CVE-2021-28712
- CVE-2021-28713
- CVE-2021-45464
- CVE-2022-23036
- CVE-2022-23037
- CVE-2022-23038
- CVE-2022-23039
- CVE-2022-23040
- CVE-2022-23041
- CVE-2022-23042
- CVE-2022-23824
- CVE-2022-23960
- CVE-2022-26358
- CVE-2022-26359
- CVE-2022-26360
- CVE-2022-26361
- CVE-2022-26365
- CVE-2022-29900
- CVE-2022-29901
- CVE-2022-3219
- CVE-2022-33740
- CVE-2022-33741
- CVE-2022-33742
- CVE-2022-33743
- CVE-2022-3553
- CVE-2022-3807
- CVE-2022-40982
- CVE-2022-42309
- CVE-2022-42311
- CVE-2022-42312
- CVE-2022-42313
- CVE-2022-42314
- CVE-2022-42315
- CVE-2022-42316
- CVE-2022-42317
- CVE-2022-42318
- CVE-2022-42320
- CVE-2022-42321
- CVE-2022-42322
- CVE-2022-42323
- CVE-2022-4949
- CVE-2023-0056
- CVE-2023-20588
- CVE-2023-2680
- CVE-2023-34324
- CVE-2023-3750
- CVE-2023-38560
- CVE-2023-39327
- CVE-2023-39328
- CVE-2023-39329
- CVE-2023-4949
- CVE-2023-52356
- CVE-2023-6228
- CVE-2023-6277
- CVE-2023-7216
- CVE-2024-10041
- CVE-2024-1013
- CVE-2024-11586
- CVE-2024-49393
- CVE-2024-49394
- CVE-2024-49395
- CVE-2024-5290
- CVE-2024-6505
- CVE-2024-6519
- CVE-2024-8354
- CVE-2024-8443
- CVE-2024-9029
- CVE-2025-32462
- CVE-2025-32463
- CVE-2025-32989
- CVE-2025-32990
- CVE-2025-3891
- CVE-2025-5987
- CVE-2025-6170
- CVE-2025-7424

Thomas Perale (6):
  support/scripts/cve.py: remove print from cve.py library
  support/scripts/cve.py: fix CPE matching
  package/pkg-generic.mk: Set <pkg>_CPE_ID_UPDATE to NA by default
  support/scripts/cve-check: add cve-check script
  DEVELOPERS: add Thomas Perale to cve-check & cve.py
  docs/manual: add information on CycloneDX

 DEVELOPERS                    |   2 +
 docs/manual/common-usage.adoc |  27 +++++++
 package/pkg-generic.mk        |   2 +
 support/scripts/cve-check     | 134 ++++++++++++++++++++++++++++++++++
 support/scripts/cve.py        | 133 +++++++++++++++++++++++++--------
 support/scripts/pkg-stats     |   3 +-
 6 files changed, 271 insertions(+), 30 deletions(-)
 create mode 100755 support/scripts/cve-check

-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
