Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DDFC4829E
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 07:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8371B82EDB;
	Thu, 15 Feb 2024 07:02:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nPYlpSwjbt_z; Thu, 15 Feb 2024 07:02:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AFF182F06
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AFF182F06;
	Thu, 15 Feb 2024 07:02:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3274E1BF5AE
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 07:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CC0460819
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 07:02:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bC_J8P6QkINk for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 07:02:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0757C6077B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0757C6077B
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0757C6077B
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 07:02:16 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1d944e8f367so4976185ad.0
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 23:02:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707980536; x=1708585336;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hOYrXakO7HS2RWgGRJo16tKZGj461dZVFPBFhBGy2Cs=;
 b=S6fcCpIyYDT7HV5hafiLS8X/mBmJXhoWLLIoyd8kueQVBQ0335hssNXXddFRO7K16Y
 bSCxoxIeiE+dEGsyCWAcNT6yAZgIP7K6nJQVwFW8m8FJFN1nBjnU0UIvXJGXs8qFPQeU
 QI2Shmeos66wZaP9TMiP1U4PEupUbH8LgcLdaBQHYfIOMtNYQrCwKtFuR40Ed4AwTDq3
 4PZeUZCmRfpn+CaWH/TWKpvxtFEhw58bdf5wk9ycSzAX0A++1muyZBa7Jm6wAehBADbo
 m08x/3/KIw/8XAx76Z6KVRGKufwuYDzlvoAec8/IWr0UYtRu0z2onXq/LpTLqv71gRrW
 vMxg==
X-Gm-Message-State: AOJu0YyR2s9H9yTc/ZOJwXzfPbkA0rPNRR9Rxsa0u0aPiNla4GtsWUIN
 4XobpBo71vpb7W1cwfN08cCbg4JDBPMSVfVl3U8mFUxibx1Bs8itYtQi5kRetMo=
X-Google-Smtp-Source: AGHT+IGlZ5L2MeN2vjrnPyRTnBYX+pdtT+CwebxsLjLh6apr5gmnSHSsu5rdkJ0hhJ/n94pOko8rSA==
X-Received: by 2002:a17:903:124b:b0:1d7:691e:2704 with SMTP id
 u11-20020a170903124b00b001d7691e2704mr1304233plh.35.1707980535374; 
 Wed, 14 Feb 2024 23:02:15 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 r15-20020a170903020f00b001d9a41daf85sm547640plh.256.2024.02.14.23.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 23:02:14 -0800 (PST)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 14 Feb 2024 23:00:11 -0800
Message-Id: <20240215070011.2668708-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707980535; x=1708585335; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hOYrXakO7HS2RWgGRJo16tKZGj461dZVFPBFhBGy2Cs=;
 b=no7XKsAErq4bAUe5gNbfdMEcJwQzKnJU4Pv3WISaDj5lksE7zOWG97oJtdNEyQHU9X
 vGoEOpK4ZAvXIfBfo2aNs5LuZR2XDddlbn6fqPQEG4gmlcVwSJRtCgZWrXc3o6mA4pdj
 wH05f+HEzjY4qdjTs8lKWtFcjUsWxdDEBqvwE8WFmZ/61tERs15hzrOTL/vvRMSYH6pI
 QxEuvBnOC6P4LXoJbfoyuq1cYsSZz1XTtHYco0+qDioqvSeAarNc1DyPYwmMqXn+9DXv
 3+h5IotJbUV58KC3OjvopANv3+d8n5qqPiElMd3P3+esuqrxy7x3/b7E2bQaCz9rPZG3
 qQeA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=no7XKsAE
Subject: [Buildroot] [PATCH 1/1] package/iperf3: bump to version 3.16
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes - https://github.com/esnet/iperf/releases/tag/3.16

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/iperf3/iperf3.hash | 4 ++--
 package/iperf3/iperf3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index 02ada0dcc6..a8634c4a7e 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,4 +1,4 @@
-# From https://downloads.es.net/pub/iperf/iperf-3.14.tar.gz.sha256
-sha256  723fcc430a027bc6952628fa2a3ac77584a1d0bd328275e573fc9b206c155004  iperf-3.14.tar.gz
+# From https://downloads.es.net/pub/iperf/iperf-3.16.tar.gz.sha256
+sha256  cc740c6bbea104398cc3e466befc515a25896ec85e44a662d5f4a767b9cf713e  iperf-3.16.tar.gz
 # Locally computed
 sha256  35aa7c4618b9884d6faa9b43a4e70291b35ea9f89329d5d33becd852e85221b0  LICENSE
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index c00b16ce61..6d902c3b13 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.14
+IPERF3_VERSION = 3.16
 IPERF3_SITE = https://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
