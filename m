Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA12CCA470
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 17:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9FFF82233;
	Tue, 30 Sep 2025 17:34:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9zNubQat_QRZ; Tue, 30 Sep 2025 17:34:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF78D8222D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF78D8222D;
	Tue, 30 Sep 2025 17:34:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 24B5A111
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 17:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1657960F3B
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 17:34:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rd6AhKvUckGO for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 17:34:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7128760F1B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7128760F1B
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7128760F1B
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 17:34:18 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-62ecd3c21d3so11338257a12.0
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 10:34:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759253656; x=1759858456;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R4IXLMEYomrSEoA1r+TfDbb2TTGyxB6jy25mcy0dk9Q=;
 b=WIAyfSn53i2kLErkqE2QOtL+J4OeycwksvzcgP5h1i7ZrINX0FnCAdlSZj16VAxQlN
 wP1OQPEJz4w0MqIYv3dIMIfxJ5P2po/R0ocmw7Wnnp8iHA3x/Vsu6V2d8UOMpl2SUVrr
 SgK7Pef9x9MNvLBEh8FBwpwmSB+jZO8qx1ulpU1sPdKca1hjg9LL2QWkOiu49On55HYZ
 XUmoA14JVDwWgXU/O/ZvRiuUNwlcWPZEck7FAm/WMy0PVp3SlzLfBDP2H873/VQR8PEb
 zk9/S+cbq/tV+tagmzna0Qv91IG6sZH3nkRTLVOjvaaO9CpqPqhus8EAlE/1ihOVMqrM
 wc7A==
X-Gm-Message-State: AOJu0YwmeC4mI1bqaGP51QN6IItx4kolHRkrSJPxi/6eGDVSwhiJ55wy
 ENW64Ek6bDXaLWQ5/bDU4mdAIOODdpaB7reyaSGnD6Ggzrv+gtJ7iiKFMDDtllWgSUMVeQRnI6k
 p/pcFi8w=
X-Gm-Gg: ASbGnct9Nn9vY5dq0Ltczu7q9nXzs8VqjePaYjPrmp3+fq71rZgm4NL+ebeI8hZkAaD
 Xqvk91dwaEdiyRLkblkiixQ4wbOLGbC6eV8ZDL5tWN4D3FrHEn+QVPdfLjQ6uDvInbhJd8eLXS8
 cEIQ5NJIfEE8e3qean9KTZqlYaTJoAhmwdpD8F3VJHbYB4hOKwxXsBeN2zc7QwxnToS2R7djNrv
 TWWOXG5LPwBETQSwWNobahK+mnjvhDD6zPDEuLbvwbpCid3G3lKQUj7PC2fNkd6oDm6DR8DTD6Y
 2ET33aEH50qc5Dkft2Vwmc60W59rKmxgqTifp5Fj/hE0Mjlzo3gLm+6ridxowryC8dmSPmJx/yM
 ByX9pBandBijUS7JFTVWBmJhDrIGA3LStJMDBdkCpkzXqazZhBCpI3Yi4hFZw5j62jrn7EYgu0O
 mnaA9tNEiZZu4TYjREe8CncCpcM51vonsgq48u8dRM60/g4EiGi2FNi7txqK7OkqKlJN7iZ8p1m
 BfKvU7F9pywvjJlMkNmgHO4CJtL+X5F/oZL
X-Google-Smtp-Source: AGHT+IHfyZSxyZ7Uw1746RxUh+3Ww7A2UtiHGw+4A3BVcXLj3r0CbgUeB92gPNKG5AT8G3Kq0qN9Mw==
X-Received: by 2002:a05:6402:2356:b0:62f:608e:bbe5 with SMTP id
 4fb4d7f45d1cf-63678be1fcemr730756a12.11.1759253656230; 
 Tue, 30 Sep 2025 10:34:16 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-25-27-158.retail.telecomitalia.it. [79.25.27.158])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-634c065a67csm8120635a12.36.2025.09.30.10.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 10:34:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 30 Sep 2025 19:34:12 +0200
Message-ID: <20250930173412.3791937-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1759253656; x=1759858456;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R4IXLMEYomrSEoA1r+TfDbb2TTGyxB6jy25mcy0dk9Q=;
 b=A46y9aGa1YdWvp5SzT1cYHVfL8kqNyd0CNi8psQ/cda6TUqUJ5+2ITZBbWX6X05h8O
 zXd+s9jytfw5qTVSIgDU5kvdH2JDJCVKYqd8o0p98nq55F8AWWTJo1P5s5y3NaRf4E77
 e7TaNuFSwS+EN7WTLTfFwFBQXlihhA+FuV5po=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=A46y9aGa
Subject: [Buildroot] [PATCH 1/1] package/evtest: bump version to 1.36
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

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/evtest/evtest.hash | 2 +-
 package/evtest/evtest.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/evtest/evtest.hash b/package/evtest/evtest.hash
index 0ed51df4e4d2..f5aa5ca52509 100644
--- a/package/evtest/evtest.hash
+++ b/package/evtest/evtest.hash
@@ -1,5 +1,5 @@
 # locally computed
-sha256  06dfe6b9760b78f3f73aca2120cbcb79339b33e59d5c79a49b4bd5d34844b054  evtest-evtest-1.35.tar.gz
+sha256  3b9a66c92e48b0cd13b689530b5729c031bc1bcbfe9d19c258f9245e2f8d2a0f  evtest-evtest-1.36.tar.gz
 
 # License files
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/evtest/evtest.mk b/package/evtest/evtest.mk
index 65897a41e601..0249bd88cc3c 100644
--- a/package/evtest/evtest.mk
+++ b/package/evtest/evtest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EVTEST_VERSION = 1.35
+EVTEST_VERSION = 1.36
 EVTEST_SOURCE = evtest-evtest-$(EVTEST_VERSION).tar.gz
 EVTEST_SITE = https://gitlab.freedesktop.org/libevdev/evtest/-/archive/evtest-$(EVTEST_VERSION)
 EVTEST_LICENSE = GPL-2.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
