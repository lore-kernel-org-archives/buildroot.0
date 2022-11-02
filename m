Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94983C433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 18:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2C8B416E2;
	Wed,  2 Nov 2022 18:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2C8B416E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lc9mA64-3tKQ; Wed,  2 Nov 2022 18:58:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9FFE416D4;
	Wed,  2 Nov 2022 18:57:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9FFE416D4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E1AEA1BF4DB
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 18:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C795B60A7B
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 18:57:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C795B60A7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3kW80b9YPYAb for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 18:57:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDBDA60E63
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BDBDA60E63
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 18:57:43 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id d123so11070145iof.7
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 11:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zK7a+P9xeEuQ+V5HPEyX1uoQb3C72/9BqGFPXaoN7Dg=;
 b=dNPOPSTy5tstbgJZpSOWgN/wK0SKL6BbqeO7nGRz4xfJH/QeNmQhkCDK+8HZSAvjyg
 ToOLmd1CINUsGgQM5+jt6uYDsBAd+HkN9AvGPew0f9carLdKasA3KgwTiFn+KAkaSRbe
 jRU3MbNICYmQ3NyGJw2u0imauyC5jEWR2EPzQ+4KtbBbO8Zimr2qpDE81XU727aA7zmq
 UkqGaCEwsouJpjkgKdpFlFWT7b76WoZgfgWr880Zuysd9FpqbzyBvLGLUMRHE1Q26Dzn
 B3aFjQFqdbIGHayMCUHoy+uhMUPEHL57JlzwVACcMNXagANdeCWR5SNwSGkCDCyFQhL0
 cJlA==
X-Gm-Message-State: ACrzQf1oKL4E5nHdgwRdZBjyBpgrlKPTFHn4j1p1zRkkWyMGjEFglNSA
 We2bn55YIPUgsfyptYRAgkyjDoKOmSdK1w==
X-Google-Smtp-Source: AMsMyM67YBw3QVEqOOqIb9FTTANEGScI0K1Q0Yq95l8DQbGa0Y7hdkZjTfz3MjTvjdlHZoLhw3VHog==
X-Received: by 2002:a6b:2ad5:0:b0:6c5:da79:4caf with SMTP id
 q204-20020a6b2ad5000000b006c5da794cafmr17020043ioq.158.1667415462497; 
 Wed, 02 Nov 2022 11:57:42 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 q30-20020a056638345e00b00349deda465asm5067753jav.39.2022.11.02.11.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 11:57:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 12:57:39 -0600
Message-Id: <20221102185739.2346971-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102185739.2346971-1-james.hilliard1@gmail.com>
References: <20221102185739.2346971-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zK7a+P9xeEuQ+V5HPEyX1uoQb3C72/9BqGFPXaoN7Dg=;
 b=LyJNY7On3FTNJaz6fnf1awwbHmiSCpLvDpAhqr60xfIjn3hT8eh4Yf0U3NIDOiAIDJ
 mmrNGfvJqszD61VVMA/zY0vAnEW+Jv6s83JUHJylQ0A9RTfvpMm/AmJyQJwn9YPzM8Pt
 S2pO86hjjzvIsihdNPBuxhXSQAzrTGaFKYUEe6VnvnsS4DI+dsai/zZnhKF7RPKbsFK6
 df1dbE2d07Dg85bb/sZEcd/fANNd6T04znO6ByebpL2Oc8Q0FufvHNBAR9tQUGaUHHpC
 tCqvCNwW4QC4zzsQLXgTDGYsHmbdrMra/zygmA2MnM3mfuw3MKz7YNwRakXHvdRZs/o3
 7rxA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LyJNY7On
Subject: [Buildroot] [PATCH 2/2] package/python-bleak: bump to version 0.19.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace python-dbus-next dependency with python-dbus-fast.

Add new async-timeout dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bleak/Config.in         | 3 ++-
 package/python-bleak/python-bleak.hash | 4 ++--
 package/python-bleak/python-bleak.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-bleak/Config.in b/package/python-bleak/Config.in
index 085c16fae8..691450f86b 100644
--- a/package/python-bleak/Config.in
+++ b/package/python-bleak/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_BLEAK
 	bool "python-bleak"
-	select BR2_PACKAGE_PYTHON_DBUS_NEXT # runtime
+	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
+	select BR2_PACKAGE_PYTHON_DBUS_FAST # runtime
 	help
 	  Bluetooth Low Energy platform Agnostic Klient.
 
diff --git a/package/python-bleak/python-bleak.hash b/package/python-bleak/python-bleak.hash
index 5acac877c9..9a8310b11c 100644
--- a/package/python-bleak/python-bleak.hash
+++ b/package/python-bleak/python-bleak.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bleak/json
-md5  0c26b270358a782767012220fc595aa5  bleak-0.12.1.tar.gz
-sha256  4a80a24cc944e52e856054639f298229c39a2fc720e5f7adbeebb117d10849ed  bleak-0.12.1.tar.gz
+md5  57564087d6e17ad1853109f530279b27  bleak-0.19.1.tar.gz
+sha256  dff7c7f281dcb6629d0d722209c79ec3aa2a6c33867cb5c1ea3d44b72ca155c0  bleak-0.19.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c4029a2b63b3824ab68be841f414addbdde20cb79cdbe272fa80c0b2abe65374  LICENSE
diff --git a/package/python-bleak/python-bleak.mk b/package/python-bleak/python-bleak.mk
index 3ae6d90311..00a4946ef6 100644
--- a/package/python-bleak/python-bleak.mk
+++ b/package/python-bleak/python-bleak.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BLEAK_VERSION = 0.12.1
+PYTHON_BLEAK_VERSION = 0.19.1
 PYTHON_BLEAK_SOURCE = bleak-$(PYTHON_BLEAK_VERSION).tar.gz
-PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/67/4b/ba00c69a24a8d08c86f02caa45727a2ad2844c7bee9630ccb063be226f71
+PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/30/b9/60e1f455365e2340fe076cf7683f4e6d03db0b759d4f93fa45e68dc371e5
 PYTHON_BLEAK_SETUP_TYPE = setuptools
 PYTHON_BLEAK_LICENSE = MIT
 PYTHON_BLEAK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
