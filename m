Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C31CAC59A
	for <buildroot@archiver.kernel.org>; Sun, 21 Sep 2025 16:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE183816DF;
	Sun, 21 Sep 2025 16:18:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pCYQx1Ouqzru; Sun, 21 Sep 2025 16:18:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC8DA81587
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC8DA81587;
	Sun, 21 Sep 2025 16:18:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10CE01C0
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 16:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0259F60B08
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 16:18:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cDvJca7X7yHG for <buildroot@buildroot.org>;
 Sun, 21 Sep 2025 16:18:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1AA7B60AE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AA7B60AE6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1AA7B60AE6
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 16:18:47 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-631df7b2dffso1805990a12.1
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 09:18:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758471526; x=1759076326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1AvlBe0Jwx/QPlpL7ZJ8cXAUwm9Q4gAR4l+BeUx8myw=;
 b=l+fR4qIz5nWtyHzy82od+HXhWrLk8haKMLmvdrCww+661VxW8qGBaBwbdeXmMi8f0y
 KArGcvjtRo6iyy0rFS39damg4PrH9xven1wPTetzwIFDj2vP/zcqcjPi3wWd7yJwylrf
 8kAyR68L+co8hpsOd6hkUMpwTUT02mWygdo4uZnhFzeTrypjCYaFTHDz7eURGi+axxnH
 gF6YNV+gCAxR+7Wwbi1+sk7tq3xBzSEvYbqIj98Plaf3uyHzwdJeifbq76Z6ajV75BpR
 h3G6RdOGHgbBzGAaWTOBh3pSrebhB42xF4ncFqOxr8EtDkkMMfXD/aZVnTIxNtBfZ/Lg
 hQbg==
X-Gm-Message-State: AOJu0Ywi7gNbpqz8SGeazICKTxC+WotO35UMuFWYNmmPpBlss6WcXuop
 vxImEfDIKRkRm64JgkylLsZwc0E3UXeHSyWPVspifbLL36OHnC2bGnB4370vd4OTUtg=
X-Gm-Gg: ASbGncvUj1oV2Me1HK8fXx3YsgnfwArRH/ixl63qL3ml9zZF4eD0mp04z95Hs0y4Wk+
 BR+0jc+E74ej2B77yUT65prcqImH1PhXrQh6Bx3a5sG0lPNZzMRSU1XLmXWqE12/rR2N33kEvNK
 qiTEpZkTBGbjXo+r9VToz3jnoFtmxT24WaQh8ZynGm6+WBPd9TUkjrr3MBCdrErTE8b3uxOBIho
 jE350HHduSdiSPHeOT8O97HAkQQ6u1bPz57xMvi76zheHRPkRHxupZVUOXUy16IKXHzsFXpmnTO
 5Nwwli5B2xhXCcOacr76HnTYJLUAW4htgRKO8KaFZNEjwoUHHJmFPPkqr5C0Yvkr9pfyBY+gkXG
 yhwoqa1Cjy818
X-Google-Smtp-Source: AGHT+IFv2TksoUvyDgQivcQYfY9AqBhZ7zpcxev11Qz+c0NhnSz4Cty5tRixPW1PY5Z3WxDuke2Qaw==
X-Received: by 2002:a50:f604:0:b0:62f:1366:46e8 with SMTP id
 4fb4d7f45d1cf-62fa2159bcemr10060017a12.7.1758471525844; 
 Sun, 21 Sep 2025 09:18:45 -0700 (PDT)
Received: from LinkMed ([2a02:8070:2483:7e00::f6da])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6300fd080b2sm3938245a12.46.2025.09.21.09.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Sep 2025 09:18:45 -0700 (PDT)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Sun, 21 Sep 2025 18:17:48 +0000
Message-ID: <20250921181748.416113-2-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250921181748.416113-1-raphael.pavlidis@gmail.com>
References: <20250921181748.416113-1-raphael.pavlidis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758471526; x=1759076326; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1AvlBe0Jwx/QPlpL7ZJ8cXAUwm9Q4gAR4l+BeUx8myw=;
 b=gxvNeLiWzL/QAlzZrAOyDEV3xfGXZw5eJLRPjk9Bk0+adSUubkDIASqqRloN5D5Emg
 DlQFkizAbCkmAvXxYB0X/Kf3V0UYGPz9T4Q3+c5Gqi33BqsBNcpqNSY0BUASokSeu9AL
 s/HDJv+seF1WPevVDeopy66ngAYn7DsbG9l5yazYDK+aBYK/s1kcOtUA/pl5Qu2/hVr/
 PHwAO96AAcDATdogEaIlwZ0I80UHGTMW5/qDtb12ZfzEbzJWl/pHx8MIC9YgpbYQLONM
 LY0xyET6jyb6zGRHR1eFEcu+upz/G4JCUsGeuKC2EmKegMInS5JbEqRaMAmSp6AchefY
 NJaQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gxvNeLiW
Subject: [Buildroot] [PATCH v1 2/2] package/sway: bump to version 1.11
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

Changelog:
https://github.com/swaywm/sway/releases/tag/1.11
Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/sway/sway.hash | 4 ++--
 package/sway/sway.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sway/sway.hash b/package/sway/sway.hash
index 379180b0de..46f2bee753 100644
--- a/package/sway/sway.hash
+++ b/package/sway/sway.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://github.com/swaywm/sway/releases/download/1.10/sway-1.10.tar.gz.sig
+# https://github.com/swaywm/sway/releases/download/1.11/sway-1.11.tar.gz.sig
 # with key 34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48 "emersion <contact@emersion.fr>"
-sha256  7472a7f11150212e0bed0bd0af9f591c9caac9f9ea87c35486e475a21f5ce81f  sway-1.10.tar.gz
+sha256  0e37a55b7c3379230e97e1ad982542b75016a0c7d6676198604e557f9b373dae  sway-1.11.tar.gz
 sha256  bd35722bff46327f5eded1d211207277bbe043d2a22048b282c42ef801593b8b  LICENSE
diff --git a/package/sway/sway.mk b/package/sway/sway.mk
index 74614b0c7f..f27d147852 100644
--- a/package/sway/sway.mk
+++ b/package/sway/sway.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWAY_VERSION = 1.10
+SWAY_VERSION = 1.11
 SWAY_SITE = https://github.com/swaywm/sway/releases/download/$(SWAY_VERSION)
 SWAY_LICENSE = MIT
 SWAY_LICENSE_FILES = LICENSE
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
