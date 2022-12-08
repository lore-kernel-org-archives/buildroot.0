Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30F7C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 21:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83BDD41942;
	Thu,  8 Dec 2022 21:07:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83BDD41942
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9dFFLwSkRW5r; Thu,  8 Dec 2022 21:07:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 461B041946;
	Thu,  8 Dec 2022 21:07:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 461B041946
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 95A351BF396
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AEA54193D
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:07:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AEA54193D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ONQqMUsFUYTE for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 21:07:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC29441936
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC29441936
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 21:07:32 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id o15so1845074wmr.4
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 13:07:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jn9xkaeNRVwGOImMSao2vrXUcT/DOgYtwAltF2h7R0Q=;
 b=LTPl0jv1Eo9fw/8PWbEgl+9i50syJqFpCC7DMG52CjI7RvCrOKTlWUEmk09a0650V9
 72TTNc8sqs0tL5K1QakOqcokbHf/ldfurosb91X26gE8xp3XeZ4F+IeFP/gIqIoG16s8
 U3RrwtQV8ithT1uoe5y6MVFoI6hxgId5gFDQSSamgfM7ifNgCql+hxrp+7koCgd/qkdv
 FSJtkv9wjrzvBtyYxrcGm+Mbldomb7iWSyir/xy/oNUx7Ks2rfg41nQid2vyXkKivOXq
 k7xK3bL1MphtOiOwRhx5xN1xWLPicI3fsq5ogii+z59AZpiWt3m20dPk68b59ZYvh52w
 yWLQ==
X-Gm-Message-State: ANoB5pnq0DDuAzWIFVla8sFGrrA4LVfx05Bkl0tysBv9ct/8HDu+FiqG
 mzbbd9kHHzsN+vcXQMpGDV6DUQvjog0=
X-Google-Smtp-Source: AA0mqf6XLBHsPTteYmJIf+Es/pJgGCr0oTPm0bvKkhGOtN7wOfeDtlYGosLtjZNPbTyUfstU+U9ERw==
X-Received: by 2002:a7b:c315:0:b0:3cf:aec5:e642 with SMTP id
 k21-20020a7bc315000000b003cfaec5e642mr2932024wmj.31.1670533650587; 
 Thu, 08 Dec 2022 13:07:30 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 e23-20020a05600c2dd700b003cfd42821dasm6043344wmh.3.2022.12.08.13.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 13:07:30 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 22:07:26 +0100
Message-Id: <20221208210726.31762-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jn9xkaeNRVwGOImMSao2vrXUcT/DOgYtwAltF2h7R0Q=;
 b=bM/CaWqfW+B+zJcznavefN7v7n8t8EOKT3jqv+CMlvPKg23jqujU81FXmehYfDfVkF
 gU26Pu1ujHTxLZUVoaZam21/HVkbX/cAsHKz8FBHPl+yU1gX2yfiZYIFlhK7NkqNODP2
 +UD4jWTSMOYhPWomIY1DNmM5QS1zk2ssXYM0xEsWzIJBEsBXgY4im90SHWfhos7Aj0Vi
 Q5G3UIKFk3zfF0EpqbWimPXZOyVTliKCY/YHc182PuT+aHzjyUAH/gUQVUWpzo+xXUbZ
 oo2h6LuSvYDbwlwBy01JiWTrJFx6x8lR4SRug/IxXPgQKatkQaVfhWeSO6FJmda9oJKX
 Ac2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bM/CaWqf
Subject: [Buildroot] [PATCH 1/1] package/ipset: bump to version 7.16
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://ipset.netfilter.org/changelog.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ipset/ipset.hash | 4 ++--
 package/ipset/ipset.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ipset/ipset.hash b/package/ipset/ipset.hash
index 9c251be27e..fb9b8c40d2 100644
--- a/package/ipset/ipset.hash
+++ b/package/ipset/ipset.hash
@@ -1,4 +1,4 @@
-# From https://ipset.netfilter.org/ipset-7.15.tar.bz2.sha512sum.txt
-sha512  0fc936d971c30a0925c585d506c8840e782fdaeec09bc8fd249e874fe838fa55a4dbb697f6e1423a6769abf07a1ce2195abc37cb641e8e4ad70f1b4c7130916a  ipset-7.15.tar.bz2
+# From https://ipset.netfilter.org/ipset-7.16.tar.bz2.sha512sum.txt
+sha512  e69ddee956f0922c8e08e7e5d358d6b5b24178a9f08151b20957cc3465baaba9ecd6aa938ae157f2cd286ccd7f0b7a279cfd89cec2393a00b43e4d945c275307  ipset-7.16.tar.bz2
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index 4eda65e81b..9832d8fd30 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPSET_VERSION = 7.15
+IPSET_VERSION = 7.16
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
