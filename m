Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB9CE77188
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 07:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A60560F8B;
	Tue, 14 Jan 2025 07:30:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JmVtr-zs4kMS; Tue, 14 Jan 2025 07:30:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F74160E72
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F74160E72;
	Tue, 14 Jan 2025 07:30:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2ABFEB8B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 07:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C55A81DCB
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 07:30:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NYJP8FH83-Wf for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 07:30:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 76B0981DF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76B0981DF5
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 76B0981DF5
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 07:30:54 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ab2bb0822a4so1052978566b.3
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 23:30:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736839852; x=1737444652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sdrU0DZrvfPE3j8EkbbkEdn4RvbyJInNHT3JHG9JO0M=;
 b=hHq0n7jG6Dz5hTEkeW5sEkYwli/MHzxzF/k9Ys15UQmTNS9EHkET3racpmURNb6EKw
 6iXFYGWt8Afm4foncFHGkAH0QnZInyB4+i5e221zH1zlA2BIN2LIOijtxmSjj1zt6Juw
 NmGs58TvFb5gcgii01EqUlkoYqMa1dl5Ok7gTLERX2u9MBRYQBi5VHfKJkGZE40ExEqw
 2WTu4N5vvIWRZaV+Xj4cTN0GlaW1A3sDGRW09DKfaNHfRD2PZpBf/FdhMDNoRlaAMMMF
 xCjTZCjitV++Om7Pa72X2TFP4PMyHQscLkc98aCGpkI3mMYPOi7mInUOKY9VRQgqmxnw
 7gFg==
X-Gm-Message-State: AOJu0YxVioguuo/rJ37RbZOGyLgk2Mx6RuUkkVyhsnjBWv9596/R60rI
 SIpS92cEIkCn+wW6bBTIvlCYLGq3CW5Ux9YnKHVd6Epf9yhf2NDZ+hIpFg==
X-Gm-Gg: ASbGncuIugvi5vhu80M4AmHj40ncylk4uY+gY1P0dBrwzCoQJmyOTYbP8oy/ikg0JtQ
 wxvVpiWJjBZ1ce9IUkZ7v8mThIetShKpLf2xhAShtVDqu9Iaa1GIHybsqbkpCFgEHtmp5+nrPqw
 GYkk0J61r3Hu4PfVSFA4H7Xy8h67u2+uuwkH6klPLwAcyfKA2ZVqfcHI3ODEJ+tuUSW8bsr44vA
 YjD9LPu6h9gjOvB7Z7BDXRfVhGoM/FmRvG+cviR+vdhyA/ue3PFTBSMdb5/CpDGz07W89f8GA==
X-Google-Smtp-Source: AGHT+IEXG83XtroLX5cy5g66QOlRkxmRV+x/Ue6alRR1Tu5tAIJg7114ICpdZJnSgqkVVAYwF2YXkA==
X-Received: by 2002:a17:907:72d6:b0:aa6:88c6:9449 with SMTP id
 a640c23a62f3a-ab2ab56abc5mr2392978366b.19.1736839851933; 
 Mon, 13 Jan 2025 23:30:51 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d99046d822sm5618777a12.56.2025.01.13.23.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 23:30:51 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jan 2025 08:29:58 +0100
Message-Id: <20250114072947.284965-10-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250114072947.284965-1-heiko.thiery@gmail.com>
References: <20250114072947.284965-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736839852; x=1737444652; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sdrU0DZrvfPE3j8EkbbkEdn4RvbyJInNHT3JHG9JO0M=;
 b=EyhREXFtpFUEGnRnqFG0ZYjoGTkRhf+0+OQyVhGuffxuhkbZUe/JzfhVoxqbVPfver
 GeQach6RN8vNKT9LDDkS9MYRDbmAlI6TyIEtSxTSis5/90HFd3gBeyaBaGX5omikysAO
 77cIGywy+XZNy3Onkdt7NhqKV/jlAnz59fdb4v1P4Mgc8SbAEoGo8cQWt4i9svxx9NwW
 +cvJra6HI9hiqej20PqVo3Tn7oL2cvj1X+ZUtjq4zTZBBw4uhKJV5+1szG7O/yB/nVEM
 Rw55gMuQj9/jnraJ0fBxzr5S42VYN9nCFqLoT057PfjgoNsfAvyp08i4ULDVS9n0Srjd
 VulQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EyhREXFt
Subject: [Buildroot] [PATCH v5 9/9] package/netopeer2: build host variant
 only when doing sysrepo setup
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

The host-sysrepo and correspoinding dependencies are only required when
installing sysrepo modules to sysrepo database during build process.

The build time installation can be selected with
BR2_PACKAGE_NETOPEER2_SYSREPO_SETUP and in case this is selected the host
variants are build.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/netopeer2/netopeer2.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
index 6163c169cd..6accb8743c 100644
--- a/package/netopeer2/netopeer2.mk
+++ b/package/netopeer2/netopeer2.mk
@@ -9,7 +9,7 @@ NETOPEER2_SITE = $(call github,CESNET,Netopeer2,v$(NETOPEER2_VERSION))
 NETOPEER2_DL_SUBDIR = netopeer2
 NETOPEER2_LICENSE = BSD-3-Clause
 NETOPEER2_LICENSE_FILES = LICENSE
-NETOPEER2_DEPENDENCIES = libnetconf2 libyang sysrepo host-sysrepo
+NETOPEER2_DEPENDENCIES = libnetconf2 libyang sysrepo
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
 NETOPEER2_DEPENDENCIES += systemd
@@ -20,6 +20,11 @@ NETOPEER2_CONF_OPTS = \
 	-DSYSREPO_SETUP=$(if $(BR2_PACKAGE_NETOPEER2_SYSREPO_SETUP),ON,OFF) \
 	-DENABLE_TESTS=OFF
 
+# host-sysrepo is required for installing yang modules during build
+ifeq ($(BR2_PACKAGE_NETOPEER2_SYSREPO_SETUP),y)
+NETOPEER2_DEPENDENCIES += host-sysrepo
+endif
+
 NETOPEER2_SSH_AUTHORIZED_KEYS_FORMAT = $(call qstrip,$(BR2_PACKAGE_NETOPEER2_SSH_AUTHORIZED_KEYS_FORMAT))
 ifneq ($(NETOPEER2_SSH_AUTHORIZED_KEYS_FORMAT),)
 NETOPEER2_CONF_OPTS += \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
