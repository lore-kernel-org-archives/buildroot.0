Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3337BC3600B
	for <buildroot@archiver.kernel.org>; Wed, 26 Mar 2025 13:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA56784767;
	Wed, 26 Mar 2025 13:27:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U3fe8TCiSIuf; Wed, 26 Mar 2025 13:27:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6F0E8419B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6F0E8419B;
	Wed, 26 Mar 2025 13:27:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 644DCE4
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 13:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 565F960B19
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 13:27:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 404QoaZVfBN7 for <buildroot@buildroot.org>;
 Wed, 26 Mar 2025 13:27:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A945060B16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A945060B16
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A945060B16
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 13:27:16 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cf680d351so5240485e9.0
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 06:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742995635; x=1743600435;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4ymr1Kh9Rk+eUmiSLos1v+sg8GwFeDXyVCiXyZhd1XM=;
 b=njlxTvMBDRzb7GvqF644il97+VjQYCZe6RpQ7VW5HbFTiQ7WTIf+L3bakmJOClmb04
 RYqLEYBcr8IN2ITTWaGz324y3SicKW6llNIHid3vitai4tUDLxeBR8rdELZISDEbAx7D
 QP6XKRk4wA98jpcZJHccxma8MLKb201rOG1PCifpOwwOTDfhAnTUoFmqix3aN++40N1k
 z3PMZrJRhL4ZcPZs3yJtB/QbqEFp/Ze2N9qrzSCp1hBoeTWXRKf5gzxBgIkJZAMJCTp4
 dRlaW1RuXivH2e9rUdOx8bxTPX03LsXKxNFLIVUQO+F3l+tbq/OiXDXVUFqyZ+01AABg
 pK2g==
X-Gm-Message-State: AOJu0YyRzbSt7Z+UI2EVV3WqJvXqLoNNdx8LcTN1oFFJWD0ABpfihCer
 sZ6lafsH7er1nnlhopHPVZ7hFWmAudVz/1Mdh4oLsPKVSOCpPCOsLMPBHoc7lbQ=
X-Gm-Gg: ASbGncu9GvMnPMN7FCqfAvBeY61As0hqrurVSpeaV8o4FXErxQ/amYHfXbvKCAFfI2G
 FVmUnHmuURCWXZ6E++TJnNbn7Czj2SdwsCGvEL/kOK5YoQCYFrHm+5j6JKGTuQqlr3YHmwrEx4A
 fEZcd5LyZLibm/YtT8et0jXIIHnDloKjE3UvOw5JnDIxZ+RVTfC/xCQwFsVn6QKzo2zI3BoitIC
 oPyNqf+5LRDtnkHKefN6NCoSDhey8bh6crO/vcUZLg/aAwaMB532Hcx6120K2QSxi9l0W7C8hLj
 V3j1Dsa7q2Aki40atseyT793yqS9I5H7KS3D7kuGLelhhigDY4iwrYoilgcpMZ5WoXa/yQvby2d
 PphzMXetR
X-Google-Smtp-Source: AGHT+IFOb+YfXSKm2dYkUYJN78y2Izco2aBi+0+hPqGbpdYWSF5WOiYR5W6D33XVdHQFQE6USsc4dw==
X-Received: by 2002:a05:600c:1d01:b0:439:8878:5029 with SMTP id
 5b1f17b1804b1-43d77547ecbmr35874075e9.2.1742995634394; 
 Wed, 26 Mar 2025 06:27:14 -0700 (PDT)
Received: from freepad.iliad.local (free-reseau.vlq16.iliad.fr. [213.36.7.12])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82e83482sm2175715e9.14.2025.03.26.06.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Mar 2025 06:27:08 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vincent Jardin <vjardin@free.fr>, Robin Jarry <robin@jarry.cc>,
 Julien Olivain <ju.o@free.fr>, Maxime Leroy <maxime@leroys.fr>
Date: Wed, 26 Mar 2025 14:26:54 +0100
Message-ID: <20250326132655.35729-2-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326132655.35729-1-maxime@leroys.fr>
References: <20250326111651.23707-1-maxime@leroys.fr>
 <20250326132655.35729-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742995635; x=1743600435; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ymr1Kh9Rk+eUmiSLos1v+sg8GwFeDXyVCiXyZhd1XM=;
 b=QWKipQIGnOjonZM1/xd46qT0bVtxr5JeISD74KO0kww6FzOLyEOF9nJic4bpQdAhAH
 qFSye1n5IfBwZ/J2ToNtQQgxiecqj5HILriLcRf9pQsM99QJYe8UYo4srGIcbSfW4amF
 OeXV79IB5QqfIoJeN2TNNDeai6LeOzy/dyCK/0D8fDgvntdeFxLtssGpLGYPC0VzF7eJ
 liQjIUUP2iHaUSwgH1ah8Xw9ecWCzCAfLd16FzrTOQqPrdiamKT39WQtb8ydNEvfcTym
 UVfLboVaGaM45nVKiI3n+1HnAyqpXSliW0NvN04DUOgDMCrCu5mAog9fkox5n97iW+jt
 LuUA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QWKipQIG
Subject: [Buildroot] [PATCH v2 1/2] package/libecoli: bump version to 0.5.0
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

This new version is required to compile grout v8.4.0.

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 package/libecoli/libecoli.hash | 2 +-
 package/libecoli/libecoli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libecoli/libecoli.hash b/package/libecoli/libecoli.hash
index 433550f91b..f973b6f254 100644
--- a/package/libecoli/libecoli.hash
+++ b/package/libecoli/libecoli.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e66a85a35bae644b0baf9a4e6d084ff926ebaa12023f9df9f34e8f7a46834da8  libecoli-0.3.0.tar.gz
+sha256  bc9ca742f32dc7787146de4cbc3997b28356adaf219049304bbc3368d25b7395  libecoli-0.5.0.tar.gz
 sha256  e58bf9ec962bee9b3e37abcaa0bc0ec940b05efdc1d1a5a4d9e2fdbcc08b7bdd  LICENSE
diff --git a/package/libecoli/libecoli.mk b/package/libecoli/libecoli.mk
index f260467d1f..f989e7b9cd 100644
--- a/package/libecoli/libecoli.mk
+++ b/package/libecoli/libecoli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBECOLI_VERSION = 0.3.0
+LIBECOLI_VERSION = 0.5.0
 LIBECOLI_SITE = $(call github,rjarry,libecoli,v$(LIBECOLI_VERSION))
 LIBECOLI_INSTALL_STAGING = YES
 LIBECOLI_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
