Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413D1C5DF66
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 08:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE4C06069F;
	Sun, 16 Aug 2026 08:08:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9JKYK8UPWPgm; Sun, 16 Aug 2026 08:08:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDF2C6069A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786867687;
	bh=AfDZAS9ElHuqKTdWJzgLp0SX6iqWcur6t666TX1LZ2c=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Yv95rhl1an0V30mqPgtA37V0vEOwACz6MMM7cELzgpRBuvOYMtkVU6zzUziZ/dXoV
	 a9rTTIibiwao5gLaVJNr2jb9ottky2W7gLL0E71is7NZUkJZtju4SlFclsc1nlN4xR
	 mRRIpqgvImujRSwZnyrqjSVfowE94+L/yfUmzZnGFSIBwK8vn1+wLXhnhjemGFPrSj
	 upBYEdzYarJqUTXSWIZ1+wzgx3/1T9iMnLpe9FlE5yvydX8lKE2HDqCLrtsXDXmJ5F
	 27itF2b8yXDQvVqKY/lciFxoCPAjtnPCilpANa0C8azq3LqSmw2QsQdzVXjdVEM0zN
	 ytFPfLaZDuy7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDF2C6069A;
	Sun, 16 Aug 2026 08:08:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DEC61333
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 08:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5548400C0
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 08:08:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tNfODmGK_-KY for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 08:08:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E4E504006B
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4E504006B
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Idns78ST
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4E504006B
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 08:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1786867682;
 bh=wdgP+azuokoflNHHCu+xniovcsJgad7SJsgkqFW2/bE=;
 h=From:To:Cc:Subject:Date:From;
 b=Idns78STsV5ZbcCFABry+I9eH11SHFsGTrLihwMNSYq3HlbLCCk0LHaRy63w6Q+bv
 Xi71c2ka6h5Sg+Q0jSyr0FkZ4cka2SJW3nlkGgJgcXjkrQXV0kSKstgUomwQ1f1vU8
 cdDAcuhHmjPWJUG9Nz9oCro+xMs96yaUZAnftlYnvrR3nWWsN9KtsdTcWcd8AFKlQV
 IMbXuYTWBOA6O3FS/mxkb0OVXro4iIv6GZSq31ZMIFlwb5t5ea1P4P9Ps18npYRSbZ
 Pvj0LEmKMhA9B6BzPMVP6BImxRGvKtEwFdzlIjkulRaPf+AymCN0gARpcyDiCqRsXR
 ibyJy0vea/XTA==
Received: from fli4l.lan.fli4l (p54a1bf47.dip0.t-ipconnect.de [84.161.191.71])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9D0B2A4C272A;
 Sun, 16 Aug 2026 10:08:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36676)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wvVuU-000000001CY-09Em;
 Sun, 16 Aug 2026 08:08:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Aug 2026 10:08:02 +0200
Message-ID: <20260816080802.2794593-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/libffi: bump version to 3.8.0
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

https://github.com/libffi/libffi/releases/tag/v3.8.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/3621ffbf0180befdf3cc82f379082b4b946072be
with the exception of bootlin-armv7m-uclibc which is broken with 3.5.2
as well:

../src/arm/sysv.S: Assembler messages:
../src/arm/sysv.S:104: Error: selected processor does not support ARM opcodes

This bump does not introduce new build errors.

 package/libffi/libffi.hash | 4 ++--
 package/libffi/libffi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libffi/libffi.hash b/package/libffi/libffi.hash
index 5f34afd392..2a98652d2d 100644
--- a/package/libffi/libffi.hash
+++ b/package/libffi/libffi.hash
@@ -1,4 +1,4 @@
-# From https://github.com/libffi/libffi/releases/tag/v3.7.1
-sha256  d5e9a6638ddbd2513ddb54518eb67e4bbe6fa707bcc01c10f6212f0a088d819d  libffi-3.7.1.tar.gz
+# From https://github.com/libffi/libffi/releases/tag/v3.8.0
+sha256  7da3e2d9a171eb0a038f592ecad3ff2bb2550f3496d87b3b29ad0cf4430c0db4  libffi-3.8.0.tar.gz
 # License files, locally calculated
 sha256  17b64dc60f3b6897a60f971e288b973f655c2edcdf08b25f3c3dd5549857881c  LICENSE
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index c24ce22c84..e022304193 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFFI_VERSION = 3.7.1
+LIBFFI_VERSION = 3.8.0
 LIBFFI_SITE = \
 	https://github.com/libffi/libffi/releases/download/v$(LIBFFI_VERSION)
 LIBFFI_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
