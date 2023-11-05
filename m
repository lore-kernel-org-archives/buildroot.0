Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D280C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 02:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C820860DC6;
	Sun,  5 Nov 2023 02:08:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C820860DC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IWyLeSAfc4Fc; Sun,  5 Nov 2023 02:08:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16A2760AC6;
	Sun,  5 Nov 2023 02:08:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16A2760AC6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D37351BF59E
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 02:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5C8B60AC6
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 02:08:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5C8B60AC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6zrB0tEKtN66 for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 02:08:09 +0000 (UTC)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D6EC60AB2
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 02:08:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D6EC60AB2
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-359472f74c5so13329135ab.0
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 19:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699150088; x=1699754888;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vJ6enCfJlwXtWOV82+B2WuSP9P9wzLf7r4c/tSGdpRY=;
 b=Z1zeVUo+scV2kbJVKpxM1KKMJd7EIrKx4qIWvN/XiYG7WojAez5Kjk68XSa8gg/sc9
 WKO+dEfhyQUvqFDTGmRFwqHPhG0wo2+txdWiGtN8zNQkNF9zgzWG8ldP3o+6v0z8MSJW
 l+1/pCI2jbf1m6usk0ORteNYSbTVbzScgrwKiOOgNtHYXW/UtYlcjCbmgobQvnc0NOli
 0Le3ha2oqLTs/tTZ6dfKd4YtV/u6b6L8imIti6a3TP/QnR0P0hQ9t0lqLfuRtdNcTPqF
 QzZzFZsceIjLqZNMPV/zDhV00S8+OYEn0NR6+8E9hhdSP4CVQ4jFfueEIVlfkJRcgoqG
 wgOg==
X-Gm-Message-State: AOJu0Yyu9gLIOKsBmpOWcaLppmorrw0bRBnX7ApOX3KVHQeG1ERhLJkK
 ClloE6nEt6fhFz3K2ZGjvG6WqTCUsrM=
X-Google-Smtp-Source: AGHT+IFmEn7wpo/mNMWN3v2K8aDnbML3TffYBHUOHHRoHUnnBUQSn9Whrrr1vI84eg5CYK6B47pQbQ==
X-Received: by 2002:a05:6e02:2612:b0:359:3e0b:3a1a with SMTP id
 by18-20020a056e02261200b003593e0b3a1amr18342123ilb.26.1699150087979; 
 Sat, 04 Nov 2023 19:08:07 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 c20-20020a056e020cd400b0035801ed36edsm1582568ilj.47.2023.11.04.19.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 19:08:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 20:08:05 -0600
Message-Id: <20231105020805.2737023-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699150088; x=1699754888; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vJ6enCfJlwXtWOV82+B2WuSP9P9wzLf7r4c/tSGdpRY=;
 b=HM0r5DPxbLFuXcoqvgdh0vi6TKcfT0ZyPMlPIwppRJnYF2T8wJ9A63WqCi+O/gcCRk
 lUFoWcPX/ChLDc7aOZHdbZ/VTqiPZDHTF8UdS1YEr9CsbMaXC57leT7WPHIYNozRIIAC
 WkZlXy4zTof1WJwWbHLeKXlDRLIvnSXM7G40N2sg+BNfXpl4Vq5FvpX8HwDgbz5c/EAy
 fnQxctzyxnLawArQ4o7ccm1PkBpKU70Fj6iN7edXochtoCARnBcdX+G+XMnVofqbEykb
 gNTShUwuEz1xUB1If1EN3fZnsnMIBnQ65szbd2uy5w6MDHHiO2H61PD+XnyfPYmY0SmU
 ETFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HM0r5DPx
Subject: [Buildroot] [PATCH 1/1] package/python-blinker: bump to version
 1.7.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-blinker/python-blinker.hash | 4 ++--
 package/python-blinker/python-blinker.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-blinker/python-blinker.hash b/package/python-blinker/python-blinker.hash
index 28416d9fe2..e0c1d600eb 100644
--- a/package/python-blinker/python-blinker.hash
+++ b/package/python-blinker/python-blinker.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/blinker/json
-md5  1c7375d100a67ba368d9cde0ab2d8cfa  blinker-1.6.2.tar.gz
-sha256  4afd3de66ef3a9f8067559fb7a1cbe555c17dcbe15971b05d1b625c3e7abe213  blinker-1.6.2.tar.gz
+md5  0306b831281e9918ffb0ac6e3e18b47f  blinker-1.7.0.tar.gz
+sha256  e6820ff6fa4e4d1d8e2747c2283749c3f547e4fee112b98555cdcdae32996182  blinker-1.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  9eb73a1f38597a4aa17025d2ae1be3839624c795e985d4f0e9769ce29faca467  LICENSE.rst
diff --git a/package/python-blinker/python-blinker.mk b/package/python-blinker/python-blinker.mk
index 6af0f811cb..234126a500 100644
--- a/package/python-blinker/python-blinker.mk
+++ b/package/python-blinker/python-blinker.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BLINKER_VERSION = 1.6.2
+PYTHON_BLINKER_VERSION = 1.7.0
 PYTHON_BLINKER_SOURCE = blinker-$(PYTHON_BLINKER_VERSION).tar.gz
-PYTHON_BLINKER_SITE = https://files.pythonhosted.org/packages/e8/f9/a05287f3d5c54d20f51a235ace01f50620984bc7ca5ceee781dc645211c5
+PYTHON_BLINKER_SITE = https://files.pythonhosted.org/packages/a1/13/6df5fc090ff4e5d246baf1f45fe9e5623aa8565757dfa5bd243f6a545f9e
 PYTHON_BLINKER_SETUP_TYPE = setuptools
 PYTHON_BLINKER_LICENSE = MIT
 PYTHON_BLINKER_LICENSE_FILES = LICENSE.rst
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
