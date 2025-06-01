Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB24EC54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 10:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AECBF405E4;
	Sun,  1 Jun 2025 10:41:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jf9dUasv9uNs; Sun,  1 Jun 2025 10:41:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E06EA405E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E06EA405E9;
	Sun,  1 Jun 2025 10:41:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 18307127
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2618400AB
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:41:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BfZCMSvmP-V0 for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 10:41:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EA2BC4043F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA2BC4043F
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA2BC4043F
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:41:40 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-553246e975fso4252974e87.0
 for <buildroot@buildroot.org>; Sun, 01 Jun 2025 03:41:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748774499; x=1749379299;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7J5biE1rVZmTlZC+IWb+fBHbeGSognHT+AQvxgdIL+4=;
 b=lgwftDOwZbGIMuUHM70OJLfM4MgpPtlrNStG9mETSJcKgCaYIsaiW7iWrCocaDqyEc
 Xo1UAmuffSiRYQx5RdFj3N45dGBsQzxRFG41f3cTAH6DZWge6A2Tw28AdSnhC80y7D2k
 JBHwJZj5aRa9giM9d5ZMoNxErmBDAV8JgCbLCGveV7P20I+x1ColkmlcqvAT1kdVTIVp
 qONqyFj5h71kKX0ECarcnV6Toy3lm1n4B5tw+0tomSr0tUb2CS//AiVvtnNvZwpDho39
 9u24cZuegffXzuRlveYZveIKGrbXNrsPU7GvT3iBtbJAMegn0ZYou8H9Y4VLfxhTZ0MT
 CeUA==
X-Gm-Message-State: AOJu0YymxYPQw2c6flhRUexNpibsxudV00ZelCn/1j5WywOHaCUq0amP
 r08xDQ56coA0dpgpBEflJ392VkLb5T04eMRqY9uYAxItysq6sFFWlqNb8b+yvA==
X-Gm-Gg: ASbGnct5ROQsGYsWdfqVTTRCHbpZS8Yw/36+ZY6/kEiYuMP+gUOQxRfnUKO98AH/SIt
 oI7ea6dkucAZGxngc4vwJYZlS45uJ9X0u0hUaKXw6sZCDUMl1ZE9DybVN+BITFM4maWxDZ0r0xU
 AWfS8I1RkVs07TEygiz6h7ZCbQE1j/j9laZuXhj3srU5DnWONuQDKDRER4ed1aymnWxWxJq6Ljz
 q9iYXQ/6Abddj7BdBaFCIgfw2ya+432jWxzkIKTPY8q8u0ng29859uJ/1v0+3ksuL/0CSG2zKxV
 37zXn9a5su8TDdYUnbPf4eU+qpZNynqIAZj2KZGG9owydI5fKbyXF5Ymrp//4jOsI770nTiF79A
 8ib2o/Ig3Yw==
X-Google-Smtp-Source: AGHT+IE0ZRkxfD5GFjwgNqKw7eJfhfMfe1WhmDntAda0h03ckSZA7XEgV2wYMQ/WwWPrmSFDHwYolg==
X-Received: by 2002:a05:6512:3e0f:b0:553:28f1:66ec with SMTP id
 2adb3069b0e04-5533d19dbbamr2464361e87.31.1748774498526; 
 Sun, 01 Jun 2025 03:41:38 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553379378easm1266670e87.240.2025.06.01.03.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 03:41:37 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  1 Jun 2025 12:41:22 +0200
Message-ID: <20250601104133.3238551-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748774499; x=1749379299; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7J5biE1rVZmTlZC+IWb+fBHbeGSognHT+AQvxgdIL+4=;
 b=QOdg6OGlYLxZqRVxS95BzCHSZclLkN5rUyp/IiUziZLC9GghrpyY8cI9CjKHkkhXe2
 5ns1eZ5Y7BmXAiFdOyYTmb8ZL5tn5xw7ZwKkd4XcbQN5rINIDPUQaDIqrMQRC7wYjonz
 0lAp9ldEEgicSC9eQrYMZoV63W6jZ4iRK4udsYTW0baBQAdwjZkFbd6uVCWk6HkpYKKF
 lOkQS/vmW6uNo98vspfzuYVk1GVEi1q4+jo7ocPHwa5ly86k3B1C6VRrK8KJKX3goLrp
 bD04ddK9XETvj2n9N86GkyqULsnHtRxtUZcteQ4o21zyOnUsuw1zyXXVDy4CX7h8f2US
 aKGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QOdg6OGl
Subject: [Buildroot] [PATCH v4 0/6] package/qt6: update to 6.9.0 and add new
 packages
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

In this version of the patchset I moved the qt6tools fixes into a separate
patchset:

