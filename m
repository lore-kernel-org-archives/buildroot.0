Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B07C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 20:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFD6F60BDB;
	Sun, 11 Dec 2022 20:45:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFD6F60BDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JTAlrMPkZQwS; Sun, 11 Dec 2022 20:45:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 114F860B49;
	Sun, 11 Dec 2022 20:45:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 114F860B49
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DE03F1BF2B1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B98EC813C7
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:45:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B98EC813C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f11GFdjGY-9V for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 20:45:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFABC813B0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFABC813B0
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 20:45:16 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id b13so15395990lfo.3
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 12:45:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ABgCoBEjXuvBYonfZIIqYsxOKXDPuPwGIaXZT3tsw9k=;
 b=H44S1kIpX510wnhUiUyzma/w3MSfaIJL9ns3eu5AlJ8xLDQACBM5QjsMqxsu/b4Kga
 76bCeqOF7jQIRFBcaF4iIsn5GQjSLBWdAZvL7u4trw0RZGV2GKb12LT+kQnVxyKeld15
 mXNqK30zX6Gm2nT6QWNGnhSKWU2GZHuNRRvGt4YwhYLg9YIE7yrw/VCaekcsaGmmeqr5
 skYGr3qfkXUlhFm8fHFfXZNF4+FyDuF/D5o50anrSMqxOF8M3YuE3XbqPBYHmFf7hYz8
 oew7nB/mBUdXJN1LR64xT46pCeNOItfE5880IZUSzIy6o4yNuTyxB8IIuNw/UOzcKGcg
 Ox1w==
X-Gm-Message-State: ANoB5pkGnfSMzGwlWBKZIv0qoCv79rEX1lFokrs7hi6aZO2f745UaQ2B
 V7EDdG7U/KRsP5/IcKgtXZuZe2E6rQU=
X-Google-Smtp-Source: AA0mqf69h6DIt5rveymR8zW8714BvIlKtKYR6bv+Z7PtrfvT0lHW1oEmQQd7oznlIWOlcLjI8r3qhg==
X-Received: by 2002:ac2:43ca:0:b0:4b3:cc12:1a7a with SMTP id
 u10-20020ac243ca000000b004b3cc121a7amr2841605lfl.51.1670791514562; 
 Sun, 11 Dec 2022 12:45:14 -0800 (PST)
Received: from stuudio.localdomain (94.246.253.165.cable.starman.ee.
 [94.246.253.165]) by smtp.gmail.com with ESMTPSA id
 q20-20020a05651232b400b0048aa9d67483sm1327756lfe.160.2022.12.11.12.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 12:45:14 -0800 (PST)
Received: by stuudio.localdomain (Postfix, from userid 1000)
 id BB0332A24A7; Sun, 11 Dec 2022 22:17:13 +0200 (EET)
From: Indrek Kruusa <indrek.kruusa@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 22:17:04 +0200
Message-Id: <20221211201704.25858-5-indrek.kruusa@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221211201704.25858-1-indrek.kruusa@gmail.com>
References: <20221211201704.25858-1-indrek.kruusa@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ABgCoBEjXuvBYonfZIIqYsxOKXDPuPwGIaXZT3tsw9k=;
 b=mjpOxCY6BTHYnIemqKuT7+dOZjlq35P53n1AL+zO6uZ9jyvAH8HjAUskRne4jIRvrB
 Z1Ypk0QAcQ8JUCb8BSKsK6/G3OizYcVdj+BcMaSHZr4lqds20EWg4v0tJarmfFHUXXGz
 EvUD9D2I/qVmgz4+DYwzcak8XyGfe7DiyYA/z2NWJLzmTyhOSEN5rXPSLWuerQeIu+2u
 7TmDk6dyVBygAGb9iuWtvKkrO3iN07KxIfvHh7AyyS3OeUpHSRLVwdT4R3BuYlYoJCy7
 jq8joH/mww06QmUl2AyRK3RmZxaMIIg6qZKC/dLBi+TxlPK4ClH5/4XC4gp12LjozC19
 7a/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mjpOxCY6
Subject: [Buildroot] [PATCH 5/5] board/nezha/readme.txt: update readme.txt
 about framebuffer console on HDMI
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
Cc: Indrek Kruusa <indrek.kruusa@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Indrek Kruusa <indrek.kruusa@gmail.com>
---
 board/nezha/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/nezha/readme.txt b/board/nezha/readme.txt
index fd4c6707de..8d207ced74 100644
--- a/board/nezha/readme.txt
+++ b/board/nezha/readme.txt
@@ -20,5 +20,5 @@ Copy the bootable "sdcard.img" onto an SD card with "dd":
 
   $ sudo dd if=output/images/sdcard.img of=/dev/sdX
 
-Connect a TTL UART to the debug connector, insert the microSD card and
+Connect display cable to the HDMI connection port, insert the microSD card and
 plug in a USB-C cable to the PWR connector to boot the system.
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
