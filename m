Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B741DC4332F
	for <buildroot@archiver.kernel.org>; Mon, 19 Dec 2022 21:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5958541504;
	Mon, 19 Dec 2022 21:03:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5958541504
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bl7W97k4clT1; Mon, 19 Dec 2022 21:03:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 746084157D;
	Mon, 19 Dec 2022 21:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 746084157D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1239F1BF369
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 21:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD2BB812CF
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 21:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD2BB812CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xCj2Py7etXTG for <buildroot@lists.busybox.net>;
 Mon, 19 Dec 2022 21:03:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F252C80A8C
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F252C80A8C
 for <buildroot@busybox.net>; Mon, 19 Dec 2022 21:03:03 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id h7so9923389wrs.6
 for <buildroot@busybox.net>; Mon, 19 Dec 2022 13:03:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Da7SKHShi9Ma2v3BrIhz8xF2eyeI1KYmxiwAy/r6JQU=;
 b=DokTEh3FxfQsmaDPtpOMgOYLRRfWbQdzndY/uAyWLKiqdlMbiileWCiTUqKl9X8To0
 5qLlx4dk5WxgqTXdYwHz+CRqaBqfJm/hcB1XsJXhTS9B+BOBF0lhuEfKsJGT0ZAd3RON
 SLMOueFU6d/IGcbj4IvClnOvKdFW4b9l+sEHzZPfVWOnvZjBD46uIC5nZRrUo/RQZTR7
 ixECybGYs4z0IGiVA54t+4BOIrz88Mh7YrgBJCkSMjJYNSwoqdINFxy/a6fcDKmSN0UO
 04c7w922Y1MtisBRLlUJXEUIaAiYKNU3QcbtvX6EPOfnTLIgmS6xDaZfOHqIb0vKBadh
 39BA==
X-Gm-Message-State: ANoB5pk+Hg66jmGebRCSz9dslpnbW4J1zFYHEPQy+Z82Nij5wYP+ur/N
 wAX7pzjCIOoyObpQ4ssT/6dcUHkGO48=
X-Google-Smtp-Source: AA0mqf5pHJe8K07BU3Bec+D9T1XJfK8K7/XAQBWncrb4xVy+d4kYoZ5oFSKSNhljMgfEDYF5wFGBMg==
X-Received: by 2002:adf:f451:0:b0:24f:a289:b422 with SMTP id
 f17-20020adff451000000b0024fa289b422mr20348804wrp.16.1671483782059; 
 Mon, 19 Dec 2022 13:03:02 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 bt21-20020a056000081500b002421888a011sm11021607wrb.69.2022.12.19.13.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 13:03:01 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 19 Dec 2022 22:02:56 +0100
Message-Id: <20221219210256.3416871-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Da7SKHShi9Ma2v3BrIhz8xF2eyeI1KYmxiwAy/r6JQU=;
 b=aPpHr4DdSrTrr6HOHNa6nZHKCzm7YqT+Nv8hf3RwTCf05Fct6Dft0//Kj3gX54ddQN
 svpYBi0H0rKYMngvwqchdLVF8LwJ7TkYj1nILPD4kEg9tv5Uz56Etnd4wRVmGF4ko3IK
 h9566LMpj8ji6ImsAcgvcOEbX+MREXEwhotqkCy2yIvvlPyZUBe9QyKoSjzXATqqBShb
 vmaRqnlWRnld4ZAYKfyJMJZ2cl6JH/F6M0Zai7ybcCD2t854ZLzfbc8a6P7WHc+b/zfJ
 aOwZ6ZN6D1Juy9mbEK7TSjcmPlSAQA4VXo9oTDpr4/c/A/l+wVQWfzWP9sAIIP2shCD+
 nrkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aPpHr4Dd
Subject: [Buildroot] [PATCH] package/lualogging: bump to version 1.8.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lualogging/lualogging.hash | 2 +-
 package/lualogging/lualogging.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lualogging/lualogging.hash b/package/lualogging/lualogging.hash
index a9eadab4d..5ed012ea5 100644
--- a/package/lualogging/lualogging.hash
+++ b/package/lualogging/lualogging.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  d4a8791e9b24840c4a4c0366399f55b6deb060fc3947f3a9aae9ced0334160c1  lualogging-1.7.0-1.src.rock
+sha256  285edf8abc9844cb37da94888ca01cb26a2ba08411ea13a3ee0f4d029ca512dd  lualogging-1.8.0-1.src.rock
 sha256  d900082cb26f8cf4a491ca51c00241f2c2e9cd9ae3531c62234017a360706adb  lualogging/COPYRIGHT
diff --git a/package/lualogging/lualogging.mk b/package/lualogging/lualogging.mk
index 78197f6be..96c09c5a4 100644
--- a/package/lualogging/lualogging.mk
+++ b/package/lualogging/lualogging.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUALOGGING_VERSION = 1.7.0-1
+LUALOGGING_VERSION = 1.8.0-1
 LUALOGGING_SUBDIR = lualogging
 LUALOGGING_LICENSE = MIT
 LUALOGGING_LICENSE_FILES = $(LUALOGGING_SUBDIR)/COPYRIGHT
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