https://patchwork.ozlabs.org/project/buildroot/list/?series=459138

Bernd Kuhls (1):
  package/qt6/qt6positioning: new package

Christian Hitz (1):
  package/qt6/qt6connectivity: new package

Jack Rubacha (1):
  package/qt6/qt6grpc: new package

Roy Kollen Svendsen (3):
  package/qt6: bump version to 6.9.0
  package/qt6/qt6sensors: new package
  package/qt6/qt6speech: new package

 package/qt6/Config.in                         |  5 ++
 package/qt6/qt6.mk                            |  4 +-
 package/qt6/qt6base/qt6base.hash              |  4 +-
 package/qt6/qt6charts/qt6charts.hash          |  4 +-
 package/qt6/qt6connectivity/Config.in         | 17 +++++++
 .../qt6/qt6connectivity/qt6connectivity.hash  | 11 +++++
 .../qt6/qt6connectivity/qt6connectivity.mk    | 42 +++++++++++++++++
 .../qt6/qt6core5compat/qt6core5compat.hash    |  4 +-
 .../qt6/qt6declarative/qt6declarative.hash    |  4 +-
 package/qt6/qt6graphs/qt6graphs.hash          |  4 +-
 package/qt6/qt6grpc/Config.in                 |  7 +++
 package/qt6/qt6grpc/qt6grpc.hash              | 10 ++++
 package/qt6/qt6grpc/qt6grpc.mk                | 43 +++++++++++++++++
 .../qt6languageserver/qt6languageserver.hash  |  4 +-
 package/qt6/qt6mqtt/qt6mqtt.hash              |  2 +-
 package/qt6/qt6multimedia/qt6multimedia.hash  | 12 +----
 package/qt6/qt6multimedia/qt6multimedia.mk    |  8 ----
 package/qt6/qt6opcua/qt6opcua.hash            |  2 +-
 package/qt6/qt6positioning/Config.in          |  8 ++++
 .../qt6/qt6positioning/qt6positioning.hash    | 16 +++++++
 package/qt6/qt6positioning/qt6positioning.mk  | 47 +++++++++++++++++++
 package/qt6/qt6quick3d/qt6quick3d.hash        |  6 +--
 package/qt6/qt6quick3d/qt6quick3d.mk          |  4 +-
 .../qt6quicktimeline/qt6quicktimeline.hash    |  4 +-
 package/qt6/qt6scxml/qt6scxml.hash            |  4 +-
 package/qt6/qt6sensors/Config.in              |  6 +++
 package/qt6/qt6sensors/qt6sensors.hash        |  7 +++
 package/qt6/qt6sensors/qt6sensors.mk          | 32 +++++++++++++
 package/qt6/qt6serialbus/qt6serialbus.hash    |  4 +-
 package/qt6/qt6serialport/qt6serialport.hash  |  4 +-
 .../qt6/qt6shadertools/qt6shadertools.hash    |  4 +-
 package/qt6/qt6speech/Config.in               |  8 ++++
 package/qt6/qt6speech/qt6speech.hash          | 10 ++++
 package/qt6/qt6speech/qt6speech.mk            | 37 +++++++++++++++
 package/qt6/qt6svg/qt6svg.hash                |  5 +-
 package/qt6/qt6svg/qt6svg.mk                  |  3 +-
 package/qt6/qt6tools/qt6tools.hash            |  4 +-
 .../qt6virtualkeyboard.hash                   |  6 +--
 package/qt6/qt6wayland/qt6wayland.hash        |  4 +-
 package/qt6/qt6websockets/qt6websockets.hash  |  4 +-
 40 files changed, 349 insertions(+), 65 deletions(-)
 create mode 100644 package/qt6/qt6connectivity/Config.in
 create mode 100644 package/qt6/qt6connectivity/qt6connectivity.hash
 create mode 100644 package/qt6/qt6connectivity/qt6connectivity.mk
 create mode 100644 package/qt6/qt6grpc/Config.in
 create mode 100644 package/qt6/qt6grpc/qt6grpc.hash
 create mode 100644 package/qt6/qt6grpc/qt6grpc.mk
 create mode 100644 package/qt6/qt6positioning/Config.in
 create mode 100644 package/qt6/qt6positioning/qt6positioning.hash
 create mode 100644 package/qt6/qt6positioning/qt6positioning.mk
 create mode 100644 package/qt6/qt6sensors/Config.in
 create mode 100644 package/qt6/qt6sensors/qt6sensors.hash
 create mode 100644 package/qt6/qt6sensors/qt6sensors.mk
 create mode 100644 package/qt6/qt6speech/Config.in
 create mode 100644 package/qt6/qt6speech/qt6speech.hash
 create mode 100644 package/qt6/qt6speech/qt6speech.mk

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
