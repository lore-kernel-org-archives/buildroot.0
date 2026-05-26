Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1337BCD5BB1
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 19:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C767661096;
	Tue, 26 May 2026 19:27:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jTmyFG8MXmBp; Tue, 26 May 2026 19:27:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B1D46108D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779823670;
	bh=gB5SVFqeI9TPBFFkBPRaLyXowju8r9hO5LKwGVlDaVk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XgAH2EtKgMBmf7rtSXm7QmTFaTw1qBj21mOsSNZMu/Vqf95bdktx9HwRiT0is4EmK
	 jhNJZ009CB34HbIg1azXlrNalOgWWcPKzbb3Jc32Kop9POZSKJl7LVD/aTwiH4wCRW
	 qWvqfSsb9m/py8U9JyjGfm/7pP0zdn4otjh5LciJrzJODfKYEtDgVvMCqjprAoRFpg
	 kr6SzUE38hFPDIIWipqYxFkx3WJmrwx/cYOwoaJwRyRIuaC8a2tLrzTPKKfE4BWHDk
	 ZBD0Y7WPGLLikjtYRjE1Zzzf0NrEbri/WX7Wc1hC4U2o2NsUDZ/YvIRO5+STMHKu0n
	 CGOkRms5Lcn8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B1D46108D;
	Tue, 26 May 2026 19:27:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 51DE2265
 for <buildroot@buildroot.org>; Tue, 26 May 2026 19:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4342A82068
 for <buildroot@buildroot.org>; Tue, 26 May 2026 19:27:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VndGPlu5EUol for <buildroot@buildroot.org>;
 Tue, 26 May 2026 19:27:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 27D7D8206A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27D7D8206A
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 27D7D8206A
 for <buildroot@buildroot.org>; Tue, 26 May 2026 19:27:46 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4906238c62eso24161485e9.3
 for <buildroot@buildroot.org>; Tue, 26 May 2026 12:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779823665; x=1780428465;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fYBsrhSYUXB+LJwrewV+xllWGPl0wpDv/d4e8DphmX4=;
 b=bx2Uvm/0wGHdAeQPM/6mEDufM/zpuRYLbqFiUPAuAB8mpqHp7y+0hYQsWQ+dPAKSis
 7AzNlq3ResMeiGvwQ94KFZWlsIJFjq1PlCqS/EnDfHlASCKgTJmVftMs5bouf71hP215
 tqWro7OiLRmhGqCRyBUBF7DfzA2HIhWUC1b3l60CxkKIFxHL5OgUDjQmmBlxtjtRZ+16
 ZXAcHNtTNNW6eR2wGsrPPpwRkucoyGPp6H0ocO2AEVnfpPAaHb3OF4ZT05fJHSW2GkJ6
 xHzPQAQDybbhpvzmV5Qk0V+IOPDCfgVPOen/MyxGbxt+urCmvTZ7l/iACQlriAmcUeFm
 5Nyw==
X-Gm-Message-State: AOJu0YxlyYJl6tYoNbpPqXjhchaySAaECcTsiyyp2i2X6z9J19zp38s4
 DltniNnf5pBzQkn+CpfMto6x7L8aL2cDfwd+7k/Pq3hbC09Bwsr3rmkODLgBIJOXwpgu4/doWwK
 EypGq
X-Gm-Gg: Acq92OE3qkf5zlPQLEYcV+3itaBj0xMuOf0bPRMw24+LKEEf/PPf9xiudWCENhfkl22
 6KWF9PxfNssA+MqmAwvD+P33OVoen4b13SGnJ6j3esawhRq/6e1hgO0T1sKXOODmEHuhyS+eE09
 H/nKkE4RYtJMoF8vQYZB/Sgtu5XBHAsyi93qet0+smrhU6J2YHcYcHoasRvaln5YaNqJ2cHD+SQ
 VbkuwWD/FweEonJQjZP7zE53J+J8wn1Ni1ZMaWwOXJbo2nVXTU3IU1NEymnBZgkzbp/pxVPLypw
 Jq7D61ZMqQ7MDFMfn5m61Kkdk6Uj3vRgHFVOu+3PrLeEmU9Nufz8k+ksppkEp/itK4tdtWulIVA
 EHmRATESXTFEegPVxZ78WzhgkmAM02r0P7nRR8y+8zNYFKuJNxJ0A5UCF0Avn8VIrC6w077oAR6
 8UGN+wovEENzkARdTlrO/QCUJhzkSBWMQ0I+QqidJYcXozuPW/wPeahyOPK9fvFzfi39nwqOehk
 Xcbko2OQLVtxjFweOyZ9XJ1J6qIOioDhZRBe/jmbYRNt7MrOAuJw6Z+qLWZzfKTUhTqPXhhmqkI
 JphGshIpOKreIfDxfOjNMRBphGABF//4Jad36vQN4Dw=
X-Received: by 2002:a05:600c:1d0d:b0:490:601f:d788 with SMTP id
 5b1f17b1804b1-490601fd8bamr194673875e9.5.1779823664931; 
 Tue, 26 May 2026 12:27:44 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-0-96-182.retail.telecomitalia.it. [87.0.96.182])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45edb5b28absm351439f8f.27.2026.05.26.12.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 12:27:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Tue, 26 May 2026 21:27:33 +0200
Message-ID: <20260526192733.2105339-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1779823665; x=1780428465;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fYBsrhSYUXB+LJwrewV+xllWGPl0wpDv/d4e8DphmX4=;
 b=WiiyJS+WoIVnPfl+4BbZ98dzsY3WIBLoVWySGf+XxJmLOTLyaNzlwsd1f4mqS/Ymc6
 RNXTS5V/I8khLNZYRXni0dY7r1JjiVWWMh6peUJwtVvbeqkB4ewrrszbkVmv0koHA2BY
 7L2lc5sFB+syggbhaEuuEfWoqxBOUH+bdOLvA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=WiiyJS+W
Subject: [Buildroot] [PATCH 1/1] package/less: bump to version 702
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log, see:
https://www.greenwoodsoftware.com/less/news.702.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/less/less.hash | 6 +++---
 package/less/less.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/less/less.hash b/package/less/less.hash
index 5f0b0f3846fc..8eafceabceff 100644
--- a/package/less/less.hash
+++ b/package/less/less.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# using DSA key F153A7C833235259
-# https://www.greenwoodsoftware.com/less/less-692.sig
-sha256  61300f603798ecf1d7786570789f0ff3f5a1acf075a6fb9f756837d166e37d14  less-692.tar.gz
+# using DSA key AE27252BD6846E7D6EAE1DD6F153A7C833235259
+# https://www.greenwoodsoftware.com/less/less-702.sig
+sha256  242a64c00f02d96f8ee208cf638ae1728b727c7f5fdf82a7d4f4cae32fb084e2  less-702.tar.gz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/less/less.mk b/package/less/less.mk
index 49156a805bdc..91c853009af7 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LESS_VERSION = 692
+LESS_VERSION = 702
 LESS_SITE = http://www.greenwoodsoftware.com/less
 LESS_LICENSE = GPL-3.0+
 LESS_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
