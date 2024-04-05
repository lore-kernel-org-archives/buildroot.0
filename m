Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CC7C67861
	for <buildroot@archiver.kernel.org>; Fri,  5 Apr 2024 15:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50CE34191A;
	Fri,  5 Apr 2024 15:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AI3uHGD0xJpO; Fri,  5 Apr 2024 15:36:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 187774192D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 187774192D;
	Fri,  5 Apr 2024 15:36:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 19E441BF2B6
 for <buildroot@lists.busybox.net>; Fri,  5 Apr 2024 15:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06E84416A9
 for <buildroot@lists.busybox.net>; Fri,  5 Apr 2024 15:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x6reUSGMRYfN for <buildroot@lists.busybox.net>;
 Fri,  5 Apr 2024 15:36:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BAFDB416AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAFDB416AE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BAFDB416AE
 for <buildroot@buildroot.org>; Fri,  5 Apr 2024 15:36:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cabe.dip0.t-ipconnect.de [79.214.202.190])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 83081A4C1DD6;
 Fri,  5 Apr 2024 17:36:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51566)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rslc6-000000001mB-1O4m;
 Fri, 05 Apr 2024 15:36:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  5 Apr 2024 17:36:22 +0200
Message-Id: <20240405153622.3348696-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712331383;
 bh=3I0U61Ej6+G+ZLr+VkubD+yy08QvB+T4KN60S5MMdWY=;
 h=From:To:Cc:Subject:Date:From;
 b=u5ggviDAdG5BQ2tmwWy4ZBbwX09et5DXXXmoYrL1VErDUJ5a8ZVCUPPa7gJ5HCTML
 y1gP5v/U7u1g7r+XMO2xYfZTADBOzRdNWH6+1gsIGjk4sfC0UXjZrdZaqlkomd/SBY
 nRpX60dXVv+pAu7TZd6PzO7StK/CB826tSNFaVBaSRvd0fXWYfr39bzlZJG3vQY8QD
 YkGZXn4WcQIK8D5r9GS0D/nnAGaCUvZA8DDbvQeoXqX+GzYcld7ypOkndbXtptX4r/
 J3ky3LB3S96qySqqjyhM9JezDWd/YaZ3HjvlEWBthvBhddLK/J2UPymKvBHbNRZecd
 aG7McUB9xzycQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=u5ggviDA
Subject: [Buildroot] [PATCH 1/1] package/dropbear: add optional dependency
 to libxcrypt
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

When glibc was bumped to version 2.39 in commit
b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
libcrypt support.

Due to this removal dropbear was unable to accept connections using
password authentication.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
My knowledge about the internals of dropbear is non-existent but adding
libxcrypt fixed the connection problem which occured right after the
glibc bump.

 package/dropbear/Config.in   | 1 +
 package/dropbear/dropbear.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
index e14a670c19..6a9161d659 100644
--- a/package/dropbear/Config.in
+++ b/package/dropbear/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_DROPBEAR
 	bool "dropbear"
 	select BR2_PACKAGE_ZLIB if !BR2_PACKAGE_DROPBEAR_SMALL
 	select BR2_PACKAGE_LIBTOMCRYPT if !BR2_PACKAGE_DROPBEAR_SMALL
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  A small SSH 2 server designed for small memory environments.
 
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 7ac8a38559..56f565e016 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -39,6 +39,10 @@ ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 DROPBEAR_CONF_OPTS += --disable-static
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+DROPBEAR_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 define DROPBEAR_SVR_PAM_AUTH
 	echo '#define DROPBEAR_SVR_PASSWORD_AUTH 0'     >> $(@D)/localoptions.h
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
