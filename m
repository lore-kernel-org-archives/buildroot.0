Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A739C3ABC3
	for <buildroot@archiver.kernel.org>; Fri,  9 May 2025 04:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CCC261081;
	Fri,  9 May 2025 04:19:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7HmOBKXVV04F; Fri,  9 May 2025 04:19:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F63961123
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F63961123;
	Fri,  9 May 2025 04:19:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B1E5015A
 for <buildroot@buildroot.org>; Fri,  9 May 2025 04:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A321E40410
 for <buildroot@buildroot.org>; Fri,  9 May 2025 04:19:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id umicteejUj5Z for <buildroot@buildroot.org>;
 Fri,  9 May 2025 04:19:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D46FD40247
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D46FD40247
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D46FD40247
 for <buildroot@buildroot.org>; Fri,  9 May 2025 04:19:44 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-736c062b1f5so1854063b3a.0
 for <buildroot@buildroot.org>; Thu, 08 May 2025 21:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746764383; x=1747369183;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vrw1CxJDaOnWYq1evUYxXNTiEL+K3+SrvSsQdXIISCQ=;
 b=sGQEeJ2CjQHFtYFXPjP/fcEnYhHIs+ks4RFjIFUeLA5EbhQFYB1MSiCvnJwgthaE8b
 Lxv2M8Y/Lrv7JgPvv26e8EhJOId9PjGctfbBh1uew+ysowKYlHl4+vKBn4XElf8GJHDm
 lAiybWc8OmGTg7HLh9zlFIzIrEQpV2P5eLtPmRP+q4h58FgWieVzyISEf/HiPLWpuMMZ
 Xnp704VQ7RmRZKuesQ0z1XM7hq+XWCtIU+6jOuwPiGiYlFm6cj4XC9It5bHMjMz1b1Uo
 txOVlUKwOQ4aqLI+eY4u3hFblQW4wXbwCHEMQ7y47X+W81DLblm9rE9jsJyyLW/pP4iN
 7VSg==
X-Gm-Message-State: AOJu0YxAYg334bqza1RdvVJ62jemJ8OzBWj52p8VkvyZom36l2Rkgw6W
 wYzJ1XEM1wch+uWAqwAk+zrtuwqbwd+5uyehioXfpoKLOWCH9sPvIU2GDDy7
X-Gm-Gg: ASbGncugIKbz19pSJmwDpC6e51ZCsPVW3eYtx41mY3ZXNAzMVZdniiC1ES3x+FwJGfa
 re2uDlFSiSvobYT54sSAbg0XWx+jnlE4gugPI7U8bGPEyLtXqF32lVlFHklMVMq9Cw1fFtK1oJB
 4grxfuKVFrbmmCUxjsQPIQ5QUW8FuDfJkRLFjSIULVPFpFmPU6XbNg8QJVPl2+fAaOWhZlTqzzV
 fF072wFfL3yGLBomiDtvhtyB4izVurhhhdG51ymrCQzT4BUzfTiqrRvxGlfUEQQ9VdmkL3PEDJr
 8YH5zBPKHQ3gfSzWfhpju44xUxT1uOf8XM8nuMrGrs7e/uH144wgm8ywuMAa4PgQql3x1Qq2Vy+
 ZMWQg/eDXYazAsq+pw7ddylNPY5U=
X-Google-Smtp-Source: AGHT+IH42qozlo9j30SYFo9CleMTNTacn87qR4pYyOl28TWcXu6tsrJBP8lL33ZAuGLPL0wFXpMTkw==
X-Received: by 2002:a05:6a00:1808:b0:740:afda:a742 with SMTP id
 d2e1a72fcca58-7423b2e8a7fmr2836281b3a.0.1746764383356; 
 Thu, 08 May 2025 21:19:43 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74237a38674sm866549b3a.135.2025.05.08.21.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 21:19:42 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 May 2025 21:19:39 -0700
Message-Id: <20250509041939.11656-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746764383; x=1747369183; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vrw1CxJDaOnWYq1evUYxXNTiEL+K3+SrvSsQdXIISCQ=;
 b=ngs+0sB+JrOVcv7bt2L2NYp7zjaQglu45vsGFMwlHYwyS5JIU5SmFCj07+GYLRRdzD
 1VoigvxYnJ103QYtvdGHBzpYyNPWx38YIDDderXsl3R9b9fEYGyPol8gxbc0D4jhNThx
 emeeDe1frfsQmUQdNs9VSy7MdhDQtEDwsqFMhrqDVktnWEY3av657rvfOkiBBX2bOu1v
 aJ6tcV4qZVah3pZBNV0eernTSGxLEAvPM+88vbu8+GrXDFJID27TCHeB0y86cJYLZ4kv
 v+OhyzM/qKp1w2HX+M6X+Ewj6KYXMHdRq3gdnPqsLLSN4NtmBkigJcj7PihhVhfq3av7
 8pyw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ngs+0sB+
Subject: [Buildroot] [PATCH 1/1] package/dropbear: security bump to version
 2025.88
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2025-47203.
https://security-tracker.debian.org/tracker/CVE-2025-47203

Release notes:
https://github.com/mkj/dropbear/releases/tag/DROPBEAR_2025.88
https://github.com/mkj/dropbear/releases/tag/DROPBEAR_2025.87

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/dropbear/dropbear.hash | 2 +-
 package/dropbear/dropbear.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index cf2dd18d61..b18aca3aab 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,5 +1,5 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256  e78936dffc395f2e0db099321d6be659190966b99712b55c530dd0a1822e0a5e  dropbear-2024.86.tar.bz2
+sha256  783f50ea27b17c16da89578fafdb6decfa44bb8f6590e5698a4e4d3672dc53d4  dropbear-2025.88.tar.bz2
 
 # License file, locally computed
 sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index e043893aa1..c383212e76 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2024.86
+DROPBEAR_VERSION = 2025.88
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
