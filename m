Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190E3C433FE
	for <buildroot@archiver.kernel.org>; Sun,  9 Oct 2022 08:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6996482444;
	Sun,  9 Oct 2022 08:41:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6996482444
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P6fUIgQTsoce; Sun,  9 Oct 2022 08:41:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 869B28174F;
	Sun,  9 Oct 2022 08:41:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 869B28174F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F9261BF397
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 08:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 289DB410D1
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 08:41:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 289DB410D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5atGe1gQIZAd for <buildroot@lists.busybox.net>;
 Sun,  9 Oct 2022 08:41:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71362410C4
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71362410C4
 for <buildroot@buildroot.org>; Sun,  9 Oct 2022 08:41:42 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id b1so7741834lfs.7
 for <buildroot@buildroot.org>; Sun, 09 Oct 2022 01:41:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l6gZSsMQnhmwX2aMnXRVlqJiQoAIjHmQCG5ZdUsY8sU=;
 b=NRXQeYIl2Pb90Fihh8LC/yDSJ235UKGt/TN/T6IVeSjKz2Tt2SBNK/kjNbRD8LZ9OJ
 xz+ttuTqZ/TbPirUr2+hkzEUokdXtalJEyZ5AsVdVs+NA51GTN9ZiFoXdByDcEKwTFFb
 RU8XOfpHjOedx85nfxxKSmmigKig4M3FVNuGxKTuO6Q6tQxMA0z0YnpaYuA/hCbJj9Ov
 otY9e9qgQGDDas4leKiT1qbcI0jZW1pwdydr8YoI5M6StNAGFUGtyiIuFZCJDYC+jkvC
 JJjBZt1subgD7ssPMhxo8LcACqQoi4AlTQmi/kiqFqsY6psDVp6L3baeOo04H0MgY8nX
 4Q+g==
X-Gm-Message-State: ACrzQf1gvWeu4cO2v9tN+b9THYaL763Xk7SbLQUPlBX1izrxydf6X9+Q
 suO/KSxRpib4iT2y//KxXBVhw9ndLps=
X-Google-Smtp-Source: AMsMyM7J4Jj7Dj17RJeNmgd3Az3eBGPN5nZz153sDhIUAFsR8IZ9z8TVNXgzbh6mT084tbX+vFZXsA==
X-Received: by 2002:a05:6512:308d:b0:4a2:5958:3443 with SMTP id
 z13-20020a056512308d00b004a259583443mr4515246lfd.208.1665304899886; 
 Sun, 09 Oct 2022 01:41:39 -0700 (PDT)
Received: from localhost.localdomain (82-209-154-112.cust.bredband2.com.
 [82.209.154.112]) by smtp.gmail.com with ESMTPSA id
 a18-20020a194f52000000b004979db5aa5bsm938177lfk.223.2022.10.09.01.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 01:41:39 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Oct 2022 10:41:23 +0200
Message-Id: <20221009084123.231395-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l6gZSsMQnhmwX2aMnXRVlqJiQoAIjHmQCG5ZdUsY8sU=;
 b=RdWX9p2sNrOQbIPQKm420t/Oq4GbZ6qLlpBlNZqEu49kTcdkL/FDvjhusWDo7xmA1U
 OuzNhS5NhQ9rp/esm3/iBDzm9rnUYS6Yep+1PTummhItJn7WZiXh7yfuoY5ycEyLr41R
 VqlMOngAICEqDjLw35Bb+t2MX+lPmP1huU+/52/fAjRiwRdRu6kCqRPd90UFGdrCv2gj
 nt0l3ntl5NMzRJEFCFE7XvpCHptoU0Q2wjwI09KVwo8x4TnuuWvdEma7tC6a/ZJ0wktl
 CwqwCZ7KBQxkCaAgAnYVKvPEWLXFZyoxhqySwOBg3rPktg3EnLxpBRHXQaiDXn30ed/I
 uN/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RdWX9p2s
Subject: [Buildroot] [PATCH]  package/libostree: bump to version 2022.6
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
index 6839d5439c..582af4b7b9 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  914c4d993bc111d7dd30ae9721b6ffe8ab56eb1fd6e81b097b09f400cc1b053f  libostree-2022.5.tar.xz
+sha256  835ef47d9a0b35a10c77ffd7f0fbd2e2b87f7cccb588da27442a05ff71ffad8c  libostree-2022.6.tar.xz
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index e0c955bc9a..e99da9d2cb 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2022.5
+LIBOSTREE_VERSION = 2022.6
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
