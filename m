Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4BBE9A04B
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 19:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCE3A4060E;
	Wed, 18 Feb 2026 19:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wLceSVIZK1N3; Wed, 18 Feb 2026 19:18:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D46C440624
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771442284;
	bh=RdvIGG7rLqvXXwfC18QSAxVFCJ3iJC6DLil3nr0KKTs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IKzDNNoh1uHlk65fmzbZcHMQ/+4TnITDymca2liunAt/+PLmqUK4CIUDPESLiXbr1
	 /z0rzZpEhaDnaTOvlEQRSkij+uhIDeuGF4xlQPfr0E4SUO/OHKmTa3qRO8drGP66TG
	 dNdFrzMiv3ncAdHSWH1Tr7VgKddNtXoUUmGwKCMdGFudD0Wgu3YU7pU8qpsKRmnlEN
	 yn7moTgAOTMk9WUc/eC7ZOqGN30WiTIw3M5VVXXTm1os4BH6EVell7AXjM11k0O6BD
	 BLocsUTwvGkA+rOHiwF1CUS8y4pN+y/u6rzZaLUJPgK4OTBrIXXCeVwiVLMkzChKTK
	 i9ccjO6lKRtjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D46C440624;
	Wed, 18 Feb 2026 19:18:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 36B28206
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 19:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADC1C60594
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 19:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iaZP1Ug_NI-o for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 19:18:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8904660749
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8904660749
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8904660749
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 19:18:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5ce.dip0.t-ipconnect.de [79.214.197.206])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3D532A4C0E8D;
 Wed, 18 Feb 2026 20:17:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48162)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vsn3f-000000005y7-0QBG;
 Wed, 18 Feb 2026 19:17:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 18 Feb 2026 20:17:58 +0100
Message-ID: <20260218191758.2582626-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771442279;
 bh=e/3xbxBaiEBhH+CN/UC1oQfX8HfFF0Rcfii2RiO2vrQ=;
 h=From:To:Cc:Subject:Date:From;
 b=rWbeu/XCa9XMdJUVIQRYNUh/OtY+cz4J9/NtmRyXw9vB9t1wuCnyKM4n+cmr15CCj
 1GKIs9NujZQJHvCc2232Io6wlJeUAQ1Vzkgpfpo0E8bTg+3WJY6TmmuPUV1fglcrYV
 i+8zhGk80G4DLmddfVG53AgZypQjvUYt8tfAZyzSKhpeL+ueSAHWBxhqUqVVwW6nip
 tKjNazywPTteg+NstdOqjCF7mSKHtAC4chYPQkpmn6NZ4xL3GyQsDGtd9eygXmPnt/
 mAzjCwd2Rjoie91EaP82LSjUlFYU4zGXDBm8UXr4nn4Fa6WDY8bR4U5au7PXIcchFH
 usWIwT/QXIG6w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=rWbeu/XC
Subject: [Buildroot] [PATCH 1/1] package/fio: fix build with nfs
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

Buildroot commit 215133c0fc2819f059fbb35071ab2e0987f5107d bumped the
package from 3.38 to 3.41. This bump includes upstream commit
https://github.com/axboe/fio/commit/171e18146a3ea26491b087a29c6ee7b0ad21e719
which added gnutls as dependency to the pkg-config call for libnfs libs.

This causes a configure warning

  Package gnutls was not found in the pkg-config search path.
  Perhaps you should add the directory containing `gnutls.pc'
  to the PKG_CONFIG_PATH environment variable
  Package 'gnutls' not found

and build errors like

  nfs.c:(.text+0x75): undefined reference to `nfs_close'

when gnutls is not available.

Gnutls is in fact only needed for libnfs >= 6.0.0 and not for the libnfs
version 5.0.3 currently used by buildroot. This patch adds an upstream
commit that adds a version check for libnfs to the configure script:
https://github.com/axboe/fio/commit/ceadd9251f0b2ad707ddef2cdd42f91573172bbe

Fixes:
https://autobuild.buildroot.net/results/41d/41db210797fc5f036246063a9e3634b27158b3c8/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...tionally-add-gnutls-for-libnfs-6.0.0.patch | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 package/fio/0002-configure-conditionally-add-gnutls-for-libnfs-6.0.0.patch

diff --git a/package/fio/0002-configure-conditionally-add-gnutls-for-libnfs-6.0.0.patch b/package/fio/0002-configure-conditionally-add-gnutls-for-libnfs-6.0.0.patch
new file mode 100644
index 0000000000..891ec1374a
--- /dev/null
+++ b/package/fio/0002-configure-conditionally-add-gnutls-for-libnfs-6.0.0.patch
@@ -0,0 +1,60 @@
+From ceadd9251f0b2ad707ddef2cdd42f91573172bbe Mon Sep 17 00:00:00 2001
+From: Luis Chamberlain <mcgrof@kernel.org>
+Date: Wed, 23 Jul 2025 19:42:22 -0700
+Subject: [PATCH] configure: conditionally add gnutls for libnfs >= 6.0.0
+
+gnutls is required newwer version of libnfs, and so we need to check
+for this. libnfs version 6.0.0 and later added TLS support. Earlier versions
+like 5.0.x do not require gnutls.
+
+Add a version check in the configure script to detect the libnfs version
+and only add gnutls as a dependency when libnfs >= 6.0.0 is detected.
+
+For systems with older libnfs versions, the build will work without
+requiring gnutls. For systems with libnfs 6.0.0+, gnutls will be
+properly detected and linked.
+
+Generated-by: Claude AI
+Reviewed-by: Vincent Fu <vincent.fu@samsung.com>
+Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
+
+Upstream: https://github.com/axboe/fio/commit/ceadd9251f0b2ad707ddef2cdd42f91573172bbe
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure | 19 +++++++++++++++++--
+ 1 file changed, 17 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 13450118..64e58b65 100755
+--- a/configure
++++ b/configure
+@@ -2348,8 +2348,23 @@ print_config "DAOS File System (dfs) Engine" "$dfs"
+ if test "$libnfs" != "no" ; then
+   if $(pkg-config libnfs > /dev/null 2>&1); then
+     libnfs="yes"
+-    libnfs_cflags=$(pkg-config --cflags libnfs gnutls)
+-    libnfs_libs=$(pkg-config --libs libnfs gnutls)
++    libnfs_cflags=$(pkg-config --cflags libnfs)
++    libnfs_libs=$(pkg-config --libs libnfs)
++
++    # libnfs >= 6.0.0 requires gnutls for TLS support
++    libnfs_version=$(pkg-config --modversion libnfs 2>/dev/null)
++    if test -n "$libnfs_version" ; then
++      libnfs_major=$(echo $libnfs_version | cut -d. -f1)
++      if test "$libnfs_major" -ge 6 ; then
++        if $(pkg-config gnutls > /dev/null 2>&1); then
++          libnfs_cflags="$libnfs_cflags $(pkg-config --cflags gnutls)"
++          libnfs_libs="$libnfs_libs $(pkg-config --libs gnutls)"
++        else
++          feature_not_found "gnutls" "gnutls (required for libnfs >= 6.0.0)"
++          libnfs="no"
++        fi
++      fi
++    fi
+   else
+     if test "$libnfs" = "yes" ; then
+       feature_not_found "libnfs" "libnfs"
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
