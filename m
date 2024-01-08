Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA3CC3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 22:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AF424192C;
	Mon,  8 Jan 2024 22:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AF424192C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ieMya0RGxpYD; Mon,  8 Jan 2024 22:30:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02C8B41B61;
	Mon,  8 Jan 2024 22:30:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02C8B41B61
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6BA031BF421
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 22:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43062419C2
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 22:30:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43062419C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TjikhTb_Lmsu for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 22:30:04 +0000 (UTC)
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E90224031D
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 22:30:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E90224031D
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-3bbbdf0b859so2806157b6e.3
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 14:30:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704753003; x=1705357803;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wSYypNUlHKUqyNqpAs3fFGSKUrOKVJUza16ib6d/0B4=;
 b=iA0E93gU4kMl0XOu+N5yzLGeQOh9aVLFDtvmWvinrxkJJZzZNSBrU74f41Bu3syU6d
 Y1P/VIx1Q8ftv5MViOhfLMNacqWwR1AoNi0I1eTrb5x8ryx4y8dUcyK/BPEz9T2hVsO+
 TP4z56iU0WrqhWVKiJV1nLKJsaq31Uut+tDwlKD5UpznixMKgHI/kJBVCeZdMTY6oUoz
 KDuRgKYVylmxbFF/zDh04s8QXdClHA1IWHOxSpwPTWiaQsKPglveQedZxsOSAySllY+5
 4wZbqx+IcaLwp8eFERlT44qwLR8Slevp1wE+5Wdr/jpDGuAsSTSG8iiPM0/5cdkiiBYq
 NgGA==
X-Gm-Message-State: AOJu0YwTW9J5ONovGVXKpA40X/OadMC+R+OOCqtf/jVoiJTvGsSuXxAn
 DrDM4zPfHeVM/9y3sw54DDBLY8u0PunWJw==
X-Google-Smtp-Source: AGHT+IE3Og3ps+XF+3BxWR6qTX5g2WY1O3xnZQt9qAIgiXFeCKZyE2zu5BANDnBhfeox8yY7QAaJDQ==
X-Received: by 2002:a05:6808:11ce:b0:3bd:346f:1d86 with SMTP id
 p14-20020a05680811ce00b003bd346f1d86mr1578440oiv.20.1704753002609; 
 Mon, 08 Jan 2024 14:30:02 -0800 (PST)
Received: from pox13.. (office.relectrify.team. [159.196.192.155])
 by smtp.gmail.com with ESMTPSA id
 ff10-20020a056a002f4a00b006d96d034befsm362363pfb.30.2024.01.08.14.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 14:30:02 -0800 (PST)
From: patrick.oppenlander@gmail.com
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 09:25:51 +1100
Message-ID: <20240108222957.3567-1-patrick.oppenlander@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704753003; x=1705357803; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wSYypNUlHKUqyNqpAs3fFGSKUrOKVJUza16ib6d/0B4=;
 b=DbK94XBD4JaFDDXe2NHazLFIGNoa26L6Sqmpo8VBytf/AovD05WlcjzEptHaqcwxJc
 OD/T+euyHCzxj4jhNy3lLMYlK95Vfa1Xx9J1UBwn77oA2FOaaxmwKVhpOPHqKIG0EDPN
 m1+A11Vt2r+e82Qw/kirFTUPhylmBucqMi4vBL07RlHxYvaqiT/Ub4VpjiYdT7pbipe/
 YRLUmZN+piysrcSg9VAldelasF7szOXZSARGDNfMqEQx2Ul7KqQgJgFJrh7iuJzX2Fc2
 w7aFn4Cv63IRXKGN++WH+CIziSW+7JBuUpAyi0M6VCj2HuKCYk4Bt7lVGnfegS7al5wj
 a6pQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DbK94XBD
Subject: [Buildroot] [PATCH v2] package/minisign: new package
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
Cc: Patrick Oppenlander <patrick.oppenlander@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Patrick Oppenlander <patrick.oppenlander@gmail.com>

