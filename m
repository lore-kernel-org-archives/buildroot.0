Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74211E784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 23:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1712A814C8;
	Sun, 28 Dec 2025 23:44:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hqotMmoY9pvU; Sun, 28 Dec 2025 23:43:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEAD0814DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766965437;
	bh=amO09qswgbCNejoCU7ShdaJEubhTEQTM0SRNrS/HurI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Bw1eGrm9ubXlBLQajQMirWEvWSWlZlqXbEjkbNh35JswRGaFImF7nTbV+QaP9NReG
	 9DyaiX+mgHBmhxGW8QZVQSibvHjZdFZ+sY8Qt1Jjv4MwPHUI0NenDPS5LRwS11fkft
	 CaWABKq/Hn6q/AE6pti11irDkt1goxZRgbS2hgTSGDIEQ821KycSlGCHbASGkHrF2p
	 KS2fXyVdTvZbHrM9OKtdqUYI4cliCKlaG9/77efzGgpAsWub3VNEMSaXyqzDDTQRyw
	 yh+laJt/eBUMcGHNJUq9eOYUa2iWtSxNEuTcyEp5kcsCIEA8Vcb0hKgIJFQjBppRRJ
	 nOCjy+oH/LKag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEAD0814DD;
	Sun, 28 Dec 2025 23:43:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 20C761E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 23:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 137AA40754
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 23:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qP3GhaOGn1ZO for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 23:43:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0425A40755
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0425A40755
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0425A40755
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 23:43:54 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-7c6dbdaced8so7019302a34.1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 15:43:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766965434; x=1767570234;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=k1VwV/55af2BRRaUqwoSufsQNOjXFlBMMzBLMz2cElI=;
 b=NlSxTfrnTPIyqrIv2E+VGuYCxEQHpCqvp8hY7YHypPbXqZYg+hqA8CY0co2Im6Anms
 8hWPpwA22Mlh8CoZgjUAASBU6REBX7u2cz0ogcFEFn7/PhjzU93om1hCP6pjiCBnpKLB
 3O9/KCJS9qoeWS3a5GZm3jGS4YVm/p/NRojElkZ1r6EfojBBPxQ8dM6u/4sDy2SG54EY
 EMAuxdupP0eq1x58BR7vDWjcDUA3KrW8pgrbWMV6XTk99qkRMOjpQPkaL7FpoTBsfKzj
 APNSllb++zncsC6J5koIGn5zQxFjQeqfGKcj1gnIVjap+lTXtGzXCn1rQ9yX5cighbLg
 qThw==
X-Gm-Message-State: AOJu0YydNGIr8FP1zdnyn/XJwgg+0g1RIgE3wm2Is833zMZsFwsWk6X2
 xp2+e66hLOUbmRaul0Abu9h3hN0SsH5Gi+B+w4/0vK8sgkminUIuLx0nOgZVQp9GTpA=
X-Gm-Gg: AY/fxX7OVWpI/Bp4OLKOeHFgZnwkhXRjG8Nr1i7VbjBlbr1Nmj5iBIi0uqXQkCl/hgk
 MeJOhfRKhkNpXxajGTdpviTNkxRcsPzbYPmBYSeSKMBD5I+1W4oy4XAioZ6eUw9+8LCeTWIzwzv
 8J8tfQuYw2RoP6R9O75gujspRduXy5s+q5qol3EVWZdABKCL7r7uLGf3ki5KB18poZWZm3nk5sE
 p89ESGrl/DwahU5k9XsVB/4FSkzw7KdVFQnMQ2NnwJe65wYxpMZaltzf9esVExDyglxSAr7+qw2
 uxvQii1BJA3mqWCglzywE9VDMGam2O5gIXrgOeEN/oxTIdfJ7nMjaaLzlOkTLrJ8adiWj4VhTz2
 OPznTBB4I1JyVuacUyL/+5z3H8/+VQapKE0+Rcn+S+keO/d0YW8Z7dDjUTsNr2TNU9OHNVGGO3T
 jOWhG20lfqA+MFYEdDqdr+2qJAeYo0JwzG/Gal1F2V3xGhecOzn23aN1QSeI52gZVf5hAGmoMdW
 N+bmfD89TCyyOUjREJyu58tp3agVtHYFZVrgMnwnqjB/u/iQu7a/4U=
