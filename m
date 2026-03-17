Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA81F33807
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 07:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6831B83E17;
	Tue, 17 Mar 2026 07:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6rQdSPCWQ3vj; Tue, 17 Mar 2026 07:06:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3CD483E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773731160;
	bh=uvfkuT2FVwKSsB1ttzf4Cb91UVbdgCP6MM/V3X62F+0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I0h+KT5XeILRuNKXH42ccrb7a54kHkZ8n6DIf78P2A1EPTBxPqLHyKBGOPQS28yGv
	 RDsT4+HKJVeX4J651oLySAMSSz8K1JPv+qOqoPQEO0ATIV9eosQpcTBbOgexelQ4+A
	 yhU2byBBB/knJFCZeFKitwzqfOt2FI0MWD1TIgsHmdA4O6v3m6ejFHzPjcXNhFETBy
	 9VEbBuIdEfNzndcsFD3KkkxL2Mjb4ENvowRsJrPMxunllHzFIfMgaW9ZhB1+A6JozX
	 GN/UNNHbmjagU8lCWrrqGkIcG+2MzFIMWl29o0q7rdemAwZQ4XPr4U6vUlA61YKpLr
	 M+Rh6BIZDAquA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3CD483E11;
	Tue, 17 Mar 2026 07:05:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D796D3
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 07:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 593F383E15
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 07:05:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dVoTC_w0Hu-Q for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 07:05:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5D3F383E14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D3F383E14
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D3F383E14
 for <buildroot@busybox.net>; Tue, 17 Mar 2026 07:05:51 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48534237460so58369635e9.3
 for <buildroot@busybox.net>; Tue, 17 Mar 2026 00:05:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773731149; x=1774335949;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R8yuN8ywdc8K0ayzDZ5CTzMCMiSEItzB5ALxFXFXvUw=;
 b=bGydLHJS1IUt5UuO5uiq42+87ooB4OhieqSRsMghJs/w24qdi+sek1o2IWre5VI44S
 xcwwosIN5OtBCqOFJw/YwoeT0BjoQDmSr+rhs8cS+FPkr4X36yZmMM09Tb2dwWMPmfXZ
 mgGRjRSpiJQ8q5E1Fsope0FA01uSm6NnvKGVXNyC5YOFfRhJZd4mmT0WVpgvNzv+qLeU
 Cd8Sg1soN+VerOqJy+wuYGgKMsSqxMc6iy3WSLDAcsdIADd1CQFLehsuewUQIz20J9bR
 TkNb/NAdtjwkYh+I5X2bXCZ2HbM7cLgttsFnprvaN5qSsTfbdn6k4xDY0sJFwlZOpXpp
 1Crg==
X-Gm-Message-State: AOJu0YyyfVFpZcKrmonsJff506o56gO9t1pCgpD6IMDFumhfqQakBUNM
 U2r3TUV2iZa0+zXG5rQTaSJvFE4EFTrgL9nyrvnuLEzlDvNF1PEEsXINWq5C3VCLTKMM7AFpFpG
 6cADI0Q==
X-Gm-Gg: ATEYQzxOtqpRCYrFw1KyDevQDrsGsohVFPQXvETm4WNkWFiy+w3O+EWp3jsci3P532A
 PVCyu9Gm6PlgVgXuX3S8puXJixztcJYdxtOYAzYrRPDzXY6gW8G6d7kq2hM8MxBrsYmYWA5W6o2
 GOm9JgM1BjOxk+7z+vtRfxjb0Jcr47aWZlSjd4NssLPMVFJHvmyXpfnfU6P4Zx2mNA/lg/Te3dx
 FY7M09wc5/s+JotnBjIKIV7wtwYLUd8yL7aWGIQ7PlWE6btw3vTPQTwnXF3bQBwQYm7rWPyBnBL
 rgKhvzME13lqTirMpwbUq0Af7pM/ZAWmqpyGbcf7nFhr71RKqz239xf2QOlWD0qtWIHQzTQTcbs
 0smVQC4+kaRXTNV3RVDZeWrlzdZInCbHgYV9jcNf5RA7ddD/ZQ/Lu7us+aV+vfD+3Jtj5dw3VSV
 tcDcqJyoEslq0IoA4GnS8CTJBEB3nRPFxe01JpYbeYA1fvOTOqYw==
X-Received: by 2002:a05:600c:5395:b0:485:4278:2558 with SMTP id
 5b1f17b1804b1-485566c6a81mr276837245e9.6.1773731146655; 
 Tue, 17 Mar 2026 00:05:46 -0700 (PDT)
Received: from vm-2404.. (181.185.66.37.rev.sfr.net. [37.66.185.181])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4856eaeca12sm86711615e9.12.2026.03.17.00.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2026 00:05:46 -0700 (PDT)
To: buildroot@busybox.net
Date: Tue, 17 Mar 2026 08:05:39 +0100
Message-ID: <20260317070540.219669-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1773731149; x=1774335949; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R8yuN8ywdc8K0ayzDZ5CTzMCMiSEItzB5ALxFXFXvUw=;
 b=J/nng0wen7DkKEGaqoCp20E1dYih5iC4McSTQ5gvrpQyGMS9uahm7Kvv3i1tUjZ4kW
 EQ0kWmelFCSQtzAkGqqBKxszi5X6NCuyl9locRm+cUF23TiJEvMDN5J3ZkBcy5kJIKLC
 gjFsb7selrK5PfgjsuKkfauetrpBWaWCYByZIA89USInL7CPKoqaYWBTpA4IrFkX8tH6
 4K5Ls/AtHwfYT7Q/0+suzuL9r+kwIAdwlAPqgRYoN/FLPm61PQ4Vqbqj/pJofEdv/PE0
 Pem15Zk2Db6Z0yrbSsCLJssTf5XItncyA1oKqL/8N56xkFvCRsQ3rqQRLZ/PtodXdLaT
 +haA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=J/nng0we
Subject: [Buildroot] [PATCH] package/janet: bump to version 1.41.2
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

diff LICENSE:
    -Copyright (c) 2025 Calvin Rose and contributors
    +Copyright (c) 2026 Calvin Rose and contributors

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/janet/janet.hash | 4 ++--
 package/janet/janet.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/janet/janet.hash b/package/janet/janet.hash
index 02dc550db..0ddc8ced7 100644
--- a/package/janet/janet.hash
+++ b/package/janet/janet.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  e7fdcb7ccc83a3be6181f7d7d71f0ea027a000e0eefe9bba3b8373c05eb5764a  janet-1.40.1.tar.gz
+sha256  168e97e1b790f6e9d1e43685019efecc4ee473d6b9f8c421b49c195336c0b725  janet-1.41.2.tar.gz
 
 # Locally calculated
-sha256  805858acec1df54018879efc78ee3ff7bab5e69908c58e46bbc2d94520f29023  LICENSE
+sha256  16e31703a3ab5c4d3e35aa8bd607551911a9d981fbf0b5fbd832fe6eed4b70ca  LICENSE
diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index c7255394b..a7ea27c2b 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANET_VERSION = 1.40.1
+JANET_VERSION = 1.41.2
 JANET_SITE = $(call github,janet-lang,janet,v$(JANET_VERSION))
 JANET_LICENSE = MIT
 JANET_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
