Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294E2C433F5
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 07:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0B7541BB8;
	Wed, 30 Mar 2022 07:14:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cEo3hOA8xN5o; Wed, 30 Mar 2022 07:14:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B7AE41BA5;
	Wed, 30 Mar 2022 07:14:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FCB21BF5E0
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 07:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E1108131A
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 07:14:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L9GJsKB_5Rfw for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 07:14:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2EEA80E48
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 07:14:51 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id e22so23753377ioe.11
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 00:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X5X600nlNnDbYNnZc5QX1g9Wn+Ckm3sBED7eOPD03/Q=;
 b=GnT5KXjb1zxflDQdq++NX4/+NwUlS1td+QR5cLQq8oloUbi4Ho+vUyw1Y//iw2iJOX
 n7Mlt3zX/eAj4OFAoc0tXL6LVdjeJF7N//d7tajtwGD1I98PdrWQsOD77k6fEDiqjk7S
 +eT/ugTzsweWcimsZNHvt3nuNhk0/iEfZ8kShdziCaZ4ze9xkFywHNeW/73NZQGQPzS6
 elElm+mbZet/8XADCTHUayTReH1XBytNnGt+LSIu7LS8L6pTP48ey1cXmCx3nwPKhkUm
 Xh3hQUIYrA7JHpS2yDDReut8z/f0KwGeuZKUJHdnPrS46S279NAbzhe/XhiiuFkxvKsy
 qiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X5X600nlNnDbYNnZc5QX1g9Wn+Ckm3sBED7eOPD03/Q=;
 b=dsaN9XUPVPJRo95f2n2inDKZt8fZ57Jh7TZoEDnfKEdK9wnJDrm9J2pZ8pAFY6tfiJ
 f0QVdFvPAvDbGrbnYGpUyv7K2TDjypNNO/hmx8G+Cx4QIxxcGEadGrxz05ygLzXxvDTM
 XoMJmrdYhf1QyaHvHUQeqbcH7fPYwD1iXVtB9r92ZSbzADbGFJ3REI+UP/8TiRcPqYGr
 yVNOibB8nowqO2GflQwmPnLfJt43+mbyaLAbq5MljJVRuna8vfy9tJZlrDPveg33suV7
 +FfvtF6Pal8hbg7bJtLBYdQgBpbuOaCYZWuFCoQDuskqV9gCuBvWHEsuWc9QMmu6QQSO
 gqkA==
X-Gm-Message-State: AOAM53064lza2TGRQLwTH5qNHFvQsL+sEXt1PjGe0Vh5ynQN4ftIgNQz
 YwLuQTY5PCMUGX4juj6/cQHes+MAg4PUWA==
X-Google-Smtp-Source: ABdhPJx3hUzygIoRrRwC9o4g0keGa44OzGvfpkisG8vpmHdawWvDlsJEmSoSCNjbBWcal3zoKxiz+Q==
X-Received: by 2002:a6b:fb15:0:b0:64c:9b3a:2182 with SMTP id
 h21-20020a6bfb15000000b0064c9b3a2182mr1152269iog.211.1648624490823; 
 Wed, 30 Mar 2022 00:14:50 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 r4-20020a924404000000b002c9dc82ab11sm1358805ila.79.2022.03.30.00.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 00:14:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 30 Mar 2022 01:14:49 -0600
Message-Id: <20220330071449.4060342-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cog: bump to version 0.12.4
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/cog/cog.hash | 8 ++++----
 package/cog/cog.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index 839b12e619..00d3a4e191 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/cog-0.12.1.tar.xz.sums
-md5  25a80a5a8a52b8873933a128151b8928  cog-0.12.1.tar.xz
-sha1  3b9f67bc23cd9e3db2221366d6cde4ca0b06b811  cog-0.12.1.tar.xz
-sha256  23caaafa2ef5c2f6a97d467fcce908ea71087ad03b72deb9280225c0dd561c91  cog-0.12.1.tar.xz
+# From https://wpewebkit.org/releases/cog-0.12.4.tar.xz.sums
+md5  cdb8acdc3acc9b5082e7db9c279155c3  cog-0.12.4.tar.xz
+sha1  600b30efadf55bf94ea5062a0a1b2ea0b74053e5  cog-0.12.4.tar.xz
+sha256  9983c621c8e14fca3792ff566cb6b86d6a1f17446eb4c083af4a5a749112982f  cog-0.12.4.tar.xz
 
 # Hashes for license files:
 sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index 2f6ef402fb..f2ca0af93d 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = 0.12.1
+COG_VERSION = 0.12.4
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
