Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FF1CF6495
	for <buildroot@archiver.kernel.org>; Sun, 29 Sep 2024 20:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD20A80FB1;
	Sun, 29 Sep 2024 20:15:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rPQrqe5HgmnD; Sun, 29 Sep 2024 20:15:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77A4181062
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77A4181062;
	Sun, 29 Sep 2024 20:15:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 707A51BF334
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 20:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EACA4014C
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 20:15:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e9ZTyoCwHnII for <buildroot@lists.busybox.net>;
 Sun, 29 Sep 2024 20:15:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 728C9402AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 728C9402AC
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 728C9402AC
 for <buildroot@buildroot.org>; Sun, 29 Sep 2024 20:15:21 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c88c9e45c2so1657174a12.0
 for <buildroot@buildroot.org>; Sun, 29 Sep 2024 13:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727640919; x=1728245719;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sm/DDXPO2xPeh95hLe2m6X5Nso22usfjyTAfZ7Z1YY0=;
 b=lQnk9+e2z+6p8wjOYicmN2gTJQ4zPBWYHWpz3Hz15TMzVGXKhI+zhX+kWbAMQ8ONVV
 Jegb/HuAHNZTahLBH5keKsL8W4EYaw593M58dZiabPYsO9K4AEGnMQc/8GU7O+/M9rHa
 KOh8HzRrEh5zMa2FuS406JmuMEIsJSptRYRNTmaOmR7tZVEql9kljJjOIml+1svQPS+7
 S8HGBRDySkXaTfAJKfWT+DbH6PUxkvGRUM8omA8r7V+n7bmFJx5ecJb+ekR6gGw7KCx1
 5tB+iA0NlcAdRtIBQ162IXqrE7BTAkLAJrEzlBEedxb1rYv/1+hj/gURy57E39eIG6TT
 FwOw==
X-Gm-Message-State: AOJu0Yyoc7e2vUapclcfzrvMk65pLxYznT9FBX4+KR9kM1oYGrEDV2s5
 zxrN6dlPzgwfrhA+KzZ+g+f+InF6NtSu2BUJ2Xc5HXJM2RzVe8cVQNRpSg1Jvp/dEAvzt1fP6sX
 vthE=
X-Google-Smtp-Source: AGHT+IG7cHzJ2KkZl07RbrtAZqSW6PuehQ6rNdvS3ZuT0efg3ZTPj/8ZNxrnuMuqJGTea/IDfbVxUw==
X-Received: by 2002:a17:906:db06:b0:a8d:ee9:3888 with SMTP id
 a640c23a62f3a-a93b1679678mr1376113166b.32.1727640919309; 
 Sun, 29 Sep 2024 13:15:19 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-54-102-102.retail.telecomitalia.it. [79.54.102.102])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88245fbd2sm3537870a12.42.2024.09.29.13.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Sep 2024 13:15:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 29 Sep 2024 22:14:58 +0200
Message-ID: <20240929201459.1761285-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240929201459.1761285-1-dario.binacchi@amarulasolutions.com>
References: <20240929201459.1761285-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1727640919; x=1728245719;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sm/DDXPO2xPeh95hLe2m6X5Nso22usfjyTAfZ7Z1YY0=;
 b=lqOyfHk9T4q8FrZMAELcLQTmcUi5C8seh98XmhLLOydTdAJhbQPRcvkPo8fbS9SMIm
 1NJ9OEKRTbBXz/o8fFdjoRbVIVUDPDPNOarvFq96vg+5ZG4jDbv+qk+ZQK4M8U76lCdK
 Ixm3CIJuGKTF2DyM2sQ1cw80Y0Oa4kW7SOZYk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=lqOyfHk9
Subject: [Buildroot] [PATCH v3 8/9] package/busybox: remove STATIC from
 busybox-minimal.config
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Waldemar Brodkorb <wbx@openadk.org>

With FDPIC we want a shared busybox executable even with noMMU.
Static is already handled by busybox.mk for static toolchains.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
No changes since v1

 package/busybox/busybox-minimal.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox-minimal.config b/package/busybox/busybox-minimal.config
index 5d2a30806ac8..9733dd215682 100644
--- a/package/busybox/busybox-minimal.config
+++ b/package/busybox/busybox-minimal.config
@@ -40,7 +40,7 @@ CONFIG_FEATURE_SYSLOG=y
 #
 # Build Options
 #
-CONFIG_STATIC=y
+# CONFIG_STATIC is not set
 # CONFIG_PIE is not set
 # CONFIG_NOMMU is not set
 # CONFIG_BUILD_LIBBUSYBOX is not set
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
