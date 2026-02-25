Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BCCF4BB9C
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 10:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA68E82352;
	Wed, 25 Feb 2026 10:57:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kLMf2lKgRRP5; Wed, 25 Feb 2026 10:57:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4831D82301
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772017035;
	bh=Bb8XFcUNligIzusbzbaoOxPNRDiYuJnWfH74H7ZHmns=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=iyXHC3/Hb3UuySEKMSnzm0Slbe2/zsLH48cRd/osGTymTBgwAI06bxhaj+y4MbjYt
	 tkHQtPqmcgYPBU1I6rFweLUAxnL3mqDTGbhKlE+MW/rMcP69Ybi//21bHBnByvlSuH
	 zdmZsCZrNqAMC1+nf/h3Og91toOavwT3/DMXoe1ykUd2jUARb91XInpG0JMI9PP4CL
	 djHQ3+gpxpws0Ez8l+PHeiCnJZy0E+tASAFrV8Batj02h7egfUVhtmX7MWc4bOTyv4
	 t6S3C6mwMGtnZG084IapQEU7dDzlNGepM/sYtDaTsvMPoLZ9pT1l5BR9uY3dj8rXw0
	 6a0YEaKQt94/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4831D82301;
	Wed, 25 Feb 2026 10:57:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 91050204
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 10:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76DFE41E56
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 10:57:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zCkj0868v0ke for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 10:57:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5333F40635
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5333F40635
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5333F40635
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 10:57:12 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-436356740e6so6807307f8f.2
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 02:57:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772017030; x=1772621830;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rl8vPpi2W8gi6TpyJZgrZmlbzN+diZqFPTLH7sT2XX4=;
 b=Nx0Zh51TsfekTcK3JIn601Jl5mVRgvSoxLeK4vAVqYkduB8McR5O10Bg1FJV5lHb0J
 axxN+pE8i2Q2BCLlgJqW3yoFscg689I0YAL6nPS01UA9fp2wDWpkpLkN5YzdLpreTxP5
 E7k0XJ0T/hen7SWXqbguZ9Pce5WEoT4OJuKIq2XaRWoJyec4aOFlpXGkMgaTTtAzMoUa
 dlWlsLqi3RQlAAuRNouzZzKtiL/BZX73pSf0yt89cfXSbnX+Wsp/vpmiVmvLP3mRowxt
 9T3id2tMPP9GR6+iel0mHWy//hACyBiH+iY9+zFLCytoi9COQpgSG9+Q+9wf80MnJqVv
 q1uA==
X-Gm-Message-State: AOJu0YySfdTux+s34z2aicAsAONisftT5qAeKqT/mOMxUR+OCiXSNDDM
 mO/F/GkaEwh7NdyungiMC2oW+ADxezLSppQVMSmujBqDaD2A4U5KxuU4zL8T7XUorVWET29i21d
 8Pmp8
X-Gm-Gg: ATEYQzyeJ9yXkOAXdrXGLgB4EOHcCcIKrkB4nncEZYsfL4Z3PO6wkWqRq5DQTFDqM5P
 LngRd/RbwJjuJBggskbCl7tOJHSp17eKrYaoRN/ABiWJvlqVksSEb8P8ARjPKlP6z3Mg+dIedWY
 8quFoHGmLO0+rsYYmXO/tQlXFQ5vnA1nRC/bwNUURFgT24eBMZEj8stBSlTaDq6xwzpQJQBb5dA
 zIqs3pKfy2aVyQsc3fNlgKP4n8F7i3Deh8aIE5Gl2WDHkelBpMMS6xcpXR7egTrlTtVHJ/7NGrX
 ADGMmSBQKXGZPpJQcE2DotubBPRkWjiwSpxAoDpSMZ+gbD0o9xWEUeYyqB4oLEVCvV2AQs6P3bm
 nkQMV8e/peEXK63j4gqg8bnbeIHFDIhi+PRKd7gSyk79atcQ4Exhl9IcMkJVz8NNg4HJ5a9Y41/
 cOlxnDMebVpTy5br2B1Vg5sS4BkYwh9+6i01jng5xSQGnqt13x8Rk=
X-Received: by 2002:a05:6000:1866:b0:430:f5ed:83e3 with SMTP id
 ffacd0b85a97d-43994294e7emr48512f8f.6.1772017029690; 
 Wed, 25 Feb 2026 02:57:09 -0800 (PST)
Received: from FRSMI25-GRAVITY.. ([2a01:e0a:943:83d0:eec9:6496:dd61:39c1])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43990c388acsm3112693f8f.28.2026.02.25.02.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 02:57:09 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Wed, 25 Feb 2026 11:55:58 +0100
Message-ID: <20260225105707.139320-1-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1772017030; x=1772621830; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rl8vPpi2W8gi6TpyJZgrZmlbzN+diZqFPTLH7sT2XX4=;
 b=RVMUkaoH0PnA8MKVSgnY8UdEcqx+BYCLLvZC/NtpYZuYiCJO7jez4WaGhRyljqwokM
 uQ15ptfHSb92sbXEzmG4uXA3QK0T/eC23G+zGmMFWxXtY8NOGszfMiuZzghCwgJUSiNK
 6UKz5h7SKMXXTuoITFNey3W30oqlIhoG8eOMk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=RVMUkaoH
Subject: [Buildroot] [PATCH v3 0/2] Linux kernel CVE filtering
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

Changes from v2:

- Mark non-compiled kernel CVEs as "not_affected" with "code_not_present"
  justification instead of removing them, preserving audit trail
- Fix help text formatting with RawDescriptionHelpFormatter for better readability

Changes from v1:

Following Thomas' suggestion (https://lists.buildroot.org/pipermail/buildroot/2026-February/797289.html),
this v2 implements kernel CVE filtering directly into cve-check rather than
as a separate script.

1. Kernel build generates compile_commands.json (optional, via Kconfig)
2. cve-check script enhanced with optional kernel CVE filtering
   - Automatically activates when --cc-path and --cna-path are provided
   - Uses CNA database to determine which files are affected by each CVE
   - Matches against compile_commands.json to filter false positives
   - Marks CVEs where NO affected files are compiled as "not_affected"
     with "code_not_present" justification
   - Keeps CVEs where affected files ARE compiled
   - Keeps uncertain CVEs (CNA database lacks information) for review

Fabien Lehoussel (2):
  linux/linux.mk: add generation of compile_commands.json
  support/scripts/cve-check: add kernel CVE filtering based on compiled
    files

 linux/Config.in           |  20 +++
 linux/linux.mk            |  12 ++
 support/scripts/cve-check | 119 ++++++++++++++-
 support/scripts/cve.py    | 294 +++++++++++++++++++++++++++++++++++---
 4 files changed, 418 insertions(+), 27 deletions(-)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
