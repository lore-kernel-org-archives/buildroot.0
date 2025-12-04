Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FAAED20694
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 13:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60947846EA;
	Thu,  4 Dec 2025 13:48:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jtTwB9cHT9A4; Thu,  4 Dec 2025 13:48:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FA13846ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764856096;
	bh=wCf/w6FdCMTl0w9G7qGO3rNFipmMQI5ZmveM3a895o8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AEAoLKzpYx1xOqdRY+D0sy2kkB3uG9N8Sns0LIsaKkF9o8ey3qejHRCKFAKnj0La5
	 ejP1FYZPXvNxtQ3InDmBPHBdDQa1AHEmYHhp6LRIVwc4cSRk3olQBro6Nh1zWnh08N
	 3W/VtH4Aw6y1IgtrfqydqVYfL6LE+9WPi3zceUA8U9SD+WQ1Zi9RLu8UNKhtBsREme
	 F5wp7TE+B5YmK0and3WncrdZLXt7klxAAp/aT08spyMfZnsG/8Cep2IXOOQ6m/rvB8
	 xNHS+0l/rjysUJPFxalAfuJf5q8YthPOAJ2Jo0xpVLFL5YT2DU+9XQ0MRHVmOARO6q
	 P2KRdSW62fbog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FA13846ED;
	Thu,  4 Dec 2025 13:48:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08CB5D3
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0717D4089E
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YoVu__5Mm1ae for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 13:48:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D92A840898
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D92A840898
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D92A840898
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:48:13 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-477ba2c1ca2so11848115e9.2
 for <buildroot@buildroot.org>; Thu, 04 Dec 2025 05:48:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764856092; x=1765460892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tyZPKD7RW9FlZ26r22ItfqjpZPFSSL996j+zndkK3GM=;
 b=UsKuByrd+zqHC78vjjvYzs3EDwR7rPkaR+4cq5Il6LY8Jm1RWVfTLBIRBXm2pUxaH7
 f9Nsb1VxahgYPhTSIQWqCQHRvJ7WVYJfGqGt2HLqnQAPb6TEmpicoSBrob+KJGaEEKS7
 ZVYTAnxzImI4iVlooNalbJSErJNkLl3xIItR0YpkExEB99jDQvIgQDCG30bn73j1j1Tz
 EfrKyrQXhpYFTVX0Dr3HEqJN79oyM/ycvbhFzQg6YTD4G8PamfiwFxiuSON8woCmJ6Tl
 PiPVCX22kpu2oe+CeiXVENrqn/n410p85m/noPFVWBJIuCFCJvsifFP9gd99HQ9G4WrV
 dekw==
X-Gm-Message-State: AOJu0YzG6kTYad/viywBf260w+BxJUYQkiT63En6VSD5Qg9ZzGPg+CAF
 rOu+DzH88zhPqyEa8qrLfKQIGC+mzcnTlC/ydyxB2SXysjzGuP59Vzep5MVpXg==
X-Gm-Gg: ASbGncvnL+gfbPN/klAGqZROl87TrhKl607JPkFfDdVjEYtveIhE+dC2H56QLIyYQ8A
 4jRK5hRYrr60llVV0lMbxG3uQm5GhS0RPp9fKXpJmh6k9Jdqw3QH9pWE8BpSSyKdbawCMJWZRGP
 pxzWnLzeBlk1s1sg0BZni5WiCbQzLnfzPG9gkPWqvnhixOPJYgfJ7aqfNun5lGvH4W54xpURgwo
 v3fc3X7TpsW6QtdsvtPwe1QVFCfdtAovqurPQ1KbPU5dd0NZI80fbstqhYvhjolUTQ865kD8C8o
 /RH5yZEwIM7HZV/+C0/th157sDVVU+JxnXPD8hIXnYSX9bAZ2/DmKs6bqE15qVF4X/G+oUEr5Uj
 XTaYd5fGd9bYJeADKukpa/2YIHbVX5A6669G11MKD3bN+2qlRPba5Rjn0d5HL4w7lBv0koFa6WD
 PEifz1TIo7WWjfLg==
