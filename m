Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E04E7716E
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 15:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84544605A2;
	Wed,  4 Dec 2024 15:53:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e_FNmvdpvmMp; Wed,  4 Dec 2024 15:53:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99114607B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99114607B6;
	Wed,  4 Dec 2024 15:53:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A5871DD1
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 15:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 355114023A
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 15:53:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uvGCAvWREHsE for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 15:53:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=becher.jannik@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 19FFE400F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19FFE400F6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19FFE400F6
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 15:53:48 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aa503cced42so1008704066b.3
 for <buildroot@buildroot.org>; Wed, 04 Dec 2024 07:53:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733327627; x=1733932427;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y2rbQIntEhvzFMM5W3IkS5PDW06zfI1gbA5ncHeVMfc=;
 b=YD9umJhFN7J0+k/N/018N/x3VwXR58YPqCrigSGtVJGJKor0VhbsP6SEhLhhPER7+h
 r6EcrGHi/7GnF8c6FVXS88ocJJBHheGG2Nbt2qYeuMeaxyuJR6DtTvRf0nrtUxK3l1wh
 KTBfAiPRdQ509ThrD9MdDCukfF8Hh982UNULM5zToYmp5WaEAfs87jalJdcjyeW4RyMf
 4sAFrCJQXyPfCF1Yt7r+YHxKRiFvw+doccNZM0q6xb2vSChEJowQU6qFnx1JwmHKLb80
 SVNeS/ASQJrAqRgtpluhJr4A9u2TBsfszGoAOlouYSqFJzhOfmOMpKonaJU2EDOp+eDh
 tDsQ==
X-Gm-Message-State: AOJu0Yy6G11mqQijk29+VeRroMNZqrdMRh8v++o67nz3YBfOYSbO4dmx
 q02DDQZcbYgHPZKZjdRK4/llQu7ZOiZ+NEFmO9xG0atGYYzPe/mD5w9b5FTWKI8=
X-Gm-Gg: ASbGncu2gwXitOLHoJ5KX4U7voEnn+XL8d+urpaEpCrrZuAaeLevNShv6FdUE60ICMe
 hNtKxUGzIRnF/wFsxfh6r7+deat2xUfnTfxmRZbTCughA/kh3jmkJfXqBxQ7BG4B9cGeORPybtj
 fJja3mIeJAaDtEuBfAXuceDr+VGO+ZY39/1/EAv2xJ+cmNI+a5aRwYXI+hBsAw4fr/PmIsFp4cF
 SAP7w9FyMMeUPVmsstaosLRvBvSuK8mkwRjTQt78EamoD+MHf40EDgk8Jozn45PUNcaYYV8R9+r
 HQ/7oADqDdzxi0HirJ8rQfI=
X-Google-Smtp-Source: AGHT+IGq4zIR1mwwGMQmB/xtTtHMO9lmdhdxhgqm7Qoe3loxp1O5jW3YDsGefaNFqT8tCQj9AVmB+Q==
X-Received: by 2002:a17:906:23e9:b0:aa5:fd7:cd7a with SMTP id
 a640c23a62f3a-aa5f7d667eemr519158166b.21.1733327626515; 
 Wed, 04 Dec 2024 07:53:46 -0800 (PST)
Received: from localhost.localdomain (p5492bafd.dip0.t-ipconnect.de.
 [84.146.186.253]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5996de782sm743518866b.56.2024.12.04.07.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 07:53:46 -0800 (PST)
From: Jannik Becher <becher.jannik@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>, Jannik Becher <becher.jannik@gmail.com>
Date: Wed,  4 Dec 2024 16:53:41 +0100
Message-ID: <20241204155342.185278-1-becher.jannik@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733327627; x=1733932427; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y2rbQIntEhvzFMM5W3IkS5PDW06zfI1gbA5ncHeVMfc=;
 b=gxxES0+FkDCYlfyyqiFPp+cmzjh0UjQ2rr97nSFsEKObtMJDLWmhKKfE/4NBoN87Xf
 ofjHv5fYExvJ+Kyh9Ugl2Y6FZvG1FSPzHrBpHRXJYBmiUtyqcKzhilbbsK/CL15TwjPZ
 dswKfWOknekeahaF+vQmosPFlaSqmb8i2j1vvYQm3kwCxsOcdyL1kjWLq0psHwvY6CMU
 m/ugfXPaDJbn/oVu5SAQMWsYfWl30+MHLImfd3DIVEpWDUGaerD7tYCLKk+2aBcaGPmj
 MBVbLW5mQJIotxttlPNAv4KgXkXVmlmV4sFZNGXZMskeuhBFZkVnR6WwdMo6YPBzJ0pp
 vjig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gxxES0+F
Subject: [Buildroot] [PATCH 1/2] package/igh-ethercat: bump version to 1.6.2
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

Signed-off-by: Jannik Becher <becher.jannik@gmail.com>
---
 package/igh-ethercat/igh-ethercat.hash | 2 +-
 package/igh-ethercat/igh-ethercat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/igh-ethercat/igh-ethercat.hash b/package/igh-ethercat/igh-ethercat.hash
index 67a152c6ae..0c3a8bb07d 100644
--- a/package/igh-ethercat/igh-ethercat.hash
+++ b/package/igh-ethercat/igh-ethercat.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  7e4d8f3497c0bc0b64a151c0d074349fe7614767563642d6fedb19567eafa1e1  igh-ethercat-f5dc109176400f540a8682a2c9ee20d411d14d61.tar.gz
+sha256  844e9846a30b8bed0ae7f1e9a70b724b8980a21ef61c2bdf8fa219c9745c1958  igh-ethercat-1.6.2.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
index 5b618ab54a..374f8891e5 100644
--- a/package/igh-ethercat/igh-ethercat.mk
+++ b/package/igh-ethercat/igh-ethercat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IGH_ETHERCAT_VERSION = f5dc109176400f540a8682a2c9ee20d411d14d61
+IGH_ETHERCAT_VERSION = 1.6.2
 IGH_ETHERCAT_SITE = $(call gitlab,etherlab.org,ethercat,$(IGH_ETHERCAT_VERSION))
 IGH_ETHERCAT_LICENSE = GPL-2.0 (IgH EtherCAT master), LGPL-2.1 (libraries)
 IGH_ETHERCAT_LICENSE_FILES = COPYING COPYING.LESSER
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
