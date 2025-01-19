Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864D3C02183
	for <buildroot@archiver.kernel.org>; Sun, 19 Jan 2025 13:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 313818140A;
	Sun, 19 Jan 2025 13:39:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AYKlcKkRIbQL; Sun, 19 Jan 2025 13:39:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EE9381412
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EE9381412;
	Sun, 19 Jan 2025 13:39:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 815BDD7
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 13:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F36060726
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 13:39:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A22rZG5ZFAgs for <buildroot@buildroot.org>;
 Sun, 19 Jan 2025 13:39:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.54;
 helo=mail-wm1-f54.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 54FB86062F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54FB86062F
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 54FB86062F
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 13:39:44 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-436202dd730so24644355e9.2
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 05:39:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737293981; x=1737898781;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=clmuIZKgfgPR7N8UF/NvgclIJDGF0q3d8v+3tFMubKw=;
 b=BBUfMdvINs8xSx+Vu0FIgyD4WCqtuSOQIJ9uN1H+QDY1NyIcwjQsGyuuUR5Hh6U+vq
 HjbdRhLQt4xUk5gSmjZCb74gNUnT9vn/QnkGZNBYn8MQRiVGxG+ePVmHTVYUFGekdhFQ
 3kVmZDkyZYvwlWw4SFmfH+vcLKXAfAvGZSd3MMc/59ygnRVQHifjO75TucgcOvZDubqS
 Wm/8pCzzh1rThQRM3n8hkY3Dxq3vKROa41uRhQDJr3mdbRIhg28EAKjcUrFRMrnkGdWH
 6CrBYgPAPqK/l0NJUfXwDpk11DLQmOYv1I0+SwkleHgFjSW5hSHqNkCXNJ3mqbUHSfKJ
 cXqg==
X-Gm-Message-State: AOJu0YxOYw48eriw3YZnyZa5eD/1Gv97Hb0ldF6v+EII0AxQn/VkP3Kj
 tbZZ7td0bTQ8p+XcyjvzWydBcN06rEMuFUnjNt9sZQx5cDscvYWNzyeb3w==
X-Gm-Gg: ASbGncuPlArWhOUlKZJXTun40EuqcwFtcvLRqOXS9D+D3BuOeBSFUBbMQQwczI8gyqZ
 4jJSIOClceJIHzIRcGEcTd0h/LyRGJqS0p856i5NzwHMr4zaOLCdW49ZjOqwtJWJOnZh0d1jiyv
 cB/LSukv8+Mr1QDsTm/5HNUzQwcp10ruEHCKthbJl64VX4Wr5xJjISUjE9fZH3WTIUkRlDTIACz
 /l4HkrVPYw248fIDDxt+2EXTdrGPcIzIuh4B0LOZRX00/W0DtMOe7zz8qUO0fZ/AaCo7iAVXwjO
 9SIhYQSJUuJqqcqoWBUoWnY=
X-Google-Smtp-Source: AGHT+IGcTSeR8vJ/5jzM61xabQoIm9HRd8DVVQvwE9pNcP1mOT+MBjxZHktxesVoZc8RlRtXzOyGGw==
X-Received: by 2002:a05:600c:3c94:b0:435:192:63ca with SMTP id
 5b1f17b1804b1-43891439f04mr77268715e9.21.1737293981161; 
 Sun, 19 Jan 2025 05:39:41 -0800 (PST)
Received: from thomas-Precision-7670.barco.com
 ([2a02:a03f:eb68:2f00:3db:5537:3fb4:4bcd])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43890420412sm103923815e9.18.2025.01.19.05.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jan 2025 05:39:40 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Date: Sun, 19 Jan 2025 14:39:38 +0100
Message-ID: <20250119133938.868173-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH] package/lighttpd: fix missing conf install
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

Commit 2c94ed37fb4d20d3a8e485e972ccdc2aef43e59a bumped lighttpd,
but forgot to include the lighttpd.annotated.conf file to the install list.

See the news: https://www.lighttpd.net/2025/1/10/1.4.77/
"doc/config/lighttpd.conf has been renamed to
 doc/config/lighttpd.annotated.conf, and doc/config/lighttpd.conf
 is now a simpler header which includes lighttpd.annotated.conf."

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/lighttpd/lighttpd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 985b9ca513..609fe3e3be 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -185,6 +185,8 @@ define LIGHTTPD_INSTALL_CONFIG
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/var/www
 	$(INSTALL) -D -m 0644 $(@D)/doc/config/lighttpd.conf \
 		$(TARGET_DIR)/etc/lighttpd/lighttpd.conf
+	$(INSTALL) -D -m 0644 $(@D)/doc/config/lighttpd.annotated.conf \
+		$(TARGET_DIR)/etc/lighttpd/lighttpd.annotated.conf
 	$(INSTALL) -D -m 0644 $(@D)/doc/config/modules.conf \
 		$(TARGET_DIR)/etc/lighttpd/modules.conf
 	$(INSTALL) -D -m 0644 $(@D)/doc/config/conf.d/access_log.conf \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
