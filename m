Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484E8CCA471
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 17:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15FA482733;
	Fri,  3 Oct 2025 17:37:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zav-6XhWq9mF; Fri,  3 Oct 2025 17:37:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41684826FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41684826FB;
	Fri,  3 Oct 2025 17:37:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 89D4C91C
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 17:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7074841092
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 17:37:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q-X7bePCEdpa for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 17:37:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6E32D4108F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E32D4108F
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E32D4108F
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 17:37:05 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b4aed12cea3so52060266b.1
 for <buildroot@buildroot.org>; Fri, 03 Oct 2025 10:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759513023; x=1760117823;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=reyYAm9bAPbp1GileIXkpX7h0MLLRRuK7PHuCnktpAE=;
 b=srGi3t/jRB3z+owOZ6seLP7hMFR9NXCCcicIzxOnrJVBa9tplnZbcL2D6dMEI2f2YU
 iJTxh+wA7RAObI4qakSKlBrAJ2OjcsLYserY5jqhvlrz+IvxGTAp971ofVwvV4Q70xR/
 2KmuBP2jisOQ2LOsrf8EqXNqu6I/F8zen4xDgS0WSMVhZtI/EeVLWpOJdW4ttishSSDW
 6HXcGrqONTCqFvmWaYhPkTqc3wRY0EfpcXybS7LnhOmkVpenvo1839ig33dejkF5erAL
 zu1hTIBKx9KnhRIVywyt6dv5jTFWHvEvuORbJfHYFMQE36sz+dmPaAeIk18JgddbMObi
 nH0Q==
X-Gm-Message-State: AOJu0YyyngRkp6TkFx+R4hE1S4vy/m0yTxfhYClTTMXeg5pzq6sEGD4B
 HPmiNAicTUaA3TWMvsWcjfU+f4P4VliYI0Y8xtHUyp5anbRQFsKOsAK+2PrrM9+L5GP8YX0qE4T
 vZg1Gvzs=
X-Gm-Gg: ASbGncuM6CcGrjYHTauEXQ/x5Gr0MbKkFyE8QxygQ0x4CWkO3Ply40ISpUxnJvgoKK/
 TlknGCbWahfDgzPIAKQvEyslsfj65tNo80r/+4dI1eOn0XR0PDHR3sOHcGFdOJtWARwSuRf9nIn
 EEuF4q9fCPM2VUyPinCEqnVi7vdOiQXQ8xyie5XecCFmQd0/mPLoLazjrgg/uCewsuX6tR7vJK4
 LPcvt2ucnNRNg5rt8vK9e8ZbIUMjITsQyLvcHorlXF1k1BXy3LdhYEsipHPEo/5HnfscFWKuQJd
 RcRV788K4rTo1lWyBMZddw3+lsXfjxC3Qt1ndHA5JYV4Fr4AHjKqkzRgpQ9r8zUqstPFUhhl8nw
 PkPQ0h+lCZv+KCHH1+q2bCfw8jE/3bZgavi0Vq94sW3w8YMu1XMBGyKTIT0ivSNU7g5OHwZxFjN
 xVRxC/dSMTzFNCvz6VAcu9GVX/BZChnuM6+bdO71iPAKcaloiWrXqDZeihsTj2mPz+mkyCRb3/u
 r0OlUJtIsyRSiw=
X-Google-Smtp-Source: AGHT+IFWL5a0hsuwCzADmP0VlBiZdSEunfbtsJpINr0d3kr/Qm0ai7hki3hT7jvsvlwOkUOMjFK8xQ==
X-Received: by 2002:a17:906:ef0c:b0:b3c:a190:b85 with SMTP id
 a640c23a62f3a-b49c1a765f0mr464102666b.21.1759513023252; 
 Fri, 03 Oct 2025 10:37:03 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-25-27-158.retail.telecomitalia.it. [79.25.27.158])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b486970b32bsm502565866b.50.2025.10.03.10.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:37:02 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri,  3 Oct 2025 19:36:59 +0200
Message-ID: <20251003173659.1405230-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1759513023; x=1760117823;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=reyYAm9bAPbp1GileIXkpX7h0MLLRRuK7PHuCnktpAE=;
 b=kgiDk5osq7PVPOqksOirO1XL17OzqpQ43Q13w2+bsiIa351E0EFEBHPihTFOHki+GF
 oCWuWmyr6mVXvbF8Ve3pUpdt3z76+u4EDVZH6bdaG83xsUK3JaAQ98/VOLcd/yH2HUUr
 sHBskt39Rh/wWwdmAbNHBFTUqvhBFybaJCrvc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=kgiDk5os
Subject: [Buildroot] [PATCH 1/1] package/faketime: bump to version 0.9.12
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

Release notes:
https://github.com/wolfcw/libfaketime/releases/tag/v0.9.11
https://github.com/wolfcw/libfaketime/releases/tag/v0.9.12

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/faketime/faketime.hash | 2 +-
 package/faketime/faketime.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/faketime/faketime.hash b/package/faketime/faketime.hash
index a7d8d62dba07..3888c71ceaaa 100644
--- a/package/faketime/faketime.hash
+++ b/package/faketime/faketime.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  729ad33b9c750a50d9c68e97b90499680a74afd1568d859c574c0fe56fe7947f  faketime-0.9.10.tar.gz
+sha256  4fc32218697c052adcdc5ee395581f2554ca56d086ac817ced2be0d6f1f8a9fa  faketime-0.9.12.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/faketime/faketime.mk b/package/faketime/faketime.mk
index 6fc684f85293..ec1a07293507 100644
--- a/package/faketime/faketime.mk
+++ b/package/faketime/faketime.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FAKETIME_VERSION = 0.9.10
+FAKETIME_VERSION = 0.9.12
 FAKETIME_SITE = $(call github,wolfcw,libfaketime,v$(FAKETIME_VERSION))
 FAKETIME_LICENSE = GPL-2.0
 FAKETIME_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
