Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BD1CEE330
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 16:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18EED40E0D;
	Wed,  9 Oct 2024 16:41:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NYLVq8ayV3o0; Wed,  9 Oct 2024 16:41:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC95140E03
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC95140E03;
	Wed,  9 Oct 2024 16:41:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5AF2F1BF3F6
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 16:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54EDB60008
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 16:41:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lKKJPz-ktia6 for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 16:41:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5DA8D608ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DA8D608ED
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5DA8D608ED
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 16:41:46 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-8354599fd8aso23970839f.1
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 09:41:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728492105; x=1729096905;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fsXw+j4mYadUJIbXCZ18q76ErnJjeTbzbRtIH+I++5c=;
 b=gAQFCT93ef9FbeHDmXq8yXddWrrNtUYk7lhJP3bExrudYG/+frw3M7EMqglfhNoQjQ
 Z7iv/O3FH9r33ftphuEUWgUqRNHWoFJrIQqXYb5VzWeKaz6fT4OrVHb24iQSNG/W55J7
 1NLv0AudtgXhjkVtj/jaNZFIAAaexpzXUz8+ppp1j1Z302JmqauU/HPTIC+G1vWiExr7
 prTnNj8bZ5DidvvDoJdsLKM2pMm9lCDcTuS98jAld0aXsAepTn6rHpjwMf1hzxW/UPBd
 tfNQ/9CjjFMVEuc58T2OHF0fjpc7gMUZaxNpJeyh+vyWQPfIaq5WX1hQCQ3sga6aTPop
 SaNg==
X-Gm-Message-State: AOJu0Yz2F/AMV7nNEyWrUZfkkCep3xTZR75YHnUofIQ+sF0zMqONvpCA
 QRt+8U7PcL1B6Lyxgz8ZTMNk49wFgpvzK+U0I7Dpt8Nf9Tt4EXVxpbtJbijE
X-Google-Smtp-Source: AGHT+IH/x8PBVQLqEugXudLj9noHXcGoJifQ6coMMH/a+ssy0vf3iWEefhY9IHPAm23pDD0CEyTznw==
X-Received: by 2002:a05:6602:6001:b0:82a:7181:200f with SMTP id
 ca18e2360f4ac-8353d4ad3cfmr322118839f.9.1728492105137; 
 Wed, 09 Oct 2024 09:41:45 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4db6eb86f45sm2076909173.78.2024.10.09.09.41.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 09:41:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 10:41:43 -0600
Message-Id: <20241009164143.3825125-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728492105; x=1729096905; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fsXw+j4mYadUJIbXCZ18q76ErnJjeTbzbRtIH+I++5c=;
 b=P1dsSiRBN0l/OUX8e9OmX/OHdH6IwZlV2ElxEh9aSEU+c6dfpSbsP4uioYf5foofB+
 XhoyU1GI8PYLfya04ljvAIPhE0nx0HIXRCR5rPcnXMPhVarZk8vnGB7hx4j6Lbd8c5vb
 ugHh6F88l8jAselh6iJRgZTbUhsLAWjBVtPC5j18UzaAoK2oFrYtgXGAmfaY3t2LUIuf
 zUpHOuqqEhqv/PfBrruv8KPZXPAOv9MZHqAh3LDsCrq7U2U6caiG6Xaq/HVTG+Ehk0FD
 yb/wvsSRlPLr8E0J70i1fU7SiOx9KNXboTkhz++Bg/Uy6NS6z1lqgFaKaatdVk3U1OsM
 StEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=P1dsSiRB
Subject: [Buildroot] [PATCH 1/1] package/python-humanize: bump to version
 4.11.0
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
 package/python-humanize/python-humanize.hash | 4 ++--
 package/python-humanize/python-humanize.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-humanize/python-humanize.hash b/package/python-humanize/python-humanize.hash
index 98ea691e0e..ea30ca5c22 100644
--- a/package/python-humanize/python-humanize.hash
+++ b/package/python-humanize/python-humanize.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/humanize/json
-md5  1c0f59ba335b32c06e121e5577ed1548  humanize-4.10.0.tar.gz
-sha256  06b6eb0293e4b85e8d385397c5868926820db32b9b654b932f57fa41c23c9978  humanize-4.10.0.tar.gz
+md5  c37298e6bc6604b54aeb0e158c7c0512  humanize-4.11.0.tar.gz
+sha256  e66f36020a2d5a974c504bd2555cf770621dbdbb6d82f94a6857c0b1ea2608be  humanize-4.11.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8ba6c18112a431400ad3c743f70670079b302545d98884fc2f28a91c383a0380  LICENCE
diff --git a/package/python-humanize/python-humanize.mk b/package/python-humanize/python-humanize.mk
index ff87f6a18d..196645a28f 100644
--- a/package/python-humanize/python-humanize.mk
+++ b/package/python-humanize/python-humanize.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HUMANIZE_VERSION = 4.10.0
+PYTHON_HUMANIZE_VERSION = 4.11.0
 PYTHON_HUMANIZE_SOURCE = humanize-$(PYTHON_HUMANIZE_VERSION).tar.gz
-PYTHON_HUMANIZE_SITE = https://files.pythonhosted.org/packages/5d/b1/c8f05d5dc8f64030d8cc71e91307c1daadf6ec0d70bcd6eabdfd9b6f153f
+PYTHON_HUMANIZE_SITE = https://files.pythonhosted.org/packages/6a/40/64a912b9330786df25e58127194d4a5a7441f818b400b155e748a270f924
 PYTHON_HUMANIZE_SETUP_TYPE = pep517
 PYTHON_HUMANIZE_LICENSE = MIT
 PYTHON_HUMANIZE_LICENSE_FILES = LICENCE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
