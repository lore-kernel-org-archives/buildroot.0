Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F74C3ABAC
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 14:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1BD640728;
	Tue,  6 May 2025 14:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7UDUCpddXJqw; Tue,  6 May 2025 14:53:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 046AA4054B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 046AA4054B;
	Tue,  6 May 2025 14:53:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EABC12E
 for <buildroot@buildroot.org>; Tue,  6 May 2025 14:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FF0B4058B
 for <buildroot@buildroot.org>; Tue,  6 May 2025 14:53:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gdJpF4Q8I6C8 for <buildroot@buildroot.org>;
 Tue,  6 May 2025 14:52:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 68EEF40568
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68EEF40568
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 68EEF40568
 for <buildroot@buildroot.org>; Tue,  6 May 2025 14:52:59 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ac3fcf5ab0dso948984766b.3
 for <buildroot@buildroot.org>; Tue, 06 May 2025 07:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746543177; x=1747147977;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WINEWMVYf4nnMgOvJCr+Mz2P38LuGNlygXuGQUEilq8=;
 b=lldJtXAsJ3RwA4ouvYHPDN6rNoJ2RFnRiwbsgI5ra2zkyiCi2h3SWmRdRccKacJU9H
 Wd/kc/lL7kSvDiC3iW4zJYdNIVpZlZhCjTJGfY8psvjJAJoUNhG6+BYXRnJPIE1WLVKs
 kle45wvXOvwocFUHDxUTNJAXKCF4vr79JNqMS6g7WzjZjL97D0W4oEHUXuAFYLDWMbPY
 MERPHSzD31UhR6bazkmOTNlwN1u+LYpcG2Lm9oPDZxmRqOwyGEv7IYzwGj2c66MZfY8q
 qOYl5lf6wPf9MITDxWK2fzSv3dDbHJOVu1XEV2bes+z5u6XQ0ccDoGWLb7tubxMciSSv
 gqSQ==
X-Gm-Message-State: AOJu0Yz7FmNQ3n99Ccng16Beeuqn69bzR3Xu5c6aG1iiCPa24Zbil8nY
 r2tHu1oo3Dof33YZlYysPu2DylBuXZFJ5wbW3/Poy+3EE8bSN77sYWUaGeWH85GbT8ymNmPH/9p
 wRio=
X-Gm-Gg: ASbGnctGmZNT3HXvWyl4yP7dS/EGw9Fu9bYlE1qK7wPlpTHJW3D5ogxsszbxmrEVMm6
 JsyTBNzpU8j2h8sYIVQxfWeOPCB27brs6OrNvysLCGLkCeZQcG9kLKeVv42QaWjdZmXgxNOouPg
 1of0luUrh3Q8ziAQdkCDhs8K5ANxQnQvvNbHSUr9sTNH6MvXt86ALQPyhMGW9WZ1WLdYm97VTAl
 AdRxokh+D00TyjHx5y3+rhVDKqGH8sU85QmjpaTz93H+Q3+7APtK89g794vbs/bQ0DgU7TXspLd
 bKgyjzV0yjqrB1scP2pWGJPrxBHuRP+64nRG+tZQqjVG/We945m2lrEUAz+iSY/r
X-Google-Smtp-Source: AGHT+IHnefz7nd8GHO0k2w5rhj5lXlE5vkh/O+q6u2s1l09Hhmjhc0zr7yXGzsElTKeZu2OOVif0wQ==
X-Received: by 2002:a17:907:a2c7:b0:ace:6f45:b5c6 with SMTP id
 a640c23a62f3a-ad1d454f4e6mr315908666b.22.1746543176945; 
 Tue, 06 May 2025 07:52:56 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fa77bf1e35sm7877770a12.66.2025.05.06.07.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 07:52:56 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue,  6 May 2025 16:52:36 +0200
Message-ID: <20250506145236.895150-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1746543177; x=1747147977; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WINEWMVYf4nnMgOvJCr+Mz2P38LuGNlygXuGQUEilq8=;
 b=a33XzVWyecl/ACrIUIV/Klpgg9ZZksJ4SXkZADsOpJIBRT/qOAaQVLv8Uoxllv18FA
 VzVxnA3vDQhVhJDzmCe9OFxGaVd7xYtNhU11JkNqI3WlEwyaeTLOlRqMUXiFRM4HREno
 lKsX4axFNifpnuhG82PjmaMyIXksVz7hAXBkKZpl1C9E2FKSvnipp5ZDlcNgsCNhQx2G
 zaTKhR6asSxvfZ1l6tdEF+AlI5WN2LwNfXxggV7dOJZ2OqvlTtFqFVFJhMIHVvdbYn4Y
 WVubYguI0F0DZBD6VuDx29EVIsmeHtRW3qmkthVXvTCiUbZnlI33aqk7/5G/XafqXT7D
 caAQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=a33XzVWy
Subject: [Buildroot] [PATCH] package/mender: ignore mender CVE because it
 doesn't affect the client package
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CVE-2024-46948 only affects the device management and update server part
of Mender, and not the client running on the devices

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/mender/mender.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 146e6b2b73..1050277db1 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -8,6 +8,8 @@ MENDER_VERSION = 3.5.3
 MENDER_SITE = $(call github,mendersoftware,mender,$(MENDER_VERSION))
 MENDER_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, OLDAP-2.8
 MENDER_CPE_ID_VENDOR = northern.tech
+# CVE-2024-46948 only affects mender-server
+MENDER_IGNORE_CVES = CVE-2024-46948
 
 # Vendor license paths generated with:
 #    awk '{print $2}' LIC_FILES_CHKSUM.sha256 | grep vendor
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
