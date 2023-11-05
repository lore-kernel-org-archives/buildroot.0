Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D93C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 21:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1F32417D8;
	Sun,  5 Nov 2023 21:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1F32417D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cnj79Y4wWtKn; Sun,  5 Nov 2023 21:52:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0878B417F6;
	Sun,  5 Nov 2023 21:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0878B417F6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CFA851BF45A
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A992861057
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A992861057
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u9Dq8O4_9mga for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 21:52:28 +0000 (UTC)
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E98F61056
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 21:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E98F61056
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-35941ccaa85so17456695ab.1
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 13:52:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699221146; x=1699825946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qkg5nR8bFefqNwNYwNFVj+0ZpLNtfuzz+p/6X0hhBRg=;
 b=Ke+1Y50hDz+e+9KIF4u5nZkV6ZHDMOV7GuwnB7szT48XW9lN0ThnsgpBLiiNSPW6vP
 nf6DFd0wxm7zBWecZTut1M+hdASBQcI5iMxerxN2UpqbOTwN3qPY8w0smuXuF4IIwSXn
 UMV46MidyOUKzbHj6o78YT4PKqCLhMMpWdWo+FcbxwXkO9O7TItcLBPXax3jNHtN73n1
 Ui0cYzko3GUBU/+xdjFq2JFslHw2bJXhIwMDkmNo7UNPuqFfyeN5jvAJ1tR1ip0Hx8zN
 5VKv1koAYGhm8wCWI3p4JJsPdItScidaU9Jghn1T+m2CTk5Wmv8/Q33JO31/0vEgeMuX
 SP6Q==
X-Gm-Message-State: AOJu0Yw+l4wZ88er0DCTRxnsQtGY/2auNrdDnamNGlc3NBCrLxIZYJsp
 iqj9GSwB+LhIAdQhhWCJ0W3XBOauFQr1W+XeJE+F1XXc
X-Google-Smtp-Source: AGHT+IHZENIj4TQLk6tF1O3H8p1GqZdPXfoRGOvLqMP9q36k0YehQI4Vy2lBx121Ac5joKVcWXCtdw==
X-Received: by 2002:a05:6e02:1be9:b0:359:582c:c96b with SMTP id
 y9-20020a056e021be900b00359582cc96bmr14769390ilv.25.1699221146298; 
 Sun, 05 Nov 2023 13:52:26 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a170902b09600b001b8a3e2c241sm4607175plr.14.2023.11.05.13.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 13:52:25 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 14:52:18 -0700
Message-ID: <20231105215221.1602465-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231105215221.1602465-1-adam.duskett@amarulasolutions.com>
References: <20231105215221.1602465-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699221146; x=1699825946;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qkg5nR8bFefqNwNYwNFVj+0ZpLNtfuzz+p/6X0hhBRg=;
 b=mXOFI4yhsN7YA5aElk62aiHKCnBmMA0QLs43dfOx65NzclmqFVZOIFammdDrjMJc8B
 bnIT3cX2PeyKOKeDG1sUPTCnohXEJNgLVNZQSdqx0iRRwl+pGsnuWm53jYWjokNX0tyM
 GU3gZMT+sh6QRG9lVsqiOyJXapcxew9/y86+o=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=mXOFI4yh
Subject: [Buildroot] [PATCH 2/5] test_systemd_selinux.py: use timeout
 argument for emulator.login
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

self.emulator.timeout_multiplier *= 10 is equivilent to 60 * 10 or 600.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 support/testing/tests/init/test_systemd_selinux.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/init/test_systemd_selinux.py b/support/testing/tests/init/test_systemd_selinux.py
index fab23e3330..d463f91669 100644
--- a/support/testing/tests/init/test_systemd_selinux.py
+++ b/support/testing/tests/init/test_systemd_selinux.py
@@ -21,9 +21,8 @@ class TestSELinuxSystemd(infra.basetest.BRTest):
         """
 
     def wait_boot(self):
-        # The complete boot with systemd takes more time than what the default multipler permits
-        self.emulator.timeout_multiplier *= 10
-        self.emulator.login()
+        # The complete boot with systemd takes more time than what the default multiplier permits
+        self.emulator.login(timeout=600)
 
     def run_tests(self, fstype):
         kernel = os.path.join(self.builddir, "images", "bzImage")
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
