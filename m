Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B4ED0D156
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F116413E5;
	Wed,  7 Jan 2026 18:02:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qx46bVkJcFL8; Wed,  7 Jan 2026 18:02:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94177413DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808934;
	bh=nP8Ulfzh+7ogQoMIfnUaPcq501NBeYbD7m2AxiKtiYM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MR7Vrzylr/dRosjejNMEggVSj/zwCnprPhwy9OdPKP5nT+STvkzuWjxQnc/gnV0sP
	 q4MAKKI6r1dVZ+7QR/C0XTzeswY2jptM90NQONOQwZmFHo2GBGhm3HgJR5x+A3ZT8t
	 08F5AgD6h5BlFVAC0PkfmMTS8hPvuGlOFYZVw/HwjGzpMsLbkag78VFKPN70yRKqeU
	 PIP+nS/QH5cDg8ogKt9MqktID6f9Hm6xUSMBxOyv7pXjHH97Gygx1dIDmrAcXRfifP
	 oDiSJEX8Lp/zblUSIoUZjbxPadx3kzOr6INdP34Md9EoByDZb8VMGVPIsMuMrYKav2
	 /VfVm4T/2nLpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94177413DF;
	Wed,  7 Jan 2026 18:02:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E27F25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9063080FB2
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zTYHZDR__Dfp for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4EA680FF2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4EA680FF2
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B359F8268F; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:52:22 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 1b9addfc6ce85de3484c27bb952bf56061ddebb7
X-Git-Newrev: 81401483329e0b0d0c559e109a5100e87e55108e
X-Patchwork-Hint: ignore
Message-Id: <20260107180112.B359F8268F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libiio: fix
 python bindings without glibc utils
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=81401483329e0b0d0c559e109a5100e87e55108e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Libiio python bindings use ctypes and specifically the find_library()
function from there to load the libiio.so shared library. This is not
working unless glibc utils (specifically ldconfig) is installed to the
target (alternatively the target would need gcc or binutils, for objdump
or ld).

The easy fix here is to just bypass the find_library() machinery
altogether as it's not needed on a buildroot system.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Tested-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 193df1cbec8b4e18b998494a7dc05c2a06445036)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-bindings-python-fix-library-loading.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
