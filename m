Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F909C7619A
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 05:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B49440194;
	Mon, 27 Mar 2023 05:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B49440194
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jlyoaies4hNt; Mon, 27 Mar 2023 05:37:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5596401B7;
	Mon, 27 Mar 2023 05:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5596401B7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B3A61BF3EA
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 05:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 805424098F
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 05:37:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 805424098F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FY1JVy1DgPdG for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 05:37:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 657784098C
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 657784098C
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 05:37:17 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id y15so9709443lfa.7
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 22:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679895434;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Efk8b+zhw64SYXnh0VT50L9vBEm1q+WZa4hC8QH8oo0=;
 b=UOoLkzwXPBBu1IgRFJj0zP1s00dbmoH0tXflkUHN3xvUIT2LDR+ut0lXLFcNfY4D8E
 KdXOiw/1VZw6HhAI2cLl7YIZLnMS7/PWF2p0MMdn+IB459PAo8Kr5HlA9eUGGL99GZvN
 VOuVgLKPxXVSckX69O5Zi83PA0nc0vyh0MAJWKDytqQSDRiHVTH6dJkrNnP9B+HAqrIm
 N4jdMh7QlL2X4VdF7503x6N2DUvE3uqdnZEl42d+ykjRLsfkW2Y91/dvODGsN+oRUHLj
 zWISEohoMtA3ICsy0y76csPM08g4JwWCvzfOrjgv1Dsc+1dg9Asy/XuFcRj3vIT42dDc
 8uWg==
X-Gm-Message-State: AAQBX9cnZherkWZ0ToUhqmJ7vGgvM4VNViBN+LrBqkPDNFGMMx3dpdRp
 LUlaEdtpvdOpKkIx7nh0uXCfDlXwZGY=
X-Google-Smtp-Source: AKy350a4h5PdkECJv5PhnXyb96uY57c4bZNSvOBRQcnxsfVdfuHtabTkDEb3FtjUipJ/HSb2wJzKDQ==
X-Received: by 2002:ac2:5547:0:b0:4db:1bab:98a4 with SMTP id
 l7-20020ac25547000000b004db1bab98a4mr2333168lfk.32.1679895434285; 
 Sun, 26 Mar 2023 22:37:14 -0700 (PDT)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 z12-20020ac24f8c000000b004ddef915fe4sm4492467lfs.274.2023.03.26.22.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Mar 2023 22:37:13 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Mar 2023 07:37:02 +0200
Message-Id: <20230327053702.517399-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679895434;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Efk8b+zhw64SYXnh0VT50L9vBEm1q+WZa4hC8QH8oo0=;
 b=ZcH4zN0SRH2ZOMu6vIloTC77a0sADAjQ+qq6GmUdvTx7K2t/VMaAXcILn8qYN8CAxd
 lxpLRqWQyWmko8PkZvJiFNRZUV9cRUF0xBkxFAbhi1m1GIpOWxqU7H8SpLZJmc1/BcwX
 uYvIlFWLYo7S8Vg6tpzVb5Nq+9iiekWTnYDApWP2gkbsx66oaoIT91akbdfXTGCeeptD
 3mWUkNh1+dNwfdajav1wTe3pGA/CpRNMe5l9WssH3q+bWwvAf2z7wVZNENNBL0AhObPO
 /kIR+N8sOTvGax8GAGqJfWs1LZ9VpYdog7Cc3EkDPZXosi+AHI0MJIDloJ2qbA81Kj87
 vPUQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZcH4zN0S
Subject: [Buildroot] [PATCH] package/libostree: bump to version 2023.2
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libostree/libostree.hash | 2 +-
 package/libostree/libostree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
index 63dfe98d80..db99b4b07b 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dd792b167693a1971c9f6e3168013d906ac035100ff6c719a3b322eb44b96f55  libostree-2023.1.tar.xz
+sha256  ceb0788755a0bff5738d44543552fbf883cf71df481baa3ca7288da7a402bb85  libostree-2023.2.tar.xz
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 4b17fcf391..367a833ac9 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2023.1
+LIBOSTREE_VERSION = 2023.2
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
