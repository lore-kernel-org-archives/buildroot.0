Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98822C27C65
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 18:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B84860629;
	Tue, 11 Jun 2024 18:00:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 70E_RJlLiFhW; Tue, 11 Jun 2024 18:00:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 296906064A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 296906064A;
	Tue, 11 Jun 2024 18:00:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F3781BF312
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B2E681F65
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k4O0nGShdrj6 for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 18:00:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com;
 envelope-from=cdimich2188@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5196B81F88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5196B81F88
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5196B81F88
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 18:00:40 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-7042a8ad9f5so74545b3a.0
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 11:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718128839; x=1718733639;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SDqQryY8icep8B6hNCKGf66zmkF5ylsTxGymgvyKHR4=;
 b=Z4830WkIyxg5nRj+ac4AW4VMjlr43Gdy/HXrbYChs6QwHX5143vb73In3/4v13qFmf
 B29cNfbWaFQro8B3gJK5m0tL5yAfUGsyeGiVPLYH68YXN5nslbCivzBZmg4wnaFDNXeP
 qdjcuyHMWVLOGXcZJHKV3cCOeXWMa+S8wpVm+Drsix7BGQIASws67nmtKTi7nO5EZgl0
 LquzKxfVDEU4wYA/+Tjx/kgikQo6r2bIte3kmAu+OLAFjuvE2P6GfTUOaemV2vjBJQ3y
 UPv6AWV55Y7zfFp+10H/xLHQNfNkiL0x0dmMVlZKz/ta1itgabaDssJERtDwKbmHzmiN
 IOZA==
X-Gm-Message-State: AOJu0Yx1gtL97lSHX1C6mR6C393WQJrbDeayTJYKTtGL4vudFc/yIJNJ
 3CdfsA3fCDbcv8KYEI7FkXpIWhDqkz7hpRjcwAhStqDDPXsNzmm6qXzCS6Tt
X-Google-Smtp-Source: AGHT+IFsUg6AsoIgXgk7mPNslrI6KNZUPQ0i9r9nzhSge42RBLo10KNGaC7b6Z29tIwDwOrQi03F2w==
X-Received: by 2002:a05:6a20:12c4:b0:1b4:b4af:6052 with SMTP id
 adf61e73a8af0-1b86bda6e9amr4939323637.23.1718128839185; 
 Tue, 11 Jun 2024 11:00:39 -0700 (PDT)
Received: from chris-jammy.lan ([136.52.56.126])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7041cff68d0sm6670410b3a.185.2024.06.11.11.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 11:00:38 -0700 (PDT)
From: Chris Dimich <cdimich2188@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jun 2024 10:59:55 -0700
Message-ID: <20240611180007.2127244-1-cdimich2188@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718128839; x=1718733639; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SDqQryY8icep8B6hNCKGf66zmkF5ylsTxGymgvyKHR4=;
 b=JVq9NkrJ2D/lYK7BlFDNVL7cOW8uvEdWjDr63H1aSJLVsjcrA6tYBr/SxYg4wKTLnQ
 SyZ0P6+wjDdecYLCMPMrcV/Flh1jPwauGVmJtNmcpVK8WtCHL4wjgTDJgivGB38/jBhx
 uJvEUoCPTw2mnZuE65GUvoyPQiG/PNpHUpEV9/4FBRTm5bygQhEZeXpUI4dOjK7DJO3k
 NBV6f4is6dbq0g+jUk5LnehGXbtFlSYISHUz8U8/iKSQLPOnUluMadmjt3VSSXB82Srw
 oa2v6VGhMFD9uY1HBip7h7xgx7S7j92vHl894sg7nyjuqDLsqOlwePPxXTJ+DM0KVpBv
 kZwA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JVq9NkrJ
Subject: [Buildroot] [PATCH 00/12] freescale-imx: update/add various
 packages as per NXP 6.1.55-2.2.0 release
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
Cc: Chris Dimich <cdimich2188@gmail.com>, Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series updates various freescale-imx packages as per
NXP 6.1.55-2.2.0 release. Also includes i.MX 8ULP support addition
as well as a new package: firmware-upower.

Chris Dimich (12):
  package/freescale-imx/firmware-imx: bump to version 8.22
  package/freescale-imx/imx-codec: bump to version 4.8.2
  package/freescale-imx/imx-gpu-g2d: bump to version 6.4.11.p2.2
  package/freescale-imx/imx-gpu-viv: bump to version 6.4.11.p2.2
  package/freescale-imx/imx-seco: bump to version 5.9.2
  package/freescale-imx/imx-vpu-hantro: bump to version 1.31.0
  package/freescale-imx/imx-vpu-hantro-daemon: bump to version 1.1.9
  package/freescale-imx/imx-vpu-hantro-vc: bump to version 1.9.1
  package/freescale-imx/kernel-module-imx-gpu-viv: bump to version
    6.4.11.p.2.2
  package/freescale-imx: add i.MX 8ULP support
  package/freescale-imx/firmware-upower: new package
  board/freescale/common/imx: add support for i.MX 8ULP

 .../common/imx/imx8-bootloader-prepare.sh     | 19 ++++++++++
 package/freescale-imx/Config.in               | 36 +++++++++++++++++--
 .../freescale-imx/firmware-ele-imx/Config.in  |  3 ++
 package/freescale-imx/firmware-imx/Config.in  |  1 +
 .../firmware-imx/firmware-imx.hash            |  6 ++--
 .../firmware-imx/firmware-imx.mk              |  2 +-
 .../freescale-imx/firmware-upower/Config.in   | 22 ++++++++++++
 .../firmware-upower/firmware-upower.hash      |  4 +++
 .../firmware-upower/firmware-upower.mk        | 27 ++++++++++++++
 .../freescale-imx/imx-codec/imx-codec.hash    |  6 ++--
 package/freescale-imx/imx-codec/imx-codec.mk  |  2 +-
 .../imx-gpu-g2d/imx-gpu-g2d.hash              |  8 ++---
 .../freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk  |  4 +--
 .../imx-gpu-viv/imx-gpu-viv.hash              |  8 ++---
 .../freescale-imx/imx-gpu-viv/imx-gpu-viv.mk  |  4 +--
 package/freescale-imx/imx-seco/imx-seco.hash  |  6 ++--
 package/freescale-imx/imx-seco/imx-seco.mk    |  2 +-
 .../imx-vpu-hantro-daemon.hash                |  2 +-
 .../imx-vpu-hantro-daemon.mk                  |  2 +-
 .../imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash  |  6 ++--
 .../imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk    |  2 +-
 .../imx-vpu-hantro/imx-vpu-hantro.hash        |  6 ++--
 .../imx-vpu-hantro/imx-vpu-hantro.mk          |  2 +-
 .../kernel-module-imx-gpu-viv.hash            |  2 +-
 .../kernel-module-imx-gpu-viv.mk              |  2 +-
 25 files changed, 146 insertions(+), 38 deletions(-)
 create mode 100644 package/freescale-imx/firmware-upower/Config.in
 create mode 100644 package/freescale-imx/firmware-upower/firmware-upower.hash
 create mode 100644 package/freescale-imx/firmware-upower/firmware-upower.mk

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
