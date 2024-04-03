Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B37DCD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 15:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4111841560;
	Wed,  3 Apr 2024 15:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aSnXK4KB930u; Wed,  3 Apr 2024 15:37:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17860415B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17860415B9;
	Wed,  3 Apr 2024 15:37:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 302B21BF5A0
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 15:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CE4C60EBE
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 15:37:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D_ohuvd64pHu for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 15:37:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5731260EBC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5731260EBC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5731260EBC
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 15:37:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf33.dip0.t-ipconnect.de [79.214.207.51])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 95C74A4C2AF1
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 17:36:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35774)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rs2fK-000000000Rn-0GQf
 for buildroot@buildroot.org; Wed, 03 Apr 2024 15:36:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 17:36:40 +0200
Message-Id: <20240403153641.4122789-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403153641.4122789-1-bernd@kuhls.net>
References: <20240403153641.4122789-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712158602;
 bh=jgGMW0V52KKDyBoxHqHDtFYFYGtGy3ey9II8WLdLXkE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mngYhlnptrRU8aHUSzkE3AZXV/zsziR8jwn2DgOmMkWNZS5RTe5yIKxaIt0TZ990q
 xycPjuiKDw/nUFIU65/U2vfOzZuqSbyYOdINNu7jcV25+oCfYqxZ4v4b6HwuRyj5Uu
 bOGu2GXzT2pypkHpXyMJ0thYMsfwz3lYp3z/s8aRnvZ1KqXUjXjGfDqxTzBqHk0c3D
 SIGpAbvTDvoJ4fN57mSncpVVTkOnuL81NADMufiG+Gzm8adzQrIhSgZKG7RgIoPB+F
 Gsn56SMa8jCMEVHf9uMqGU5hH7PvbRB/5YJ0L2hNQNf/JJqrCUausRyO3eUQ6dPwk0
 M2f1y1WuhZohw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=mngYhlnp
Subject: [Buildroot] [PATCH 8/9] package/squid: add optional dependency to
 libxcrypt
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

As glibc's libcrypt was providing squid's libcrypt dependency this
broke the squid build using glibc version 2.39.

To fix this select the libxcrypt dependency to squid when using a
glibc toolchain and add the dependency if selected.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/squid/Config.in | 1 +
 package/squid/squid.mk  | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/squid/Config.in b/package/squid/Config.in
index 149884d815..ab13e735e1 100644
--- a/package/squid/Config.in
+++ b/package/squid/Config.in
@@ -17,6 +17,7 @@ config BR2_PACKAGE_SQUID
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_LIBTOOL
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBXML2
 	help
 	  Caching proxy for the Web supporting HTTP, HTTPS, FTP, and
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 6a2b522336..e325c63cb0 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -52,6 +52,10 @@ else
 SQUID_CONF_OPTS += --without-mit-krb5
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+SQUID_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SQUID_CONF_OPTS += --with-openssl
 SQUID_DEPENDENCIES += openssl
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
