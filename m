Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD7ACDE003
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 14:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 867EE60D4F;
	Wed, 24 Jun 2026 14:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qX1zKqkg93ow; Wed, 24 Jun 2026 14:07:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44E1560C28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782310029;
	bh=HqiFeC9If6/TEZkD3YaXpE4P1pQb9GJc+67dkSuz7hk=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=pM9TcOOgeqgj8YSOU/Sfb7+8kjQkIU1p+j06YM9rxmQ7+hhopDDgzIoSVHXcTZGrL
	 ve8/H6UuhiVb5VTfnQzkTmxNEtrGOnRgILpeh+TqRmuIPfQdtoSxhANJN7uZ4GgPOC
	 cYUsxqZIEouqQTiHxiVBHq9mNA1s5Zmqp3gV6RmFkpL5ZnqnWwEQZRuddVsjTT5u8I
	 2DcIcXwMMSQWQaXY0eYuZLXPcNyXsy0E/S0s1beuMRwsYPBqd0zEHk1W39N1+rqaq+
	 yflz6smGg343tQarRA7sSGNgmYi2qEE5DMQkD2Vn5WE/IurCueQP/faRWKIU6PdpmR
	 ZwDZyOVMJvxDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44E1560C28;
	Wed, 24 Jun 2026 14:07:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 75FAF367
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 396D460B04
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pg0iNTGKeD64 for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 14:06:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AF55660AB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF55660AB7
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF55660AB7
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:56 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-49261a64cf4so3924475e9.2
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 07:06:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782310015; x=1782914815;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FJ9NcvHCizDuyZLSQisZrDQ6QmGBalsIRGa3vy7hwQg=;
 b=bC00kuWJSYxiv41XpwhGylFCZOsIDynrkSUUAGIfTJeyCsmMnjXQvOSVsojhTDu1fu
 5juyot+JK/dS5PvZXaJA+PKzpqqA/wXgA9sXzqrv8njl6DWzC1o4h7DPdKON2JEtAcp2
 hquxhZR5bpauGlCygSx9MsPbkx5MWrBXwRbY+24IljdAkc+L2SP0fvVVPYZNJuSdCZV3
 OgbDh3ZH63MvZG7+yuYm2WQreYfQCTv8C3riyIMbd/pMm5RqGJCYC1GObBAjbspu/ZKz
 IgFU6rVduSADv/YASJ8VKmWHyLtYfrzO9eFRCC/GWr9ve64M9CDygD5D6CQyNJWrd6tG
 MM+A==
X-Gm-Message-State: AOJu0Yxj/+UKjKZPk8BCKW6e8fqHyktpXQ1SywUtPmcOAMbj2Scv1eHJ
 wQpvP/LkmE96d1ciM2y+F1iRZiT4mOjDl/u1EdteTCBP2zvduCFfQ4L99Q0eMcmoePzcr1boRIY
 0UW+b
X-Gm-Gg: AfdE7ckYewzsVygJGue58QdqGRuFHBrsbeKKvDzpWUzcniuexK00iUJ6Mi9W2vuU0TO
 EeIkymKdaLOkGVyXT9/cn1ez4VIjHRsRDGHqILtVNOclmjW2xGOxQARXDTSaEVhnFpoZbGV8UmS
 jeFvVXiPCBuwjchASdEnddtknnyk+anljPS30sak/bl3U37n1tbp0tCbAbhFu2wOHwc8XZnFgv4
 O5cQ4HXCaqf27/HmpWBsgiFZ7zV48z/SHln4M/cv2368h8NeqvWCGcsLnfQq4qxae6674jknhU8
 9lOQC1tDDNDZu3nmsSIlN/24gVF9ocGHHpLNldSx2wEDhnBO7jkVRC5dMRXZAcqhz5Y2kP4QotQ
 cO2Rosu6aFJQrgz4003tkEITe46Foh0UzLKY74OEytqVkAmkkIaPyFOM6jeiUw/xe7udz0+AKxW
 2OkerJYHGSfhJc4gY=
X-Received: by 2002:a05:600c:c4a2:b0:492:604b:c77b with SMTP id
 5b1f17b1804b1-49260875ae9mr47804915e9.26.1782310014458; 
 Wed, 24 Jun 2026 07:06:54 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49260e14d0asm43700205e9.0.2026.06.24.07.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 07:06:53 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 24 Jun 2026 16:06:42 +0200
Message-ID: <20260624140645.185318-12-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624140645.185318-1-thomas.perale@mind.be>
References: <20260624140645.185318-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782310015; x=1782914815; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FJ9NcvHCizDuyZLSQisZrDQ6QmGBalsIRGa3vy7hwQg=;
 b=UKvKb/wTx3MVPaWiq3MeKVnWR06bseKIH3Te+u4ZZ88q47fxmESUv36RJMu77MP3pn
 FviEKffnfodmfrGXwuEaWT8749fOVirkJBfJ7j/CkKm5LbTN2Rr4jzFVpfsdfS5SsiRF
 QXmscOgfJi30uc7oHRkunDRdG/zhcW8y7/jZK5jd3pSh2fWXFcshR4cUr1qADm5kXvqE
 m5c4OFo3K910l4mEFqxYTJKryw1XF8MVt821TNPGf6bE8gyle/C/u6vk+ffeQCLhR/ZC
 5BzTXaHl7HmGfK4dERh7UcLtVGh4710hV7nZmAL7OEhytEyAav91Eld1qnCwObD6rd6N
 U+yQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UKvKb/wT
