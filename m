Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9061E94109
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 08:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8519960868;
	Tue, 30 Dec 2025 08:19:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YFr-1YDrSygV; Tue, 30 Dec 2025 08:19:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 679726089E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767082771;
	bh=4FG8Nta/jQmZEtwYpkdwk/Xs0wh3aVDIlki0EAYRxg4=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=mP466rMFW4v/pbbcPJELyMWCAZyrq8n+nQo7pkyBmr8quMtLNj6uZ5ikRGIsN6fPF
	 D2Ae5mRWtHQjypLR9eqFtBizEEFx6Wo/0EpnQ3XSopHIXc33nIZ8amrAjBLpTPkJdK
	 m+Vv5Bdyn6GnR9jo3VXFRBZxStrydHD1YXmIdqwZwPJ8W3K3lxSJbSrWyMo+FQ7mrn
	 3mN5lttGIUH1VFrgwRQ4KJomctDE2doeQoWVcySwsrhzH/Ij6dcLeVM9YF6dKw6pIo
	 h2mM6zYyck9hV5DigUYihx6ms2cEChpKyjq1ZB+J5hXbHQlGxyqrCx4nAosg5XB2ru
	 ocSWxGr6bxpYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 679726089E;
	Tue, 30 Dec 2025 08:19:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 38401D8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26F50812FF
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t4bV2KZ9e9iP for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 08:19:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 92B4A81295
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92B4A81295
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 92B4A81295
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:26 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-477bf34f5f5so70911775e9.0
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 00:19:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767082764; x=1767687564;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fGmuBZDQy4j3oOztHCB4Bb1Z4P4Gby62YuozCickQ08=;
 b=cfng9VxkZH1xNSBKb/nCm44Kjxl1A4xK5Y5h+5QzXwS82QoJTLCViwR/MmOubcHTGG
 YJV8QEVL6DeZCPDNHGlzGgTPNpVob3GQZO4BfVSx4kAgfVHdtFLGXlvX6RtquwJqAoCA
 9Prj3nNpbLzLDd0kAMh7RDPYsUHtiz999RF4eVHY1iMSb2/gHpMRsCnsdd2FtkGCJ8jN
 VXfg7tNKJiSslQsg6gATfuZyf24IPSdS70icFytEvSXa0wtXoCUlCfZWCUQtAZqTrNZj
 v+P7SUF0KTfvovz6db1EXGCefEJdR1K0R+4Ivs0TozeU6vLv432razinPm6mbgbgtJdL
 QcSA==
X-Gm-Message-State: AOJu0YykD+4q3IhOGAyat0XSlb7M8ObTL05vP4Enlg2dPa4CBJYtQom3
 MrwWE1LJdB7jDDCItz85jGMdXHQ0jXYZ3rkwhGiAWOsSmFCz2Z59X9rjvEQBgbT2gxFMLLMjKZG
 w8/UkPwA=
X-Gm-Gg: AY/fxX6cjvs1nJFDCwPYp2TeWc9PtqmxtBaRtcaJ4dJR7JGK1S5EHbBxegKfFj1kG2L
 Ebjp1GROblyxGYVf3kXB7IsjABuFcp5SGKWC0nSbgx7TChqeYmArXiZcxC2FsEu54fcLBRSyib7
 fu/227qkDanubP7KN2I5f3kQHyf2eezCTqZzQs76Y+xQMOsNRrciqtqKgO1QUISFd7nDRLLj3Eg
 vE85R1nXIQtTancR2BmO7Pz9haFzAis2hsEyC1yc0n+jCLh6AYyaFI95ORAQhgluYLfFOmJFAFV
 dkMQ4st56Z1RS5ao964AXcFdK4eifdqoVoj4HRDzVrrBClrnCxhFekCpRTa9wsduJ2Nl0RigLXW
 zQEKwNNf3/zYfS0Yq5aEcL/3ur33L2ORKeGzkekfrMBXqwQypa0hqD/6Y9PAg5ckpnkildTDRt+
 y/dXM=
X-Google-Smtp-Source: AGHT+IGgPozhujJdf3c3FegWSx5sD0gudATTcCWiYddWb7Rtc+kvkOPcRYWj9dPzT9VI3O6vzbhoxA==
X-Received: by 2002:a05:600d:4453:10b0:47d:2093:649f with SMTP id
 5b1f17b1804b1-47d2093660fmr253173385e9.8.1767082764273; 
 Tue, 30 Dec 2025 00:19:24 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab2ebfsm66328773f8f.40.2025.12.30.00.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 00:19:22 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 09:19:06 +0100
Message-ID: <20251230081917.18676-5-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230081917.18676-1-thomas.perale@mind.be>
References: <20251230081917.18676-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767082764; x=1767687564; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fGmuBZDQy4j3oOztHCB4Bb1Z4P4Gby62YuozCickQ08=;
 b=EbK7YZXMEwB7Lg5qLPnWqp5TVeUYG/V0vbraTAUyCKCwKgFgslNkL/KhnCaVurEGSz
 afY9nYr3aY1VIl9Qm+TJIU/TP/h/rXTqkrdLVCQjKm8+9hqttQ8W8qamXUZzBffOz506
 0DaLATE13YP96Jg8Mx5iUBByPPL2tTBatso1IY6b6AasfOkMeD+6msQ/s9uv7qDggqb/
 lOfCGWE7lsgWKvTWibzuronUEIxEe5kkStEJ22XNk+vkBa6FSEGtixrlpRk/Mi845wp3
 TnxmHSWjoeXIEdDklHRGKqXpCKt7UqYZq8zmQtimh+nk35VyOPabkXQ+0X+PQS4iu61M
 pXbg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EbK7YZXM
Subject: [Buildroot] [PATCH v2 04/15] package/tiff: remove stale IGNORE_CVES
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Bernd Kuhls <bernd@kuhls.net>, Olivier Singla <olivier.singla@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Buildroot commit [1] introduced this IGNORE_CVES entry that was due
to a bad NVD entry.

The NVD database has now fixed the annotation [2] and it can be removed.

[1] 740412aefc package/tiff: ignore CVE-2025-8851
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-8851

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/tiff/tiff.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 32bebcf95f..e64a6baf83 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -13,9 +13,6 @@ TIFF_CPE_ID_VENDOR = libtiff
 TIFF_CPE_ID_PRODUCT = libtiff
 TIFF_INSTALL_STAGING = YES
 
-# Fixed in 4.7.0
-TIFF_IGNORE_CVES += CVE-2025-8851
-
 # webp has a (optional) dependency on tiff, so we can't have webp
 # support in tiff, or that would create a circular dependency.
 TIFF_CONF_OPTS = \
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
