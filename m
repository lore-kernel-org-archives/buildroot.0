Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A81CAC599
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 00:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4361260DB9;
	Tue, 16 Sep 2025 00:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lqZTib93rFL8; Tue, 16 Sep 2025 00:59:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50DB060DCA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50DB060DCA;
	Tue, 16 Sep 2025 00:59:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E1D5199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1443140A8C
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P4O1pZJugINZ for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 00:59:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 13EE040AC7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13EE040AC7
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13EE040AC7
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:59:30 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-42404af313aso9821265ab.0
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 17:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757984370; x=1758589170;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H0ZGyiw8qO7wekWY060hSSefq8E0eiV05PXBlZC+WN0=;
 b=exEIEhIEOVNflXSL5sW7Y0cPo8Wk7qiL4qO3Ks0HfkKEq4jRH8Opamv6K5289E0s9T
 kWFKwjF7EWHZhEOvmhmouLh483l6WdcEhdtNJRgmOTKHDlv91sjE6pMf21wryNvNYYqh
 EeVp0LYAychgGX78aku7jh7gshGzXYaiLAAIKOTdWI+we8LP/WtquW+XwNl1eWwSNFnc
 WAfmIzvRSX1Zu+Ai125BKlDBtDvVaF0nyqvLJ28mWuFDc0JBj8Avpl98h+a3S6PX04Vs
 Fy3Tpg1v4KYfJGxRyQ2JKHYjcm9yUa1cxxpHp3mDQIj0gj3CRFSUD2RdtTxTrhzRR4fL
 9XqQ==
X-Gm-Message-State: AOJu0YyvylMlBOHwI8bTnjomW+Knmrg//M9GUuEPl/BmvUApFs3+Qw+K
 DOLobXseV97b3OPEN9sKwU5BLEHY3YM5dnbaX1cRAPPsGyjvF6S2qQLBZY1PUQ==
X-Gm-Gg: ASbGncuiiwXdGXsv4XVB8uMHmqlp9iN1PEGbPsyhgpQ0/PzWcR2qjK4jCA3JHl55cGw
 0V7MFauPdYUzLsSSfk3grrO4/013qN835XRvDmXdDd/1irUs3Jv/n2IUVxiscbZMKLS4U38OAwM
 x/MNMC4eUX/LT3pw8OhIlrlURsE0JonbXKhs6NwC9rJ+hQlAyuHm2v85PQTWAZf+iKrrt5buIGL
 LM0WL/ZIpVVXtyOXA+R4hdW00ZFFGtOq7ttqLmtH/VTa7L85TT+IRptinS1EjL5EwWLzRXzOY8A
 WJPthgcy6b9dXknAdUeJGdNhfV10HAff9X+FVM8Z7vCIVy7lEI6bNI6ufrTFW4nGlRM1vla1ZmS
 eLOLiNjHxkjDVN3GFUV0GCs2vDsiyd0uN4YJiqLecCLdXJv8DnBh/KnpPSwmajQyWxo3dffcMmk
 Zu
X-Google-Smtp-Source: AGHT+IHIhAekyJBVIqzV3gOzGHHfopiBja/mz4j45hHXVPQGuTAKRkg/JzlZAD5TKoDy/k5OqkaRLw==
X-Received: by 2002:a05:6e02:2584:b0:418:a784:5e1f with SMTP id
 e9e14a558f8ab-420a39c0b5amr120088815ab.16.1757984369763; 
 Mon, 15 Sep 2025 17:59:29 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-51217ed6212sm2945091173.1.2025.09.15.17.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 17:59:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 18:59:27 -0600
Message-ID: <20250916005927.2542039-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757984370; x=1758589170; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H0ZGyiw8qO7wekWY060hSSefq8E0eiV05PXBlZC+WN0=;
 b=IocHS89yeBSVsqc5g8S+wJwnmKpNs+YqLNhW5kvGnkJOURYFwUImTxc8yXNpVnLMUk
 wyjRJ0GxVbWi24xaiqXAJ/C9VGqgmWtXNwJrehu+HFIjIYDhEBwPJ+yL9alW8krrgTZj
 mYkpVDlVIPbvklE0cknkSSc72exUL78fCC7zcQ7RNyCE4KG+uS/2jQQdWJVxK6MWnWhZ
 qKIF3GLm26hXvHkbNlrRSWwl2zxRotuqunXV2+fUofVBDDmihExmW+DwSEBabJvblU5v
 CEcm9f9a2KsFZA53edkpb0nsqeWhfEUjlfKe2J0p5HENCMsplGenr+C8UWC2Qshaq0lU
 GmkQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IocHS89y
Subject: [Buildroot] [PATCH 1/1] package/python-starlette: bump to version
 0.47.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index 5939eb198f..4937d93ad0 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  b58c9f8d38df9946689cb3e9f94555da  starlette-0.47.2.tar.gz
-sha256  6ae9aa5db235e4846decc1e7b79c4f346adf41e9777aebeb49dfd09bbd7023d8  starlette-0.47.2.tar.gz
+md5  5ae93b12a6b5527fc97c5ba3921bc552  starlette-0.47.3.tar.gz
+sha256  6bc94f839cc176c4858894f1f8908f0ab79dfec1a6b8402f6da9be26ebea52e9  starlette-0.47.3.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index 4037903cc5..04f40460b7 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 0.47.2
+PYTHON_STARLETTE_VERSION = 0.47.3
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/04/57/d062573f391d062710d4088fa1369428c38d51460ab6fedff920efef932e
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/15/b9/cc3017f9a9c9b6e27c5106cc10cc7904653c3eec0729793aec10479dd669
 PYTHON_STARLETTE_SETUP_TYPE = hatch
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
