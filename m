Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21046C3DA64
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 08:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D50C6406F2;
	Wed, 31 Jul 2024 08:10:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VxpzLlBM0lwa; Wed, 31 Jul 2024 08:10:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F5B640710
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F5B640710;
	Wed, 31 Jul 2024 08:10:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B866F1BF57B
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 08:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6ABD60A77
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 08:10:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lblGKt99qeRr for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 08:10:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 867B36065D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 867B36065D
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 867B36065D
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 08:10:21 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 4C61F352115C; Wed, 31 Jul 2024 10:10:19 +0200 (CEST)
Date: Wed, 31 Jul 2024 10:10:19 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZqnxazbddLIiWfuP@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1722413419; bh=mb+3UWmS4tEpenRxVyY/HnFgPaFoCGABxSHu/E0OhZI=;
 h=Date:From:To:Subject:From;
 b=gb4fhP6RTqV5BXZX1m6ztvyAuq/4aZ44dtjKWqcfaWPpPdEY7d6EX/TqHbZwfpIm+
 pZqyZ8JPCFaapPD2N7HP7sSf0H5Is7YgObQFZVQm8NAgnQJA6XfTgTeY5E0oal+j+t
 700J43bGq92WUAIRTPZhLWioYp85S9IVCbrSOzw/uzzrv2CDZzfeRrgiSTCqqzXcNP
 tF8SC/9yJQIJq0GxbXAf9TNjvyfo5BuDRdu9GxCyiZX/vuYF1opqKLrkRgXI5UaWX5
 5Td3seXsbxl4Xp1gzJ9Nd9HT6A3Xyb5vyFNpfLboArHzYLz9yuICaqCALNKoQwBHh4
 2YdVUWFH4Rz4Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=gb4fhP6R
Subject: [Buildroot] [PATCH] package/asterisk: update to 20.9.1
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

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index bff34b37bb..ee21d88d98 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  bea2978c41d0f69f7197536c35c2d80cbfdf7db826f48c0741b6f66462981d2f  asterisk-20.8.1.tar.gz
+sha256  c928c715dc5ff783ea6cf62cca3eebdc1dc9c5d40ce9b37b0213c0eac7f4090f  asterisk-20.9.1.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 3d41285c78..64ec740d46 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 20.8.1
+ASTERISK_VERSION = 20.9.1
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