X-Google-Smtp-Source: AGHT+IFXPSXBxe7B8apjj4y/oNob3xXsSLQJpKCbQh/OzXwrSUpGp4u0jfDOMT4v1g8BZEYXCrZsSQ==
X-Received: by 2002:a05:6830:4425:b0:7c6:ce49:d8a9 with SMTP id
 46e09a7af769-7cc66a7f6b4mr17109018a34.23.1766965433730; 
 Sun, 28 Dec 2025 15:43:53 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc66645494sm19818454a34.0.2025.12.28.15.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 15:43:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 16:43:50 -0700
Message-ID: <20251228234350.2887246-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251228234350.2887246-1-james.hilliard1@gmail.com>
References: <20251228234350.2887246-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766965434; x=1767570234; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k1VwV/55af2BRRaUqwoSufsQNOjXFlBMMzBLMz2cElI=;
 b=edExo7ycl7/owZHHbGesoCF185xWAxMdlZ8D85PCBJ0Et/bvI+muH4/6nzKuFln4je
 OhXEIw+CK3HnxUJ8u+BE19VFEE3lVV9Z4K3oau25c2VPJbylhcoai6hBfcaTfy3Kge3Z
 Y9L81C9rjYx1dmDyLmPfvP72M13SuQFUwYG60fQ0v3dp3Gk+0RyNiVd2F1Vj1UrHNQFW
 chtHr1qOOp/iti40lzMLKK3aZwub7DdVPJG3sD7ioI4sL7ZZuV+gEICP1bKlnW9TVtUC
 73O2Wg/RrKtae+pn5rinJVAlx5M0yo2Zq4P1OOkBAjQzm8hRwon/i0kquevlRpjwzKU7
 zHJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=edExo7yc
Subject: [Buildroot] [PATCH 2/2] package/python-autobahn: bump to version
 25.12.2
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate from setuptools to hatch build backend.

License hash changed due to formatting changes:
https://github.com/crossbario/autobahn-python/commit/83d985db646fb045e0b26a9075baeec45633e281

Drop no longer supported AUTOBAHN_STRIP_XBR env variable.

Add host-python-setuptools build dependency.

Add new python-base58 encryption dependency.

Add new python-ecdsa encryption dependency.

Serialization dependencies moved to mandatory dependencies.

Propagate new C++ reverse dependency.

Add new python-brotli compression dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-autobahn/Config.in             | 32 +++++++------------
 package/python-autobahn/python-autobahn.hash  |  6 ++--
 package/python-autobahn/python-autobahn.mk    |  9 +++---
 package/python-channels-redis/Config.in       |  2 ++
 package/python-channels/Config.in             |  2 ++
 package/python-daphne/Config.in               |  2 ++
 .../Config.in                                 |  1 +
 .../Config.in                                 |  1 +
 package/python-magic-wormhole/Config.in       |  1 +
 9 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/package/python-autobahn/Config.in b/package/python-autobahn/Config.in
index 527416a3cd..ada62e1e3b 100644
--- a/package/python-autobahn/Config.in
+++ b/package/python-autobahn/Config.in
@@ -1,38 +1,42 @@
 config BR2_PACKAGE_PYTHON_AUTOBAHN
 	bool "python-autobahn"
+	depends on BR2_INSTALL_LIBSTDCPP # python-ujson
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	select BR2_PACKAGE_PYTHON_CBOR2 # runtime
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_HYPERLINK # runtime
+	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
 	select BR2_PACKAGE_PYTHON_TXAIO # runtime
+	select BR2_PACKAGE_PYTHON_UBJSON # runtime
+	select BR2_PACKAGE_PYTHON_UJSON # runtime
 	help
 	  WebSocket client and server library, WAMP real-time
 	  framework.
 
 	  https://pypi.python.org/pypi/autobahn
 
