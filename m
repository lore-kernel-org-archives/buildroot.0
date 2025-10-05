Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6B7CAC5BB
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 13:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 387E241191;
	Sun,  5 Oct 2025 13:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F6-jcvohiFkE; Sun,  5 Oct 2025 13:25:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B14414130C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B14414130C;
	Sun,  5 Oct 2025 13:25:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E8125272
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA8B640A40
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:25:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XodgVvID1ArB for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 13:25:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 265F640A29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 265F640A29
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 265F640A29
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:25:04 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-42420c7de22so2207853f8f.1
 for <buildroot@buildroot.org>; Sun, 05 Oct 2025 06:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759670702; x=1760275502;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d+HmAL/LfSEIArrTt+rUPZjL0DwK9e2wOeFPHb55Lwc=;
 b=v2WXG6LI19hRZrPsKq5UFWplHPwssbEDUh6WaGmAEr6wwiBl6wljCS/BnlqrrcR7/s
 ILQaBPLmm8Dt68pzDBO1l16h+N9DZel5x46AIipC2vpd0eM0d0sR1/FAMWPlpp/EbXKO
 IkNNyce6hFmedO5uzKKjtvJmjkOvXQdmFOmgq3bRJmDkbIlahY178T7xdWu0BkWh3k3V
 +ORhud3uKLEq6peJzlvqFNUaMKGWo6R6B6YVozHtdsp2hKM7Rl4zTVyO+IvbcrCM4HR6
 x1BTlE+80R1Cltm6wOXxj9HKkxu8G3Yg20rZeC1wrsT4au/98yvAsztuuyczZcwxnMUk
 MEgQ==
X-Gm-Message-State: AOJu0Yxu1/h7h/3Kpjl00YQn/EarKTJev7Mgv1DpI9gtOTkaunJlWqa1
 BmG0M6s/aNWX+6BvOQgFH/klGGIoW3TN6yFzZ5M9XKNSNYounw6vg5rQ
X-Gm-Gg: ASbGncukd0PALH8zXrIXjTZVl2FnwfcWwG15xwfJWFjUMK3wq1rx7kPAbZBuUF5uKJ4
 WlhZStuZa5Nnj5GC7I3ka2cYKw0bfYEeHey/v9DC3JWj0aXCnyhJWXl9swdzWX815fFS4/YCeJZ
 Z350WYdQ1EH3oAyoq1YBwRRZgJKnPDg2bVY01qBWnlOHhd49gHwND7MrZeVI3GNT4iKkDrDGAbR
 MKX4MmDoNtoZN5w/feGOjApw3GW4kqJPPwpu1XjJET5V4wPqHRsJpv2fVEnpQ8RkrBX2x/x30XD
 gqH9i9KNOvqCBSfUP9bhFCPOson0xw8hMlweEynceMqW2/XtZpTEG1PubMJN/9T7Uresj0ZTt9Z
 b0PHm/6LDl3sqR8ppi5KL39IE3SNR9AFA5oZ6/Y3YfHk9ttetog3igocrnigexjiE4D6PfA==
X-Google-Smtp-Source: AGHT+IHB1tLpWpHPwtS+6HYouuLymWDEBRR/Ynba0YzfSPENSfiG8kHc4YRbj472m6KH3DdOwQOe3A==
X-Received: by 2002:a5d:64c6:0:b0:411:f07a:67ed with SMTP id
 ffacd0b85a97d-425671ab779mr5661759f8f.61.1759670701781; 
 Sun, 05 Oct 2025 06:25:01 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:2acd:89a8:83d9:4be5])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-46e61a25dbcsm228881075e9.19.2025.10.05.06.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Oct 2025 06:25:01 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Sun, 05 Oct 2025 15:24:45 +0200
