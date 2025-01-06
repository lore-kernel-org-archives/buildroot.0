Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A580E77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 13:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0C9E606C6;
	Mon,  6 Jan 2025 13:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 02rcNUVr7GmS; Mon,  6 Jan 2025 13:43:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 084BD6075D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 084BD6075D;
	Mon,  6 Jan 2025 13:43:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 409446B
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EC81403C7
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:42:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pcFAC09CZo6p for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 13:42:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D4C1B400B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4C1B400B9
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4C1B400B9
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:42:51 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aa684b6d9c7so2391519166b.2
 for <buildroot@buildroot.org>; Mon, 06 Jan 2025 05:42:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736170969; x=1736775769;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0e9EOCjsFxwDCfyoVTdgMK9843uTyb6eKhE8NUQCQ+g=;
 b=QQylN3dbftFA39CIqPb939mUd/Tl8sCB5pSRyuWLDu2whfU7F1Sf/1EosErKL4Miaa
 CZmoVzMX5V0tpPma+iOW52zoMlNqX4vclZ4KjNd+7J31Hf5PVQ/eanypPziZBkHPSphC
 Jf/UPTLgJFbfZPg6vcqPva+LWGnW5167ixmgEsnsCvD1R9KdSN1oTBlaBO3mTOegTk7P
 DNvz4tka3UdEf6SM7az6njWmCH1WOAMgbSegfHje/7yUV44RfbIdXMYSfGtZPUMbUOnz
 ZcK657dAODL3TFYH5RVaXc0mE91urRftN33z+AOxd168DtlbDwIdzgnDbBl5tmNGs/N0
 Tr2w==
X-Gm-Message-State: AOJu0YyT3iqprczgoPuHxmTbhAOz2teBEyFI1LZRnsN8v1ZnM6EVRu7E
 0WAwU/sWtVBcftxuwUfQfpTltacH7SbuDlJwGESOyu5EYY7esYA+6b5szA==
X-Gm-Gg: ASbGncvAEWW8wNMDnEBXVOKtWNfHFuxWMTOwFihv7rpp/R7O5WJp67YFQuUK4wl4eae
 v5o9N/Rq3KSxYjB4IapyL70eBqYTmqI/y1Dq3dJtPvTQ6ZD08fNP8zjIvzlL0JztJ3tAjO6RiT7
 /Gs02aW89ulmiAoeUuDxt0N8DIB/osn3bAItzEwo5yRIXYhQCf5vgAzDOFooWV0Dw904apOfLH6
 XN2NylcNIQoKuArjG8wT+G4Vhq/pdUzQyZNeRPNMk0BR7DraQrQVh01HDuCT19tSyfQLZb50A==
X-Google-Smtp-Source: AGHT+IEZ0VPpieTEH2a87TqBS1Js73SiR5S3cf9x+24Db5RHSpzwFjRynSZ/EKFuKTn+zP34dr1nVw==
X-Received: by 2002:a17:907:7da5:b0:aa6:8781:9909 with SMTP id
 a640c23a62f3a-aac2d32837amr5615601866b.29.1736170968865; 
 Mon, 06 Jan 2025 05:42:48 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0eae74e4sm2243847766b.91.2025.01.06.05.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 05:42:48 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  6 Jan 2025 14:42:18 +0100
Message-Id: <20250106134219.1914954-7-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250106134219.1914954-1-heiko.thiery@gmail.com>
References: <20250106134219.1914954-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736170969; x=1736775769; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0e9EOCjsFxwDCfyoVTdgMK9843uTyb6eKhE8NUQCQ+g=;
 b=d+zCctTaqDFMnI6nbEYyhpSo2YbO7QQefrz62t8rqOCcY/2rqgwbvGllSwHNDEFw4h
 6yZP/jpRujD1GnGZpu2sHvSnU58YkFTqWyetSw8SASBYplsCbqZAIjMCoSnvAxEy51kE
 wZSap8A4vysn9elgXzALcAk2gQVCHgTi8Bc0sSF2F0Pr23bgJA5SeASW9v+DPQGRszfa
 B9dwyLlOvOxdmHNGJroUCX7yOzfrpjPZVuy7FXxzwrEbC5xE5AiQ4mG8dXaBBUliBhxb
 CLOZv4gfKz6nQBv1QZhF6OTQ6N/zQAlUjBGCvFj/ZuDAvLar0688nOZTuQETMdEib8/F
 zwDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=d+zCctTa
