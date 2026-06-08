Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA45BCD6E79
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 21:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E23C84D9D;
	Mon,  8 Jun 2026 21:21:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X7z0q6Rdr0sZ; Mon,  8 Jun 2026 21:21:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 563AA84D98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780953676;
	bh=2sKmWfv6UETvNuKL1FJ+EH23dT/T/Nu60b4xafdM4G8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=VvmGSYDrL5a8iydr1p+1gpicJoh5U9ewrta54Vh8UlZWidPzVFz4nu9O3SQm5KKxi
	 dcs2GF6wgsekPW44Bv1d7WhNGl/TC0wJ4XU6vh9BH3dKVkaHEyhVbV+cn3dqb1dCzh
	 TNMFUgFpEG/tue3sFqVLgPgs7zW8kd/Cz4Bfd2brexTMrqMJp/DXcjJRqDWiqZDIXf
	 BR0A50Hgt9j7CJxaXi+JSBNrDHBRochA8M78gLnzxUvhnpG3bJtz/Wa/GFr+8Y3bTX
	 nLVT3Yj4z+bGoA+HBuzSIyHG4xxOhuz3c0c0hmbCPiX8hpN1qzAM3LwQ6qALxJISvZ
	 n+NueD8zC54VQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 563AA84D98;
	Mon,  8 Jun 2026 21:21:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 431A9EC
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 21:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34AC040E4D
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 21:21:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aWRWsIg1RrzF for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 21:21:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5A26C40DB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A26C40DB6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A26C40DB6
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 21:21:13 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-45ef616daf6so4360811f8f.3
 for <buildroot@buildroot.org>; Mon, 08 Jun 2026 14:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780953671; x=1781558471;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T8hJTAtLo++I5EPpQ/yL+BTW7WRNk/1NF5c2dK71zns=;
 b=QGXMPWvQdVuxjCr1JtGP2nLSi6JAzEBsNTXmCe4NpUUwvXIXB3YsqYz21fI8QQfr/V
 cF/mt/6XhrYzWYNPoSGMkEEHgb6vgxe7DoYgWIKISeeecDMfeSv9AaOHGFN6Yi0uq4jb
 T8y5GtxVI0sQUPZg4ULXuA7YAQUJCdRJ90s3gplHGMyN2BZynaIdJbxgHukFcRNbDSGN
 Y/GYdOg+0Q2RVgGgKMEEyDPnY7KJLQ4Q0V1QxP4lzptNPVO+Cq4htGSZYssKByuGbo16
 mGTZHmJkN9AA89Vs5/WPMzZxAwZqksKjUqNkzzv3wfh5/GCsKrxYuEqWuapvoWxEly6O
 0p6Q==
X-Gm-Message-State: AOJu0YyuqOzSDJlIVIyvM6HJMDtbCWg3z0vTxKQYO0ls4RBWIsGnSFOT
 HrPA8o3QGmXDmcSAozNf+MsXuGNVgevfAgY4GaAXF3jZgSoKaK/0kJ2D/HmE82Pzm7FmK5r07ng
 BGxCu
X-Gm-Gg: Acq92OG61MUl9xpiBDVWv8E/2gVJm/7ilARKPak8ZktIuy3eSDStU+AXhbOQeGwevsO
 wldyL5frSPrK4DLdMtr8cyotMAkmb880dluYPFamF2oM00NZsVVNI8kmfGFKNjVi9/IdO5Serlt
 ZY70YOFvkWTpaXrcon/2u5V/GWISPKApayTjcnGelg8FUdEycpBIcpKE2DOAvlfSHhrGig4wIqW
 B6zafgn+65vZfekvM3y2FtCGmFh97QfysbKAC7JOmKozZRnx0bDcnSZ1jV1mzU/NUTwDNTJfunE
 5bXUA/1k4uglkolPApCE4HqgdnS8hXi8Nr8/n5BpA1bKfU92d7KOI5h/pfS2QPg/tMobMXXdUOT
 YPDdyuZHWY0MD9OkO7TADl49uyxQ7H8kPmYUqHZGXDPLJgaZm/ulf2c8zoqTzt5RMoZKfOn1m11
 2XS3eOEohLuSLdLiNcIdqLKWLgDbAgpczlKsSJH+q5/0UqtruMe6F8HudgdQ==
X-Received: by 2002:a5d:6644:0:b0:45e:f780:6181 with SMTP id
 ffacd0b85a97d-46030501958mr18435431f8f.23.1780953671563; 
 Mon, 08 Jun 2026 14:21:11 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46028a6dce6sm48710510f8f.30.2026.06.08.14.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2026 14:21:11 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  8 Jun 2026 23:20:46 +0200
Message-ID: <20260608212054.902018-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780953671; x=1781558471; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T8hJTAtLo++I5EPpQ/yL+BTW7WRNk/1NF5c2dK71zns=;
 b=QMaU7HRHM7Bqbm7idpa7zCSR1xt3jDFOH8i3Y/+NA1MEEQw7pg+it0fzgjFRWVvv6A
 H6/mJdxP/Xe+2WdZf92aLkszOb1foOmpjqQbNSmXQli1uSOgSK9XCL3sbimoafTk8zxH
 PgQexMH75lXAedVnJUTk/LcdXtjTzdchggzmt59n6KNN+LvNBPQ9Yrjqje4XA20cElRi
 NTEQFZliwU5HCa+P4aED3en91YU5XrYBfOQ9WXCBe09te17qOxtZijmFObImH+scPiOv
 SV/rWpB8t3vQUKAF7PFSogMCGuIvYrwSp9f1MTe8YGXEHQZ3pJwF0iGh8nXVvgzsan4I
 G0oQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QMaU7HRH
Subject: [Buildroot] [PATCH for 2025.02.x 0/4] package/python3: add upstream
 security patches
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>, thomas.perale@mind.be,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix a stale IGNORE_CVES issue in python3.mk, and rebase 3 security patches
for Buildroot LTS that were merged recently in master commits
- 9cba1cfaaf7acb64d7e73ffeb4ad455c784d7764
- 67ec0e9c202a1d0f3cd2d4780a23950ca64a1745
- d4be78ccb572f9e44271becb7af3c1987718456e

The patches have been imported from their upstream backport PR to Python3.12

Titouan Christophe (4):
  package/python3: remove stale IGNORE_CVES entry
  package/python3: add patch for CVE-2026-3276
  package/python3: add patch for CVE-2026-7774
  package/python3: add patch for CVE-2026-8328

 ...al-ordering-in-unicodedata-normalize.patch | 275 ++++++++++++++++++
 ...le-data_filter-validate-written-link.patch | 178 ++++++++++++
 ...E-2021-4189-PASV-fix-to-ftplib-ftpcp.patch | 118 ++++++++
 package/python3/python3.mk                    |   8 +-
 4 files changed, 577 insertions(+), 2 deletions(-)
 create mode 100644 package/python3/0013-Fix-O-n-2-canonical-ordering-in-unicodedata-normalize.patch
 create mode 100644 package/python3/0014-tarfile-data_filter-validate-written-link.patch
 create mode 100644 package/python3/0015-Apply-CVE-2021-4189-PASV-fix-to-ftplib-ftpcp.patch

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
