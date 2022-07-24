Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCFAC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 05:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F0A960E62;
	Sun, 24 Jul 2022 05:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F0A960E62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aPLiVoYAMdQC; Sun, 24 Jul 2022 05:52:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B91FF606C0;
	Sun, 24 Jul 2022 05:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B91FF606C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 21BD41BF59B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AD5B400EC
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:50:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AD5B400EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bgSbkk71-4Mt for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 05:50:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CAC8400AC
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6CAC8400AC
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 05:50:45 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-10d6ddda695so11131491fac.0
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 22:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=XGf8h9ZDWAMzlB3mYt62qUG2Afk2TetaCrwnvTWyfeA=;
 b=MQdxnab/swSEcXvXjbMb8BecbJKlmxzrKd263Zsi4Ytv2yBNI97MZxcznTdPmmtdi+
 +fKTaGZYEkTMUC6BRsDIjbenNnx+fbj4x+4/+78zPJC71s300jh65hSEi8kfttYYwoco
 s5NqUqMrROo+pcfewkiaeb5Kyq1GtLR2enVl6S00lI1VeDNbF4c1MpjHdqn07j72ILB2
 +R5mfwKIVmnUJ+oJaxmLMyCw0hWMvfbCi9gB0yC7BIpHZtnMjJAX3I1wq4kL6+y2jgt5
 vWqb57E5RWkORkYKqjWiisRUz7LQYrhosgl/dNqaGGnkEMZBWwUosLHwBDrYZT6YAybm
 M/SQ==
X-Gm-Message-State: AJIora8EKUcp9C7n1VrX3EQVrWmhq90OADyd/OI9cIGTTO4UxGAa6fzH
 h4QGG7cccsENWPGQxHVpkbvgTCHnMy4=
X-Google-Smtp-Source: AGRyM1u87gBAaN2E47w5hxbzh4lKAYf7XoL38+XvHWCotqU6bfAn70ta+B+i8rQzTYkGzB7XG8eZHw==
X-Received: by 2002:a05:6870:3042:b0:10d:81fe:baa2 with SMTP id
 u2-20020a056870304200b0010d81febaa2mr3457006oau.83.1658641844520; 
 Sat, 23 Jul 2022 22:50:44 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a056870818d00b000f5d8d031b6sm4236969oae.49.2022.07.23.22.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 22:50:43 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 02:49:05 -0300
Message-Id: <20220724054912.2354219-10-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
References: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=XGf8h9ZDWAMzlB3mYt62qUG2Afk2TetaCrwnvTWyfeA=;
 b=U/rNh+8JZGoEBsKQXZuD5BRtsDosDlQH07FrDer4aLDaW36au5BWGElj4xZcxxPWvZ
 91le7IvD/5LCvBYCRXGygule5GJRWRHFSkvjFDPmi0FxZK6k1HLuZFwD+zo/UGHmMOTT
 NN3l0M/PUrFucake8GelX7Uc0s5xuidBNlX1aiAk8xIa/jyXR1oq/75cdnOTT29he/Nl
 ZpR2Rhvy7H6iXIowsV7yG8+ANaLvT+94JLar808IesEtI5MVVrLp25mnOoOuDA3uSqDN
 Uny6+vHtDuNfBpkmmPQbEp0m2p29ISt4NPry9Su1D5DC86xpREcsqJtTD9nvDnbB7ldj
 71/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=U/rNh+8J
Subject: [Buildroot] [PATCH 09/16] support/docker: add python3-magic
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It will be needed by check-package to run checks according to the file
type (the same determined by the command 'file').

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
NOTE to the maintainer applying this patch: all patches after this in
the series assume this patch was applied, a new docker image was
generated and its version was updated in .gitlab.yml
---
 support/docker/Dockerfile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index afe8911e78..76501048ff 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -39,6 +39,7 @@ RUN apt-get install -y --no-install-recommends \
         openssh-server \
         python3 \
         python3-flake8 \
+        python3-magic \
         python3-nose2 \
         python3-pexpect \
         python3-pytest \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
