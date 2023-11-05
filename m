Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9453C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 21:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F3FF417D0;
	Sun,  5 Nov 2023 21:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F3FF417D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wWYUvFJEZBeL; Sun,  5 Nov 2023 21:52:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8D5C417DF;
	Sun,  5 Nov 2023 21:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8D5C417DF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D14BB1BF45A
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9C6C417CE
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9C6C417CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t6u330Q6Gb7M for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 21:52:29 +0000 (UTC)
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 26E7B417D7
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 21:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26E7B417D7
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-5b92b670f2aso3085172a12.2
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 13:52:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699221147; x=1699825947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1hzadjFnseJDwIvkHFy9epTpcicHncqnaVpUohqqzu0=;
 b=h+mKsRxUZ5pVxekJGHC4/hd8icm7W2Py24OQnoQE695DYDfGoWTlqYLcbllz0pVNQs
 Tlb8Pat12nf/rOoKPqx1XWIs4PFz1VgPRgiyI4XpVCcHLIGCneyQj3xDgcV94dmUL36R
 gBxWHFUw7z7Rh5bPp6twKkGabq/2uQyAR8ZyuFWv94iLQHV+4JQOiklYayhL5/Rkqeiz
 EnXlKacCsel19MMXLqp0qMfJwn6+knyefg2/sLGMVgCYSb1xTXI0zupkfiPozkmvlxth
 MDDrn+wpfpPKpELahXJv9RgRGmcBYrBwpJ99aKlNqxRBI+KX+oH+cB6OpZQ3cGsMT8lY
 1MBg==
X-Gm-Message-State: AOJu0Yxyoq0zsPDClV9hlOBQGV4JS6r6WMwckUcRS3dVfLAwd/wBecsV
 jsQ6mo3iYE0JCleoLYu6P96PgO7N9RYox5EyBsTvxYVH
X-Google-Smtp-Source: AGHT+IFYUA9WckG4+bgx1ZzM1yyNd2+feBXda6DWPxrBJg1ykjt9Xy/chr6u09OYy12PoQ6Le8BnPw==
X-Received: by 2002:a17:903:1390:b0:1cc:2f05:7edb with SMTP id
 jx16-20020a170903139000b001cc2f057edbmr24006459plb.35.1699221147652; 
 Sun, 05 Nov 2023 13:52:27 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a170902b09600b001b8a3e2c241sm4607175plr.14.2023.11.05.13.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 13:52:26 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 14:52:19 -0700
Message-ID: <20231105215221.1602465-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231105215221.1602465-1-adam.duskett@amarulasolutions.com>
References: <20231105215221.1602465-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699221147; x=1699825947;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1hzadjFnseJDwIvkHFy9epTpcicHncqnaVpUohqqzu0=;
 b=bCzRxACLJtxRaMtXAS5dtSUKdFB4yxyUwqyCS0SO//SSahVvUFu9nd+nlGVD9Xovge
 IkMRFeV5j3a5hO5ks1rEiaNRON2PYB0BssY257E32mDBy8iLmdzeILphc/IIOmGUY0k3
 ZttfGto1Zm8QPab1+3Ife/8urSlIMETLvIEn4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=bCzRxACL
Subject: [Buildroot] [PATCH 3/5] test_lxc.py: use timeout argument for
 emulator.login
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
 support/testing/tests/package/test_lxc.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/package/test_lxc.py b/support/testing/tests/package/test_lxc.py
index 5be4782e2d..770cd10f30 100644
--- a/support/testing/tests/package/test_lxc.py
+++ b/support/testing/tests/package/test_lxc.py
@@ -33,9 +33,8 @@ class TestLxc(infra.basetest.BRTest):
         self.assertRunOk(cmd, 120)
 
     def wait_boot(self):
-        # the complete boot with systemd takes more time than what the default multipler permits
-        self.emulator.timeout_multiplier *= 10
-        self.emulator.login()
+        # the complete boot with systemd takes more time than what the default multiplier permits
+        self.emulator.login(timeout=600)
 
     def setup_run_test_container(self):
         self.run_ok("lxc-create -n lxc_iperf3 -t none -f /usr/share/lxc/config/minimal-iperf3.conf")
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
