Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9753C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 21:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD57B81396;
	Sun, 24 Mar 2024 21:24:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jLDoK0j49Jfr; Sun, 24 Mar 2024 21:24:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E74F081400
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E74F081400;
	Sun, 24 Mar 2024 21:24:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0AC8A1BF4E5
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 21:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC2AD60737
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 21:24:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cApPo4LdVVit for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 21:24:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2f; helo=mail-oo1-xc2f.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 961B6605F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 961B6605F2
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 961B6605F2
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 21:24:52 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-5a128e202b6so1325797eaf.2
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 14:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711315491; x=1711920291;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AKkQ9gST9EVCkPURjG2C8J7JJ0eJpgh4MUdFQgA8kHg=;
 b=LMsiXlmNwT1aVdBbnIMQx1AdtLyrjyufd0fxvczIFDaTja4iZZZxe4MvPHxaUzW/p7
 jxXFlWoZqhEPFfTlHA5eqpKxu1OORfkeEJqIr3cxfD9dr+flAEeRKX3IwgeCr+FHBW4h
 VES3EHJBauW2BS9A3n13xWgxEs70OUUBygKI7cy+cPo5iVSqU+FFdJIun9Z4zh198G5q
 pGHDUYxw/1nkd3aHcDanDpFCCmNhjM0CugGZ9LQ1ZUGxLffQ97NgOu6cKcatF4ozIm6e
 gtJvcrncTCfbczwII1pxSRQx8oY3fA1adoorqpVeZPqWN1SO5JHyWNjY2BqqA9CE6f8u
 eoWw==
X-Gm-Message-State: AOJu0Yzl6uAF0WDPetLEx8ifP5bus7u+mguj9WOW0YjCrksD0juvZANS
 uRsUOFHASaOWSaxwUatWJy6xEN+BwfRojVg6w0QvXW9Ijcs5piwYb8tTUmvE4LG4f8IsH17tl2T
 w
X-Google-Smtp-Source: AGHT+IGJN+bb17q/JxEPYG2NarOfVglpioDGcnEuiMvmDTVvsVEr+6nW4mQ02BEWk7pSOHL6Rzxw+g==
X-Received: by 2002:a05:6358:7691:b0:17b:f881:6635 with SMTP id
 e17-20020a056358769100b0017bf8816635mr6259443rwg.28.1711315490655; 
 Sun, 24 Mar 2024 14:24:50 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a17090a658700b0029c3bac0aa8sm8979556pjj.4.2024.03.24.14.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 14:24:49 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 15:24:33 -0600
Message-ID: <20240324212441.526544-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240324212441.526544-1-adam.duskett@amarulasolutions.com>
References: <20240324212441.526544-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711315491; x=1711920291;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AKkQ9gST9EVCkPURjG2C8J7JJ0eJpgh4MUdFQgA8kHg=;
 b=JBQLfPzOJFM9CSC4hE5YVIFZA2DAi5vbz24UlQ9a0CtDW2I+FTmOJxIl5dIlcJNyql
 PcsRO2fQt0w2524aD5E+x6hiR8/2g51IWh2YTVqZnSk9q9fYqCHfZKfen1+M/5wT00rE
 ZWxrznP/CiJQd1XvwiH1nxEyG+bm5gyxQPEcI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=JBQLfPzO
Subject: [Buildroot] [PATCH v2 2/9] package/libsemanage: bump version to 3.6
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/libsemanage/libsemanage.hash | 2 +-
 package/libsemanage/libsemanage.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsemanage/libsemanage.hash b/package/libsemanage/libsemanage.hash
index 73df34bde9..862e49f52e 100644
--- a/package/libsemanage/libsemanage.hash
+++ b/package/libsemanage/libsemanage.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  f53534e50247538280ed0d76c6ce81d8fb3939bd64cadb89da10dba42e40dd9c  libsemanage-3.5.tar.gz
+sha256  41138f46222439e1242f27c1587e95cf54a059259aaf1681db642cc30c4e0d60  libsemanage-3.6.tar.gz
 
 # Hash for license file
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  LICENSE
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index 0fbdc5ae8d..7742e7060c 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSEMANAGE_VERSION = 3.5
+LIBSEMANAGE_VERSION = 3.6
 LIBSEMANAGE_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSEMANAGE_VERSION)
 LIBSEMANAGE_LICENSE = LGPL-2.1+
 LIBSEMANAGE_LICENSE_FILES = LICENSE
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