X-Google-Smtp-Source: AGHT+IFHpOXNCTfC99o/fid9QzyAcpYQHleD8leV6+hQQtEn3a20jjLdZPtKnDYst8J3D+bFq4KefQ==
X-Received: by 2002:a05:600c:4f0f:b0:45d:d8d6:7fcc with SMTP id
 5b1f17b1804b1-4792f38d58amr32152665e9.27.1764856091722; 
 Thu, 04 Dec 2025 05:48:11 -0800 (PST)
Received: from freepad.proxad.net ([213.228.1.188])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479311fbaf4sm28817255e9.15.2025.12.04.05.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 05:48:11 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Maxime Leroy <maxime@leroys.fr>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>
Date: Thu,  4 Dec 2025 14:47:42 +0100
Message-ID: <20251204134742.406507-8-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204134742.406507-1-maxime@leroys.fr>
References: <20251204134742.406507-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764856092; x=1765460892; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tyZPKD7RW9FlZ26r22ItfqjpZPFSSL996j+zndkK3GM=;
 b=C43q51XeFvtD9kJcTzPFrvOvq4ht8uEKeoENZ3M5HMnC2Yqur0hpkkg825FjhkfrfB
 +UxSYEWR74vnGtuvzSozthr7d2SehGTx/ZCaVfLF7ooUJOsTdn8W1GHmaD/YgL2LPuO8
 KxqMSCq/5c5aU/4jT8LHA+Z+m7ODxWY73dB6v+ASQO7E7Vd7t9Ek4gvxwNfqwdQvLV0/
 LozjBtq5KbLlbSGhPijx2dS52vG95PPHAjwfrexik9sSqk/Eu/0YjAGBcLzBptJs7vza
 ZhbpQnLXGVf1QzwHiwQ3tzIVudDhfjWqfO/MmYOCQh+V8OdS7gHBza5cYBX++QEhJQ9r
 9uIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=C43q51Xe
Subject: [Buildroot] [PATCH 7/7] package/dpdk: add option to disable target
 installation
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Introduce BR2_PACKAGE_DPDK_INSTALL_TARGET (default y) to control
whether DPDK is installed on the target. When disabled, DPDK is
kept in staging only for build-time use.

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 package/dpdk/Config.in | 13 +++++++++++++
 package/dpdk/dpdk.mk   |  6 ++++++
 2 files changed, 19 insertions(+)

diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
index 627683d283..c220b4d01a 100644
--- a/package/dpdk/Config.in
+++ b/package/dpdk/Config.in
@@ -37,11 +37,24 @@ config BR2_PACKAGE_DPDK
 
 if BR2_PACKAGE_DPDK
 
+config BR2_PACKAGE_DPDK_INSTALL_TARGET
+	bool "install DPDK on target"
+	default y
+	help
+	  Say y if you want DPDK libraries and tools installed on the
+	  target root filesystem (e.g. /usr/lib, /usr/bin).
+
+	  Say n if DPDK is only used as a build-time dependency from
+	  the staging directory (e.g. for static linking), and you do
+	  not want any DPDK files on the final image.
+
 config BR2_PACKAGE_DPDK_EXAMPLES
 	bool "Install examples"
+	depends on BR2_PACKAGE_DPDK_INSTALL_TARGET
 
 config BR2_PACKAGE_DPDK_TESTS
 	bool "Install tests"
+	depends on BR2_PACKAGE_DPDK_INSTALL_TARGET
 
 config BR2_PACKAGE_DPDK_DRIVERS_LIST
 	string "List of enabled drivers"
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
index 080f924329..2f744e519f 100644
--- a/package/dpdk/dpdk.mk
+++ b/package/dpdk/dpdk.mk
@@ -74,6 +74,12 @@ ifneq ($(DPDK_APPS),)
   endif
 endif
 
+ifeq ($(BR2_PACKAGE_DPDK_INSTALL_TARGET),y)
+DPDK_INSTALL_TARGET = YES
+else
+DPDK_INSTALL_TARGET = NO
+endif
+
 ifeq ($(BR2_PACKAGE_DPDK_TESTS),y)
 DPDK_CONF_OPTS += -Dtests=true
 else
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
