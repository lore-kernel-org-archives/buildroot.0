Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3D2C25B75
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 14:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A14EE40493;
	Wed, 15 May 2024 14:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X3iplAUtggdu; Wed, 15 May 2024 14:59:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3F7C404DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3F7C404DC;
	Wed, 15 May 2024 14:59:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C2E631BF232
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 14:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB86A41AC7
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 14:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lB-EeRxf2PNS for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 14:59:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A281D404C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A281D404C3
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A281D404C3
 for <buildroot@buildroot.org>; Wed, 15 May 2024 14:59:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07BE260008;
 Wed, 15 May 2024 14:59:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1s7G62-001WUi-17;
 Wed, 15 May 2024 16:59:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 May 2024 16:59:02 +0200
Message-Id: <20240515145903.363218-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/libvncserver: correct
 WITH_THREADS=ON/OFF logic
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

Commit ee59023794f5540e5 (package/libvncserver: bump to version 0.9.12)
changes the package from autotools to cmake and accidently inverted the
threads logic.

The reason this was not noticed is that the build system verifies if threads
support works and otherwise disables it even when -DWITH_THREADS=ON is
passed, E.G.  for a nothread configuration:

cmake ... -DWITH_THREADS=ON ...
..
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Failed
-- Looking for pthread_create in pthreads
-- Looking for pthread_create in pthreads - not found
-- Looking for pthread_create in pthread
-- Looking for pthread_create in pthread - not found

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvncserver/libvncserver.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index 3a15a82d08..082f838f12 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -22,7 +22,7 @@ LIBVNCSERVER_CONF_OPTS += \
 	-DWITH_SDL=OFF \
 	-DWITH_TESTS=OFF
 
-ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIBVNCSERVER_CONF_OPTS += -DWITH_THREADS=ON
 else
 LIBVNCSERVER_CONF_OPTS += -DWITH_THREADS=OFF
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
