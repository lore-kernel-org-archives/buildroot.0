Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1727AFF887E
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 16:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA4AF83F28;
	Wed, 29 Apr 2026 16:41:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BIZJ1Z48HFAt; Wed, 29 Apr 2026 16:41:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B856983F21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777480889;
	bh=06/kGFavx9obTjYNJF/S0cEncEtcjTelOTCldrAjVTQ=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=IEG87+vBwhZlvY4iuwfELd3NTaBAWuprP3xq/JMIZ9ep0AFn1nlXRj4m58s/KggEB
	 p4jcpH4m+d4YbdH6eFrMFMRa9KGLbzwLzXTdea0McL8bG3FD/HS7QQDtRTS18chLRk
	 p0gbuplVhGb7rXWm/xtdQDM0WURVxtQLpxfgta2KlWWw0hnRp35sxpXoD0qzZwg97Y
	 epLzlA4P7GmxNP2kOMu5g8dHG1MkUFW6ENRDAIK950tMTPyQJfDUDrNC54SNeoxIwH
	 PJjPfEKsyew+0c/NG9MH+4pE6kjgkCjGujgYoQGQ1sWKkzST59Ge1Vcur0Rm/goZ2B
	 QKNwgNdk69lSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B856983F21;
	Wed, 29 Apr 2026 16:41:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B724923D
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 16:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6A1D83F21
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 16:41:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TJt35bQEIEL0 for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 16:41:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6FD9983DCF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FD9983DCF
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6FD9983DCF
 for <buildroot@busybox.net>; Wed, 29 Apr 2026 16:41:27 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-43eb012ac4fso18473f8f.0
 for <buildroot@busybox.net>; Wed, 29 Apr 2026 09:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777480885; x=1778085685;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aOlxsNbmMgcO+W94hOiT7SIxyyLs7MLUXNJGu/6+n90=;
 b=U23xckfP3OXldMaf+5/pgSx5820TkQlj33mqopdfKnAPC3NLLD4Y1ThHlOW2ofCEpu
 4cNUZoI29gGeRujbgj/FYuVxB+e1FrFyDOhjoblUaTasUjm/0229urF98C2UhbRpqaF/
 1BWQXojsO8BMiyQpVJa9U6mpNHay9FjGrpjPuI35GOUMmcPtl/oL2ZN0sfzkF2+IQECv
 RSE+DGsMNvDkrEE8DimJhdoipoKkjjbCcU2eZdoftWDbpmCI70ndidPUZQZmF5DyDwy+
 CmTsNULMOv1Szkv95J1n7HqnKqcTFrj97x064bCvG2loMvfGusPUl2mVO2hTkG4M12kP
 Q2Zw==
X-Gm-Message-State: AOJu0Ywr7ymlgcR+m41KkQzpR7GvVpbcnOgWA6Diqg34f6/LhyjG7dIs
 zrCccQp2miPqUGYtBKNFVpPm+OrBHw9ScoYy9RpoqFVw6961H7DYfK36YY6+InORiy6iO447wCI
 ULMIeScYr
X-Gm-Gg: AeBDietC4/+Y2K3ceP01VuGP8m/rA8iQA/FpQH/LdOQMkUJj08EtaVtIFU2gBBGTcLX
 iOuwB8bs5cwCktmcznlxWx2YuGAzvLeTx2NJHz6MtNC/Zm23QfxA7RAkVwDtu7J3jCYiRtyjP5T
 kVr9HT9Eh/8h1+nCD43Kcg7tTB3pUsv5NttPjcdgf1kig8s6fMDquwEPm7jrqk8st2oKyWXZEtq
 K+csrdQMbcdxZTSjry+aTjcifBK/5yygOtv493w9kjU2FUndO++/agV1jw3ecsoPjutVl0DZTRJ
 rVRQbWX2ENnNi1dfl29L1oFemE7qrkGrCYPCIPnmQoaiJvyKDTKDKrJMGTggZIlx2hCIGC7vsvj
 bkY4ytr2vEhHlTmUlz4jQTU5fT/TP52p8pregVWKObQ5tMnxw7h8ItVNH7bUkC6qNe+mG6gi2q5
 pLGe8hhajDpSjqG5sKLR/JE2KgZZhbCQdD7nTO0lRNkAYpAB4AbRzrpLKCOM0N
X-Received: by 2002:a5d:584f:0:b0:43d:1cec:4767 with SMTP id
 ffacd0b85a97d-4479065eb4emr8479099f8f.36.1777480883754; 
 Wed, 29 Apr 2026 09:41:23 -0700 (PDT)
Received: from vm-2404.. (222.186.66.37.rev.sfr.net. [37.66.186.222])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-447b120bdefsm7124728f8f.0.2026.04.29.09.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 09:41:23 -0700 (PDT)
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Wed, 29 Apr 2026 18:41:07 +0200
Message-ID: <20260429164108.159388-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1777480885; x=1778085685; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aOlxsNbmMgcO+W94hOiT7SIxyyLs7MLUXNJGu/6+n90=;
 b=Lfuy6ZCwQp8g/S3Tl9L3/3D3Xw/kPR4rfKaJkADbDWFvbw88IwH1VgondbV3uzAyTG
 MISfmM9MTuz6CS68hhfFx8XtZfkEs1aJrrATGMsU51bf+AQi0a0j4xH5f5l+Kw5fjrKR
 2Hj+DtQCKynih6KPQ51jjK8xVFlR/oWD4gZcPOfSrLnJ/xm+lCDo+gWedFWc7sGZp8By
 hsnETGpzpUcMZ4ixWFG1G1FdsP20zr+pMVrGSFR9zwEdgxAMC6JuQy6UCo0C9Nx/HbhC
 HDbeMfYvRpVOWSVUZPq8KKnPcT3HRmjwBwFCtfZHH7wkoRREos3m8wkHgl3q+SY3Gxrj
 DYsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=Lfuy6ZCw
Subject: [Buildroot] [PATCH] package/libpcap: security bump to version 1.10.6
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

fix CVE-2025-11961: Fix OOBR and OOBW in pcap_ether_aton()

For change log, see:
https://github.com/the-tcpdump-group/libpcap/blob/libpcap-1.10.6/CHANGES

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libpcap/libpcap.hash | 4 ++--
 package/libpcap/libpcap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpcap/libpcap.hash b/package/libpcap/libpcap.hash
index 7f53b99b8..098b059fd 100644
--- a/package/libpcap/libpcap.hash
+++ b/package/libpcap/libpcap.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.tcpdump.org/release/libpcap-1.10.5.tar.gz.sig
-sha256  37ced90a19a302a7f32e458224a00c365c117905c2cd35ac544b6880a81488f0  libpcap-1.10.5.tar.gz
+# https://www.tcpdump.org/release/libpcap-1.10.6.tar.gz.sig
+sha256  872dd11337fe1ab02ad9d4fee047c9da244d695c6ddf34e2ebb733efd4ed8aa9  libpcap-1.10.6.tar.gz
 
 # Hash for license file:
 sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd  LICENSE
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 67adb0a97..c4feee576 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCAP_VERSION = 1.10.5
+LIBPCAP_VERSION = 1.10.6
 LIBPCAP_SITE = https://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3-Clause
 LIBPCAP_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
