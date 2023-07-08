Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4A8EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  8 Jul 2023 20:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACE5D60DFD;
	Sat,  8 Jul 2023 20:06:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACE5D60DFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0OIyBd3nxsvu; Sat,  8 Jul 2023 20:06:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F331F60E6D;
	Sat,  8 Jul 2023 20:06:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F331F60E6D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 715F01BF863
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 20:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49C9241570
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 20:06:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49C9241570
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GFYevxCETNrp for <buildroot@lists.busybox.net>;
 Sat,  8 Jul 2023 20:06:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72764414EA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72764414EA
 for <buildroot@buildroot.org>; Sat,  8 Jul 2023 20:06:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfe4.dip0.t-ipconnect.de [79.214.207.228])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F2B70A4C0EF6;
 Sat,  8 Jul 2023 22:04:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55090)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qIEAh-0000uD-1l;
 Sat, 08 Jul 2023 22:04:47 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  8 Jul 2023 22:04:43 +0200
Message-Id: <20230708200447.3919009-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708200447.3919009-1-bernd@kuhls.net>
References: <20230708200447.3919009-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688846688;
 bh=VAwsRTE5YjP5L8ajc/m0LhZmy2/MT60u+eGTDVFWGts=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vlCGi0OHe7jHx+cZe/HA1FLTVpnUyuGWE7X06FRpPUkXcUzFNgct6TDrMGcohDm2N
 1GpaCy4z6xBD1y01n9m30gVkArLAHdWaU17ADAWf0eJtz0KnINElDL/VlyQuSR9DY6
 FmweUwNe3Yt3hb1GHYEYSdWBTL9kCFgqxlv5mXIscvaODHK+oBtqvHXdWge9K06UlE
 O9wC2FtCWAwwLebIX3reRD7rmyCDFM8LnbdloWbBi95yEXKX449ZlaXzollUpVfFsm
 OOIB5TVe35XAwTARWQo1izx/EuXnup+FlF3mxnRnriK0XKo4PznEYYgLkF8T3chtYO
 qqp4riXLg4WPA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=vlCGi0OH
Subject: [Buildroot] [PATCH 3/7] package/gd: add optional support for libheif
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
Cc: Pieter De Gendt <pieter.degendt@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gd/gd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index 55c12e6968..969c02aade 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -44,6 +44,13 @@ GD_DEPENDENCIES += jpeg
 GD_CONF_OPTS += --with-jpeg
 endif
 
+ifeq ($(BR2_PACKAGE_LIBHEIF),y)
+GD_DEPENDENCIES += libheif
+GD_CONF_OPTS += --with-heif
+else
+GD_CONF_OPTS += --without-heif
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 GD_DEPENDENCIES += libpng
 GD_CONF_OPTS += --with-png
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