Subject: [Buildroot] [PATCH v4 6/9] package/netopeer2: fix shellcheck
 warnings
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

The init script S52netopeer2 has to be renamed to S52netopeer2-server to
match the daemon name. The step to install the init script now uses the
NETOPEER2_PKGDIR variable to reference the directory instead of
explicitly using the "package/netopeer2/" path.

The init script now is removed from the .checkpackageignore file.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
v4:
    - new commit that only contains sysv init shellcheck warning fixes

 .checkpackageignore                                     | 1 -
 package/netopeer2/{S52netopeer2 => S52netopeer2-server} | 2 +-
 package/netopeer2/netopeer2.mk                          | 4 ++--
 3 files changed, 3 insertions(+), 4 deletions(-)
 rename package/netopeer2/{S52netopeer2 => S52netopeer2-server} (92%)

diff --git a/.checkpackageignore b/.checkpackageignore
index 6b6fa4689d..d2e012d70f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -896,7 +896,6 @@ package/neard/S53neard Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/neardal/0001-lib-neardal.h-fix-build-with-gcc-10.patch lib_patch.Upstream
 package/netatalk/S50netatalk lib_sysv.EmptyLastLine lib_sysv.Indent lib_sysv.Variables
 package/netcat/0001-signed-bit-counting.patch lib_patch.Sob lib_patch.Upstream
-package/netopeer2/S52netopeer2 Shellcheck lib_sysv.Variables
 package/netperf/0001-src-nettest_omni.c-fix-compilation-with-GCC10.patch lib_patch.Upstream
 package/netplug/0001-makefile-flags.patch lib_patch.Sob lib_patch.Upstream
 package/netplug/0002-add-missing-time-include.patch lib_patch.Upstream
diff --git a/package/netopeer2/S52netopeer2 b/package/netopeer2/S52netopeer2-server
similarity index 92%
rename from package/netopeer2/S52netopeer2
rename to package/netopeer2/S52netopeer2-server
index cadd6b9feb..3fd993b578 100644
--- a/package/netopeer2/S52netopeer2
+++ b/package/netopeer2/S52netopeer2-server
@@ -7,7 +7,7 @@ NETOPEER2_SERVER_ARGS=""
 
 start() {
 	printf 'Starting %s: ' "$DAEMON"
-
+	# shellcheck disable=SC2086 # we need the word splitting
 	start-stop-daemon -S -q -p $PIDFILE -x "/usr/sbin/$DAEMON" \
 		-- $NETOPEER2_SERVER_ARGS
 	status=$?
diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
index 47fcd31acd..4853e5d176 100644
--- a/package/netopeer2/netopeer2.mk
+++ b/package/netopeer2/netopeer2.mk
@@ -29,8 +29,8 @@ NETOPEER2_MAKE_ENV = \
 	SYSREPO_SHM_PREFIX=$(NETOPEER2_SYSREPO_SHM_PREFIX)
 
 define NETOPEER2_INSTALL_INIT_SYSV
-	$(INSTALL) -m 755 -D package/netopeer2/S52netopeer2 \
-		$(TARGET_DIR)/etc/init.d/S52netopeer2
+	$(INSTALL) -m 755 -D $(NETOPEER2_PKGDIR)/S52netopeer2-server \
+		$(TARGET_DIR)/etc/init.d/S52netopeer2-server
 endef
 
 # The host sysrepo used to install the netopeer2 modules will leave
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
