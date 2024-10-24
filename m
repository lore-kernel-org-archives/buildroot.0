Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D65DD0BB46
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 00:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C9E580569;
	Thu, 24 Oct 2024 00:05:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qGqOwu7MoJhQ; Thu, 24 Oct 2024 00:05:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2311680AF8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2311680AF8;
	Thu, 24 Oct 2024 00:05:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EBB37972
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 00:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D966B40A75
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 00:05:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yRfNS_a0tV9S for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 00:05:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C467B40282
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C467B40282
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C467B40282
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 00:05:10 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-83ab9445254so14409339f.0
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 17:05:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729728309; x=1730333109;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+e+VFPvA1lxQFZTb9LaLEJjj2+CgvCrHHAXkpTNCP6w=;
 b=oL+Qz0/NvYjtSLewMhayDV/TQp9dfesXO3aJfCNljrtAVQpKVv1jJhuxq/8iJDqnfL
 F113LbuOCzVLvt1ajhTpuBrwZgqX98r1meb5PQ2mY2ZKRJTTRp7by4JhrDHhTZnE7vev
 s4aoKDRaR+UGRmplJKjhLuQDfnl++zhwgZ2adVesTAoMIqsBkcconAmXAs/4/FMSkgPO
 M/s0AlexgEuH/YTU+pqmSO/YY+oYT36clfwWquUwBAeeZMB5/1606RCSH3L5mdC4MqxG
 rCRDiTI/iAqQHNWpkqA82Bw7a7WDiSYLxiKtkL9rmGFO7sMJuak2MvK8l6HDFh5cutZY
 kzLA==
X-Gm-Message-State: AOJu0YyXvaTzPgy+SlzWvPEexeKqvDJ2wpK+V0bmjqmJO8v1Ac01HLGM
 KXh89MRqfsFHADj/CuQmYhley8yWquYQs5RsGeG8moOfi5Gg574qy6pcoA==
X-Google-Smtp-Source: AGHT+IFBrjRljkrNZ77UIoBM6mo6LN7+CKj27F85WPR5AYxNYRRR/LxCiO4NGN3/m3mtWw9obTq4eQ==
X-Received: by 2002:a05:6602:3c8:b0:835:3ec0:9 with SMTP id
 ca18e2360f4ac-83af63f6959mr531966139f.15.1729728309485; 
 Wed, 23 Oct 2024 17:05:09 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc2a62fcd8sm2457136173.134.2024.10.23.17.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 17:05:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 18:05:00 -0600
Message-Id: <20241024000500.3354977-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729728309; x=1730333109; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+e+VFPvA1lxQFZTb9LaLEJjj2+CgvCrHHAXkpTNCP6w=;
 b=fzbTFD6/sLsa5b4oG0ik+aYwUIKseZfnNT4dsqwUa0rCJWZXMSVrk8dNV6SEPLDlvY
 LTXb0S93h6nT1i+gDX7BRuK4LAwMvFoN4Ep7W3tN6u5TUtPw4+zvx3IySCljT0csCu+b
 2loaQ4npf1RiHWum6C/okORarIFwlkCiYdaCv+82l4KzLsQCZ6NRRU39lOZvU98SPd88
 738eilhRJ+javy5XAtVMCMGqYjH97BLLasfgj2vQJSq1GtEx/GquQL4stA2etqEu8LGR
 wRZB/PWyAz1p/lmgfRozY0bdXZ/1iqJm8M7JavX9GX5aK5r08fg+A3Y3NnM407S6uYvP
 nsNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fzbTFD6/
Subject: [Buildroot] [PATCH 1/1] package/python-termcolor: use hatch setup
 type
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

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-termcolor/python-termcolor.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-termcolor/python-termcolor.mk b/package/python-termcolor/python-termcolor.mk
index fc1db17629..e2492ab3c4 100644
--- a/package/python-termcolor/python-termcolor.mk
+++ b/package/python-termcolor/python-termcolor.mk
@@ -7,9 +7,9 @@
 PYTHON_TERMCOLOR_VERSION = 2.5.0
 PYTHON_TERMCOLOR_SOURCE = termcolor-$(PYTHON_TERMCOLOR_VERSION).tar.gz
 PYTHON_TERMCOLOR_SITE = https://files.pythonhosted.org/packages/37/72/88311445fd44c455c7d553e61f95412cf89054308a1aa2434ab835075fc5
-PYTHON_TERMCOLOR_SETUP_TYPE = pep517
+PYTHON_TERMCOLOR_SETUP_TYPE = hatch
 PYTHON_TERMCOLOR_LICENSE = MIT
 PYTHON_TERMCOLOR_LICENSE_FILES = COPYING.txt
-PYTHON_TERMCOLOR_DEPENDENCIES = host-python-hatchling host-python-hatch-vcs
+PYTHON_TERMCOLOR_DEPENDENCIES = host-python-hatch-vcs
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
