Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D92C25B78
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 15:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51E48404F8;
	Mon, 27 May 2024 15:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RXv2ddEe0Dl9; Mon, 27 May 2024 15:57:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D4794063D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D4794063D;
	Mon, 27 May 2024 15:57:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC0AE1D1E9B
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 15:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E36DF8149A
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 15:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tKKaH4WnxQPC for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 15:57:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=alexander.i.mukhin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 02EF581493
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02EF581493
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02EF581493
 for <buildroot@buildroot.org>; Mon, 27 May 2024 15:57:19 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2e9684e0288so31417941fa.1
 for <buildroot@buildroot.org>; Mon, 27 May 2024 08:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716825438; x=1717430238;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xdKjLjRfR6c6FNS2t+HGteCMqDA3kKXmklwUlB+aVMU=;
 b=v984AYdEdBJC7PfXBqAv7DDhRX4UnjBSx0ITUCUuzsyOBQOLaxp2Vx9UyFR6O2MGEP
 dSyS7R3cklqWnEHIyljprOfjRruIfcmNjTzBiiipq+C5py+Db3HoUUc4J9/LKl1b7yCt
 5vsfSN4AaLw/mfCCEoXwaXiaRateS3D1npsim6E/Q1z8F9pia65OS3PxHFnjrra/0Ame
 wMofjLD3AQK9EDE0Qh0htvYgqvlbkTuN0bGFdg638U3TJEeX40CHrkQnk61mF4SRw3Qs
 /p9ZrYOkFXZ7ugoQ3SPD0esnUhW+lM/M4Y4poTTlMNKZNd8XOF0O0Ry6P26rmZ7Scwa+
 oLVA==
X-Gm-Message-State: AOJu0YyfOnNOX1udb+pM6DlE+qYuK3B3aELtgSem4ZaXcMzuFbxsJYJJ
 38OozvZcjiArKU6nwoCmLuS4HuwSx0sMChJGYioM7lgNLipV84Tn5J5gfA==
X-Google-Smtp-Source: AGHT+IFMT8fxrj1N+R7hgm7zcaQvU/t+VLTl6LvUdx73/F6eRBFQpALPHBUabHSEbS4sv2ih8v9d/g==
X-Received: by 2002:a05:6512:1253:b0:51a:f48d:7b31 with SMTP id
 2adb3069b0e04-52964eac3f1mr11879155e87.13.1716825437546; 
 Mon, 27 May 2024 08:57:17 -0700 (PDT)
Received: from localhost.localdomain ([2a00:1838:20:1::ba6e:cf96])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-529a5dd44f9sm353174e87.224.2024.05.27.08.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 08:57:17 -0700 (PDT)
From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 May 2024 18:56:39 +0300
Message-Id: <20240527155639.2716516-1-alexander.i.mukhin@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716825438; x=1717430238; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xdKjLjRfR6c6FNS2t+HGteCMqDA3kKXmklwUlB+aVMU=;
 b=Wn6MYvOxiA27eWEqzXCGGO9y6uQtWpZ8HVxXghxqlMK7pk69cJ0BtIjTg01gAlm3B6
 QBNi1U7DOGn7Jm5ZzrGUSBmO4lhXOr1lL27kweGY055FjRDtGnHP/whpQYjnsJTAE+cZ
 9iJigwL1FhJZPmgnGU2ePpJjkbmPvRuVXliEYouzOMoplJDayaBgix/gDVr3JEcObA+I
 k1Rj3Cz7OvVXuyqir1HSkpR0PQZAXrIcEueZvYz7O4LTbXWzxHk3W1fpMmLKbkwpRQtW
 cEbJeGHMdRT6hhb8YX+LsdgS0yW7BTlvyVmCj/cLn0B7oDQ2cdV70LGe2Kx+stKaIjiM
 Y7pw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Wn6MYvOx
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: add myself for package/zfs
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
Cc: alexander.i.mukhin@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 52c9b84a..53ec6049 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -122,6 +122,7 @@ F:	package/libest/
 
 N:	Alexander Mukhin <alexander.i.mukhin@gmail.com>
 F:	package/tinyproxy/
+F:	package/zfs/
 
 N:	Alexander Sverdlin <alexander.sverdlin@gmail.com>
 F:	package/mini-snmpd/
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