MIME-Version: 1.0
Message-Id: <20251005-waffle-v1-4-4aab4f497a8a@gmail.com>
References: <20251005-waffle-v1-0-4aab4f497a8a@gmail.com>
In-Reply-To: <20251005-waffle-v1-0-4aab4f497a8a@gmail.com>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1075; i=rgallaispou@gmail.com; 
 h=from:subject:message-id;
 bh=qfvQ33AihpkHc1uOwSUGJtD6XrjNTAdr3kmIcULyxzk=; 
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBo4nGmskLo0H6WJeo5A+/HxpWpHRmh7hHb6K/Cr
 W2HXSP9ZWaJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaOJxpgAKCRDnIYpo1BLC
 tdOND/4iZMma99QmRKwQ6Om2zWanxvgfXXhln/Fx8Ze1sGOGIT+2CnWDO7HAPSQQW///tO4PSZ1
 zmgXBj6MesDIbmxTKRWLYWrj/v2R9tX4Y+dWLJ0BYlira3iDLYg3gJ5bbBHwELUXe0XcWh0W1O1
 dr92K8bGt2n6JAW0fAz1wEhx3fDcd0hg/MMNiV2VxpOPPfDTNU1cH4MTZs0sNUrMVx1hHq7rcNj
 D8QqLt8R+wRtrspcAN3xCuhhxQsWL/XOzCrW2/fM35QiBXKnc3x9SSVXonGX+H9PBdIqIDcODMS
 WOXirCKT7knDBnHk4M0yrnlawetCjnA58d3xgK5S9utM91yJ1hgLVs7CkLNY3NQtjN7/atEyr26
 cQpU7XdlqdGHSaKNrxNqk+uvYL4vk6A2NWKJn85dHPmU+wxFsWrTctTRii8b1peMWI4aFvf+H6c
 q1TJSs5hGyu8qWxR3ERw9cgrSS+djCdszLpWp3pvg4fM+7d8FW5JWs7jCjIDdvGUDuz7aemQqxo
 W27zHeZk4rEJ0qTM42gUyT2PqZ6/NoYc9FNJJwxF5FryvMibK1CrSKERFcrEAFNnXDhtJze1iOo
 0WjNVsqzuf3l765raydm0iOlfKaMbQmzf91fyk2mH9uzOIyjyzMOCPjSwfOGUXDyH5jT2ZtlDQM
 RVSKXNzSIz5joEQ==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759670702; x=1760275502; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d+HmAL/LfSEIArrTt+rUPZjL0DwK9e2wOeFPHb55Lwc=;
 b=L91dDVWItyCrKpAu2CgjLSoGO4YU2MZ4bVNPoRtMOSyLuZx9xeDWtFLOuKyndpysRB
 H9NiPJag8zPAP/F02uu2tbQXQxmx78AcWVQPdTsFUOxbYlL3WhPGDwHE/D8ldHVR2Um6
 FPJAX1fXKoYzfMF5AVUgiyJHfEou6kZ9tG2aDBCPF3vH7nFcC2W7uYL4gqri96lqP/FI
 N746xSHAzcG26nA8VMNNr3SJYy9pX8oThRCgOHPHOpwM9cDCTp7tPd/ZUeKvGpHS4qTR
 3UwtGN7IfxqOKFDwtqR2ybUvRzmd480QMSZzOP+9+MMPdilsIym7KkS+tjbte5YFoNcZ
 7g9Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=L91dDVWI
Subject: [Buildroot] [PATCH 4/4] package/waffle: fix pkg_config_path value
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Default path goes for $(HOST)/lib/pkgconfig.  This does not work for
latest waffle version since prefix in the pkg-config file points to the
host directory.  This results in the concatenation of $(STAGING_DIR)/xxx
and $(HOST_DIR)/... which ultimately resolve in a file not found.

Instead, override the default path to $(STAGING_DIR)/usr/share.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 package/waffle/waffle.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/waffle/waffle.mk b/package/waffle/waffle.mk
index 5c8d0f051c8c7b763c19ce3ecb92c09e2c4865c3..2dc36c4b23b03d3b14e66ae6838be20f3eadadcc 100644
--- a/package/waffle/waffle.mk
+++ b/package/waffle/waffle.mk
@@ -13,7 +13,8 @@ WAFFLE_LICENSE_FILES = LICENSE.txt
 
 WAFFLE_DEPENDENCIES = host-pkgconf
 
-WAFFLE_CONF_OPTS = -Dbuild-tests=false \
+WAFFLE_CONF_OPTS = -Dbuild.pkg_config_path=$(STAGING_DIR)/usr/lib/pkgconfig \
+	-Dbuild-tests=false \
 	-Dbuild-examples=false \
 	-Dbuild-manpages=false \
 	-Dbuild-htmldocs=false \

-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
