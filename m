Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696A5C54EE9
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 20:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1DA4405A0;
	Sun,  4 Sep 2022 20:50:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1DA4405A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Iw2PAZ-tJLEF; Sun,  4 Sep 2022 20:50:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B131405AA;
	Sun,  4 Sep 2022 20:50:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B131405AA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 451401BF38B
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 20:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28B264028F
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 20:50:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28B264028F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dunm5tqXbsjI for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 20:50:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C491C40204
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C491C40204
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 20:50:12 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id t7so3906039wrm.10
 for <buildroot@buildroot.org>; Sun, 04 Sep 2022 13:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=mUremROJculbrmu7aJsCF5JUMgNNXfi6QmT3wzcYeqM=;
 b=rGWuFgLSSt2Eccx6JlSkPPyLdpK2Um0dR/d3wwWWbHkCE6jUVkZWkmUFaLltWbdqa1
 UdG2MVb3KF/XFQW13KrgN6tgJNglXL9wsIX3Auo8kxocurOWV4tB+A1FxuqiJMuNLBzM
 9O+weOfiLvTCAt2rj+fu0CAy+4tiIfd9kn6Ulht4eme2j4uk7fp3GakAXcazRHJl68yE
 hAAUkOR9Vs2IXCtPzXbacCP5qixHzW/c1t+g2b5LeV7MJvFNd4TblY2RxeGn0xs6q0U5
 CCtfT7KhPaAHDwpsbrnL64gKkbiN9Yk2EY26jdccTrAvGHecTaBWyycaBblJbvhDSEZa
 KlUw==
X-Gm-Message-State: ACgBeo1tA41Fkv7Q8BH50V4Lcz2FG5qyGMQHpFWe8j0JjOKP9vICcQxL
 e0kmHS11M4Kwa8IyzQQFZT5F2Tu4XYE=
X-Google-Smtp-Source: AA6agR7JVgcRo1/cmsCDuGaWuw0yZ8lnDgMSE0xrSZT60TgMWKroUSPe92EpVLkEhGi9f5pH90OtYQ==
X-Received: by 2002:a5d:528a:0:b0:225:4a8e:221e with SMTP id
 c10-20020a5d528a000000b002254a8e221emr21961078wrv.145.1662324610673; 
 Sun, 04 Sep 2022 13:50:10 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c3b9300b003a846a014c1sm16473662wms.23.2022.09.04.13.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 13:50:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Sep 2022 22:50:04 +0200
Message-Id: <20220904205004.53601-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=mUremROJculbrmu7aJsCF5JUMgNNXfi6QmT3wzcYeqM=;
 b=JqADTHuKZW+fYF58j47MQdPI3zsbClQGN/93ad9RRwoyxsc+vNlSHdWY0t251W/S6J
 +4tqKwQgqSl0kiM8c4ZvVCJ0T+VwSXsLG7YZxRda+kgjaClx5jbXEqjAgntTdm1Qe055
 WnMUhRr8FZjD59R35yVmQ62PwW+QRToaA/zcj+rh109EYNuOj9kYneGjQjeoPBE+4sdI
 2crsCW/lP/me9jvyoYNrMO2CEj2/QTno4r26x1T1sCEBKAFK9QfRWCYmMUQYexRwlcK0
 Qzl0GaBKaZcNeFzv2hkT+FphN8yaBepBvBp2wYbDpaGs+pXLX9mcww9ju4l1yrjcZF0X
 m8mg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JqADTHuK
Subject: [Buildroot] [PATCH 1/1] package/sconeserver: fix build with gcc 4.8
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
Cc: Simon Dawson <spdawson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc 4.8 raised since commit
8b42bbf30a914b0fd40a4518e61ac7bc511a7deb:

/home/buildroot/autobuild/run/instance-1/output-1/build/sconeserver-8d1935919a2013358993a8e9dfa992cbde56e503/http/AuthRealmDB.cpp: In member function 'virtual std::string http::AuthRealmDB::lookup_hash(const string&)':
/home/buildroot/autobuild/run/instance-1/output-1/build/sconeserver-8d1935919a2013358993a8e9dfa992cbde56e503/http/AuthRealmDB.cpp:93:3: error: 'unique_ptr' is not a member of 'std'
   std::unique_ptr<scx::DbQuery> query(m_db->object()->new_query(
   ^

Fixes:
 - http://autobuild.buildroot.org/results/198c23f1de5cc90efe2d3b4ce053939457e003f7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sconeserver/sconeserver.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index d15b112801..bfbd5dc6ed 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -17,14 +17,10 @@ SCONESERVER_DEPENDENCIES = \
 # https://github.com/sconemad/sconeserver/tree/master/markdown
 # has no cross-compile support provided by the sconeserver build system
 SCONESERVER_CONF_OPTS += \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -std=c++11" \
 	-DWITH_IMAGE=OFF \
 	-DWITH_MARKDOWN=OFF
 
-ifeq ($(BR2_PACKAGE_LIBXML2),y)
-# Needed to fix build failure when icu is enabled in libxml2
-SCONESERVER_CONF_OPTS += -DCMAKE_CXX_FLAGS="-std=c++11"
-endif
-
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SCONESERVER_DEPENDENCIES += openssl
 SCONESERVER_CONF_OPTS += -DWITH_SSL=ON
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
