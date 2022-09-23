Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F496C54EE9
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 01:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13CCF60BD9;
	Fri, 23 Sep 2022 01:11:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13CCF60BD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E4zDHB8hOfdL; Fri, 23 Sep 2022 01:11:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E2E860B79;
	Fri, 23 Sep 2022 01:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E2E860B79
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1EC161BF37E
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 01:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDD1660B79
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 01:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDD1660B79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Y1PL2f6m-OX for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 01:11:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE5E460AE4
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE5E460AE4
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 01:11:23 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-11eab59db71so16317311fac.11
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 18:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=KV+RK92hF8KmjqKsLqUmhnUOuKn8le+4ATwsMW9r6I0=;
 b=UUMLBGomMwTzqIXBlS+CaX9I+LVU6rL0TTfIVZrUB4l2Jbh8VqdSNYjqAJV8Rpq/rH
 F64ll7nl1Q0Eia27ayYUgS1qBBjgwThRPSGWnvci018QvqINJ91nQ/L6dhASvAPRwg+S
 fwGOz1HmHr2lYL02n8BWRW/p0ysS7b3OZjo8B9CdUz5l/w09MAZxqCoufoMwv4nwDBY+
 jzeHBbec89oC1ZgU5ypp5L/HgUOsujZj3cH67BePiuJJz96GY1nmgO++jjkAKOOeYoQZ
 oX54N2XS2L/S0QAyOmqoDmPMEbsStUa/gXqpp1Q9h/yRYFT2onvYmHbpJ8MWNjDa0wQ2
 JxxA==
X-Gm-Message-State: ACrzQf18oauRLAS6jM/IIYOG3oNLzJCaC4v7HJhPTqioWPTvnNRbUd1C
 tvEGLz/QB6ZP8wQbGft2pfoZPxYVH4Z6zA==
X-Google-Smtp-Source: AMsMyM5ffsrsfQyeNGUtHc+nt7frdzXzzUKbZN33VX/qgiZpWbG+BhRg8g7YuGeyDVVkg+/0D8WuJw==
X-Received: by 2002:a05:6871:b26:b0:127:7d57:9e28 with SMTP id
 fq38-20020a0568710b2600b001277d579e28mr9473467oab.141.1663895482575; 
 Thu, 22 Sep 2022 18:11:22 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 r21-20020a05687032d500b0010e20d0b2e3sm4082535oac.44.2022.09.22.18.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 18:11:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Sep 2022 19:11:19 -0600
Message-Id: <20220923011119.1590684-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=KV+RK92hF8KmjqKsLqUmhnUOuKn8le+4ATwsMW9r6I0=;
 b=ga+2ohpnP8hgnloYXdVQryxPQb7D/YJguiks1WWzQk8+vxtzfPUmIEbVES+mgvwYkk
 UGkQV8CUq/infwbxRAwhf7tJGo/DzP0tHy706GZgzgi7LhduCkSweSEYrBdws8dN70u4
 8zGwtSdcfaIaCYtnqHScY8E32ZqASzq2zJTKfWf2JkQ9WVGFB3wtMFzh13d3z0qZZdX4
 JLgnYXXkQD2KoCyhV//ImFwu569nYhE8SaHmb16TZf1f0/9e9m4n0DyuJ/bD41X1t241
 Eo8bEMkzzsy6qfAYEHpZXAY7OOfqp24Yhb606d5Pwa1FcwXbB/sOkjncAfShggXdNTSa
 SyNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ga+2ohpn
Subject: [Buildroot] [PATCH 1/1] package/python-flatbuffers: bump to version
 2.0.7
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-flatbuffers/python-flatbuffers.hash | 4 ++--
 package/python-flatbuffers/python-flatbuffers.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flatbuffers/python-flatbuffers.hash b/package/python-flatbuffers/python-flatbuffers.hash
index a27d94160a..ccc754f9be 100644
--- a/package/python-flatbuffers/python-flatbuffers.hash
+++ b/package/python-flatbuffers/python-flatbuffers.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/flatbuffers/json
-md5  b2ce60d9a7c1f8a2ddac6d49a1b700a4  flatbuffers-2.0.tar.gz
-sha256  12158ab0272375eab8db2d663ae97370c33f152b27801fa6024e1d6105fd4dd2  flatbuffers-2.0.tar.gz
+md5  3391732d344155cc070892fae5f7166c  flatbuffers-2.0.7.tar.gz
+sha256  0ae7d69c5b82bf41962ca5fde9cc43033bc9501311d975fd5a25e8a7d29c1245  flatbuffers-2.0.7.tar.gz
diff --git a/package/python-flatbuffers/python-flatbuffers.mk b/package/python-flatbuffers/python-flatbuffers.mk
index 705dc0ad5a..65f3d0955c 100644
--- a/package/python-flatbuffers/python-flatbuffers.mk
+++ b/package/python-flatbuffers/python-flatbuffers.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLATBUFFERS_VERSION = 2.0
+PYTHON_FLATBUFFERS_VERSION = 2.0.7
 PYTHON_FLATBUFFERS_SOURCE = flatbuffers-$(PYTHON_FLATBUFFERS_VERSION).tar.gz
-PYTHON_FLATBUFFERS_SITE = https://files.pythonhosted.org/packages/10/41/09e9ab2134895b82466fada08b69b800f9a724bc81fcca3d4474ce48ffce
+PYTHON_FLATBUFFERS_SITE = https://files.pythonhosted.org/packages/d1/90/0532e737a11e1dc50e9e352c3ccc97338cb75991f83279c2edbc9234e022
 PYTHON_FLATBUFFERS_LICENSE = Apache-2.0
 PYTHON_FLATBUFFERS_SETUP_TYPE = setuptools
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