-if BR2_PACKAGE_PYTHON_AUTOBAHN
+comment "python-autobahn needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
 
-config BR2_PACKAGE_PYTHON_AUTOBAHN_ACCELERATE
-	bool "C-based WebSocket acceleration"
-	select BR2_PACKAGE_PYTHON_WSACCEL # runtime
+if BR2_PACKAGE_PYTHON_AUTOBAHN
 
 config BR2_PACKAGE_PYTHON_AUTOBAHN_COMPRESS
 	bool "Non-standard WebSocket compression support"
 	depends on BR2_INSTALL_LIBSTDCPP # python-snappy -> snappy
+	select BR2_PACKAGE_PYTHON_BROTLI # runtime
 	select BR2_PACKAGE_PYTHON_SNAPPY # runtime
 
-comment "Non-standard WebSocket compression needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
-
 config BR2_PACKAGE_PYTHON_AUTOBAHN_ENCRYPTION
 	bool "TLS and WAMP-cryptosign encryption/authentication support"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pyopenssl -> python-cryptography
+	select BR2_PACKAGE_PYTHON_BASE58 # runtime
+	select BR2_PACKAGE_PYTHON_ECDSA # runtime
 	select BR2_PACKAGE_PYTHON_PYNACL # runtime
 	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
+	select BR2_PACKAGE_PYTHON_PYTRIE # runtime
 	select BR2_PACKAGE_PYTHON_QRCODE # runtime
 	select BR2_PACKAGE_PYTHON_QRCODE_SVG # runtime
-	select BR2_PACKAGE_PYTHON_PYTRIE # runtime
 	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY # runtime
 
 config BR2_PACKAGE_PYTHON_AUTOBAHN_SCRAM
@@ -40,18 +44,6 @@ config BR2_PACKAGE_PYTHON_AUTOBAHN_SCRAM
 	select BR2_PACKAGE_PYTHON_ARGON2_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_PASSLIB # runtime
 
-config BR2_PACKAGE_PYTHON_AUTOBAHN_SERIALIZATION
-	bool "Accelerated JSON, MessagePack, CBOR, UBJSON, and FlatBuffers serialization support"
-	depends on BR2_INSTALL_LIBSTDCPP # python-ujson
-	select BR2_PACKAGE_PYTHON_CBOR2 # runtime
-	select BR2_PACKAGE_PYTHON_FLATBUFFERS # runtime
-	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
-	select BR2_PACKAGE_PYTHON_UBJSON # runtime
-	select BR2_PACKAGE_PYTHON_UJSON # runtime
-
-comment "Accelerated JSON, MessagePack, CBOR, UBJSON, and FlatBuffers serialization needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
-
 config BR2_PACKAGE_PYTHON_AUTOBAHN_TWISTED
 	bool "Twisted support"
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index ef26ba346f..34d585278f 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5  d3cb29a6d5e8cc4c9671aa46ba1f2d0c  autobahn-25.11.1.tar.gz
-sha256  52e62b9cc80c3e989b182952a60fd25c9a69afb00854a925a2b185f7b1f73cf1  autobahn-25.11.1.tar.gz
+md5  3dbc5c77f853b68a4a8c8ffcbd4eb024  autobahn-25.12.2.tar.gz
+sha256  754c06a54753aeb7e8d10c5cbf03249ad9e2a1a32bca8be02865c6f00628a98c  autobahn-25.12.2.tar.gz
 # Locally computed sha256 checksums
-sha256  49c90822821c78934079a4bfed0a880790a868bc6dba90ea8fe8274e0f985ada  LICENSE
+sha256  ff61657bfe1984c96d932fc0423268097b4b588bc57d47c26e8d680250d6c76d  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 0ba2b3fb4f..f110276018 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,15 +4,14 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 25.11.1
+PYTHON_AUTOBAHN_VERSION = 25.12.2
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/0e/3a/aab5632fbd88ed26d330ab156af80c9a90419dfa2841296fd556a65e5fac
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/54/d5/9adf0f5b9eb244e58e898e9f3db4b00c09835ef4b6c37d491886e0376b4f
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_CPE_ID_VENDOR = crossbar
 PYTHON_AUTOBAHN_CPE_ID_PRODUCT = autobahn
-PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
-PYTHON_AUTOBAHN_DEPENDENCIES = host-python-cffi
-PYTHON_AUTOBAHN_ENV = AUTOBAHN_STRIP_XBR=1
+PYTHON_AUTOBAHN_SETUP_TYPE = hatch
+PYTHON_AUTOBAHN_DEPENDENCIES = host-python-cffi host-python-setuptools
 
 $(eval $(python-package))
diff --git a/package/python-channels-redis/Config.in b/package/python-channels-redis/Config.in
index 785b05cac0..a63f96a4e9 100644
--- a/package/python-channels-redis/Config.in
+++ b/package/python-channels-redis/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_CHANNELS_REDIS
 	bool "python-channels-redis"
+	# python-channels -> python-daphne -> python-autobahn -> python-ujson
+	depends on BR2_INSTALL_LIBSTDCPP
 	# python-channels -> python-daphne -> python-autobahn -> python-cryptography
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	select BR2_PACKAGE_PYTHON_ASGIREF # runtime
diff --git a/package/python-channels/Config.in b/package/python-channels/Config.in
index b94f53ceaa..4e3bc6db53 100644
--- a/package/python-channels/Config.in
+++ b/package/python-channels/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_CHANNELS
 	bool "python-channels"
+	# python-daphne -> python-autobahn -> python-ujson
+	depends on BR2_INSTALL_LIBSTDCPP
 	# python-daphne -> python-autobahn -> python-cryptography
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	select BR2_PACKAGE_PYTHON_ASGIREF # runtime
diff --git a/package/python-daphne/Config.in b/package/python-daphne/Config.in
index 51c66532f0..dddb04a153 100644
--- a/package/python-daphne/Config.in
+++ b/package/python-daphne/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_DAPHNE
 	bool "python-daphne"
+	# python-autobahn -> python-ujson
+	depends on BR2_INSTALL_LIBSTDCPP
 	# python-autobahn -> python-cryptography
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	select BR2_PACKAGE_PYTHON_ASGIREF # runtime
diff --git a/package/python-magic-wormhole-mailbox-server/Config.in b/package/python-magic-wormhole-mailbox-server/Config.in
index 1b0402ebb4..d3b81a46ac 100644
--- a/package/python-magic-wormhole-mailbox-server/Config.in
+++ b/package/python-magic-wormhole-mailbox-server/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER
 	bool "python-magic-wormhole-mailbox-server"
+	depends on BR2_INSTALL_LIBSTDCPP # python-autobahn -> python-ujson
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-autobahn -> python-cryptography
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
diff --git a/package/python-magic-wormhole-transit-relay/Config.in b/package/python-magic-wormhole-transit-relay/Config.in
index 4cbb840a82..8f341b34c3 100644
--- a/package/python-magic-wormhole-transit-relay/Config.in
+++ b/package/python-magic-wormhole-transit-relay/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY
 	bool "python-magic-wormhole-transit-relay"
+	depends on BR2_INSTALL_LIBSTDCPP # python-autobahn -> python-ujson
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-autobahn -> python-cryptography
 	select BR2_PACKAGE_PYTHON_AUTOBAHN # runtime
 	select BR2_PACKAGE_PYTHON_TWISTED # runtime
diff --git a/package/python-magic-wormhole/Config.in b/package/python-magic-wormhole/Config.in
index 57db1bde78..29ff8fd059 100644
--- a/package/python-magic-wormhole/Config.in
+++ b/package/python-magic-wormhole/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE
 	bool "python-magic-wormhole"
+	depends on BR2_INSTALL_LIBSTDCPP # python-autobahn -> python-ujson
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_AUTOBAHN # runtime
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
