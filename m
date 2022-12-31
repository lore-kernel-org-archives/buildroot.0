Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EA1C4332F
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 16:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC5268129B;
	Sat, 31 Dec 2022 16:41:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC5268129B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fXA6wP8f8tPV; Sat, 31 Dec 2022 16:41:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29885812AF;
	Sat, 31 Dec 2022 16:41:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29885812AF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF7DD1BF47D
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 16:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6BF540895
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 16:41:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6BF540895
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ihVMRnqu5_c5 for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 16:41:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6B77404CA
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6B77404CA
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 16:41:46 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id n3so21993944wrc.5
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 08:41:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W5fsmmORd8cG+FZyqq3g+ZUQz51ZqlyuxEKsrj7cVHU=;
 b=gCbeoduVmNSprycd7cRJ2BDxs8aJRN3kl0qhh5Q5kfIUd3EEyVJaKdOYDRj/y37c+w
 qw5YPJZxlSJC/GXZqqBzRe7y19hHnrTz2sS+U1YA6/i+ZjmTqhugAfpWMUn0V+bsJsSC
 8tms3/3dKTdRGEAudb1jZZtwmnDyPnyVXhcwTTwBketHGMeTnaYf6J5wwLMsiMyU3vJq
 Ia3qbTXK/3LEN+2YGnXHyWJXk+l8l2xB4arXSNk7zRaMEmDjw8CQWZbYkTxfAcnPi9Wm
 sw80MZqq7Oc4uXxrxwz/D3rYhyvqs3QYGivELg6HSIm0gOmljb3L+vNCgfpRNcUc4UAR
 IRIg==
X-Gm-Message-State: AFqh2kqGTYhs57jV00pQ3d9qbjBEOX7jATYpGOG0tdA/3HK5vA7cKELb
 D1Fa8nOZTuY5EDE1aSdQ5N2mIDeb6Sk=
X-Google-Smtp-Source: AMrXdXvN+C8U/+4zf3n9M4Lww1eHm2EN6UtpSnTa9XjNIpNrkB2HByHBtPpob47o0ubQnvySRBwmyQ==
X-Received: by 2002:a5d:49c9:0:b0:28f:5aa6:8d97 with SMTP id
 t9-20020a5d49c9000000b0028f5aa68d97mr4144371wrs.22.1672504904345; 
 Sat, 31 Dec 2022 08:41:44 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 j1-20020adfff81000000b0024cb961b6aesm23054482wrr.104.2022.12.31.08.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Dec 2022 08:41:43 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Dec 2022 17:41:41 +0100
Message-Id: <20221231164141.160482-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W5fsmmORd8cG+FZyqq3g+ZUQz51ZqlyuxEKsrj7cVHU=;
 b=cbvdn7Nl1Yk86gEw2ct2bPfxkgCe4tdd1qDs4ELFBd9XLigmq8HFGGXAzoAHB8ayUg
 i3PF1wtztKszVt29uvd6KifsQJBATHc9c+bIBprHijkw4CZ6HGOqu4CecOYTT578daZb
 dUWBpkzQiXC1idXQr12rP1hiqQ88i6csvoTGQBjaaIUx0NN/tjzwNfLET64qno97q6rK
 BF1IkwBbK1O6wgrtOAmnBqLN28cct6HJ+ZP9v0SD898iE4j/t+D5kBoA1408GFD0+3Vz
 chFRL0vVNz4OZ60Nmsnl39+AaAjEEAhlbL/yWP5o4btCKs0O4uK4NBSYWDQwb0TooYkv
 V1xw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cbvdn7Nl
Subject: [Buildroot] [PATCH 1/1] package/janus-gateway: bump to version 1.1.1
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
Cc: Gregory Dymarek <gregd72002@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/meetecho/janus-gateway/blob/v1.1.1/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/janus-gateway/janus-gateway.hash | 2 +-
 package/janus-gateway/janus-gateway.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/janus-gateway/janus-gateway.hash b/package/janus-gateway/janus-gateway.hash
index 5d73ede87f..7a87ae737a 100644
--- a/package/janus-gateway/janus-gateway.hash
+++ b/package/janus-gateway/janus-gateway.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5b8a7304761783585bfa8db7471bf8c393fa2a0ffc346747afadc0c1a9d213f5  janus-gateway-1.0.3.tar.gz
+sha256  bb83c19d6137e39833e8eb2b1deeecb33b5d19d4f503d51703bdcc478c447940  janus-gateway-1.1.1.tar.gz
 sha256  91d04c97fa1da3fcd28205873276358aafc071c5b00a9ea8c49dd06d487a9dc6  COPYING
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 9a74350b2c..0d906f1b62 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANUS_GATEWAY_VERSION = 1.0.3
+JANUS_GATEWAY_VERSION = 1.1.1
 JANUS_GATEWAY_SITE = $(call github,meetecho,janus-gateway,v$(JANUS_GATEWAY_VERSION))
 JANUS_GATEWAY_LICENSE = GPL-3.0 with OpenSSL exception
 JANUS_GATEWAY_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
