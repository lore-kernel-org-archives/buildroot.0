Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C862EC369D3
	for <buildroot@archiver.kernel.org>; Mon, 28 Apr 2025 06:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71586814B6;
	Mon, 28 Apr 2025 06:29:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vf1ZLVXVkFUo; Mon, 28 Apr 2025 06:29:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1B06813A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1B06813A9;
	Mon, 28 Apr 2025 06:29:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25D1A194
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 06:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC1BE40751
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 06:29:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uCarglsb8TxX for <buildroot@buildroot.org>;
 Mon, 28 Apr 2025 06:29:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 21D3B40756
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21D3B40756
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21D3B40756
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 06:29:09 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-b0da25f5216so2679899a12.1
 for <buildroot@buildroot.org>; Sun, 27 Apr 2025 23:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745821749; x=1746426549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Angl+oEWbgpp04wN40CaXMCxta86lXomuZuq8RFXlqE=;
 b=YM5e9pt576IFnh+87Cg77i4nG3Nhs1Cwai5qWJvXaV5xxwJ/m4FfUZPU+AXh0GcTtk
 FgKe6d/ki0H0wcd69ZQ2QHD3o5sTCoO+yVNN94zoKXatRG+NKjIH2hTuw4xYbONcwGtL
 VolOyxqcW9mf+SU8S41G0zaP5xSV+VnsfK6m6GURGgBMGBQ9Yt418hhKqRqk2mshuIK1
 WvkvUkSkytn2jT31pmRBcy/r/O+ODcwfZCeDboz731BxLRXqomnNS7hT4fgILkiuzk+G
 7WLUlkLksS/Aq0mc7PowXMeI+IfdhER/ACAWaedYwyBkUnc4fkOBCv2CeZWXaX35PkXo
 A6xQ==
X-Gm-Message-State: AOJu0YzDtQOSNZf/K12ioq7I5aIBh3bT7oQIdfsecVTexl4DxwRkhKxj
 UR7nQiJa5Pi3tXWMc3u7aH77oygV7yJ3NZy01p+AgHbuL/qOCfII/XMlRay7
X-Gm-Gg: ASbGncu4526G5ahMQoMWSPoJ9liSA5tuiAJX5hY+5a5PQHaqodwAGrTJRJnfnoHUEs3
 QADbM0zbTZ6aQyexVkW2HtvPUX34TP3oh0dMnZ5sFp3ZS3Gd11yWfL6dY3hC3BOWZ498WJuGURA
 cs52i88KHlby2SH12I2213QMkem0vOgGVGxia07zOYKi37iNQJiYftiFEcXZjS+UE6vs+bWI1a/
 92tdxWmFjjq0BiOO02aTkp2WpJrEse29MESDeQaHbKWOBWzcw1/x9itxz4K6fHHSwCwn+18HyTq
 09eI21+xGLe7GXnchNkH72j5S7MkEX0DgNqa5KSoHVlf/g2vR1JjRhonRPSnkcXJ4yLGr8JTit4
 3f+5HkqxGmxcjWxjMzUo67w+FI+SaxgtzZVF2kA==
X-Google-Smtp-Source: AGHT+IGGDjzI1CLzWptVAs50BS196ZrhYfZKZreedR4fJiQ2YqtUGpbdL/ZLyeGBSjd92/Cjc6RmLg==
X-Received: by 2002:a05:6a20:c991:b0:1f5:839e:ece8 with SMTP id
 adf61e73a8af0-2046a3abdc1mr11217927637.2.1745821748983; 
 Sun, 27 Apr 2025 23:29:08 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b1cf3921092sm1516573a12.25.2025.04.27.23.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Apr 2025 23:29:08 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Apr 2025 23:28:52 -0700
Message-Id: <20250428062852.100535-3-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250428062852.100535-1-kadambini.nema@gmail.com>
References: <20250428062852.100535-1-kadambini.nema@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745821749; x=1746426549; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Angl+oEWbgpp04wN40CaXMCxta86lXomuZuq8RFXlqE=;
 b=dV9H4K5ITji/1fmZieLSYNMIWZrf+NSDJ3GWvT1ugFYom1793OK0kdlyVEhLt2kgDy
 Q6tO4YZndM6OvUgJlR5GUwHE+lW76UvXh/jBSRFL8eBi+93S7CnW4+tTZTVW8bgzn6nc
 ICIwP19o0DKcKWDMuuPf8DawdBnsm3Fk/0TjWMp1sudwz4RZ4raK52WQOLQd8KOLpDMo
 LJawXCvwpR2Td3nVmeKrT+G6DxDZ+eRugA/PE1xreQU862VDt4UoMenuc9JbdePvp0BU
 KvGQyCdaEna6du3YpOEAtmYLnJFbzqHeQsO0WCN3CKBnBLDYV2+vdY7kEJs1cSN7FJ+i
 cLWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dV9H4K5I
Subject: [Buildroot] [PATCH 3/3] package/modem-manager: bump to 1.24.0
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>,
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/blob/mm-1-24/NEWS

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/modem-manager/modem-manager.hash | 2 +-
 package/modem-manager/modem-manager.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index fa81acd9dc..28f395e1c8 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,4 +1,4 @@
 #Locally calculated
-sha256  6c8f8720737a3788e394c700f36236278c9de09d76069a079e6f1daaf08b2768  ModemManager-1.22.0.tar.gz
+sha256  50e166bb24acb00bcaed814483920dfbc5b26d5424faee974b54c702e425a7c7  ModemManager-1.24.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 495dbcd258..932c163175 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.22.0
+MODEM_MANAGER_VERSION = 1.24.0
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.gz
 MODEM_MANAGER_SITE = https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/archive/$(MODEM_MANAGER_VERSION)
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
