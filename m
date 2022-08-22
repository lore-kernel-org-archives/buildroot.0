Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D25AC32772
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 18:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1609641615;
	Mon, 22 Aug 2022 18:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1609641615
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r5RT77gUvGlv; Mon, 22 Aug 2022 18:26:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0146540072;
	Mon, 22 Aug 2022 18:26:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0146540072
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D3DC41BF3E8
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 18:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAA8E80B1D
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 18:26:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAA8E80B1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wr5e6P0HWAlj for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 18:26:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91ACA827D2
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91ACA827D2
 for <buildroot@busybox.net>; Mon, 22 Aug 2022 18:26:50 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id h24so14263651wrb.8
 for <buildroot@busybox.net>; Mon, 22 Aug 2022 11:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=ESHXTAdMzQ17wIXmesOcqrHG6wAB5qN1tHt6L/Q1dBY=;
 b=Pk3IICehHuCtqR1kxSrxAtZODMioanKOdoJiLS85TcZQDvpTqw46zbtLSl1fBBBcIU
 uIwfL3jyVax5qWl+erZRDknHuYnq8WzV8HTnJcGyUNS6xA9Zf7YZd1dWNS1toFblEvvP
 RXic4A0Vj5kzz50pX1YcEk4GyH4Y/3l/OhCRvxjBVkT4goFLxXAlT/BhFYKUtVeBpxa3
 orqP099FKjDGmICPjOIPqOztbPsuTs0rotpWElPWfHUq46fkG/pJhdd8dgjVL+XJofmP
 8xlBlrHgFTbu4hdhvDaFmQJLhGpidLCZT50tK96wm2D8XSen04TNe4gg1sIAbnWT5Ix3
 poRw==
X-Gm-Message-State: ACgBeo1LxxHheDViz5WtP1iE/ItWLtnPmpc/+SCYDOIHXdNtGxj5pMtk
 xIl/j8AAvG+BDXP2VE+HwIZLeAAnEQA=
X-Google-Smtp-Source: AA6agR7t6cBG4C9PPvJQNNJI7Gu03mg+QEt8AYk+LLtHGiamUMg2/FTAF41PZGzdCysFAdHvIsg/rg==
X-Received: by 2002:adf:dd0f:0:b0:225:1fd6:66d9 with SMTP id
 a15-20020adfdd0f000000b002251fd666d9mr11587989wrm.42.1661192808776; 
 Mon, 22 Aug 2022 11:26:48 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 z24-20020a1cf418000000b003a5dadcf1a8sm15183304wma.19.2022.08.22.11.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 11:26:45 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 22 Aug 2022 20:26:39 +0200
Message-Id: <20220822182639.1691326-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=ESHXTAdMzQ17wIXmesOcqrHG6wAB5qN1tHt6L/Q1dBY=;
 b=dGIlB17fmuWd4/uQrESfeFDMSpky3ej3sOAk9JgirTiMLuHv7aAs9Ej2X/73P8o9mw
 W1mmFFEGq6prtzoZNXgi6tEZDzs0qVOVqLUVXN/glVqzImLalCvMJnOFjOdPkHb5Q8OI
 /1DcAM9JwhhXWWXGCBM0MQWZ3WBJHw+LVuwHUbz8CLk1s/rfLIoNbnPSBBpF2ThJu43j
 V8Nt1yt5i9HqibbKxoCXkloWRRy5Xm9vateUj9U9NLULrFkSpAo5+kjQekQpN9gXc0LI
 GJBjl+khAGAZSZOHGWrMqnWUnyUoPBkdbNPMz8q9wSEGi7OXFhSfuap5nLk0KnskExt/
 iesQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dGIlB17f
Subject: [Buildroot] [PATCH] package/lighttpd: bump to version 1.4.66
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lighttpd/lighttpd.hash | 4 ++--
 package/lighttpd/lighttpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index 0b4310aa7..b45fecc60 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,4 +1,4 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.65.sha512sum
-sha512  e9ecb3e99dd5cd0efbf98cfc937f0cfcfafe712ab0e6c11f9cdee936c508820cd8de06ef03d2f888dab19a842eebae342a83818e601dd21094f154832acb69ec  lighttpd-1.4.65.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.66.sha512sum
+sha512  6d4ae1faa0ebc3115b7ad4fc84ccdd476ca71ee701d115c1a320f525c6c3ce884b48af38f65e4f1c012b4d0936755925b16f8d37aad810a286b2349c27f47567  lighttpd-1.4.66.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index bedb9c8f3..0905b0ae1 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).65
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).66
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
