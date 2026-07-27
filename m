Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421F2C53209
	for <buildroot@archiver.kernel.org>; Mon, 27 Jul 2026 13:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DECB880E36;
	Mon, 27 Jul 2026 13:03:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LwCPhzRNJZ0s; Mon, 27 Jul 2026 13:03:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BCD480E3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785157434;
	bh=DiQJBSXe9WlnxlkhnY0wXVVaZgHaRpePdzd/HUlKGXc=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=NwNkRLMiEBmSTlfiBtZULb9Ai4YEwh4PRiQteN5d7v690iFGm/OM8nDruFF3dHr/p
	 YtATdWpfAOscjmX/1KyiqUIDieNn0HyUeQIrSkNI8Ysgt0qItRAPOLtVR4NI/NsCOO
	 5rV+uAuuA5/GiYFYHkXphQlmFFM/XSgeivJX117whx+gRWc6yDcMubIVrFjPXYe/yH
	 gsPiCUxKkL4v9JGu1WqzuwqllYCeZg9+vng78jMX/sh7RNI2BVd+Ky9PKsTbEMpYEP
	 H5mq5qn9xzY0wW+HbDmLRfjAon4H9m32flgeTxYZFf00kJqKVBtqItafJ9JGiCtaBG
	 yw05yxi+yYjHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BCD480E3B;
	Mon, 27 Jul 2026 13:03:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C334350
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 13:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C52F80E37
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 13:03:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S1qvrVMlFowU for <buildroot@buildroot.org>;
 Mon, 27 Jul 2026 13:03:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=bastien.curutchet@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 97D9D80E2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97D9D80E2C
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97D9D80E2C
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 13:03:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 621041A1291
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 13:03:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 375F6601BE
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 13:03:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EF44711C13394; 
 Mon, 27 Jul 2026 15:03:47 +0200 (CEST)
Date: Mon, 27 Jul 2026 15:03:46 +0200
MIME-Version: 1.0
Message-Id: <20260727-perf-fix-v1-1-6bffb9146263@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyMT3YLUojTdtMwK3TRDkxTDZPO0JDMLQyWg8oKiVKAw2Kjo2NpaABe
 EzH5aAAAA
X-Change-ID: 20260724-perf-fix-f14d1c7fb681
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1785157428; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=Yn7+Z4Ommj/SaRgEtNfbGncVGOIXeWtLCsVIWdTcJwU=;
 b=yovzTEsRV3EEKiYvRxMaNYU3+wxNV8KI22LcTkHZjStcvBd+6tJdqekUtE3X0UzjdcmkAI
 VfCZPqU1N+PPKT1b8Ws9JTs4zEhEL01nfXdb01aVLa6SaXZdJt+7zBl8C7sfRiYljSGZSH
 eTegNZPWMdB9mjS6Gs7kCnFgbR6qM7JJtbCJlJjaHfPRqrlki9tx98ZtnghUYsNOSCqP8J
 rBuo+g1X56DzsHxEHGADEBr1BiivxsJNOK8PD5DuwGxU7j5cVzDY3xtUY8xYs/h5y42MWn
 WsLuB3GLVNS896WFH4fFj6jjyROEiEqLtUhpX38idbKig+VrpnZoPtvmPdz+IQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=yovzTEsR
Subject: [Buildroot] [PATCH] packages/linux-tools: perf: explicitily disable
 rust if not selected
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
From: Bastien Curutchet via buildroot <buildroot@buildroot.org>
Reply-To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since kernel v7.0, perf uses `rustc --version` to know whether or not
rust is available. If rust is installed on the host, this `rustc
--version` works fine but then the perf build fails with following error
(on aarch64) if the host-rust isn't selected:

rustc  /home/bastien/embedded-linux-imx93-frdm-labs/integration/buildroot/output/build/linux-7.1.3/tools/perf/tests/workloads/code_with_type.a
error[E0463]: can't find crate for `std`
  |
  = note: the `aarch64-unknown-linux-gnu` target may not be installed
  = help: consider downloading the target with `rustup target add aarch64-unknown-linux-gnu`

error: aborting due to 1 previous error

Add a dependency to host-rustc if already enabled, explicitily disable
perf's rust part otherwise

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 package/linux-tools/linux-tool-perf.mk.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 3238948d76..9718d83121 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -134,6 +134,12 @@ else
 PERF_MAKE_FLAGS += NO_LIBTRACEEVENT=1
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_RUSTC),y)
+PERF_DEPENDENCIES += host-rustc
+else
+PERF_MAKE_FLAGS += NO_RUST=1
+endif
+
 # We really do not want to build the perf documentation, because it
 # has stringent requirement on the documentation generation tools,
 # like xmlto and asciidoc), which may be lagging behind on some

---
base-commit: cdeeb9b9c688b5bcdcc80bf89f2c046b0bd55bb8
change-id: 20260724-perf-fix-f14d1c7fb681

Best regards,
-- 
Bastien Curutchet <bastien.curutchet@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
