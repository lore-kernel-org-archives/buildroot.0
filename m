Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE2DCE8E68
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 11:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B2B280B63;
	Thu, 24 Oct 2024 11:51:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r5vp-ZINtcYW; Thu, 24 Oct 2024 11:51:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F65D80AFD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F65D80AFD;
	Thu, 24 Oct 2024 11:51:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 28804972
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 11:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 229B560703
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 11:51:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sbSUUJN0JTCM for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 11:51:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3212C606FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3212C606FA
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3212C606FA
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 11:51:38 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 75A8C352067A; Thu, 24 Oct 2024 13:51:36 +0200 (CEST)
Date: Thu, 24 Oct 2024 13:51:36 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zxo0yMFb5cgU6lyR@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1729770696; bh=V5webEs/DFN+5JWQNbk7SKwnFSJSe1H0h1xzg427GdY=;
 h=Date:From:To:Subject:From;
 b=uTtFjuXFZsW58rSm982RuIVBgBRVuC9g4LNEFX5bzRpgMPTBozY7MP22mLjUIH4ls
 VGSot1CYd/ZwbXim9nSehTOZvKglPRtewMWsN8Nabmnfo0fl3HfNVJp9pECcdg6YKm
 IHF1SYKDiCLkq+N8TksqrdkiQ+Rl8JS8SekDz3XHe6Ur3LkE6XKA/kIDqoJoz/CGgT
 MHQ8jbckfdqKA8OmefpWtG+Ae4iDiQSmbzZSN/AeKSYJB8d4gXBD+HTeSafF+/Q+ST
 9/CZlkZt8V3xPUr6skHXNSNd7TuUfZQUn2vF5wTDyyiZNf8qztwL/UmqcIPp8xNYJI
 6l5rFq9qOKCYg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=uTtFjuXF
Subject: [Buildroot] [PATCH] package/asterisk: update to 20.10.0
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

See here for a changelog:
https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-20.10.0.md

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index fe3e3642a4..61686d9fe4 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  a15099a5c776045e96b0da2534606c8dbd13bc1ffcbe325f7cfd74dc1d29decb  asterisk-20.9.3.tar.gz
+sha256  a8162085b7d16f10d5cd16fc2e2cb8399dbe42bd1c321b14eec229fc0ed12570  asterisk-20.10.0.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index c7b97a1ad4..e27aa2f760 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 20.9.3
+ASTERISK_VERSION = 20.10.0
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
