Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736CBCAC598
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B9DE611D6;
	Tue, 16 Sep 2025 20:27:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UEYlZpPrOVRH; Tue, 16 Sep 2025 20:27:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22833611C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22833611C7;
	Tue, 16 Sep 2025 20:27:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C0C312D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E20D40515
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fXd7yr-o-S1f for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:27:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7F0514117D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F0514117D
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F0514117D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:45 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45f29dd8490so29451765e9.1
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 13:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758054463; x=1758659263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rrfpgmYuJRNHl5RD3NMhjwZ0iT/ujMd2lZ9e7Uawjmo=;
 b=BOQvG7YPuajH+VupdQx6nBPDAL1Oubm3uR5tSLMxCVm+OcMZ8RbWSu+5Nt/YzPA28v
 EjxAzgbGVYCVJKq9W32JMj2mosClXUBfNAPknjWRSfS+taiihhBm8kMBUBP3i8bR1rXW
 cl7h0ycj4Ayonv4jKXgyYyXoZRFpQ929JJPOetMQJuWvfJMA0c3zfIDkqcOj5VDWudAi
 Nk1NHwjPFm1PqY7GKc5VzTluCkZAj+wa4Rxkpf4GCE0UehzUD5+8+qITslIYhNPS2wQi
 PZs0t1XMfrNpoXdH0F9l2e0deHHSTgy4OfwLOYJb/Ap1DPJo9yr4ywFYmrclI3WdZBJh
 87pA==
X-Gm-Message-State: AOJu0YzJ8Pii2zxvUPCPuU91W5PlhmeNVfPrSMf09EQ5Aa/RjRxvamHN
 Q23RfMK4qawRg7/c2cMDjVIUKRwWGeJ4VXPmDS4AxhnT7hFWPXnv4XO/7Lyr03bcbeur1O34NwP
 f8uvUONk=
X-Gm-Gg: ASbGnctuyhaExQwW6ClpJLdtg32tU7jR+u1tNBlXdbJn6w11gZknuMMaSyK8GapcO36
 eAXckEDL/qOAr+wtpGO3Q6JAPuYGFUXY6fL0RgjX6PbUxJvjVpB/ylZzattMjSTpF7GPsL040EI
 qjWJMxBevXqTJVK9FTQdcOpkuk51A0HxdTvmL4r9ISKiIp4CYcE0cgD6phl79Xd24c2CByFm6pC
 Wa5oe9I/sJax4ss+KbH6gEIeRizZAIrbtLGeXEIaX3ojRz+heK6PJBNCcNadz+Ab8pVfesSNfWb
 Xti2zUhZJ1m1XHSwCrHok2/eDO65sMpZDlSgs37REAgprcMQZprqDB/HRh/0mAbUoSFooNel+q1
 mBO7GSuf/cGBalFBk5cbbZXoWbw==
X-Google-Smtp-Source: AGHT+IFl87SHYUFCeU6Mfieo3qFimbfrUYmfftTa5zBUwtPUjwI2YSKZlAIig+8wTLJ5jZc2jQ5jfg==
X-Received: by 2002:a05:600c:6047:b0:45d:d88b:cc6 with SMTP id
 5b1f17b1804b1-45f211ffd79mr126488975e9.25.1758054463318; 
 Tue, 16 Sep 2025 13:27:43 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ec22b16adesm5497723f8f.13.2025.09.16.13.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 13:27:42 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 22:27:31 +0200
Message-ID: <20250916202735.1121872-8-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916202735.1121872-1-thomas.perale@mind.be>
References: <20250916202735.1121872-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758054463; x=1758659263; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rrfpgmYuJRNHl5RD3NMhjwZ0iT/ujMd2lZ9e7Uawjmo=;
 b=U/z05yhDx7l0QWj+7bZSgRKWny1xCoOcN1tQbXfxcVsLHh+/a4EiC7DdNzwWnzE4UN
 ECL19pCNtwEACrBm5Th4o0ylZCNafxZ6HPET8KNJZHi0ZCWCXeUKY7pV/PVN6d82U2QA
 cm6I4lkU0pJUEV0FOokaBKsvwWgm3dJhsflGB63UbTpGbaI698m17N75Daqvt9b8Rnq9
 iwz1l42BqGZ0cgMzJJ052Yso/uXxFyB2Aa/5B7riVbf/ATHw4Fn5hEox90qt1f9HxzU5
 02bIaoRKhh88O4ZOmjkv9r0JHJv/yleSxP6X0dGDF4T04PZ3Cx8ywT/VVxANfVr/aSQd
 5Rsg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=U/z05yhD
Subject: [Buildroot] [PATCH 08/12] package/iputils: fix deprecated CPE
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
Cc: Michael Fischer <mf@go-sys.de>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Anthony Viallard <viallard@syscom-instruments.com>,
 James Hilliard <james.hilliard1@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CPE 'iputils_project:iputils' has been deprecated in favour of
'iputils:iputils'.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/iputils/iputils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 842fdb8478..8e00513229 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -8,7 +8,7 @@ IPUTILS_VERSION = 20250605
 IPUTILS_SITE = https://github.com/iputils/iputils/releases/download/$(IPUTILS_VERSION)
 IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
 IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2
-IPUTILS_CPE_ID_VALID = YES
+IPUTILS_CPE_ID_VENDOR = iputils
 IPUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 # Selectively build binaries
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
