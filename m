Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33564CCF9E5
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 18:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D79A441201;
	Mon, 27 Oct 2025 18:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TkTcBXHflN-8; Mon, 27 Oct 2025 18:26:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B89C41491
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B89C41491;
	Mon, 27 Oct 2025 18:26:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 226B543F
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 18:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EB4241491
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 18:26:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zNTpQmVD-8l7 for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 18:26:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 11B6641201
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11B6641201
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11B6641201
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 18:26:09 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b6d83bf1077so19301566b.3
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 11:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761589567; x=1762194367;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ab236nXzFcqBoD+ZNkQQg6nfoG1Hn+9ejQGHaSUkxeQ=;
 b=eXnaSNjqu9zmFfDnS/fgaRU6/gznmytoJKPZWCQ12pY6L4IMW51SSYg/JqAAnm2yL+
 vzMHuoCqVlBD9YVlL2Q2dZXts577aPmbC1yWqL9KylKiWnXCAjAS2dcF645Z3Jb4p4xL
 fWu9t8+yKWhblrNzyXNniSAeYOlMfhMQ06UiDzaitvYKq1hZaksDE7W3zVtfuQhy8Cfa
 6OrQ8uWqxd8pghIGBUA936F5jRNzWuGjcFYCSWE/d7M0Lt/2JpBAJsecaXUUgwcVNJxr
 Mr71JNAGcU75cA8HB1jlvIrXvZJ0vJSQsO++tIXRSbkSqvgPeNLQ5VDZ5nKA8ImmFniU
 Xi2A==
X-Gm-Message-State: AOJu0YwrRw4groSSCMqRwpPVlAe9WlaPdKwTYhT57yQ0Yhx0ZVBK8BFy
 qC8rtpd7b9XZoH7pzeRVGsJcaiG+V0Fz67hCcsVFHoWUNmebZOL7RGWpfQvifouEz2tXxGFoQdq
 +8Nmt
X-Gm-Gg: ASbGnct7ULfmYjTAPnO/dMvYfJCJ4lF4qnReqGO3RY+9Qa3u8h74bmN4alI0F+rvtFl
 0yorz0Sx81xidBEQI/lqjkAPQyht46lrPzmuIZgggSYbpg1uJMKIDxbMdIpfarcSE1jdl6+/HGK
 37EzxSlJyEh5CbFJBYoOpZd7ZoP14t5ipg/WA88i+p8tkqhO8wTrpaetfajarxmgWuP9bpusTAe
 KcIqigVUnmaayM7EexxeOZzjJNqL8udN5azvid+glBqHTdw4t6qizi3tMfxgaKlt+BtnAki3AQw
 4m5vef687smjUGIdies5uA3HSfwnfdUqceDJD51R/1jmirCDTZN5F+YQAu0bML66UW0oF8tVQRb
 p7SveuzSxAjauKBGTEAxcikQohv1IELjnP11X0+iRDE1qZf7nWodhK2mg0d7ASh0/rupXP/vhtK
 LV66hvwhYmDSy6U8hW97Nqw95C/8zmLcDvkma6BcDUxBZg39EOvrqNR4euDjK92XWGxTZZcVz0e
 9omNQ0ZVqVdNc5LfF3YnmYi3T2G++q3t/TnHbjBMkGDe3K/klsUuo+mB22s85cGXA==
X-Google-Smtp-Source: AGHT+IGuTgaGpdUIG8PCOMyx9aUeg8KlfT0sCo1PZnV8uy5pFt8ZsJahUNGVTcql6Do+mMZ26IsJwA==
X-Received: by 2002:a17:907:3d0f:b0:b6d:7db1:49aa with SMTP id
 a640c23a62f3a-b6dba65b0dbmr92829166b.63.1761589567413; 
 Mon, 27 Oct 2025 11:26:07 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-82-50-34-170.retail.telecomitalia.it. [82.50.34.170])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d85413b88sm814059566b.55.2025.10.27.11.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 11:26:06 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 27 Oct 2025 19:26:04 +0100
Message-ID: <20251027182604.2503743-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1761589567; x=1762194367;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ab236nXzFcqBoD+ZNkQQg6nfoG1Hn+9ejQGHaSUkxeQ=;
 b=KyNFWT38K/sOtJ2EQAP6QEL/DjrBJReA5qBysxZHA7gJ2tZ3tsGTXKL49dp0SEjQCb
 MQVzZlGcyuf4YA7hptDdrD90p6ddSLEB5EIoMzrBzNiYmmWdICaHgbl3Wx/SRr8Dv7dQ
 NJqhIO7+oPc8B/m1+VRHGYAfpukYzzI5IghkU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=KyNFWT38
Subject: [Buildroot] [PATCH 1/1] package/avrdude: bump to version 8.1
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/avrdudes/avrdude/blob/v8.1/NEWS

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/avrdude/avrdude.hash | 2 +-
 package/avrdude/avrdude.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/avrdude/avrdude.hash b/package/avrdude/avrdude.hash
index 2a11968eb546..995dad3782b7 100644
--- a/package/avrdude/avrdude.hash
+++ b/package/avrdude/avrdude.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a689d70a826e2aa91538342c46c77be1987ba5feb9f7dab2606b8dae5d2a52d5  avrdude-8.0.tar.gz
+sha256  2d3016edd5281ea09627c20b865e605d4f5354fe98f269ce20522a5b910ab399  avrdude-8.1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 6f19e6834119..8f451a7fdbd7 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AVRDUDE_VERSION = 8.0
+AVRDUDE_VERSION = 8.1
 AVRDUDE_SITE = $(call github,avrdudes,avrdude,v$(AVRDUDE_VERSION))
 AVRDUDE_LICENSE = GPL-2.0+
 AVRDUDE_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
