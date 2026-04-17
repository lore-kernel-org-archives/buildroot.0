Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B419AF43680
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 09:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 883D460DCF;
	Fri, 17 Apr 2026 09:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bShZD-f8Ogvs; Fri, 17 Apr 2026 09:00:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB5B960DBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776416400;
	bh=qrDihmW4SGYJc8SVnk4sjrX2bNpRUPr2fSXZ8yp84g4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=id2l55fFmgJHi73vb8s5jz3A3T1ltDo83JE6hhWSp+E+9GWoflzyFOtvH974uvFWd
	 NTflOcNWjPdRhFiuEGp0CtFyRTGYV4AJDu1tusi35L/vswgUXO2x1XYlV4JzPBI/8K
	 XGy2lGYlH78TQc/ByaeplPfsM2uPUJvyZ6Dfg92TWdHjn7XZqF+aoFiZ4IwIROyenK
	 ix38J2v6tc3YuX+H7+kXTlbeUc51lf9bl6oooikFp/pgaUsK5ONE0NdNrq7/vzkrsG
	 OQdOn4t7Qm9nRZEDAfuXjhqHA3eJUoEpUbgUDZA4sKXbLyYD4WbPpAC55R8+t4skIG
	 VzQPC3hozbkeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB5B960DBF;
	Fri, 17 Apr 2026 09:00:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A00E5259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84CE140CD9
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yzuf2rYx23uU for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 08:59:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A7F2240CE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7F2240CE6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7F2240CE6
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:51 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-488aa77a06eso7606985e9.0
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 01:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776416389; x=1777021189;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Lc8cgauQSPcXO05cvW/39KOex1loyI1IrnpfMO6U/I0=;
 b=jvNhKKozKqeuWYfHPhP5WR7cAV7PyR4593pH7xy9FUGtSwdEcTBOJkqoLPh4GycMN1
 IFJ5VyVxd8gPlANTLNZJgPx3jNGGQriMSNWOotJ9pUHsP8fV4hoytcxBJi1NsZW7V9By
 8et5ZIKjFCVofW9B5Zy1mCzVp+Fnn7rM2AlRlXCyO9nrt/Hi2ziI1P6mwTCiUTGYoWWQ
 K2VVGT/izZpEobYccxYn6oISggCxqc3NDsW0vqSsepbMLjUK/rH7dT6fBdIRaj9Y8MXx
 dCYs4/Rj2Vgy2iW+MtWYCLZmn1te7ArT3Qf3uq7Vy188wv0ykla16+rvTti4Yb3OQzFO
 b5Gw==
X-Gm-Message-State: AOJu0Yz4sTE7kbWIO29S+B4YfK+psjjb/Eh8rxDNMO6yFZrc4U9ELUDc
 7cJ9GGmrl6L4HnogMaalkRQcDE0qEo5dnN2WcbWnfCuZzTuVXaUjQz9GWZRinQlqQtIzzd/RvUu
 TzO5ADtg=
X-Gm-Gg: AeBDiesR6SQ+b7US5Z+XaUFUMrn6nOky8K/9i+mVEyern4yUTKAAxTIBW0YrVe+gygm
 Z1lCKCnH5fLejv0dwJYH7qI6l40eO6wvwmOYr5sQDkWgGs+ffGlsPxT3wJotoYikQffEnjm0P05
 pBCrrtuZShM7PsLFyKOzclVBT9+41n+7C34XmCusjhdt5mBfkBZVh3Q4JwpSLzB92FVoIhtnfAt
 YibVLfKLv+rG7y4HdAx5zVuntPCGxcZv8gkseDX1T3extovphitPbGUHfBFsyLVoex/aqhBZL2R
 ARcPr1PZHAcujBXntAtWoKGTgpECygYlOLEFOdIQhhzEC0wDkzjPi26ZGmVPtBPvhigME9sG3bA
 dU+fuHVP+cksnPhzeadFJ2AKNulW43i1uik2XnJTD0bS+JuReoh6iMbtFJfL2usrIOZlS69nT2D
 g5XILDeq9FrWEQviASv/eC9PY0ngpuApaHzW55+uWaS4U7hr/lBCIht9yr8d0ilQflV99wOK3eX
 n0HMHfmCLxoUt1lISHyIPtzgqPf3gY=
X-Received: by 2002:a05:600c:8485:b0:485:3ee1:eba5 with SMTP id
 5b1f17b1804b1-488fb78e02fmr29615685e9.27.1776416389360; 
 Fri, 17 Apr 2026 01:59:49 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7a0745sm15077795e9.9.2026.04.17.01.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 01:59:48 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri, 17 Apr 2026 10:59:27 +0200
Message-ID: <20260417085936.200528-13-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417085936.200528-1-dowan.gullient@smile.fr>
References: <20260417085936.200528-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1776416389; x=1777021189; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lc8cgauQSPcXO05cvW/39KOex1loyI1IrnpfMO6U/I0=;
 b=Quc4QcyOSn8qE7Sq4FfgQoCiXb1kLO8cgVf57p4oIyy8f0+31wgdrGy3SMoG63SrJB
 L6QwNDqd1JQe/oKugunguV35kkWMgwh7RhWOgoSHqrziq08DLvjAGMWGVcnwoVEqji+/
 943JukupLZUO3vvy5BgNxbfV1erAJ3uOOeGi8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=Quc4QcyO
Subject: [Buildroot] [PATCH v1 12/21] support/testing : test_dtbocfg : Bump
 kernel version to last LTS (6.18)
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
 support/testing/tests/package/test_dtbocfg.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_dtbocfg.py b/support/testing/tests/package/test_dtbocfg.py
index 56a1ed4820..32f6229e25 100644
--- a/support/testing/tests/package/test_dtbocfg.py
+++ b/support/testing/tests/package/test_dtbocfg.py
@@ -8,7 +8,7 @@ class TestDtbocfg(infra.basetest.BRTest):
         """
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.202"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_USE_DEFCONFIG=y
         BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
         BR2_PACKAGE_DTBOCFG=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
