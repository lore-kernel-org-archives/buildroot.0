Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D55BC433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B28F41885;
	Thu,  3 Nov 2022 21:29:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B28F41885
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ay53_Igh8Kex; Thu,  3 Nov 2022 21:29:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F68D41876;
	Thu,  3 Nov 2022 21:29:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F68D41876
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 56B031BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F7336077D
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F7336077D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XyB-oQ9BEU4x for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:15:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43DEA60672
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 43DEA60672
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:15:16 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id z3so2454319iof.3
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 14:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c7yRgCBC5A7rHWNbiQE9XPbhqAJSF9z955yDP3GiO90=;
 b=2UXpf/TzcWKDEM0nWPXlcz2HfmSnyEHvCcSIAL3C0bIYAB5Aw1S7SNsCdth53Xhsy7
 vJzm0bfQhpCU68/Lh2xEeJI58JlH9Yw9KRKMThQbufIRcpSkPG4TNJAh+4Y01fBx2ZlJ
 z4wYgJc+lX46PmN7uR6hbXANVOee0mVh1dCl6gk4AP7EjDbKUIrdlyP0kkxFL+tZadX1
 /KTObsfKJV3HCxgYe7sxUaC0YdppgLbHIp0T4SEHoMx5LlTp0bsZGIS5KiqRa4Kmr+Vc
 ZyO6WoKfTrymLVYUZZEqa+nHigumgZVodfbP6aNLxXv4wKOla+8N1itBztkRA0QpSm3G
 h8Qw==
X-Gm-Message-State: ACrzQf145lY42onYXha0qEcWnODat9JfLMe7285fwayo7rWAJMM+n1fk
 wVgFza5hekXQRRa+dHhv3Jp/EQvlN6y42Bd6
X-Google-Smtp-Source: AMsMyM5SfepPKpYliE5v9JoVwwBvNTAaI2FaxOxxdbbaGXjHA07X7mIiQo3wKUiKMMRaBcLO1p/vAQ==
X-Received: by 2002:a05:6602:26d2:b0:6a3:f044:a942 with SMTP id
 g18-20020a05660226d200b006a3f044a942mr19814046ioo.50.1667510115051; 
 Thu, 03 Nov 2022 14:15:15 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 y18-20020a027312000000b00374a9dbd061sm544741jab.73.2022.11.03.14.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 14:15:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 15:15:13 -0600
Message-Id: <20221103211513.4099651-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c7yRgCBC5A7rHWNbiQE9XPbhqAJSF9z955yDP3GiO90=;
 b=lzQ1aDjpuNCWofg3KYoLqWPG4OtwayYMoq/XTQjWoN1rbbRxQH8alPkYqDr+NASF/t
 my8B184y5zZOjPVlSH7i0V6aX+vi3IIGa5N8gdhFEX6yN0HGMqJ+y99QbK8Plgu+r2Uh
 6Ovz/SsXLFr1zZ8aX/ESTkcla/fn9QwN2DVwyee5CAf+AHve/9DOk5kVkEQeBe0fSBwU
 7lWl9eD71/V6kRoWsS5QpCORz9FY6wAcqmL2VKTdNIR34SoBorbOI4WIZQHi33mE4jYx
 fk8oScDfRAyekHq/qqMdB0VEmnYb2b9S+iOrH1IR698N3MEXkKizuOnJA1Y7Q7I/8KyI
 n4nQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lzQ1aDjp
Subject: [Buildroot] [PATCH 1/1] package/python-xlsxwriter: bump to version
 3.0.3
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
https://github.com/jmcnamara/XlsxWriter/commit/0fc418931f984e5d6119569d47e9985b2bae5d57

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-xlsxwriter/python-xlsxwriter.hash | 6 +++---
 package/python-xlsxwriter/python-xlsxwriter.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-xlsxwriter/python-xlsxwriter.hash b/package/python-xlsxwriter/python-xlsxwriter.hash
index 7c9698067b..4363799079 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.hash
+++ b/package/python-xlsxwriter/python-xlsxwriter.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/xlsxwriter/json
-md5  5f759dccf222e8f2a9924e90c4afaf84  XlsxWriter-3.0.1.tar.gz
-sha256  3f39bf581c55f3ad1438bc170d7f4c4649cee8b6b7a80d21f79508118eeea52a  XlsxWriter-3.0.1.tar.gz
+md5  b08fcc4753c14aa64b9d99219475d91e  XlsxWriter-3.0.3.tar.gz
+sha256  e89f4a1d2fa2c9ea15cde77de95cd3fd8b0345d0efb3964623f395c8c4988b7f  XlsxWriter-3.0.3.tar.gz
 # Locally computed sha256 checksums
-sha256  8fbb9b28ef0afac1c7d999102fd2634f347448d069c8c821976f3dbd2b3f812c  LICENSE.txt
+sha256  6287be39bd007c8729f5c3cf8dfda9b462af725c1d06e3bf0e17b1532196a08f  LICENSE.txt
diff --git a/package/python-xlsxwriter/python-xlsxwriter.mk b/package/python-xlsxwriter/python-xlsxwriter.mk
index 4c8a512086..4055e52622 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.mk
+++ b/package/python-xlsxwriter/python-xlsxwriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XLSXWRITER_VERSION = 3.0.1
+PYTHON_XLSXWRITER_VERSION = 3.0.3
 PYTHON_XLSXWRITER_SOURCE = XlsxWriter-$(PYTHON_XLSXWRITER_VERSION).tar.gz
-PYTHON_XLSXWRITER_SITE = https://files.pythonhosted.org/packages/5d/36/e943d07af9d26cc2f11861955dbf0031e891f77f3d55f70217fd6a0f4d9f
+PYTHON_XLSXWRITER_SITE = https://files.pythonhosted.org/packages/53/04/91ff43803c3e88c32aa272fdbda5859fc3c3b50b0de3a1e439cc57455330
 PYTHON_XLSXWRITER_SETUP_TYPE = setuptools
 PYTHON_XLSXWRITER_LICENSE = BSD-2-Clause
 PYTHON_XLSXWRITER_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
