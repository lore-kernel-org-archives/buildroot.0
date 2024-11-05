Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BC3D3176B
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 17:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A1C3403AA;
	Tue,  5 Nov 2024 17:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZklAAaIRoAKw; Tue,  5 Nov 2024 17:48:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCADF40513
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCADF40513;
	Tue,  5 Nov 2024 17:48:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B7753B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CFC580EAA
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:48:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UXwXCIXdsYYF for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 17:48:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7643780F28
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7643780F28
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7643780F28
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:48:37 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-83abe4524ccso216203939f.1
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 09:48:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730828916; x=1731433716;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wWHog8Hhcp0tiM7HvwfWcMxI3sRaZQQ6u9W5MYy7ZC0=;
 b=K7MxcM6IUFY0qkNYF0N286bBDIHDtWuvnc9UkYx4bSbGVBlQp+Vzo7h5MnlB54z8Ng
 OaXG1kFN4Qv0JIGeYX4JQXxQoVUIr820SoBCuLVGVMJFdbBfBDpgd7opvtvyw5Pjp7GH
 Po06egf7sftPfF/8Zjla1zWoVQ1uWlhlxmSYU/O741r2Vn0UDaRw26x0AOpbVjatcV2U
 d8ibQrtOgZwy5TazvO1eOiuMgPoWB8Syy7Ef1KC6d4okkk92sbHtoLjH/D8tKdntsC8B
 45Qn0t/HX4pGZOT/O0J6QUAtesYSVjWAGjQEnvf9xWqx+Z//d61Trs/+X4ftwjj+XRUi
 LCXA==
X-Gm-Message-State: AOJu0YyKUnJvfgfXM7ofim5K3vH4EJ8ciCsHfZzWitltUSlvQ/87qpG7
 QbOCLpEblMTEtdpf9AfT3Wfav9TW87X35nf2u6APk73w/y8A4sXeMiJ/4Q==
X-Google-Smtp-Source: AGHT+IHYJHdlce3mtQ4iEuhP/mJUWsAenHUIUL9ElKHzH9K2J3dQEn+fXh3HxypMb+YBEYG8a0nT0g==
X-Received: by 2002:a05:6602:6c17:b0:83b:4c:5f70 with SMTP id
 ca18e2360f4ac-83b650372a9mr1963952139f.12.1730828915789; 
 Tue, 05 Nov 2024 09:48:35 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de048e372bsm2499630173.74.2024.11.05.09.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 09:48:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 10:48:34 -0700
Message-Id: <20241105174834.1400335-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730828916; x=1731433716; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wWHog8Hhcp0tiM7HvwfWcMxI3sRaZQQ6u9W5MYy7ZC0=;
 b=fHncsRxfERVUT/UGPwGvJiAAn6z3TSJ+xqQWtzczZ/1lPFW25XyEPv4bRhb0PD65U/
 HZSdh7fYf9t80BL3Ewu4wrBfZNKKchsG/HH0FfduxGulPwD0oKnddp2fyI1DJPxbcVG2
 +xDzldIrJkYPfwFDHR6zlLFlHDasF5uNep+yj9OgWEbVlCHEYOxhjQUdDglWevtmFCt+
 uZ0fg7ztCF9NJtjYhHHqE0DXjGlYTBHsRbar1npnlxBp6WNYPw44E0ziKywW84IhvCSU
 fhbRcgTLlp+e5a7XIFDRNO/8TiDHSqrLc7RFs37X90rNIPXFPUH2pAx9Xk2RXNEruLs/
 W2/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fHncsRxf
Subject: [Buildroot] [PATCH 1/1] package/python-aerich: use poetry setup type
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new poetry setup type which automatically pulls in the
host-python-poetry-core dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aerich/python-aerich.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-aerich/python-aerich.mk b/package/python-aerich/python-aerich.mk
index 63343e0b96..6df3dc4f6e 100644
--- a/package/python-aerich/python-aerich.mk
+++ b/package/python-aerich/python-aerich.mk
@@ -7,9 +7,8 @@
 PYTHON_AERICH_VERSION = 0.7.2
 PYTHON_AERICH_SOURCE = aerich-$(PYTHON_AERICH_VERSION).tar.gz
 PYTHON_AERICH_SITE = https://files.pythonhosted.org/packages/ca/cd/ae9c60ffc21e2d41e22c62cbf24a60dfad937222d880489703842d179746
-PYTHON_AERICH_SETUP_TYPE = pep517
+PYTHON_AERICH_SETUP_TYPE = poetry
 PYTHON_AERICH_LICENSE = Apache-2.0
 PYTHON_AERICH_LICENSE_FILES = LICENSE
-PYTHON_AERICH_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
