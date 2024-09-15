Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE4BC35FE5
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 06:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCCEA4063A;
	Sun, 15 Sep 2024 06:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gse9wcmpEsCA; Sun, 15 Sep 2024 06:09:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6344240640
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6344240640;
	Sun, 15 Sep 2024 06:09:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A39631BF841
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 06:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9250E411F7
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 06:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a90LMEFtFo_j for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 06:09:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4D7AC408C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D7AC408C5
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D7AC408C5
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 06:09:09 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-82d07f32eeaso107017539f.2
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 23:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726380548; x=1726985348;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wSxw4f400+O1rJmU2i6y9rOc5vOsrQjHnPlAFy7TZUw=;
 b=X6RIuE0X0TIpSbLeyX5lKPR28YUgsW3vPoDR4kW+JohJGdAru4SXOPruBn1eLK+O6d
 3EP0E+nH/QDFbsP0jznBJKc/4IxwHmAoVMKR8i9cdllmRiKL6lsSHGkYCQo/Ivwcgmoy
 L4ZpvQpYnox8fYeXkDQL6owh9HMylpoR+lm8Q//jeGtpNKFq0RmNVGMnLmS/YnMEjJ2N
 TWJTcpDfWuCHbSxrEtJZdpFsFzlRkRQFRhf6L3xIRdwsWp1981gV3nbns2s2s+9H/jtp
 /XGX3GSbmv/ha0y81jKMBHh7S+d9TmceLgX990YybbwAQp9oLUjsdjMq/3tQBvUtG2Pm
 ynVg==
X-Gm-Message-State: AOJu0Yw9zHzh26n9p7ew7k/2hwjOFUvTieS/otLGdMNBXm6KwiB7Olgu
 sMS7DNtHbsCWGMukv/AzVv1lgRq8cFHx+IkFr143hRSJmNc+9feWt7mV5A==
X-Google-Smtp-Source: AGHT+IFhCClb5iI3kd9/4XV4zAHPdQkA4FBfDsQWQmbF89sgfTorEjCYKfDEDqCir1jUf5NcmzU8pw==
X-Received: by 2002:a05:6e02:214d:b0:39f:5baa:e50c with SMTP id
 e9e14a558f8ab-3a08b710166mr88603195ab.8.1726380548014; 
 Sat, 14 Sep 2024 23:09:08 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e7171asm8684775ab.56.2024.09.14.23.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 23:09:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 00:09:05 -0600
Message-Id: <20240915060905.1432566-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726380548; x=1726985348; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wSxw4f400+O1rJmU2i6y9rOc5vOsrQjHnPlAFy7TZUw=;
 b=PACheR4PA6KHwFEFKxsY+dz3FacWSii+sMPVMqkjZmeMz9FKM3FuYnihaNwLKEIn1Q
 gENCoNqarBHfVvKl18OFEe1AYfw5r4bw8LchXemDNSUYH//kKQ5jEJVB/NEufEJ9bBO7
 gz7s5Lq/kepsP0frsIOUfPu7+lfuMQXv4+VqlFTGlwKFDgD3UBq7SNvuXk0T3r3wakwL
 zcgYmIkLGtE9VzRr4MQRVUJpDKqNRp1fIms8PH7T8FTVZkOl17BIXhrP3uv7eLkNwREP
 0tBdvv1eoGyJTuMozT3tScLK2PcWakBeSBccellaD42VePWnD+HhpiGjsSxU7StzfSll
 vfuA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PACheR4P
Subject: [Buildroot] [PATCH 1/1] package/python-flask-cors: bump to version
 5.0.0
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
 package/python-flask-cors/python-flask-cors.hash | 4 ++--
 package/python-flask-cors/python-flask-cors.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-flask-cors/python-flask-cors.hash b/package/python-flask-cors/python-flask-cors.hash
index ced7d9dcea..41c232df36 100644
--- a/package/python-flask-cors/python-flask-cors.hash
+++ b/package/python-flask-cors/python-flask-cors.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-cors/json
-md5  0ccfa375e744200243d85719b38cdbc6  Flask-Cors-4.0.0.tar.gz
-sha256  f268522fcb2f73e2ecdde1ef45e2fd5c71cc48fe03cffb4b441c6d1b40684eb0  Flask-Cors-4.0.0.tar.gz
+md5  a6e8202cc008ef6f70ce75a7ae7f8d9d  flask_cors-5.0.0.tar.gz
+sha256  5aadb4b950c4e93745034594d9f3ea6591f734bb3662e16e255ffbf5e89c88ef  flask_cors-5.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6e1a1bdc54834c1e0740cbce5d5f6f2cae1c846fd2a7f482b11649594fafbd5d  LICENSE
diff --git a/package/python-flask-cors/python-flask-cors.mk b/package/python-flask-cors/python-flask-cors.mk
index bfcaf63c64..1119648370 100644
--- a/package/python-flask-cors/python-flask-cors.mk
+++ b/package/python-flask-cors/python-flask-cors.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_CORS_VERSION = 4.0.0
-PYTHON_FLASK_CORS_SOURCE = Flask-Cors-$(PYTHON_FLASK_CORS_VERSION).tar.gz
-PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/c8/b0/bd7130837a921497520f62023c7ba754e441dcedf959a43e6d1fd86e5451
+PYTHON_FLASK_CORS_VERSION = 5.0.0
+PYTHON_FLASK_CORS_SOURCE = flask_cors-$(PYTHON_FLASK_CORS_VERSION).tar.gz
+PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/4f/d0/d9e52b154e603b0faccc0b7c2ad36a764d8755ef4036acbf1582a67fb86b
 PYTHON_FLASK_CORS_SETUP_TYPE = setuptools
 PYTHON_FLASK_CORS_LICENSE = MIT
 PYTHON_FLASK_CORS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
