Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EADACD1292
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 15:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ED17415EB;
	Wed,  3 Apr 2024 15:37:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MvIdmKqcmG5i; Wed,  3 Apr 2024 15:37:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C8A741488
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C8A741488;
	Wed,  3 Apr 2024 15:37:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5DBBA1BF5A0
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 15:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B511400E4
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 15:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s12SYbFy19pT for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 15:37:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EC5DE4178C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC5DE4178C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC5DE4178C
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 15:37:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf33.dip0.t-ipconnect.de [79.214.207.51])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 819B3A4C2ABC
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 17:36:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35774)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rs2fJ-000000000Rn-3m8S
 for buildroot@buildroot.org; Wed, 03 Apr 2024 15:36:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 17:36:37 +0200
Message-Id: <20240403153641.4122789-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403153641.4122789-1-bernd@kuhls.net>
References: <20240403153641.4122789-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712158602;
 bh=3bfcnDV8Wbv4U0QmAj2vGcNT3mZh6A+ZFYF6cmLxpz8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=yJtsV/o1z3yeUYhOPQuWSSXucHp57bv9yOT/mNR88k2/HVCWHoyNQ2jF3W41GEgXw
 L2cRdbQskj8yq90t8fncolFafxPCpYVB3zzBXialbjWc4ZJs1UQ3ZWlE64MxmTk7Oo
 4ROhFQIIIRnbiHIVbWts4CsORulDOhZRpkF//hR/ROMLwuxGr3vQGLMy3eehDL66W7
 oIkSDjdT6Eib9fjpos+MN1Mx9yJDFOGpcBSfj57dw2OATdu8tz602/Hnzwp0o0UxLC
 liCCe2oKyBsPzwuAB+5zaNWTwZ40bEPTwH9ZvGl/vv36J6LZD+2HzM9IoS0x3XXzTB
 lFBwVpmoE1L7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=yJtsV/o1
Subject: [Buildroot] [PATCH 5/9] package/leafnode2: add optional dependency
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

As glibc's libcrypt was providing leafnode2's libcrypt dependency this
broke the leafnode2 build using glibc version 2.39.

To fix this select the libxcrypt dependency to leafnode2 when using a
glibc toolchain and add the dependency if selected.

Fixes:
http://autobuild.buildroot.net/results/08f86ce128623105087cda0c5b32a1d0d0cfa166/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/leafnode2/Config.in    | 1 +
 package/leafnode2/leafnode2.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/leafnode2/Config.in b/package/leafnode2/Config.in
index 3700b6fb80..df9b246946 100644
--- a/package/leafnode2/Config.in
+++ b/package/leafnode2/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LEAFNODE2
 	bool "leafnode2"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_PCRE
 	help
 	  Leafnode-2 is a store-and-forward NNTP (or Usenet) proxy
diff --git a/package/leafnode2/leafnode2.mk b/package/leafnode2/leafnode2.mk
index 3ed2e20266..cba6b1f72a 100644
--- a/package/leafnode2/leafnode2.mk
+++ b/package/leafnode2/leafnode2.mk
@@ -14,6 +14,10 @@ LEAFNODE2_AUTORECONF = YES
 LEAFNODE2_CONF_ENV = \
 	PCRECONFIG="$(STAGING_DIR)/usr/bin/pcre-config"
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+LEAFNODE2_DEPENDENCIES += libxcrypt
+endif
+
 # --enable-runas-user use 'news' as default but the configure stop
 # if news doesn't exist on the build host.
 # Use 'root' while cross-compiling
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
