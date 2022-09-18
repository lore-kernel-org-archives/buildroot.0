Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F90C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 12:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E83C541B9E;
	Sun, 18 Sep 2022 12:37:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E83C541B9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ol0xAbTU0IjP; Sun, 18 Sep 2022 12:37:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDF6D41B92;
	Sun, 18 Sep 2022 12:36:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDF6D41B92
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 81A681BF228
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 12:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6999584143
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 12:36:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6999584143
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DvwmInqP0RcY for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 12:36:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 643C984141
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 643C984141
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 12:36:54 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t7so43008327wrm.10
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 05:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=fYe3ytgrslyae5kmttsATG4AaggqrzEXjXSP3RoLnWY=;
 b=yrUb/OJIfV3C3uaBTgYTNQYEZ+jRFDPCfQK//nZisTMo7x55PTxIJd2V9wt7nGHIKA
 2T7cDAPCLSR8C9avjyA8A5ulRrrx/TnayCW2JjuFNDrnTX8whX0hBvhDfGPBAffP5sMk
 BUtwGexTZK0xqALN1RoDH4xJnqaL8UQwB+f+UtNnSjojFShx0MjDj6VGuL4siUuT+Bqd
 7ZqYb9hR/B/HweKW5SC7SedV3uCN2PmShmIRSQa2/485E7gMD8K8iPTxxqxgIglW0J6+
 sjzeNGswWWA1B5P38DjGli5bY2Hstec1SFqx3N/ZmywB+P7ZkNBA22+ivDWtlBvIiYNH
 cgYg==
X-Gm-Message-State: ACrzQf10SoaaSN8NX8geh3BdX5IQZi2NsyL9sgM2QjvEPUpG2hFecx2d
 NN0TGoDPIOqZnqc355vnYNoZQ5m+h3k=
X-Google-Smtp-Source: AMsMyM792OK4UomcDgHor3XYDOuE3PRyUVBELyFQ98NXQ+RAdL7NNoi0KKjAQ544ZwFTwXp6byMwHQ==
X-Received: by 2002:a05:6000:156b:b0:22a:a83a:d349 with SMTP id
 11-20020a056000156b00b0022aa83ad349mr8119257wrz.277.1663504612104; 
 Sun, 18 Sep 2022 05:36:52 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 g11-20020a05600c310b00b003b33943ce5esm7599838wmo.32.2022.09.18.05.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 05:36:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 14:36:18 +0200
Message-Id: <20220918123618.4959-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=fYe3ytgrslyae5kmttsATG4AaggqrzEXjXSP3RoLnWY=;
 b=c0QfAf877S2hdRSjz+4x2jamFL5+ya7ljsM2ydFoS4YJqEb6drKQ3015IvPvM5iqn7
 NkBv1x8E0gXjCXR3TUOKsFhTN0/sa64xGg8rx0WXZq5W3tYkxYPIvxa+sqoAXF7GLShE
 RDjo54u5BgT9zHpUakrXVRBNL9B8Gbv4tJsjF+tOxxQ+MAtb2D/5aB1wNre7d2KP4kWb
 nn7DGJtcO9aaOZXhqidHBisH3aAv/fRCuLDOVG7znLPUIOAzaKlHVHA7crmgWKvkqtb9
 VdZjthFllDEqe2c3Ud+e0zs3KtwrCO3iSvo+pm4MjLJ8vci/NUfiy4vCtU2Fqqg22R8S
 glwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=c0QfAf87
Subject: [Buildroot] [PATCH 1/1] package/python-uvloop: fix legal info
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit b1c821b9f7bb3bbd3d104da034dd416c48082591 forgot to update hash of
license files (copyright updated with
https://github.com/MagicStack/uvloop/commit/9c6ecb62ba44f607d435441c65eba595d663973b)

Fixes:
 - http://autobuild.buildroot.org/results/8e2c8294a5388609fd765a1d80ccc2dd31e6011d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-uvloop/python-uvloop.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-uvloop/python-uvloop.hash b/package/python-uvloop/python-uvloop.hash
index 16c5e81e98..69834d5243 100644
--- a/package/python-uvloop/python-uvloop.hash
+++ b/package/python-uvloop/python-uvloop.hash
@@ -2,5 +2,5 @@
 md5  bc5e841a1c3f6e8935eeaf9d82b5ee29  uvloop-0.17.0.tar.gz
 sha256  0ddf6baf9cf11a1a22c71487f39f15b2cf78eb5bde7e5b45fbb99e8a9d91b9e1  uvloop-0.17.0.tar.gz
 # Locally computed sha256 checksums
-sha256  2fdc436a67077941295c58647f521fbef8f50e46db0970552fa1a4dd8ae261c6  LICENSE-APACHE
-sha256  9185f3c77e9f6ef8859a6ba4c94128ac1329876be3e813aad32d7645e51ae409  LICENSE-MIT
+sha256  377025287798f9dcd819e1f826fa5fc5e2f382528691ab0528c5cf8c8c282c27  LICENSE-APACHE
+sha256  6dd4c399f26de043d77a2ad7e31db4cb5bf08ea8368b0a42d6e158635cc8ab62  LICENSE-MIT
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
