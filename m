Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D0CC4332F
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 21:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EB4783F97;
	Wed, 19 Oct 2022 21:57:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EB4783F97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ItaHwabYqcGe; Wed, 19 Oct 2022 21:57:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3F0283F95;
	Wed, 19 Oct 2022 21:57:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3F0283F95
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0D55F1BF41B
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 21:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D63D141C61
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 21:57:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D63D141C61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bY_hGsQQWIXY for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 21:57:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C043F41C10
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C043F41C10
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 21:57:54 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id v1so2030597wrt.11
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 14:57:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AbY15LH8uTMmaPUCRDyAYkphwYsF+DDjSZGhJBKo7QQ=;
 b=Uk4Y8Mw/NbdI/DbpVgwgY7ZK/+fGanLGMPrSIAT1S1S4lylNb2S/4BMm94LQTANi9M
 f5vIUlppE2RiCGZnsoXaHuHX/TZj3w4+ZoAiVtsUpTspVlIMNIRAreACtuDC/4dFLBJc
 eM5ey0tHBtubC/sUTJjW2r/K60XZzvoYaMjA4wIvs/LMeVzou/0p6WaSntg7WkalTWsn
 qVFj/3ZBwpJFujkpXox2HRyn1EBliUKGRbiG2xjWH2qZ3rWJvHGYuvY9vBggdI/2rJl8
 wnqI2Dzzjq1VjwQQaiJN/btO9TmqJGJtmt7NpFwwWAbjNz2Nbcbw9xxzbTkdf5rWeLD3
 9x4w==
X-Gm-Message-State: ACrzQf2nX9uQWfpFXP57nG/61eVeFoYyiRn4XXuOM0r3FHwWQSNx/kDE
 IQ9DjxE9hWEm9+Fv8VUu/izO3mB72Ba0GA==
X-Google-Smtp-Source: AMsMyM7KERo3LZZ67MhBEFYhuaBJillzOGkb/DsD11vY5Pra7c+59u3c7KQgFsmjEaNDJhabbO2XUQ==
X-Received: by 2002:adf:edd1:0:b0:22e:5257:a19e with SMTP id
 v17-20020adfedd1000000b0022e5257a19emr6201761wro.180.1666216673010; 
 Wed, 19 Oct 2022 14:57:53 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:8478:6e00:efb:6496:4749:9d6b])
 by smtp.gmail.com with ESMTPSA id
 e38-20020a5d5966000000b0022afce9ea93sm14639315wri.40.2022.10.19.14.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 14:57:52 -0700 (PDT)
From: Oguz Ozhan <oguz.ozhan@mind.be>
To: buildroot@buildroot.org
Date: Wed, 19 Oct 2022 23:57:39 +0200
Message-Id: <20221019215741.2854410-1-oguz.ozhan@mind.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AbY15LH8uTMmaPUCRDyAYkphwYsF+DDjSZGhJBKo7QQ=;
 b=L+2b/i3eUwrdjRtU8EqwflSwI69IYdTC2oCfidDQdg+F/beWQFel4/rE1kB3QNRWZG
 uMdT72tT5j9ONNSRbytuaPDYx6dJhKJch25og2Xg2vB5FeW+2rcXCewnFy/cONSuym05
 h4iTFwiHivqXDTEr7zKgQ3beNJbvjnSXpDirgC8SsJazoPknNa1+HNj3AdxfzhgcQrR5
 IwzF7MrvlX0rPZF9K3wXsvZR7E0gizNuOpNoD6RUpnVmyfsz3nbIqEedsvvxk29n7jk9
 u5yl4WDlp3NHbcG6c5lhS4OPQei4rstUsVJz3XsaaNxf2VJ+z43Zf/Ks/qVI3h+Cwrh2
 Cx2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=L+2b/i3e
Subject: [Buildroot] [PATCH 1/3] support/testing: replace nose2 with pytest
 - Dockerfile
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
Cc: Oguz Ozhan <oguz.ozhan@mind.be>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Oguz Ozhan <oguz.ozhan@mind.be>
---
 support/docker/Dockerfile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index f54c31b54a..fd1527b1f9 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -38,8 +38,8 @@ RUN apt-get install -y --no-install-recommends \
         mercurial \
         openssh-server \
         python3 \
+        python3-pip \
         python3-flake8 \
-        python3-nose2 \
         python3-pexpect \
         python3-pytest \
         qemu-system-arm \
@@ -53,6 +53,9 @@ RUN apt-get install -y --no-install-recommends \
     apt-get -y autoremove && \
     apt-get -y clean
 
+# To be able to run tests in parallel
+RUN pip install pytest-parallel
+
 # To be able to generate a toolchain with locales, enable one UTF-8 locale
 RUN sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen && \
     /usr/sbin/locale-gen
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
