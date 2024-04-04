Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A35DCD1284
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 15:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 451B2417ED;
	Thu,  4 Apr 2024 15:34:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z8HVLBcIkVXU; Thu,  4 Apr 2024 15:34:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03F41418BE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03F41418BE;
	Thu,  4 Apr 2024 15:34:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B1ECA1BF232
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 15:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7EA583280
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 15:34:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XRHFcfaESRel for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 15:34:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E1D12821AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1D12821AB
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1D12821AB
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 15:34:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 153DB20002;
 Thu,  4 Apr 2024 15:34:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@48ers.dk>) id 1rsP6t-00E0Jr-0p;
 Thu, 04 Apr 2024 17:34:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu,  4 Apr 2024 17:34:36 +0200
Message-Id: <20240404153438.3337807-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 1/2] package/tiff: explicitly disable lerc
 support for host and target
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

We do not have liblerc in Buildroot and it may cause linking issues for
host-tiff on build hosts with liblerc:

libtool: link: /usr/bin/gcc -O2
-I/home/dragon/src/ft/ftcommunity-TXT/output/build/rootfs/per-package/host-tiff/host/include
-Wall -W -Wl,-rpath
-Wl,/home/dragon/src/ft/ftcommunity-TXT/output/build/rootfs/per-package/host-tiff/host/lib
-o tiffcp tiffcp.o
-L/home/dragon/src/ft/ftcommunity-TXT/output/build/rootfs/per-package/host-tiff/host/lib
../libtiff/.libs/libtiff.so ../port/.libs/libport.a -lLerc -ljbig -lm
-Wl,-rpath
-Wl,/home/dragon/src/ft/ftcommunity-TXT/output/build/rootfs/build/host-tiff-4.6.0/libtiff/.libs
-Wl,-rpath
-Wl,/home/dragon/src/ft/ftcommunity-TXT/output/build/rootfs/per-package/host-tiff/host/lib
/usr/bin/ld: ../libtiff/.libs/libtiff.so: undefined reference to
`deflateInit_'
/usr/bin/ld: ../libtiff/.libs/libtiff.so: undefined reference to `deflate'
/usr/bin/ld: ../libtiff/.libs/libtiff.so: undefined reference to
`deflateEnd'
/usr/bin/ld: ../libtiff/.libs/libtiff.so: undefined reference to `inflate'

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tiff/tiff.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index e384e8b814..8ec53d4fe1 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -16,6 +16,7 @@ TIFF_INSTALL_STAGING = YES
 # support in tiff, or that would create a circular dependency.
 TIFF_CONF_OPTS = \
 	--disable-contrib \
+	--disable-lerc \
 	--disable-tests \
 	--disable-webp
 
@@ -24,6 +25,7 @@ TIFF_DEPENDENCIES = host-pkgconf
 HOST_TIFF_CONF_OPTS = \
 	--disable-cxx \
 	--disable-zlib \
+	--disable-lerc \
 	--disable-libdeflate \
 	--disable-lzma \
 	--disable-jpeg \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
