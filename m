Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622BDC04A95
	for <buildroot@archiver.kernel.org>; Sat, 22 Oct 2022 20:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE95D81A33;
	Sat, 22 Oct 2022 20:41:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE95D81A33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TNa2MiVHo1iB; Sat, 22 Oct 2022 20:41:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5536F8198D;
	Sat, 22 Oct 2022 20:41:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5536F8198D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A4C21BF3BD
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 20:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54E7F60773
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 20:41:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54E7F60773
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HQCgEDrM67B9 for <buildroot@lists.busybox.net>;
 Sat, 22 Oct 2022 20:41:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34FC1606F9
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 34FC1606F9
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 20:41:51 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 c3-20020a1c3503000000b003bd21e3dd7aso7465533wma.1
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 13:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FQuyoH5nbyft68sgKPSRaVtYPKcwu5zvtnavxlpcXXg=;
 b=0NSDUAYpZf/m3+smdC/mIpIYr1x2VulNGdJgoL5UB8oC3ojuRK/b/ticKHgY42DPQx
 6qrLlvSrWnPe5lXxJWBzT+fX9WCTeGfOhTQHA5rSEmV1YBR8mKOJHEJZigeqD7zCM7uP
 UBkcwgw9i5QaAKEMjHkFYNLPvx3InWERY156TbR8mEktYTT507sjoGos3dVW4Ik/liE3
 PLvAWM38YzOsiM+iYnFxt5lQK5S2e5MRMWVR73ZKOvWh1z4JvGOm2lvgGfHMJmsXh59+
 5wVdaPaT4HPLgcdiDhrb+YAeXPLYHXpiOjc9oBRT1KGABs5hJ3zvujueFaoiJ/TyPK13
 0xUw==
X-Gm-Message-State: ACrzQf1lhK0dFWpkEbOyvQDPL2ItKZth4sAgAc/dGuFsuCF7TzKIyQIL
 7rH3mp0CtwIOHHzauWuLAqJ9toGB4PM=
X-Google-Smtp-Source: AMsMyM5FcMh1LBPYWbcy+D0kJMfAzFvsXPecAPczWRtP+cO95QIQV4mFgpA+UpYm293WvPCmxbnaRg==
X-Received: by 2002:a05:600c:468a:b0:3c6:f84a:1fae with SMTP id
 p10-20020a05600c468a00b003c6f84a1faemr21486687wmo.148.1666471309040; 
 Sat, 22 Oct 2022 13:41:49 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 j8-20020a05600c1c0800b003c6b7f5567csm15418038wms.0.2022.10.22.13.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 13:41:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 22 Oct 2022 22:41:44 +0200
Message-Id: <20221022204144.137169-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FQuyoH5nbyft68sgKPSRaVtYPKcwu5zvtnavxlpcXXg=;
 b=BLbjNo9rgnEZ773ZUMoBgUfMwl2v+e3DVDyrs242NnmWHU7nh54i6yyXHlj1qM8J1f
 mxaFYaJYXiDWRsr/RNf/elOTbdwPE7+pkve9j4SBmZsVXypNn7B5tKPawOVacM9y1YdC
 ZscJdcURpnrKOk5udZsPFA6ZNR9PCg8udm6chuC0lWr6SJLrBr+Bv1SqJjpsML1QgXVo
 uCEc3rbXyD7Y9qMX+u0Agfe4Zb39oy3BPU30nUfqawdMHUpbaQO4h9jn12H1BsjJ30Yk
 luNtPGUaA81/jyc/9729H8+3deZ/3EnDoSMVfPh7HE3xsnnxdzY3Q5ORwY/iyA4Pq2NL
 gpVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BLbjNo9r
Subject: [Buildroot] [PATCH 1/1] package/valijson: bump to version 0.7
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/tristanpenman/valijson/releases/tag/v0.7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/valijson/valijson.hash | 2 +-
 package/valijson/valijson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/valijson/valijson.hash b/package/valijson/valijson.hash
index 0aab93dd2a..aacdf7dedc 100644
--- a/package/valijson/valijson.hash
+++ b/package/valijson/valijson.hash
@@ -1,3 +1,3 @@
 # Locally Computed:
-sha256  e06bf78fc1d26d4956fabc182408ebbbc47e3a6699778cda4aa439c2a6110b09  valijson-0.6.tar.gz
+sha256  bc24736709acfb252a5fdcb5145f1f2670c7aecaba3356f6f8ba54903800fa5c  valijson-0.7.tar.gz
 sha256  1a0f99926a2dbec30eba3db820236d9953fbe3048976923ac24980e655fbe991  LICENSE
diff --git a/package/valijson/valijson.mk b/package/valijson/valijson.mk
index 4b1f722f77..51a9353960 100644
--- a/package/valijson/valijson.mk
+++ b/package/valijson/valijson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALIJSON_VERSION = 0.6
+VALIJSON_VERSION = 0.7
 VALIJSON_SITE = $(call github,tristanpenman,valijson,v$(VALIJSON_VERSION))
 VALIJSON_LICENSE = BSD-2-Clause
 VALIJSON_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
