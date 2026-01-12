Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDE4D2503F
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55CE280850;
	Mon, 12 Jan 2026 08:06:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sIUYoPCSJuAr; Mon, 12 Jan 2026 08:06:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1D508428F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205200;
	bh=5L+a8bkKmx2C7Mc39zit9A5g5wwMU/MvRF63IPULJ/k=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aROP+ltoYknLV4ABDMWGI+Pn2sNU+A2whMz1UZzhaz/IkFWJ+GhL8a3JPnk3Tb/u5
	 VOgb48VlG93RpHp4z1tY1QDSwcDOb3bh7/DHdlDpWcCwzmFIQb5kj2SSoDqkBbqcWA
	 FVB5Dz3u1K0guCmlmbsrEZjW4m52anLGXUh9aHGWlwWh54YgrnUjeB+NF8tvGlR9uO
	 e1s3Dq6URVDKjS6ezLtHrs673ULQ0UhP+R4YDfDw8U6n0a27cfp16bao6cBK8T58Es
	 UD1nLm/r8Gc7nO2qryHP4lAuAUhkucYVqzCE986wyQBetQ3XlNP+CWpRzGp7GfUFr/
	 qFq3Er4mqSI4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1D508428F;
	Mon, 12 Jan 2026 08:06:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 99A0C18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FA816123D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4TlwBUq4ih5w for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:06:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7642F60762
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7642F60762
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7642F60762
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:06:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4111FA4C41AF
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:04:48 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuY-000000003M6-2zxk
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:35 +0100
Message-ID: <20260112080419.2516889-60-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205088;
 bh=8UENjDacPgr5At+T5WAzwDfJqrZyo0Iebym4tZbjJKw=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=XVDQNxnK7prD+ITEolRqZXYYpbhR1QsggjAuvq0XqfXPbPe6KVx+y4thj2gy/6jTg
 JB0Ac24pGs7kRTimYtki7qp1D69LsHAsONScrqQQZLfq2yRJ2OLdmIj/3ZDdm/x2BH
 u04CFeXOp2QwXYJkYR65taqUngPAoJDNKk2lBHybIHFUS5GvIS++kOHYBndYzrzw7l
 O7O0zPIHR4iBrSULN4hmXcFnVuvKeEeU4WynEuPzA/AoPHtSFnP/uL3PewnjhyzPBB
 qeiCbNP4WVb1VromNXUtlFxuvNt8nuFpnuweTkyt7AYFGSKWjKAVv02rlk2L2xKiEt
 aEw1cs4Agxufw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=XVDQNxnK
Subject: [Buildroot] [PATCH 060/104] package/x11r7/xlib_libXi: bump version
 to 1.8.2
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

https://lists.x.org/archives/xorg-announce/2024-September/003530.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libXi/xlib_libXi.hash | 6 +++---
 package/x11r7/xlib_libXi/xlib_libXi.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXi/xlib_libXi.hash b/package/x11r7/xlib_libXi/xlib_libXi.hash
index 545d4881f6..a806235976 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.hash
+++ b/package/x11r7/xlib_libXi/xlib_libXi.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-May/003390.html
-sha256  89bfc0e814f288f784202e6e5f9b362b788ccecdeb078670145eacd8749656a7  libXi-1.8.1.tar.xz
-sha512  a30b1a07e6d710f5196e7477415d68074736f89d954e8f2d5ccc9b5f349e7d1d440c90fb512508176b5db5ecad55608cfb540872936b731963fd83343db3a0b9  libXi-1.8.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-September/003530.html
+sha256  d0e0555e53d6e2114eabfa44226ba162d2708501a25e18d99cfb35c094c6c104  libXi-1.8.2.tar.xz
+sha512  6348aae8f595217e26f348184dd594d83af800949f649bfd11b6aef7387faa5624ed18551fe2c3a38c8deab9d7473f72fd7e3e8472cff3ff30d4bb3fb2e6dc31  libXi-1.8.2.tar.xz
 # Locally computed
 sha256  9392174bc86e291369fd2f61f3ed325962735a5f5c585ce8d7ebd365e2a5639f  COPYING
diff --git a/package/x11r7/xlib_libXi/xlib_libXi.mk b/package/x11r7/xlib_libXi/xlib_libXi.mk
index 6ae5ec8be8..f5b0c81a99 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.mk
+++ b/package/x11r7/xlib_libXi/xlib_libXi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXI_VERSION = 1.8.1
+XLIB_LIBXI_VERSION = 1.8.2
 XLIB_LIBXI_SOURCE = libXi-$(XLIB_LIBXI_VERSION).tar.xz
 XLIB_LIBXI_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXI_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
