Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143D3C5B549
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 14:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD872607A4;
	Sat, 31 May 2025 14:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9xWtgaHvOmg0; Sat, 31 May 2025 14:39:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D79D8606F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D79D8606F4;
	Sat, 31 May 2025 14:39:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C0FF127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 14:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 622D260751
 for <buildroot@buildroot.org>; Sat, 31 May 2025 14:39:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JHLGYpD0e2pd for <buildroot@buildroot.org>;
 Sat, 31 May 2025 14:39:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AF2EC606F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF2EC606F4
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF2EC606F4
 for <buildroot@buildroot.org>; Sat, 31 May 2025 14:39:35 +0000 (UTC)
Received: from eos.home.n621.de (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id CCCD4E006AC;
 Sat, 31 May 2025 16:39:32 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Florian Larysch <fl@n621.de>
Date: Sat, 31 May 2025 16:39:22 +0200
Message-ID: <20250531143928.25446-2-fl@n621.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527152342.4288-1-fl@n621.de>
References: <20250527152342.4288-1-fl@n621.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1748702372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QKRCjFTt0J+SXjeaK9IeJ/LICV5p78So4pXSHZZxvG8=;
 b=U/h9COM0lCCZSkY/Y4f1qJQaSHokVqqtC2VbCKLqIpqcxZTelacwJRVIUoYUrRTgy3NTWT
 Tbk0FRMbAHBDKuWBCI4zACJ3pwv8CLErdWCgIrhIEJdtC+Rdy/jDE++kpMGioAp+uJijx2
 Y/DzydINFYETlk+afZ6zzz62ZvFWlyY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=U/h9COM0
Subject: [Buildroot] [PATCH v2 1/2] package/network-manager: make crypto
 library optional
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

The network-manager package currently pulls in either gnutls or libnss,
neither of which are very common and it might be the only reason why
they are present on a system.

However, most of NetworkManager works just fine without any cryptography
support, it only seems to be used in test cases and 802.1X support code.

Remove the dependency but use a library if it is present.

Note that this changes the default behavior. If network-manager was the
only package pulling in gnutls, it won't do this anymore and use the
"null" backend. Add a note about this to the manual.

Signed-off-by: Florian Larysch <fl@n621.de>
---
 docs/manual/migrating.adoc                 | 8 ++++++++
 package/network-manager/Config.in          | 1 -
 package/network-manager/network-manager.mk | 4 +++-
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index ac40197147..d5e13b1081 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -215,3 +215,11 @@ Cargo.lock file mandatory and the change from +.cargo/config+ to
 +.cargo/config.toml+, tarballs generated by Cargo-fetched packages
 have changed. Therefore the suffix of such tarballs has been changed
 from +-cargo2+ to +-cargo4+.
+
+[[migrating-2025.08]]
+=== Migrating to 2025.08
+
+In 2025.08, the network-manager package stopped selecting the gnutls package as
+a cryptography backend automatically. Manually enable the gnutls or libnss
+package if you require features that depend on a cryptography backend, such as
+certificate-based authentication.
diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index b388c573fe..c3d9f7b655 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -10,7 +10,6 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_WCHAR # libglib2
 	select BR2_PACKAGE_DBUS
-	select BR2_PACKAGE_GNUTLS if !BR2_PACKAGE_LIBNSS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBNDP
 	select BR2_PACKAGE_UTIL_LINUX
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index ab3a437838..4192f121c0 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -79,9 +79,11 @@ endif
 ifeq ($(BR2_PACKAGE_LIBNSS),y)
 NETWORK_MANAGER_DEPENDENCIES += libnss
 NETWORK_MANAGER_CONF_OPTS += -Dcrypto=nss
-else
+else ifeq ($(BR2_PACKAGE_GNUTLS),y)
 NETWORK_MANAGER_DEPENDENCIES += gnutls
 NETWORK_MANAGER_CONF_OPTS += -Dcrypto=gnutls
+else
+NETWORK_MANAGER_CONF_OPTS += -Dcrypto=null
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPSL),y)
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
