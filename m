Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAB1C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 10:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C8F660A80;
	Sun, 14 Aug 2022 10:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C8F660A80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gzo5_VdJIu9V; Sun, 14 Aug 2022 10:08:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A28AF6076A;
	Sun, 14 Aug 2022 10:08:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A28AF6076A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 344BC1BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1006D82A5D
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:08:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1006D82A5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PwAmD24WQrlm for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 10:08:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3375E82A29
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 10:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3375E82A29
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 670FF8745D; Sun, 14 Aug 2022 09:54:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 12:08:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b543a4b885d5c073f60d486cece2beaaa9849e5
X-Git-Newrev: 62edd1b48bf1a98b9993663bcd1dc0f3458a2472
X-Patchwork-Hint: ignore
Message-Id: <20220814095415.670FF8745D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-autobahn: fix dependencies
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=62edd1b48bf1a98b9993663bcd1dc0f3458a2472
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit efa5ff1489625eb862b1d7d161a169514cc9c881 forgot to add reverse
dependencies resulting in the following build failure:

Makefile:575: *** snappy is in the dependency chain of python-snappy that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/fc4fdc29ff4ab3e1585a42ed6b063e9e50583fe9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
