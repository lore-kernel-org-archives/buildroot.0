Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8456C5B549
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 14:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A47760751;
	Sat, 31 May 2025 14:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZEHDope3R4mX; Sat, 31 May 2025 14:39:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 133C2607BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 133C2607BC;
	Sat, 31 May 2025 14:39:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 64504117
 for <buildroot@buildroot.org>; Sat, 31 May 2025 14:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 569FD411E3
 for <buildroot@buildroot.org>; Sat, 31 May 2025 14:39:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HjQj0mv8SxMs for <buildroot@buildroot.org>;
 Sat, 31 May 2025 14:39:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0DBBD411C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DBBD411C0
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0DBBD411C0
 for <buildroot@buildroot.org>; Sat, 31 May 2025 14:39:36 +0000 (UTC)
Received: from eos.home.n621.de (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 3BF32E00912;
 Sat, 31 May 2025 16:39:34 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Florian Larysch <fl@n621.de>
Date: Sat, 31 May 2025 16:39:23 +0200
Message-ID: <20250531143928.25446-3-fl@n621.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527152342.4288-1-fl@n621.de>
References: <20250527152342.4288-1-fl@n621.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1748702374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G3Rsy3K9P15GSlDEWCbKOU2hZ2dPrvJGKbWNb7DiWyo=;
 b=hsNY6nXJfCgvN6B/Xy093kz98XJDX4kbQJIZYg8ITcmx2jmslp3CrbbMhG/36BSYGOwyko
 cEj7f8AoOGYLKHQm3/D3zzjDRAUrSQMw1C9qKUD0Q/PReM7vjwJopSo7aenL4ysYV2LJDc
 E25UPqTzJUtxYYvk3Jl/feWFFQF0704=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=hsNY6nXJ
Subject: [Buildroot] [PATCH v2 2/2] package/network-manager: switch default
 crypto provider to gnutls
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

Currently, when both libnss and GnuTLS are present, NetworkManager will
get linked to libnss.

The NetworkManager project doesn't recommend one over the other
officially and has supported both from day one back in 2007.

Arguments which one to prefer can be made in either direction:

Points in favor of libnss:

 - It's the default value in the NM build system, so it would be the
   preferred backend if both are available and we didn't supply any
   options to the build process

 - It's probably the more mature of the two, given that it's being used
   in Mozilla products

Points in favor of GnuTLS:

 - While both backends seem feature-equivalent, the
   _nm_crypto_verify_pkcs8 function is stubbed out in the libnss
   code[1].

 - Both Debian and Fedora explicitly select GnuTLS in their packages. At
   least in the case of Fedora it seems to have been a conscious
   choice[2].

Given what it's actually used for in the code base, the choice does not
matter a lot. However, since it is marginally more feature-complete and
seems to be preferred by other distributions, let's switch to GnuTLS.

[1] https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/36f8de25c487fe1570a19fe917c85ec065b0339e/src/libnm-crypto/nm-crypto-nss.c#L523-540
[2] https://src.fedoraproject.org/rpms/NetworkManager/c/29a9c41beafb5e549c10bfb50ee23ee47bdbc42f?branch=rawhide

Signed-off-by: Florian Larysch <fl@n621.de>
---
 package/network-manager/network-manager.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 4192f121c0..fff3f129ad 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -76,12 +76,12 @@ else
 NETWORK_MANAGER_CONF_OPTS += -Dconcheck=false
 endif
 
-ifeq ($(BR2_PACKAGE_LIBNSS),y)
-NETWORK_MANAGER_DEPENDENCIES += libnss
-NETWORK_MANAGER_CONF_OPTS += -Dcrypto=nss
-else ifeq ($(BR2_PACKAGE_GNUTLS),y)
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
 NETWORK_MANAGER_DEPENDENCIES += gnutls
 NETWORK_MANAGER_CONF_OPTS += -Dcrypto=gnutls
+else ifeq ($(BR2_PACKAGE_LIBNSS),y)
+NETWORK_MANAGER_DEPENDENCIES += libnss
+NETWORK_MANAGER_CONF_OPTS += -Dcrypto=nss
 else
 NETWORK_MANAGER_CONF_OPTS += -Dcrypto=null
 endif
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
