Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6139FE8FDB1
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 11:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28091407A5;
	Mon, 29 Dec 2025 11:15:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bXvJTPxtL8xi; Mon, 29 Dec 2025 11:15:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 562C7407A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767006933;
	bh=tHdkuVgN9GsqBA6a4Aj1vj1ehuXO+V+N87t7RCWgQsU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dMbhtsQBADDtNEYeu59R3PGodsm2BB28hnFjeRwoLMZj9RjgZ1DANoeE4Ph5tIuUj
	 Y2RcYZ8doGV30Z8xx1sG5Ud4xj3l2DhLlytm1ao612qRtHolAWPFBQxyVF5+8zCjap
	 xxyBCE8nz1Y1Bp0W3cET31lzNZ/6C1LEbzPtkWCkdciOUq2pzXPkQCbA854COeOZRU
	 FCodNXTCwMSJzDTVEdEhSUV+XS8kl3miqOq6in1gyxlZ0dy31GZ1gvxweoyYUF8TtY
	 WxtAh0anoLtZqLoXuuii66lNbGV9Af6EX9mVnTHUPNcMmWsFx//kdRMFWJnhiSWfcl
	 /Zbg+osNshCVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 562C7407A6;
	Mon, 29 Dec 2025 11:15:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DCCD3B9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 11:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEBB0404D6
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 11:15:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eY29bd6SPG-6 for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 11:15:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B5757400CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5757400CE
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5757400CE
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 11:15:31 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b79ea617f55so1667681966b.3
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 03:15:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767006929; x=1767611729;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ccCrEUi1ifed2x0wk3IyoxyyH2eSUzO2d9qxEhyi8XU=;
 b=nQZ0YSahB6EMgZltWQvt9lSdnO249p3g//cIy4ahX2xWoyhdL/OnFYfc0byMXkMgcP
 uAGA3dV2wtKoZmRUsYRuztk+sWhIKr500Hi31432xXf8kABN+LflycKfuQ1Hp1gh3eAf
 55KMCynuZK9YeI60TJMu30pyixiPRUhGVZ9mX3387qYByhk05JIKWaaDW0V9qqzrc4ri
 QQyAi/PKioCFEYkhFYIy6v43unUAjWKTcuxvYB75Y9rZejS7SFHM2mBu1TzazMwjTqFU
 Kh4zKcENxwWlFdnfofMaT4CqjyqGH+Wb5p3sL6RaU677Bak7wl7O3E1z7kJlUBJY+1Pp
 +GLQ==
X-Gm-Message-State: AOJu0Yyt2dl0LRxkLtWdZkgLnaLuyGJNBMmoPJ5YwsQRpCGkXQBNr1hH
 mWTpgD0QwrOJxDQq7lHa4KBs6lUDyXf/VtSW7bhp82ZrZwqm7my6FN8Wto5n9oHmRIW68PWRXPt
 npwhL
X-Gm-Gg: AY/fxX7Oh98o9HqeN9r4SGAI3h39rw7SB8M8JU2kAXFvucWnKciQpOI1yxiFfD991wY
 btdFhSxx9KTLLKlSfo5lpycKpCkJj0rVXtU9tTayR4NTAfh5zaIsrDNiviDdJDe6OGSwI8kSWew
 NHpib8+5Vx0XyzHzURVkbhr+gUX7WHjmJDZP90DX9mNvtCzs9T/WPox4Hjai0U5fantdYt7xlJ8
 9JUu7ESj+uzmhQr2YaMey/plrivc8IB88At7PC0nUG4hgXcnZnHp8QtE+pzdHufOxRdLYUpLw36
 2MiTW3/FJqTaYU+V+u9Q1r+ASF1ixUYSRZxRNjrurD+SdG/A4HRbahwbbStm2z0CMuR+VAnu8uU
 AVCX0Qqxge1R8cEWaLk73fQzI1SE+iKLwAdxts25806SNVHd5Kgn901WutBUJm3fhfwYAExTZvY
 Up/Tk2A38OzqTRX7WIOm5uHBa+/1GCgPC8BkvDUZ7j+v++N6x1v/M30bQeljIR08YFoQOvUAh3n
 QvMU8x4HrVLaWkSLGj67KSGIQubNILV9wI54pHCjn6h1A2g0/9whlZZkkQpWXWXqI0hqqug9p00
 x8kuVgVsSP2L
X-Google-Smtp-Source: AGHT+IGWjLQLhWyam4T+iqzwCN523pG4R2tpTxJk5la3gG1ZXwNLOjhQ4iq/IPKfaizMMnAaCwxsMw==
X-Received: by 2002:a17:906:c148:b0:b72:eaba:aac2 with SMTP id
 a640c23a62f3a-b8036f5c415mr3083583466b.26.1767006929416; 
 Mon, 29 Dec 2025 03:15:29 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b838c69f87csm67504566b.27.2025.12.29.03.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 03:15:28 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Mon, 29 Dec 2025 12:15:25 +0100
Message-ID: <20251229111526.10487-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1767006929; x=1767611729;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ccCrEUi1ifed2x0wk3IyoxyyH2eSUzO2d9qxEhyi8XU=;
 b=V+eaVQjG423Xr/M/581v/64o33bWtl9Nm7w9PvC6x7WndDAm8LPF18gJG3d8SIv49r
 RDGLLmmHcry4e14vBZqc69QOFl/ERd/gg4Qcr72Q+vfL7wPGqsslyte2GoZDvtpyGiBW
 igwjuOx5b2ovSDMIRZhTg6xy1I93te7k+Qfjc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=V+eaVQjG
Subject: [Buildroot] [PATCH 1/1] package/armadillo: bump to version 15.2.3
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

Release notes:
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index adb21b66c74e..b830037783ec 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  8ee01cd4da55bc07b7bc7d3cba702ac6e8137d384d7e7185f3f4ae1f0c79704f  armadillo-15.2.2.tar.xz
+sha256  0182d67d6949e4347a0bc62fc8c2793be7eb203c71f19edff93f8c45fd4a8190  armadillo-15.2.3.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index cb83ee9e178b..2df7f10375ec 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 15.2.2
+ARMADILLO_VERSION = 15.2.3
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
