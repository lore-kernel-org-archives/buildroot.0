Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C4AFD0068
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 13:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6964D40CD2;
	Sun,  1 Mar 2026 13:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r1xo2MnZ2G1Z; Sun,  1 Mar 2026 13:41:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BDFC40CE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772372460;
	bh=osO4bhCfE9xD19IJG9KCaIPg5VNz5qvo6BpmYJSj5nc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fy/Ff8ZtAOTYi2a/aNRTjeG7+EpNJhlw808I7fGEi6JDQmQgk3kDQYbC2q/cpbeFS
	 2mZgGCN2jfb1r+YHeeZcsYzs1HQG45i3GqzNhuoi07o7d6UZoMtvQOOLKIOS8x8xpI
	 iNbfWf+nr7y171J8VITKDbQxoARPnx+Z+VCW4G0hd9fyT9JeYPGi9vNORvQ+Oa1wyE
	 3LMa53yNE6kz2qj0Bf8Wj40WqlPrTAWeDzncBW+Vw6zXru7qGYJXG4yNLBTuv//Tfy
	 Fyo7ouoba2yZsMwNbGv3U3/XOkEaEk+QJu4FptgezJAAlkDTlzq06akGr+DRhNDbqx
	 W4gM7fqy4Fipw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BDFC40CE6;
	Sun,  1 Mar 2026 13:41:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5063C24E
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 13:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34A2E40CE6
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 13:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id geKnOcTH9Mj0 for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 13:40:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4F74C40CD2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F74C40CD2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F74C40CD2
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 13:40:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6BB7DA4C3111;
 Sun,  1 Mar 2026 14:40:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47904)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vwh2T-000000008Ty-1P8B;
 Sun, 01 Mar 2026 13:40:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  1 Mar 2026 14:40:52 +0100
Message-ID: <20260301134053.1460941-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772372453;
 bh=M2gnoJnUxUqLxlMvoYVOx9sRdYkQLmcL5ZUphbFDNDc=;
 h=From:To:Cc:Subject:Date:From;
 b=bxgVG7XNQToDz8qouJh2DSfbYnTaYVAVIWITsYTFLSxbQCUVNUQhAVVuJgy9XrAgw
 L1mXcyMJjD3o39r7+OoAtBtj6vZYfP0fPQ+FphNLtkD0dkYyWEiVbSZImnBLW6tdVG
 iRFHXIcefzwvK3cJ501QXgpfy8clkmlAAewkM1muQ25Q8qf+tIvHRrZDlBSrkpJVws
 e4bhOJaJ4xYuHOjB5kFqWx7mGrc6i7Cfu85atil+Q/Insf9svxgZx5VceDtHrY67R2
 7wqNYguoVCxmCc6aD1CgdrH0aHtDeXy00686v8A8qRVObLMckWfE1Jp5ZrX1Mgjg4j
 6c+Zd0dAg7zrA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=bxgVG7XN
Subject: [Buildroot] [PATCH/next 1/1] boot/shim: Fix build with binutils 2.46
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

Buildroot commit 101997e334efcbfd9bde3100ae75400177cfa56f added binutils
2.46.0 to -next branch causing a build error with shim:

output/per-package/shim/host/bin/x86_64-buildroot-linux-gnu-objcopy:
 shimx64.so: file format not recognized
output/per-package/shim/host/bin/x86_64-buildroot-linux-gnu-objcopy:
 mmx64.so: file format not recognized

Added an upstream patch to fix the problem.

No backport to buildroot LTS branches necessary.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-Fix-build-with-binutils-2.46.patch   | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 boot/shim/0001-Fix-build-with-binutils-2.46.patch

diff --git a/boot/shim/0001-Fix-build-with-binutils-2.46.patch b/boot/shim/0001-Fix-build-with-binutils-2.46.patch
new file mode 100644
index 0000000000..05ab7b2c83
--- /dev/null
+++ b/boot/shim/0001-Fix-build-with-binutils-2.46.patch
@@ -0,0 +1,51 @@
+From c4665d282072df2ed8ab6ae1d5fa0de41e5db02f Mon Sep 17 00:00:00 2001
+From: Luca Boccassi <luca.boccassi@gmail.com>
+Date: Tue, 6 Jan 2026 11:48:13 +0100
+Subject: [PATCH] Fix build with binutils 2.46
+
+With the new binutils which is in development and in Fedora Rawhide:
+
+objcopy -D -j .text -j .sdata -j .data -j .data.ident \
+        -j .dynamic -j .rodata -j .rel* \
+        -j .rela* -j .dyn -j .reloc -j .eh_frame \
+        -j .vendor_cert -j .sbat -j .sbatlevel \
+        --file-alignment 0x1000 \
+        --target efi-app-x86_64 fbx64.so fbx64.efi
+objcopy: fbx64.so: file format not recognized
+
+It seems it was an intentional compat break, according to the upstream
+commit:
+
+https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=5e83077d552ed6f81dbc092eb3ccf827a43de42c
+
+* Internal changes to plugin support, and stricter target checking may result
+  in some errors being exposed in user options passed to the various binutils.
+  For example objcopy --target=TARGET now will only work if the input file is
+  for TARGET whereas prior versions of objcopy accepted other target input
+  files and produced a TARGET output.  If you do in fact want the old
+  behaviour the correct usage is objcopy --output-target=TARGET.
+
+Switch from --taget to --output-target as suggested.
+
+Signed-off-by: Luca Boccassi <luca.boccassi@gmail.com>
+
+Upstream: https://github.com/rhboot/shim/commit/c4665d282072df2ed8ab6ae1d5fa0de41e5db02f
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Make.defaults | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Make.defaults b/Make.defaults
+index c5fa32bec..9b40b7f4a 100644
+--- a/Make.defaults
++++ b/Make.defaults
+@@ -155,7 +155,7 @@ endif
+ 
+ LIB_GCC		= $(shell $(CC) $(ARCH_CFLAGS) -print-libgcc-file-name)
+ EFI_LIBS	= -lefi -lgnuefi --start-group Cryptlib/libcryptlib.a Cryptlib/OpenSSL/libopenssl.a --end-group $(LIB_GCC)
+-FORMAT		?= --target efi-app-$(ARCH)
++FORMAT		?= --output-target efi-app-$(ARCH)
+ LOCAL_EFI_PATH	= gnu-efi/$(ARCH_GNUEFI)/gnuefi
+ LIBDIR		= gnu-efi/$(ARCH_GNUEFI)/lib
+ 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
