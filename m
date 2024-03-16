Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0D9C48BF6
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 21:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B566E60790;
	Sat, 16 Mar 2024 21:37:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B0B8D6GZm0F5; Sat, 16 Mar 2024 21:37:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4233C60684
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4233C60684;
	Sat, 16 Mar 2024 21:37:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A117F1BF83A
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 21:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D36260684
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 21:37:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xaEv839d9Fjj for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 21:37:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3A7CE60681
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A7CE60681
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A7CE60681
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 21:37:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca80.dip0.t-ipconnect.de [79.214.202.128])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B4491A4C1A5E
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 22:37:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53724)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rlbiQ-000000001Z0-2d93
 for buildroot@buildroot.org; Sat, 16 Mar 2024 21:37:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 16 Mar 2024 22:37:18 +0100
Message-Id: <20240316213718.3611716-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1710625039;
 bh=xTGV9qR+cFHqw1/Ome4Kr9LzK3KCAnIIEaYEg+reqLw=;
 h=From:To:Subject:Date:From;
 b=QIXVPw94KCGus/wfFUolbJBY1fOqSlxqh1eqRjFDEgpqndwNfyjauzJpe35akcW8N
 BiVUbNE0BOahHndFRSlegq84ClS2JTsnXcf4Iy8MXtL6r7rrT/9xd4CHVDkzfkuIGf
 h44GX08Zl0fSSiNTQpG1P6tIoL9ltBz86R/v/gKpL/USecjvF5Mk+DmRXkMb+rskDc
 T2cVCckd9AykFtztnB72GMmRUxCz7YhLgZt1h4ijFQ/LZMMghjsP+QuZUpdtJbix6S
 2FVnRofdWZxbP6CSImlmoiE7bd0BK3WeIxN7pi5ywyhpgHNh4yEc7hCYZ5xdq0QikE
 vRqKusMXQ/YBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=QIXVPw94
Subject: [Buildroot] [PATCH 1/1] package/pure-ftpd: remove optional
 dependency to libiconv
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 26d5d1c0a20719876220b429a43f8b1bcc29138b removed the
configure option --with-rfc2640 due to upstream commit:
https://github.com/jedisct1/pure-ftpd/commit/33eda763bfca8dfcf736275272b84602dcd18549

In the same upstream commit the iconv support was also removed because
it was only needed for rfc2640 support, this removal was forgotten in
the forementioned buildroot commit.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/pure-ftpd/pure-ftpd.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index ffd27d7b99..b918c70930 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -10,7 +10,6 @@ PURE_FTPD_SOURCE = pure-ftpd-$(PURE_FTPD_VERSION).tar.bz2
 PURE_FTPD_LICENSE = ISC
 PURE_FTPD_LICENSE_FILES = COPYING
 PURE_FTPD_CPE_ID_VENDOR = pureftpd
-PURE_FTPD_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 PURE_FTPD_CONF_OPTS = \
 	--with-altlog \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
