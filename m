Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89BEAD116F6
	for <buildroot@archiver.kernel.org>; Mon,  1 Dec 2025 20:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3757361169;
	Mon,  1 Dec 2025 20:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PgotbUDe5hez; Mon,  1 Dec 2025 20:08:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E53061141
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E53061141;
	Mon,  1 Dec 2025 20:08:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 55DBC1A9
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 20:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B2AC40671
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 20:08:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XLyriJSwUTRt for <buildroot@buildroot.org>;
 Mon,  1 Dec 2025 20:08:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8D96940993
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D96940993
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D96940993
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 20:08:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 021E7A4C77FA
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 21:08:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46622)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQABt-000000004cf-0zRz
 for buildroot@buildroot.org; Mon, 01 Dec 2025 20:08:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  1 Dec 2025 21:08:09 +0100
Message-ID: <20251201200809.3844365-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764619690;
 bh=OqZSHdWtToSDwZjwD7lR1q6Wdbudn7EmkOCCSSqtlG8=;
 h=From:To:Subject:Date:From;
 b=OddlVkCQsVcGks7Jx3insK1RuNgyEJCRxHY9uTCKHSg3/RvvbrVrlCtFA2FSMZmRj
 dRSQFT27V8Y7dGEscw46bE3yXkt6HnMlB9AMcsfNpM1fYXJ/UOrKySComtyOJPlRp7
 XmrpgnnEg0sZdJeh+zBUUrexyJQBSXSHa215I35/GdU96qTBpstYhPeE4GFGXeDK/E
 vxJ53ejhTfGT7yO1EzCh2YD9TT2PKaHC3PlDWDYA6q1QWCpNUdW5fccnHxeM8eI2Ed
 20FoQvEPgody6eE8NmlT6h8cGx/ee3I8e4m4GkSMoshlqJdlookR1RATAzrCv61gDd
 eIHk6VWE6YImA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=OddlVkCQ
Subject: [Buildroot] [PATCH/next 1/1] package/riemann-c-client: bump version
 to 2.2.2
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

Moved _SITE to https://git.madhouse-project.org/algernon/riemann-c-client
according to https://github.com/collectd/collectd/issues/4021#issuecomment-1218597353
(collectd is the only package in buildroot using riemann-c-client)

Release notes:
https://git.madhouse-project.org/algernon/riemann-c-client/src/tag/riemann-c-client-2.2.2/NEWS.md

Updated licenses due to upstream commit
https://git.madhouse-project.org/algernon/riemann-c-client/commit/9bada2fabff9124245426baf7beb18e1e9480b17

Added optional dependencies to OpenSSL and wolfSSL.

Fixes:
https://autobuild.buildroot.net/results/29d/29d03e9ba24ae9d17ff7ad57e4906c30413d8a6e/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../riemann-c-client/riemann-c-client.hash    |  5 ++--
 package/riemann-c-client/riemann-c-client.mk  | 27 ++++++++++++++-----
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/package/riemann-c-client/riemann-c-client.hash b/package/riemann-c-client/riemann-c-client.hash
index 43d4cd45c4..9daefc9c19 100644
--- a/package/riemann-c-client/riemann-c-client.hash
+++ b/package/riemann-c-client/riemann-c-client.hash
@@ -1,3 +1,4 @@
 # Locally calculated
-sha256  568416d854d1c1e5eac743c9f56db6fa0d6a8144daa74a799d0556bb6b50e679  riemann-c-client-1.10.5.tar.gz
-sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE
+sha256  468c2d6cb4095e581927005a1dab13656f5a9355e4c68a3a25fceb5c6798a72f  riemann-c-client-2.2.2.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSES/Apache-2.0.txt
+sha256  6fc9e709ccbfe0d77fbffa2427a983282be2eb88e47b1cdb49f21a83b4d1e665  LICENSES/EUPL-1.2.txt
diff --git a/package/riemann-c-client/riemann-c-client.mk b/package/riemann-c-client/riemann-c-client.mk
index f942d560c8..e7f0dfd991 100644
--- a/package/riemann-c-client/riemann-c-client.mk
+++ b/package/riemann-c-client/riemann-c-client.mk
@@ -4,18 +4,33 @@
 #
 ################################################################################
 
-RIEMANN_C_CLIENT_VERSION = 1.10.5
-RIEMANN_C_CLIENT_SITE = \
-	$(call github,algernon,riemann-c-client,riemann-c-client-$(RIEMANN_C_CLIENT_VERSION))
-RIEMANN_C_CLIENT_LICENSE = LGPL-3.0+
-RIEMANN_C_CLIENT_LICENSE_FILES = LICENSE
+RIEMANN_C_CLIENT_VERSION = 2.2.2
+RIEMANN_C_CLIENT_SITE = https://git.madhouse-project.org/algernon/riemann-c-client/archive
+RIEMANN_C_CLIENT_LICENSE = \
+	Apache-2.0 (for lib/riemann/proto/), \
+	EUPL-1.2
+RIEMANN_C_CLIENT_LICENSE_FILES = \
+	LICENSES/Apache-2.0.txt \
+	LICENSES/EUPL-1.2.txt
 RIEMANN_C_CLIENT_INSTALL_STAGING = YES
 RIEMANN_C_CLIENT_MAKE = $(MAKE1)
 # From git
 RIEMANN_C_CLIENT_AUTORECONF = YES
 RIEMANN_C_CLIENT_DEPENDENCIES = \
 	host-pkgconf protobuf-c \
-	$(if $(BR2_PACKAGE_GNUTLS),gnutls) \
 	$(if $(BR2_PACKAGE_JSON_C),json-c)
 
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+RIEMANN_C_CLIENT_CONF_OPTS += --with-tls=gnutls
+RIEMANN_C_CLIENT_DEPENDENCIES += gnutls
+else ifeq ($(BR2_PACKAGE_OPENSSL),y)
+RIEMANN_C_CLIENT_CONF_OPTS += --with-tls=openssl
+RIEMANN_C_CLIENT_DEPENDENCIES += openssl
+else ifeq ($(BR2_PACKAGE_WOLFSSL),y)
+RIEMANN_C_CLIENT_CONF_OPTS += --with-tls=wolfssl
+RIEMANN_C_CLIENT_DEPENDENCIES += wolfssl
+else
+RIEMANN_C_CLIENT_CONF_OPTS += --without-tls
+endif
+
 $(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
