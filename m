Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E91F43686
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 09:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3089560E25;
	Fri, 17 Apr 2026 09:00:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2R1dp35TO78k; Fri, 17 Apr 2026 09:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FBF660DE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776416411;
	bh=v51ju+UDyUBV7QUVHCnx5gS79eFWqkWoVCwkC5l9JC8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bt9QyBqekfUqwDKkAkgCgh4GNQsbKKIRlNj7eNAwmKW9f7wO4TcMqSeFmGL1cTgYf
	 V7iGvoYlPxjscZDBA+Z3Z5wxfLhTK9ysJwpahnc9L3QZ7pPAifcru1TM8pAKgqENxc
	 uVeio/JL+Ar2QPUbykQ1xJWtktBddrKBczquD5hpa8dn/kir1UjoAk+O5HU0142nmg
	 KpP+47FIQ3az/pAIrap6cX97NlNNJ6MbxueXCM5gWhvEmiff34pule/1s13TmCDiSc
	 nicH9AacXfczoBjQFK8/sdGJc7tlc+4evZh0JB/i8np3H0YcejPpDmXledDmyCeHUV
	 gtWOuaMaAJGmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FBF660DE7;
	Fri, 17 Apr 2026 09:00:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02898259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8E73805B8
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LZNp4Ixvay5M for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 08:59:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BF711805CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF711805CC
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF711805CC
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:57 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so6854555e9.2
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 01:59:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776416395; x=1777021195;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=srZN2RtgM20pSILc6NZndI02wIqmV1UEDIYhyIRe11A=;
 b=l1aNU8ZK4SBOho9tSbjGWZD/a1mA6jy+GVkNd68yfqGAtu6bYlkEt/A6KB8O0rUqM1
 rTH5K7nInlYi4CTcXRzBD3vtLxewAVKct2pgB7kOSf5kR44MTkC9slgW6sxkFQEK1u/V
 2LkjH8VxvF0Cj/LhanJdi1XE/h/51Cel73zCV+18thXKehKBwfHb7D/5u+5iybg7cZWK
 CrLDYZ3LzawBphjkFc8PvaaK2HpM9YBAoSRKju9S2ozIg1Iaz1x8XYIEmrs/B9W55lJc
 p0sFuUCiLCoekzhUbCsUPRdvkrpgg70vLBmVE4Qrm0b6MYKCbsx7AVxgco3yaX9248hG
 xQ/Q==
X-Gm-Message-State: AOJu0YwT6i1Wh1GkEn5jmN7HGMWVa78OVrQqcQnEtR85qrnUldc6uB6R
 I+Z0Op1JOCYteyGAuOmzMWdWA4+u3C3L5zX/xCrcn+gcXx2rCAQY1Ow/mC0wojuuvmDtov8hriv
 j1qc80Tc=
X-Gm-Gg: AeBDiet1kVitjMl7+40F8/R657ZwQgyXg8HibxcRTkXNmt1HQX5eQ/yxrHjFvDe1sHU
 hYfvht81tBHpEdvxc3dOyBzs462VfTHKG1kkY88sLKu7YsEqTKWA1POWuSm+Ro7w7aPSAywwwHO
 jHWpAEVqAd3wxalkx6COCDxg34P1xpMKbghGR2wvNknjB3K4F3RsPXxI3zwU8O/t8JMCpHb5S/f
 5UO7ivfDu6h5uilpDWt4GUSJmylbEiEGMZoX0F/l7NHvSL3gdDY5H5WfU+Wi3RMpL5hQWTBYovF
 batq9aat+z9aWRHi0GRQ++iAnmvlq+mhscit9PJFT2+3+Sz4dC4c6oJoPUYlk/UvrUhN0UoPowq
 eAEPsJfag4RTj5BSig3TTBdGZvUvhwS/JUHNTMk+4ESNCoHouPQtHHZHhya4O4sFDi6PAjpYK6z
 HzFMlNxdFYxayBPXgU/Rt8anNR5265RSj4xxRaBicIRrrVGcrsCdjUVebQ6+ydAJOVCs4GfMy9A
 cM90Xm7loxVFaKPr1ou9tWiR9sf1Hc=
X-Received: by 2002:a05:600c:4fc7:b0:488:dbcb:ca08 with SMTP id
 5b1f17b1804b1-488fb787a62mr25604335e9.30.1776416395494; 
 Fri, 17 Apr 2026 01:59:55 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7a0745sm15077795e9.9.2026.04.17.01.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 01:59:55 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri, 17 Apr 2026 10:59:35 +0200
Message-ID: <20260417085936.200528-21-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417085936.200528-1-dowan.gullient@smile.fr>
References: <20260417085936.200528-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1776416395; x=1777021195; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=srZN2RtgM20pSILc6NZndI02wIqmV1UEDIYhyIRe11A=;
 b=kLpwUhwpQkMPL4p6t995RE8aH1hBO0+2a/QIOi/NMEgsjqwI/e33P6wEnBDUACcTBJ
 Gxcpsgt9OAKgLcYyUhmzeyp2px1PrT7mThoWJQ5NxrfgpI/yxj0KbL+3whyW8Vvvaxz+
 O37bHnWd6KWh3g2C6Pmyh2gvhkStkD7WMNvtA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=kLpwUhwp
Subject: [Buildroot] [PATCH v1 20/21] support/testing : test_rdma_core :
 Bump kernel version to last LTS (6.18)
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 support/testing/tests/package/test_rdma_core.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_rdma_core.py b/support/testing/tests/package/test_rdma_core.py
index 614fb51f48..2815ebadb7 100644
--- a/support/testing/tests/package/test_rdma_core.py
+++ b/support/testing/tests/package/test_rdma_core.py
@@ -12,7 +12,7 @@ class TestRdmaCore(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.91"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
