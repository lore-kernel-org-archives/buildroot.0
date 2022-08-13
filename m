Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD13C25B08
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 08:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1499083E41;
	Sat, 13 Aug 2022 08:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1499083E41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hz5IhnGzItfP; Sat, 13 Aug 2022 08:48:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 294E783E19;
	Sat, 13 Aug 2022 08:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 294E783E19
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD30C1BF5B5
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 08:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A564060AB5
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 08:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A564060AB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aJhfjQ6Yr0ax for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 08:48:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59CB160AA3
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 59CB160AA3
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 08:48:21 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 m3-20020a05600c3b0300b003a5e0557150so133691wms.0
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 01:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=bQnOMhUeDfrQ1SZogP4P68zbC7dR8qzQ+1EfBZJq7ZA=;
 b=Sa9+i7PzrJ1XZOskXrnUdYqp0xTVPEdQxq8y2zXd5/qNFLu7U+jOh9iKjABcVHaBed
 jZHTidV7Q+uiS2BiRVN2Vi6C3mY4xL7ZuqB7YdlKIizAgFjqBw5z0tc+6Nl/DfTtYG82
 mc/+FRajKk7B3DhUAY8DlbH2+1IjsXMbIZacYeDZQdXz0k/Nkuz9Zz2YZc+Kp2Z0YHRu
 6x2XoQXlFRQkEVFjLVHXpGTBMMTkkFURtzvEsRW8P38NX+zuj6I92qDyjgsgd5BP3N1N
 qmATF7YU8Keq27uG14HpwhsX+jnyqbkjd5zHlznlhMzABn03OcDI+Sz7A6ts0Op4/JDe
 epfQ==
X-Gm-Message-State: ACgBeo2JzrMWozachvxT6iHQxdFohiWxJEsk3TEf9SUGqLvunGsrlTLa
 4aQrtCoJx5/NB0itDGqJM6X3zSp40Gg=
X-Google-Smtp-Source: AA6agR455v/O1o/bnG1p/yzsL+uBVXWZNcCXhm243FgJ2+rWvB/ejlf5nDIJqQ2UGw+JhYg9miY81g==
X-Received: by 2002:a05:600c:19cc:b0:3a3:3cfe:d548 with SMTP id
 u12-20020a05600c19cc00b003a33cfed548mr4957990wmq.6.1660380499327; 
 Sat, 13 Aug 2022 01:48:19 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b00fce1651edf2c89c7.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:fce1:651e:df2c:89c7])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a05600c4f8600b003a5bd9448e5sm2155130wmq.28.2022.08.13.01.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Aug 2022 01:48:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Aug 2022 10:48:15 +0200
Message-Id: <20220813084815.696873-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=bQnOMhUeDfrQ1SZogP4P68zbC7dR8qzQ+1EfBZJq7ZA=;
 b=fqnLHxCoNFqzaKwKVGbtjXLky84mIr6ApCLZbCljKdJd+PaHjMYoVB8651BMUf6uR2
 lQUGlO5YwQPrnC1lqCRT8fYM1RpNE9eO4XrEcz7KcrZ92WGNQyFpnFaUR7pQlTIl/bhx
 Lf9jwMjQTRYP7El5N3vxLpaPRmKzNIgVPi1pdjJrEs+HyCmrAEAZKGAjNbhpXy8p+IA+
 AwFj20cM2iOTwYOMhHwQyqzqMrVHPAhLNwc4QcW98aeyRSZs2PcorwWtSh8LdyR9OsQn
 Qjc7fZJ+PWJK4bSlZhdt9k/EtH80NjxvUq9g2umx8JTpeQ3V/PDnx3c8qj/3wvK+sjU/
 oikA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fqnLHxCo
Subject: [Buildroot] [PATCH 1/1] package/python-autobahn: fix dependencies
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit efa5ff1489625eb862b1d7d161a169514cc9c881 forgot to add reverse
dependencies resulting in the following build failure:

Makefile:575: *** snappy is in the dependency chain of python-snappy that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/fc4fdc29ff4ab3e1585a42ed6b063e9e50583fe9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-autobahn/Config.in | 9 +++++++++
 package/python-crossbar/Config.in | 6 ++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/package/python-autobahn/Config.in b/package/python-autobahn/Config.in
index c9caa1f1c4..527416a3cd 100644
--- a/package/python-autobahn/Config.in
+++ b/package/python-autobahn/Config.in
@@ -19,10 +19,15 @@ config BR2_PACKAGE_PYTHON_AUTOBAHN_ACCELERATE
 
 config BR2_PACKAGE_PYTHON_AUTOBAHN_COMPRESS
 	bool "Non-standard WebSocket compression support"
+	depends on BR2_INSTALL_LIBSTDCPP # python-snappy -> snappy
 	select BR2_PACKAGE_PYTHON_SNAPPY # runtime
 
+comment "Non-standard WebSocket compression needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_PYTHON_AUTOBAHN_ENCRYPTION
 	bool "TLS and WAMP-cryptosign encryption/authentication support"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pyopenssl -> python-cryptography
 	select BR2_PACKAGE_PYTHON_PYNACL # runtime
 	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
 	select BR2_PACKAGE_PYTHON_QRCODE # runtime
@@ -37,12 +42,16 @@ config BR2_PACKAGE_PYTHON_AUTOBAHN_SCRAM
 
 config BR2_PACKAGE_PYTHON_AUTOBAHN_SERIALIZATION
 	bool "Accelerated JSON, MessagePack, CBOR, UBJSON, and FlatBuffers serialization support"
+	depends on BR2_INSTALL_LIBSTDCPP # python-ujson
 	select BR2_PACKAGE_PYTHON_CBOR2 # runtime
 	select BR2_PACKAGE_PYTHON_FLATBUFFERS # runtime
 	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
 	select BR2_PACKAGE_PYTHON_UBJSON # runtime
 	select BR2_PACKAGE_PYTHON_UJSON # runtime
 
+comment "Accelerated JSON, MessagePack, CBOR, UBJSON, and FlatBuffers serialization needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_PYTHON_AUTOBAHN_TWISTED
 	bool "Twisted support"
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
index fb06f7672a..aadcb2c360 100644
--- a/package/python-crossbar/Config.in
+++ b/package/python-crossbar/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-numpy
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	depends on BR2_INSTALL_LIBSTDCPP # python-autobahn's compress and serialization
 	# All the following dependencies are runtime dependencies. It
 	# matches almost 1:1 the requirements-min.txt from crossbar
 	# with the following exceptions:
@@ -63,7 +64,8 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 
 	  https://pypi.python.org/pypi/crossbar
 
-comment "python-crossbar needs glibc or musl"
+comment "python-crossbar needs a glibc or musl toolchain w/ C++"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
+		!BR2_INSTALL_LIBSTDCPP
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
