Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22963C4345F
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 16:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1A10400F9;
	Sat, 27 Apr 2024 16:06:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X0zbhtLy_NtA; Sat, 27 Apr 2024 16:06:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF2EE40130
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF2EE40130;
	Sat, 27 Apr 2024 16:06:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 224EC1BF315
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 16:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E61382B61
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 16:06:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_LoWpkfRj3N for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 16:06:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 646BD8294A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 646BD8294A
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 646BD8294A
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 16:06:12 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-343d7ff2350so2364141f8f.0
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 09:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714233970; x=1714838770;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dsjHIzKuHOt3mfwrr4+ykLb3r1QvQDG4AmtaN3dIh/E=;
 b=EFZImTHcXQ3ihBXRyX9IjQH09uUbDOWcEsDzIyLeZlNJllod3zH/GdkMUeI+2UuEvy
 osvu9NVLhwt7EDSzemyauYJzYGZJskaJRP1uFBepWeuRipQIwkYpYFeLmzYzwpDPCCT4
 jdpQpYUeLC44Cy3VKzRmBrkKm+eUNCCAypqVEGr/YzVd9G5WttyGawWKRtN0sM7F2S0J
 QLOSnahtaRVGPJl4vaJbkV18M2EMO1bUsDyvLq0xrD7uwxVCQd17rc1TuQlaaKldeE3d
 yzcUD+TjvvZSOVlpvKlxAR3OFgB2N/yNHadKqrfNsEOUPDM0TBtjUyE14vmUqWnLMm1P
 my4g==
X-Gm-Message-State: AOJu0YwfeXqPAiQdNPIzFJJlqyJDpCnSgbyp/twyjAoOtBIXxK2aANW0
 //fNhZhP/VGTPYhmjyQw5z/jVTkYOn4w2EMDYyCwk7nnh9QnLignYV4WHg==
X-Google-Smtp-Source: AGHT+IGu0xaVsOrwCHT1K86DYeTRDxKIFPlEA4F+qSODZqQSsLcVskNk550PxFgdqRQrK4iZE+nHmg==
X-Received: by 2002:a5d:5581:0:b0:34b:e446:3e6 with SMTP id
 i1-20020a5d5581000000b0034be44603e6mr3903182wrv.3.1714233969599; 
 Sat, 27 Apr 2024 09:06:09 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 x2-20020adfdd82000000b0034c78bba70bsm3343979wrl.72.2024.04.27.09.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Apr 2024 09:06:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Apr 2024 18:06:07 +0200
Message-ID: <20240427160607.46044-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714233970; x=1714838770; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dsjHIzKuHOt3mfwrr4+ykLb3r1QvQDG4AmtaN3dIh/E=;
 b=O6T2xKQG+JA0LBiv4/G0WgHXU9Nhd+J0POiGANbpRyaN2yKIP+GvPOGo+RNcq26dSK
 J+KsYquWmoXFUIoALw70neV4iSRWYO+tz77JdkI6jfqpr2tHkH9yFiytNFL6VZk9Y5OH
 LkySP3dY9IrwopF1N30+JD4/eikqTvvHPSkAZrRFP0l5JkJVi9zKzYgeRnUVXQgZ3IXX
 YSYSgNXsWYd+zJYNTI9oPIflZlkFtQcyLVtyjyQ3eNjW+ys7q+D7ST+o0mFcGAPc6ir1
 Puh58ZbswlR/1XtU4g8DQf72VHNc+2SgCBZldBFhYlfHLr4BZy2l+JHgLyx6x9QzHp7+
 InPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=O6T2xKQG
Subject: [Buildroot] [PATCH 1/1] package/libiscsi: bump to version 1.20.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libiscsi/libiscsi.hash | 2 +-
 package/libiscsi/libiscsi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libiscsi/libiscsi.hash b/package/libiscsi/libiscsi.hash
index 769035837c..5caecbc5d9 100644
--- a/package/libiscsi/libiscsi.hash
+++ b/package/libiscsi/libiscsi.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  c7848ac722c8361d5064654bc6e926c2be61ef11dd3875020a63931836d806df  libiscsi-1.19.0.tar.gz
+sha256  6321d802103f2a363d3afd9a5ae772de0b4052c84fe6a301ecb576b34e853caa  libiscsi-1.20.0.tar.gz
 sha256  88e3eccc48722b2a0eaff456dda94b8e8e123848d01f631969bec8e3c6c6eb85  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENCE-GPL-2.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENCE-LGPL-2.1.txt
diff --git a/package/libiscsi/libiscsi.mk b/package/libiscsi/libiscsi.mk
index c8b6ddd123..ccee77bf64 100644
--- a/package/libiscsi/libiscsi.mk
+++ b/package/libiscsi/libiscsi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBISCSI_VERSION = 1.19.0
+LIBISCSI_VERSION = 1.20.0
 LIBISCSI_SITE = $(call github,sahlberg,libiscsi,$(LIBISCSI_VERSION))
 LIBISCSI_LICENSE = GPL-2.0+, LGPL-2.1+
 LIBISCSI_LICENSE_FILES = COPYING LICENCE-GPL-2.txt LICENCE-LGPL-2.1.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
