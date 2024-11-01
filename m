Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F13FE6F084
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 19:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0ACB81206;
	Fri,  1 Nov 2024 19:53:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vl1RnG2WkMou; Fri,  1 Nov 2024 19:53:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD58781207
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD58781207;
	Fri,  1 Nov 2024 19:53:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F207E112A
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 19:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D35454062B
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 19:53:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O5MP3qGOwuM7 for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 19:53:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A3B6640626
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3B6640626
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A3B6640626
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 19:53:23 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3a3b0247d67so8226225ab.3
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 12:53:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730490802; x=1731095602;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rJXJRdZy2vY+reS6FqrYZ02NRDZjVwxnbMaF+at36G8=;
 b=SdqPiaddYEmMqnlQoKE5ZGOyoWXHYV+4Yxo8AGywKaOZjp4NTcRwEjyDhuLvGlK1O8
 /kJ2XaRw3jegR1puJbQ/uAD5As9xKVOw3QttkaQ3ThnMoA58HbPL+UrrQhNjbQSbxSHD
 sET07SKHB3VTFjbSSANh+GnJZlRISZISqsCHCZoF47J7Z7+OE3d4/wlvUsqy6oBgq74r
 hg4UnYPFvZQvXZPNL3up2hv/vSfSHxPPf20AWb2VwMWING3eqaKF4KDGim40quUqaEo7
 C/GfRrpmr396mctQenGBWHtJuLsKAbbXZRxxgvr+heE/bcmWlTLymxpf7OwYf1v8Vy4/
 FBKw==
X-Gm-Message-State: AOJu0YzmXtUvZvjhyu6JT7xKWevaDMyTQ6SHMlDzCdIRd2z1hSnAjeKh
 7JKBqB5X65sWvaMAQv6m9zwpI8tLEEvib71fej5abNBXsBUgnFOg9psomA==
X-Google-Smtp-Source: AGHT+IE+912msmY37ZWPBTNSNHodFhaUN1uyKxV11TOQMP9Qnqk7UTi0EvFUMGmtRN2cX7py7vMjXw==
X-Received: by 2002:a05:6e02:20ea:b0:3a6:ac98:2c76 with SMTP id
 e9e14a558f8ab-3a6b0384ceamr56415655ab.23.1730490802260; 
 Fri, 01 Nov 2024 12:53:22 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6aae9fd73sm9057115ab.22.2024.11.01.12.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 12:53:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 13:53:20 -0600
Message-Id: <20241101195320.1282157-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730490802; x=1731095602; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rJXJRdZy2vY+reS6FqrYZ02NRDZjVwxnbMaF+at36G8=;
 b=OVXy4nFEKyJGkElIUTRtINKRgoduJofAOlox3BC8EgrdhL/rNZNx72tt0LmjSd+2Ft
 ni+Rc7rMS5dDsby7sQcn0Y3BDnAi/Fhw8EqSKT/EuLDS2lhPQgrOOJaohNZ/NPG/50an
 YcTOkQe7uEcX0ctJ3Ke1SFDG+Q/D9owmn6pAoiTo8mVSQQZYAHi218vjidXLXkIq82iT
 1ov2Dt7114RjkknArIPthfaAZ4RAyJp/XfEG6OUkafz5oMTWzs5LNcK+y33lVPJg9RJl
 dYP3lRrC0DGl4fz4Ewxy0miaSXHlSv7J8ZP/rGqLNp8tdcTO2fT8ZN0k0PPMsjU5OYx4
 6g0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OVXy4nFE
Subject: [Buildroot] [PATCH 1/1] package/python-sdbus: bump to version 0.13.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add -fPIC to cflags which is now required to build python-sdbus.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sdbus/python-sdbus.hash | 4 ++--
 package/python-sdbus/python-sdbus.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-sdbus/python-sdbus.hash b/package/python-sdbus/python-sdbus.hash
index 13c8c2bb5f..62a4587628 100644
--- a/package/python-sdbus/python-sdbus.hash
+++ b/package/python-sdbus/python-sdbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sdbus/json
-md5  46d3ea00a491c2eec2a25ccf61b8a77a  sdbus-0.12.0.tar.gz
-sha256  c3692d75704438a78adc1439350bc32f30d6b38ad344cfc94773db89c6ce4a89  sdbus-0.12.0.tar.gz
+md5  ea63ebfd0499940dc32878b0ffb9601c  sdbus-0.13.0.tar.gz
+sha256  801bd46608ee82614d42960c8ba8ae9300edb1bf5bbeb534bc8fd21f13d2c20e  sdbus-0.13.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/python-sdbus/python-sdbus.mk b/package/python-sdbus/python-sdbus.mk
index 0b3ea37b30..111c4bd648 100644
--- a/package/python-sdbus/python-sdbus.mk
+++ b/package/python-sdbus/python-sdbus.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-PYTHON_SDBUS_VERSION = 0.12.0
+PYTHON_SDBUS_VERSION = 0.13.0
 PYTHON_SDBUS_SOURCE = sdbus-$(PYTHON_SDBUS_VERSION).tar.gz
-PYTHON_SDBUS_SITE = https://files.pythonhosted.org/packages/8e/39/3d49f0d18dcba3344af756f31e4408e7de50b3df86fa3f3ea6f604402f16
+PYTHON_SDBUS_SITE = https://files.pythonhosted.org/packages/4f/c7/8740ff78e9ffdbb9a28e7722e145795015c62ea7ce812242f5968073511c
 PYTHON_SDBUS_SETUP_TYPE = setuptools
 PYTHON_SDBUS_LICENSE = LGPL-2.1+
 PYTHON_SDBUS_LICENSE_FILES = COPYING
 PYTHON_SDBUS_DEPENDENCIES = systemd
+PYTHON_SDBUS_ENV = CFLAGS="$(TARGET_CFLAGS) -fPIC"
 
 ifeq ($(BR2_STATIC_LIBS),y)
 PYTHON_SDBUS_ENV += PYTHON_SDBUS_USE_STATIC_LINK=1
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
