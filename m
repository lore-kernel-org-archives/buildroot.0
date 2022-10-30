Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10992C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 19:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82D0D401AD;
	Sun, 30 Oct 2022 19:54:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82D0D401AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id siwUTIeIzOo2; Sun, 30 Oct 2022 19:54:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAF11400FD;
	Sun, 30 Oct 2022 19:54:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAF11400FD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 524AD1BF2A1
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 19:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CB2B605F6
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 19:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CB2B605F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yon70k-xqryu for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 19:54:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C436060594
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C436060594
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 19:54:08 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id i9so3759633qki.10
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 12:54:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J7ocA+J1Sda3cclpVzv9k8FFpmLfg9YRILulBgJbVLg=;
 b=H3WJ5mGNu0gaMHYIkx1u1Z3zBNU6dXyIenN1b8AkJstq9xbpV95Hhm6DoLSobA/zH3
 H60r7FO/YHEGhpM82FrQo/TY3pNxwIJ+dsV8qlaFhvjXym8B2lrhbrpuB58eSXrf4UUN
 GWu8U7JqetM8pOrm5ENEjz35sA6yMDHKjUr4b5KRd6WDYQEO83eiM8gfkcGTWXqTvSPv
 8Y0PktfW2yHL75Nn9qE4meCQ2tk4ndpN7QQecBg8LELMoUsKDJjCj4Tc/MGgRuEpxpvr
 FgScWAuHDzUeFG67/RQvPr+3H8gsxnIo9QsZcPf2Rl/lC502gcXwZn4nTKheygdjWHHN
 w3ag==
X-Gm-Message-State: ACrzQf1br8ZTZuUxC+wRnavlcwxeWgEX3OR50AlQUh3qRGA/wFXx7OSc
 4lOpgGawjl4Whqpl0eFntKRDLQ6js6m0uA==
X-Google-Smtp-Source: AMsMyM6k4qUgEeOSWia54MCJSV9tU5XM5KFAy6mCvrErq+uyBAUTc09xsINoTXSJX3UT8WT+cj2k/Q==
X-Received: by 2002:a37:aa84:0:b0:6fa:bd:9bdc with SMTP id
 t126-20020a37aa84000000b006fa00bd9bdcmr6819587qke.612.1667159647217; 
 Sun, 30 Oct 2022 12:54:07 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 d2-20020ac81182000000b00397b1c60780sm2582402qtj.61.2022.10.30.12.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 12:54:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 13:54:04 -0600
Message-Id: <20221030195404.1221968-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J7ocA+J1Sda3cclpVzv9k8FFpmLfg9YRILulBgJbVLg=;
 b=Q2jULIgzK5MEw8sVpPnQBRn93Bmv9Wki0K+K7oNbIu4b4uDGIFo3NJR5/tC9UT8Vx2
 QQL5eZLyO7ZlHU7vadj/lBdKy6cXPBy57/TuDG3Rg2Okxx1CWIRBBU6QlRldx4QdO6dr
 a/S3KwCr7OPonePy1DJcpG9yJWzNWUfkPyZ3zWQtiaSpBiC/V001IhGptTiN4R4v9LRA
 o7iFXe4Rqnn01klcqfn0ydwLkQHRXJlQPnu9VIiWzBwqrI0RoVnFbFiHUadKmhE9P6tK
 n/beOLysK2cs5kB591GFWbNJ5MGmBVF3Ud+yoi+MWTxFm4pWD2g14VVptX8wHWTzB1SV
 ztbg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Q2jULIgz
Subject: [Buildroot] [PATCH 1/1] package/python-pillow: bump to version 9.3.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pillow/python-pillow.hash | 4 ++--
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 0e407bd55c..46da25dddc 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  218bdb951f3e59e8b782e329ece3416d  Pillow-9.2.0.tar.gz
-sha256  75e636fd3e0fb872693f23ccb8a5ff2cd578801251f3a4f6854c6a5d437d3c04  Pillow-9.2.0.tar.gz
+md5  a6507c1e811a51071d2d6de83070e703  Pillow-9.3.0.tar.gz
+sha256  c935a22a557a560108d780f9a0fc426dd7459940dc54faa49d83249c8d3e760f  Pillow-9.3.0.tar.gz
 
 # Locally computed sha256 checksums
 sha256  a6554cb737ba6c9b47d3301f78de03b4ed0d3f08d6cf9400714f3d4c894f6943  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 31725a3e46..5ea9fcf264 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 9.2.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/8c/92/2975b464d9926dc667020ed1abfa6276e68c3571dcb77e43347e15ee9eed
+PYTHON_PILLOW_VERSION = 9.3.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/16/11/da8d395299ca166aa56d9436e26fe8440e5443471de16ccd9a1d06f5993a
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
