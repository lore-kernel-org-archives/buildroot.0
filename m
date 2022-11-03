Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A63AC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 13:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1008417DC;
	Thu,  3 Nov 2022 13:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1008417DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iiVwQckrUufy; Thu,  3 Nov 2022 13:19:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70C57417CD;
	Thu,  3 Nov 2022 13:19:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70C57417CD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E6F771BF3F4
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C17D9417CD
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:19:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C17D9417CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zSDghYmIdNvM for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 13:19:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F0D64109F
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F0D64109F
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 13:19:21 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id r81so1276885iod.2
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 06:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1bKS+7/Mag04JJbnSXYsKkslmkr34BrnHHbMjVAhbFE=;
 b=4ocSzQEMBDgNQX8/uwnxEqo8XBZkgjWNLP+YXjuveUqXmoAd2Q6CcpwSIjgi2zKSlz
 FpNnbxsppN+abdiUTsHeNzppLgG6bs30datEoubYkY9Jzukodiiec0ecr4DQZBVJ8rV9
 JCb3FG7MuhSNLhySPhrm+1nfL4tVGjc/dQbny84fAfDw9e08FJB3Jg7sKk0iHtstJukG
 iYQ213FUSA9SBUTDPkugdWQpZov0+ZbRovbg/IPzNeOaTKIJPDtkdwC6TzOj7N0zGZVN
 CZsxxKI4u9SwGbcPIIZmWOEgzFoCxnTFi9JrrLuHNklx9Ce9m7nl91DlcXxpuy4C6PMw
 L65w==
X-Gm-Message-State: ACrzQf3IDHUvwc/KJbJtlnLJ1TpAkaaUjkrVOTJW2sefY9I5tite+Ctl
 BcCTZJuHzKjuVMnmg1RdWCGWs7rzWANEHHcA
X-Google-Smtp-Source: AMsMyM7OS9H1UToPNawZ7yeoTNlrmbOIeQ4rlVh0eSeLg+jDwV6Dwr1EOAl+4Nqq7nB8jQa/oCE5VA==
X-Received: by 2002:a05:6638:343:b0:375:8a1e:c186 with SMTP id
 x3-20020a056638034300b003758a1ec186mr4087191jap.92.1667481560319; 
 Thu, 03 Nov 2022 06:19:20 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 l64-20020a6b3e43000000b006bbddd49984sm342636ioa.9.2022.11.03.06.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 06:19:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 07:19:18 -0600
Message-Id: <20221103131918.950014-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1bKS+7/Mag04JJbnSXYsKkslmkr34BrnHHbMjVAhbFE=;
 b=i8YBWvSrTF/eR0acirLEkElhBk0Ofss0JqVtJi9i+e0UhvWAFRNQtSV4W9ykL2wYZw
 p5l7sYngvIWcaInbNsVoVnbBCELmrS5J8oVxCzn1bymv4ZPWQ7FteZveG5Rd59Bf0IsE
 sCVYCazqCliPv1ir/qI01Hs9qUlY91FzfMQKNdLZnbUXsmU3xMv7Vq6a47CAF7xVnRAQ
 ZQIl+Ok6hbeGl6ta0M6Vp/M2e5opqW+8ChuwOsvpkKrs0JzVf3bxAZX9kYYa3W0PQlAt
 9CsRknlwLpoCCbPVsbQLlznCBVeX+nCP9G+cPRS31t5kgM/o95bblJzkg0VQ9HEFZDQr
 KtwA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=i8YBWvSr
Subject: [Buildroot] [PATCH 1/1] package/python-networkmanager: bump to
 version 2.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to date update:
https://github.com/seveas/python-networkmanager/commit/9acb5c9d90154a68ffadd144e9d72f1b56038649

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-networkmanager/python-networkmanager.hash   | 10 +++++-----
 package/python-networkmanager/python-networkmanager.mk |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-networkmanager/python-networkmanager.hash b/package/python-networkmanager/python-networkmanager.hash
index 105949d50e..d4e21f1d82 100644
--- a/package/python-networkmanager/python-networkmanager.hash
+++ b/package/python-networkmanager/python-networkmanager.hash
@@ -1,5 +1,5 @@
-# md5 and sha256 from https://pypi.python.org/pypi/python-networkmanager/json
-md5  f638d854a3639fb37c0e06d1092a771e  python-networkmanager-2.1.tar.gz
-sha256  aef1e34d98d7bec7cc368e0ca0f2e97493f9b5ebe6d7103f8f6460cfca3dc6fc  python-networkmanager-2.1.tar.gz
-# Locally computed
-sha256  be40f44d54bb5e0f0eee28e957ad020a00a6e3adb0290262e92129eba1c044cf  COPYING
+# md5, sha256 from https://pypi.org/pypi/python-networkmanager/json
+md5  7e05d3ca40a4fa50222ba93cda3d0d02  python-networkmanager-2.2.tar.gz
+sha256  de6eb921d94aba7549f428ed2b3aa482a5d543ecb6965cbaa0fbb555ab31b9d5  python-networkmanager-2.2.tar.gz
+# Locally computed sha256 checksums
+sha256  d12bbc105c723d4471b39fe8197d43df822e5b4bda822a8255719d039e701f49  COPYING
diff --git a/package/python-networkmanager/python-networkmanager.mk b/package/python-networkmanager/python-networkmanager.mk
index de893f757a..785d2c0d3e 100644
--- a/package/python-networkmanager/python-networkmanager.mk
+++ b/package/python-networkmanager/python-networkmanager.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_NETWORKMANAGER_VERSION = 2.1
-PYTHON_NETWORKMANAGER_SITE = https://files.pythonhosted.org/packages/73/ec/2cc46290cedc99f59df3633d428dfa91d95946ca49af96fdb53514ee195f
+PYTHON_NETWORKMANAGER_VERSION = 2.2
+PYTHON_NETWORKMANAGER_SITE = https://files.pythonhosted.org/packages/f2/3d/0924d03117636b80a88af783f857fb101e4c47953a8bb0f733b964d50af4
 PYTHON_NETWORKMANAGER_SETUP_TYPE = setuptools
 PYTHON_NETWORKMANAGER_LICENSE = Zlib
 PYTHON_NETWORKMANAGER_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