Signed-off-by: Patrick Oppenlander <patrick.oppenlander@gmail.com>
---

Changes from v1 (reviewed by Baruch Siach):
* host-libsodium dependency was incorrectly on to the target dependencies list.

 package/Config.in               |  1 +
 package/Config.in.host          |  1 +
 package/minisign/Config.in      |  8 ++++++++
 package/minisign/Config.in.host |  6 ++++++
 package/minisign/minisign.hash  |  3 +++
 package/minisign/minisign.mk    | 19 +++++++++++++++++++
 6 files changed, 38 insertions(+)
 create mode 100644 package/minisign/Config.in
 create mode 100644 package/minisign/Config.in.host
 create mode 100644 package/minisign/minisign.hash
 create mode 100644 package/minisign/minisign.mk

diff --git a/package/Config.in b/package/Config.in
index 5a3410d758..1b7a667ea1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1538,6 +1538,7 @@ menu "Crypto"
 	source "package/ustream-ssl/Config.in"
 	source "package/wolfssl/Config.in"
 	source "package/wolftpm/Config.in"
+	source "package/minisign/Config.in"
 endmenu
 
 menu "Database"
diff --git a/package/Config.in.host b/package/Config.in.host
index c80842c33a..f03ca16b7b 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -64,6 +64,7 @@ menu "Host utilities"
 	source "package/meson-tools/Config.in.host"
 	source "package/mfgtools/Config.in.host"
 	source "package/microchip-hss-payload-generator/Config.in.host"
+	source "package/minisign/Config.in.host"
 	source "package/mkpasswd/Config.in.host"
 	source "package/moby-buildkit/Config.in.host"
 	source "package/mosquitto/Config.in.host"
diff --git a/package/minisign/Config.in b/package/minisign/Config.in
new file mode 100644
index 0000000000..cfba5586b1
--- /dev/null
+++ b/package/minisign/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_MINISIGN
+	bool "minisign"
+	select BR2_PACKAGE_LIBSODIUM
+	select BR2_PACKAGE_LIBSODIUM_FULL
+	help
+          Minisign is a dead simple tool to sign files and verify signatures.
+
+          https://github.com/jedisct1/minisign
diff --git a/package/minisign/Config.in.host b/package/minisign/Config.in.host
new file mode 100644
index 0000000000..8ed57cdbfc
--- /dev/null
+++ b/package/minisign/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_MINISIGN
+	bool "host minisign"
+	help
+          Minisign is a dead simple tool to sign files and verify signatures.
+
+          https://github.com/jedisct1/minisign
diff --git a/package/minisign/minisign.hash b/package/minisign/minisign.hash
new file mode 100644
index 0000000000..12cde42a43
--- /dev/null
+++ b/package/minisign/minisign.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  74c2c78a1cd51a43a6c98f46a4eabefbc8668074ca9aa14115544276b663fc55  minisign-0.11.tar.gz
+sha256  d775d155cbf31638714c31c6f990f9fdc5f07998d91e42d1bf15483bd2d1706b  LICENSE
diff --git a/package/minisign/minisign.mk b/package/minisign/minisign.mk
new file mode 100644
index 0000000000..34b3f4046e
--- /dev/null
+++ b/package/minisign/minisign.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# minisign
+#
+################################################################################
+
+MINISIGN_VERSION = 0.11
+MINISIGN_SITE = $(call github,jedisct1,minisign,$(MINISIGN_VERSION))
+MINISIGN_LICENSE = ISC
+MINISIGN_LICENSE_FILES = LICENSE
+MINISIGN_DEPENDENCIES = libsodium
+HOST_MINISIGN_DEPENDENCIES = host-libsodium
+
+ifeq ($(BR2_STATIC_LIBS),y)
+MINISIGN_CONF_OPTS += -DBUILD_STATIC_EXECUTABLES=1
+endif
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
