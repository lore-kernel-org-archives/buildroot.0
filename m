Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29CDE67803
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 17:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 603F5606F7;
	Mon, 22 Dec 2025 17:26:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Crjk2oSMgGrB; Mon, 22 Dec 2025 17:26:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CA6260A7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766424400;
	bh=wKf02MrxkgDEajPOWAoORO6aHBJroR2siIaDVPCRXco=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=o9LUA6loJBciMVO8rBVI0+Z1810p+brV0c99jCyt1ictRE8aujGV2LijeBwyByTxh
	 MB341pVGBCp2DrXrMBqDSKVnyjxU5+Rpn4TC22UjMfAglxIrU1B4BCzBpy0tKIysuX
	 G0hvDh+V/WNe8X0QPr2AVklP/GXqg0P8TJYyx0L/3NuspxCi5Msfbz9QYXMS/zUeAE
	 KShfwhDMLXbFl0P8rmJ8Cum0gbupi5frDuPtxNUSJodlKWT6H1TRaZR+V4/uwUFs+g
	 PXls0ilAsBuEQSvCIMBOERpaf7l7M4IkWpZOj40nadkoFoMYek1zX7IbGPk/uX209/
	 u7j1+auF5fIvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CA6260A7E;
	Mon, 22 Dec 2025 17:26:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AED1C195
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 17:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95A9C404F4
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 17:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WXAbv3K01Hqv for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 17:26:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5C90540149
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C90540149
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C90540149
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 17:26:38 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 0D6662C80CD5;
 Mon, 22 Dec 2025 18:26:36 +0100 (CET)
To: buildroot@buildroot.org
Cc: Paul Cercueil <paul@crapouillou.net>
Date: Mon, 22 Dec 2025 18:26:36 +0100
Message-ID: <20251222172638.839720-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1766424396; bh=72MajdqwNCXXJ7aD5XYfeerARAKTOmVvdt+1JPVS0Gw=;
 h=From:To:Cc:Subject:Date;
 b=o7Sh1EIALixDBGJOFUL2bnwTfMgu8L5HHiT3hUvDfuFbwTKm2IYbE6thj2StAVP1r
 3t+yeNZBlOQwbDHvPNZWXb3fU1PSwCJTMgkdJ13pjj10iSAznve3M4289SlZ3T8p+I
 z5OlmRvimf2wHOenHgBO/xTpXbJLOCpinMeM8Y57/cjK8KSVg4GXp/YxI0QJfxypZr
 vuNTlnZzIgAFJSv1huZ7/42tlBIzGO2/NF1PfDHXatouvozWbKSbcu0jvniGLCnHP6
 /WW0cFHrhijLZ8/9tRoDufi75p1vDAceLN2C3LotV5bDxJgxUmr7wCESL2GMI93u7S
 5arW2ImqcJ9aw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=o7Sh1EIA
Subject: [Buildroot] [PATCH 1/2] package/libiio: fix python bindings without
 glibc utils
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Libiio python bindings use ctypes and specifically the find_library()
function from there to load the libiio.so shared library. This is not
working unless glibc utils (specifically ldconfig) is installed to the
target (alternatively the target would need gcc or binutils, for objdump
or ld).

The easy fix here is to just bypass the find_library() machinery
altogether as it's not needed on a buildroot system.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 ...-bindings-python-fix-library-loading.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/libiio/0001-bindings-python-fix-library-loading.patch

diff --git a/package/libiio/0001-bindings-python-fix-library-loading.patch b/package/libiio/0001-bindings-python-fix-library-loading.patch
new file mode 100644
index 0000000000..f8715b4c5b
--- /dev/null
+++ b/package/libiio/0001-bindings-python-fix-library-loading.patch
@@ -0,0 +1,41 @@
+From 4d4d17e2810f793b9f7fd8acad2a3c551dbff2b5 Mon Sep 17 00:00:00 2001
+From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
+Date: Fri, 31 Mar 2023 20:13:07 +0200
+Subject: [PATCH] bindings: python: fix library loading
+
+On Linux the find_library() function requires ld, gcc, objdump
+or ldconfig on the target, which might not be present on a
+buildroot system. [1]
+We do not actually need this function at all, as we know the iio library
+will be referencable in the system under the name "libiio.so".
+So instead of kicking of this complicated cross-platform/cross-distro
+compatible machinery, we just pass in the name of the library we already
+know.
+
+[1] https://docs.python.org/3/library/ctypes.html#finding-shared-libraries
+
+Upstream: N/A, buildroot doesn't have to care about different OS's and
+distro setups, so we can just hardcode the lib name, but we cannot
+submit that upstream.
+
+Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
+---
+ bindings/python/iio.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bindings/python/iio.py b/bindings/python/iio.py
+index b91260cc..bde17694 100644
+--- a/bindings/python/iio.py
++++ b/bindings/python/iio.py
+@@ -224,7 +224,7 @@ else:
+     # Non-windows, possibly Posix system
+     _iiolib = "iio"
+ 
+-_lib = _cdll(find_library(_iiolib), use_errno=True, use_last_error=True)
++_lib = _cdll("libiio.so", use_errno=True, use_last_error=True)
+ 
+ _get_backends_count = _lib.iio_get_backends_count
+ _get_backends_count.restype = c_uint
+-- 
+2.25.1
+
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
