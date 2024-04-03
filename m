Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFF9CD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 15:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6748D40806;
	Wed,  3 Apr 2024 15:38:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jGOdECborcBN; Wed,  3 Apr 2024 15:38:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 237AC41574
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 237AC41574;
	Wed,  3 Apr 2024 15:38:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 065771BF5A0
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 15:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00F83821FC
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 15:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bj98xHaWk3D3 for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 15:38:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 059CD821FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 059CD821FB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 059CD821FB
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 15:38:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf33.dip0.t-ipconnect.de [79.214.207.51])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 90576A4C2AC0
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 17:36:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35774)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rs2fK-000000000Rn-026z
 for buildroot@buildroot.org; Wed, 03 Apr 2024 15:36:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 17:36:39 +0200
Message-Id: <20240403153641.4122789-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403153641.4122789-1-bernd@kuhls.net>
References: <20240403153641.4122789-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712158602;
 bh=ieHotwLLQXwif5CbwieU6TGQxhd+KVYLR1jL8B9SVjE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rYlZtn2p4ArVtCz6iyHSmZAfbZChqWNhJZRq3K8lBD1QsZDgpqimVxFHlnANnOwDr
 Y+h5iiYrDwu6p1W5CwJCXU8yTHEfM8302sRvQ3seK/Ze4A+e9BoYt4Te6zUPz8Y/PP
 ky3Gt0TOmDDFq17F1k8aCBTEgPz72SdeUAGgt1sV2xH7CXjjjM2/bDPRk4u0vEOmrO
 dhQvhT5h93e8V4ylA5QPBYv0MFmm7MDoWU4WfU7pglIh3BJF5eqhjbzuEFm7CWpO3n
 ket6uWtBp4OCRQtMpcgLkNkgvC0NQtqKvZG/+mAXIZ9k1464cJsBnpkjHiwED8jmy/
 XBCEkj5ggd5Ag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=rYlZtn2p
Subject: [Buildroot] [PATCH 7/9] package/pure-ftpd: add optional dependency
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

As glibc's libcrypt was providing pure-ftpd's libcrypt dependency this
broke the pure-ftpd build using glibc version 2.39.

To fix this select the libxcrypt dependency to pure-ftpd when using a
glibc toolchain and add the dependency if selected.

Fixes:
http://autobuild.buildroot.net/results/2a62f48973b30873f4da842e75176633398bef86/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/pure-ftpd/Config.in    | 1 +
 package/pure-ftpd/pure-ftpd.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/pure-ftpd/Config.in b/package/pure-ftpd/Config.in
index c060102650..edfe0159e3 100644
--- a/package/pure-ftpd/Config.in
+++ b/package/pure-ftpd/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PURE_FTPD
 	bool "pure-ftpd"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Pure-FTPd is a free (BSD), secure, production-quality and
 	  standard- conformant FTP server. It doesn't provide useless
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index b918c70930..2c01bc8804 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -30,6 +30,10 @@ ifeq ($(BR2_PACKAGE_LIBSODIUM),y)
 PURE_FTPD_DEPENDENCIES += libsodium
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+PURE_FTPD_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_MARIADB),y)
 PURE_FTPD_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr
 PURE_FTPD_DEPENDENCIES += mariadb
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
