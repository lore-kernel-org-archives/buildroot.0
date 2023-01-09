Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5535DC5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 04:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3D5460AA7;
	Mon,  9 Jan 2023 04:15:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3D5460AA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LUQqQf58dG7G; Mon,  9 Jan 2023 04:15:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AFE760AED;
	Mon,  9 Jan 2023 04:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AFE760AED
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 60EC81BF357
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 04:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37E82409AA
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 04:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37E82409AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QpfAZaFn8isc for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 04:15:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E4414098F
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E4414098F
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 04:15:19 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id i16so3852325ilq.9
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 20:15:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Ay3AyOSCgZ5gcaEAP5bUvYHOaGOVEf9bf9FRwnvRn4=;
 b=pj9QzzBBgwiEUS51DEMebzUnbFDuZgZlqC/4tgQ4pYK39YRfTbaQ9sPINk+woyvq+M
 c9jrMIIy1OkPr7nB0/DaHwY+yDYRWeYej8rZO9FBZr4V232LmyPPrj2FzJwgXRwVKZlc
 DGcMytNMqZs5JePZA9srQ7c2KNslpZkyRIY9UxuP4YTndM3YDsWSASKltC4RzyOD9hva
 ZKsnATR1zCp0XESCD+hbsvW8FEAOs00l8HyZzl84yqV0Fj+4X8iWU+9WmXm74TLHOY7o
 /5YRTWWI5j2RRLV5BMmaGCMwFRQ7U6EYRGG0IsvIQ/XKtL3sPu/8TgNQgYzJjIxLz6oV
 Xpug==
X-Gm-Message-State: AFqh2krVCS0BU+vDpVXLNlrKpxGrxwT/tucLbx8UUJ3XBBMfRlV9OnTa
 f8YvWfiUP5GOsgpzyjTmxUNIayfQLM/EEg==
X-Google-Smtp-Source: AMrXdXsRGcfeTMQZHo6aqVnEseLthrvdWvzLFIuxBMeWwulSw8ufKMQ5Tqpj5n9tSw8Lz2PD1CpSSA==
X-Received: by 2002:a05:6e02:502:b0:30d:899f:aeda with SMTP id
 d2-20020a056e02050200b0030d899faedamr8288530ils.28.1673237718122; 
 Sun, 08 Jan 2023 20:15:18 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 m7-20020a924a07000000b0030d8ee6090fsm2204538ilf.35.2023.01.08.20.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 20:15:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 21:15:15 -0700
Message-Id: <20230109041515.2294573-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5Ay3AyOSCgZ5gcaEAP5bUvYHOaGOVEf9bf9FRwnvRn4=;
 b=ZQgZp4DoIRT5wdx/AY3v+QXdt/HKkK2Ess6QdSZIxwtzFIS72GvdGNfYst4n8x1qkL
 6f2xp8gPQoTMiKsElq91ZOyt+E7+4YSq7fB2QnqUmGs8H1iXS5Gd1YwE6D5cy9dnbvra
 K7awT3/CwRFRldOkF2t9pWs1kRrimbZqAYJCUmmo4uTDE3LcYg2ABUQMDfb/+m/SN0cy
 UaNiy9/i6SyGSgW/Lw4dru7J/hWUMwaZEks2MbloQbHkO4M0qJtrqS4NC8dH6h9jLs+8
 vnSTOaMym8MSqqUsL7degT+hKdMqj0bVgrvBn+9ozJWmFwJeEiSfO2Lso0aGBvswoppf
 1Xtg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZQgZp4Do
Subject: [Buildroot] [PATCH 1/1] package/python-hatchling: bump to version
 1.12.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-hatchling/python-hatchling.hash | 4 ++--
 package/python-hatchling/python-hatchling.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hatchling/python-hatchling.hash b/package/python-hatchling/python-hatchling.hash
index 41d7be977e..154c1fdcac 100644
--- a/package/python-hatchling/python-hatchling.hash
+++ b/package/python-hatchling/python-hatchling.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hatchling/json
-md5  e06cc65ac646f9b01df5406aa1f97022  hatchling-1.11.1.tar.gz
-sha256  9f84361f70cf3a7ab9543b0c3ecc64211ed2ba8a606a71eb6a473c1c9b08e1d0  hatchling-1.11.1.tar.gz
+md5  5a6e2fd0c877feea7e71b9d72bbdbed9  hatchling-1.12.2.tar.gz
+sha256  8a6d719d96653a0f3901072b12710c9c3cc934f9061b443775c6789b45333495  hatchling-1.12.2.tar.gz
 # Locally computed sha256 checksums
 sha256  7f143a8127ad4873862d70854b5bd2abd0085aa73e64fd2b08704a3b9f5c07fc  LICENSE.txt
diff --git a/package/python-hatchling/python-hatchling.mk b/package/python-hatchling/python-hatchling.mk
index 13155a20a4..61aa1a6c23 100644
--- a/package/python-hatchling/python-hatchling.mk
+++ b/package/python-hatchling/python-hatchling.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HATCHLING_VERSION = 1.11.1
+PYTHON_HATCHLING_VERSION = 1.12.2
 PYTHON_HATCHLING_SOURCE = hatchling-$(PYTHON_HATCHLING_VERSION).tar.gz
-PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/24/20/3e21d2bc57229822ac9fb9b314d7892c16f829f34a0eb247c55fc11e09a8
+PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/f5/ea/3ed5a7ecdd8a8f7e84cffd3b5ec24279a09ce2694c218ff922c35c6f1a77
 PYTHON_HATCHLING_LICENSE = MIT
 PYTHON_HATCHLING_LICENSE_FILES = LICENSE.txt
 PYTHON_HATCHLING_SETUP_TYPE = pep517
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
