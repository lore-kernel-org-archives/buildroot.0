Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C969CD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 15:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2029A40121;
	Wed,  3 Apr 2024 15:38:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g0U10p9g1PmF; Wed,  3 Apr 2024 15:38:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1C4040135
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1C4040135;
	Wed,  3 Apr 2024 15:38:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A4F91BF5A0
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 15:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0701B60EAF
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 15:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ig0gIKhTRxTQ for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 15:38:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 49D6060E98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49D6060E98
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49D6060E98
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 15:38:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf33.dip0.t-ipconnect.de [79.214.207.51])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A1AE7A4C2AF2
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 17:36:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35774)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rs2fJ-000000000Rn-40PV
 for buildroot@buildroot.org; Wed, 03 Apr 2024 15:36:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 17:36:38 +0200
Message-Id: <20240403153641.4122789-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403153641.4122789-1-bernd@kuhls.net>
References: <20240403153641.4122789-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712158602;
 bh=CUGhdCczM4je4QB7HaCF7w1JB33b++a4vAA2AexEIiQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=VvxvZzGPLf82RjX7V1P2i96F2T9DVeKdnqyVtXiqlnvINqr+qE2fien8yvxCzhnVt
 IrUS1qytleqdHk8OEeJeiDEhgxZlC/zG9ts2drxsWBCuEQm46dHbBpfQ4s86F2Q0Qe
 Oz1GMZnw2y5wrWRv/D8dAXb2PfgbXYQAoQXtevOvrTAVfjUvePlE1mwJui5znWOnx0
 wgRqFb4xhZtNQNL30sx381m6D9HAy9+hr7YvyEVIp14MIbLAlJh4W8n3f0rtz6pEA4
 28KK1Ya9udfbJctG3J5CmAKNSWwsRrHNRwarRU3jb6/dEq/g8jq7W4KtZEM+WS2KNL
 oHoH8WxG99RbQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=VvxvZzGP
Subject: [Buildroot] [PATCH 6/9] package/lighttpd: add optional dependency
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

As glibc's libcrypt was providing lighttpd's libcrypt dependency this
broke the lighttpd build using glibc version 2.39.

To fix this select the libxcrypt dependency to lighttpd when using a
glibc toolchain and add the dependency if selected.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/lighttpd/Config.in   | 1 +
 package/lighttpd/lighttpd.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 5d9e624506..66532d7dd5 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIGHTTPD
 	bool "lighttpd"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_XXHASH
 	help
 	  lighttpd a secure, fast, compliant and very flexible
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 5109e3cebb..be8eda6b8d 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -30,6 +30,10 @@ LIGHTTPD_CONF_OPTS = \
 	-Dbuild_static=false \
 	-Dmoduledir=lib/lighttpd
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+LIGHTTPD_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_BROTLI),y)
 LIGHTTPD_DEPENDENCIES += brotli
 LIGHTTPD_CONF_OPTS += -Dwith_brotli=enabled
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