Subject: [Buildroot] [RFC PATCH 11/14] package/glibc: add vulnerability
 details
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
Cc: Thomas Perale <thomas.perale@mind.be>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Those vulnerabilities has already been addressed upstream but no new
package version have been released with those fixes.

The CVE-2010-4756 is not considered as a security issue by the upstream
project and is then marked as fixed.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/glibc/glibc.mk | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 4a6bc94634..9edab5e4d2 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -19,37 +19,45 @@ GLIBC_CPE_ID_VENDOR = gnu
 # allow proper matching with the CPE database.
 GLIBC_CPE_ID_VERSION = $(word 1, $(subst -,$(space),$(GLIBC_VERSION)))
 
-# Fixed by glibc-2.41-64-g1e16d0096d80a6e12d5bfa8e0aafdd13c47efd65
 GLIBC_IGNORE_CVES += CVE-2025-8058
+GLIBC_CVE-2026-8058_STATUS = fixed
+GLIBC_CVE-2026-8058_DETAIL = glibc-2.41-64-g1e16d0096d80a6e12d5bfa8e0aafdd13c47efd65
 
-# Fixed by glibc-2.42-49-gb0ec8fb689df862171f0f78994a3bdeb51313545
 GLIBC_IGNORE_CVES += CVE-2026-0861
+GLIBC_CVE-2026-0861_STATUS = fixed
+GLIBC_CVE-2026-0861_DETAIL = glibc-2.42-49-gb0ec8fb689df862171f0f78994a3bdeb51313545
 
-# Fixed by glibc-2.42-50-g453e6b8dbab935257eb0802b0c97bca6b67ba30e
 GLIBC_IGNORE_CVES += CVE-2026-0915
+GLIBC_CVE-2026-0915_STATUS = fixed
+GLIBC_CVE-2026-0915_DETAIL = glibc-2.42-50-g453e6b8dbab935257eb0802b0c97bca6b67ba30e
 
-# Fixed by glibc-2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125
 GLIBC_IGNORE_CVES += CVE-2025-15281
+GLIBC_CVE-2025-15281_STATUS = fixed
+GLIBC_CVE-2025-15281_DETAIL = glibc-2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125
 
-# Fixed by glibc-2.43-16-g5c6fca0c62ce5bd6e68e259f138097756cbafd4d
 GLIBC_IGNORE_CVES += CVE-2026-4437
+GLIBC_CVE-2026-4437_STATUS = fixed
+GLIBC_CVE-2026-4437_DETAIL = glibc-2.43-16-g5c6fca0c62ce5bd6e68e259f138097756cbafd4d
 
-# Fixed by glibc-2.43-17-gdd9945c0ba40d2dbc9eb7c99291ba6b69bd66718
 GLIBC_IGNORE_CVES += CVE-2026-4438
+GLIBC_CVE-2026-4438_STATUS = fixed
+GLIBC_CVE-2026-4438_DETAIL = glibc-2.43-17-gdd9945c0ba40d2dbc9eb7c99291ba6b69bd66718
 
-# Fixed by glibc-2.43-22-g8362e8ce10b24068bacc19552c128dd10e082fd9
 GLIBC_IGNORE_CVES += CVE-2026-4046
+GLIBC_CVE-2026-4046_STATUS = fixed
+GLIBC_CVE-2026-4046_DETAIL = glibc-2.43-22-g8362e8ce10b24068bacc19552c128dd10e082fd9
 
-# Fixed by glibc-2.43-26-g2890b35cd361df2517525bf2c5f8c63f6f0d4a20
 GLIBC_IGNORE_CVES += CVE-2026-5928
+GLIBC_CVE-2026-5928_STATUS = fixed
+GLIBC_CVE-2026-5928_DETAIL = glibc-2.43-26-g2890b35cd361df2517525bf2c5f8c63f6f0d4a20
 
-# Fixed by glibc-2.43-27-g4070d808bea1c077eb7e7d52b52b91cae98205d5
 GLIBC_IGNORE_CVES += CVE-2026-5450
+GLIBC_CVE-2026-5450_STATUS = fixed
+GLIBC_CVE-2026-5450_DETAIL = glibc-2.43-27-g4070d808bea1c077eb7e7d52b52b91cae98205d5
 
-# This CVE is considered as not being security issues by
-# upstream glibc:
-#  https://security-tracker.debian.org/tracker/CVE-2010-4756
 GLIBC_IGNORE_CVES += CVE-2010-4756
+GLIBC_CVE-2010-4756_STATUS = fixed
+GLIBC_CVE-2010-4756_DETAIL = This CVE is considered as not being security issues by upstream glibc: https://security-tracker.debian.org/tracker/CVE-2010-4756
 
 # glibc is part of the toolchain so disable the toolchain dependency
 GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
