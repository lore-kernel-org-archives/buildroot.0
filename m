Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBF3C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 05:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2637821E0;
	Sun,  5 Nov 2023 05:14:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2637821E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q34TRdT6djT6; Sun,  5 Nov 2023 05:14:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03502821DE;
	Sun,  5 Nov 2023 05:14:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03502821DE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C732A1BF592
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 05:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9B3D41926
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 05:13:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9B3D41926
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ww6IBtUdPwo for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 05:13:57 +0000 (UTC)
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B38004191F
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 05:13:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B38004191F
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7aca968a063so128626639f.0
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 22:13:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699161236; x=1699766036;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vM2tQJ5wecWaF6gOrBZlKQxJNVjYxn9SI/hb/SHqMWA=;
 b=SMdzYU/G/kly25xWooIipwuHf9zJdMsEfQnm/dNr6xJtmXHyfN+Icly1CQ83aFBtnK
 F89wrrYHmNDZQckVX0LTnpQjbo58uNlmuJdkfhLs6NC5JE9/kiNFU9WgJ4EMoPXD3SGG
 AH1CZlg3VWQbPJbOPe6/kUOwEnm9Us7ZT8+ijMwpa0Jn+KPGXR3tCd9LXa72X+pTsvdW
 c0f6QY+XUrDXkbCqBKdtUXVy3A3tZoDw//ZDTskMQQ/Z5pzn3SYKlaiBeSdbdU56NV/x
 JM+14o3pxg0bI7ALMpmvypuqaJ37AZ1+19EiaIwRJqFYxopoWv2WvKIpdwoQ41GTZuEB
 yoWA==
X-Gm-Message-State: AOJu0YxjOIg+dErqfx7tCPiIU0CDLYoI/uW1XWSDya+FvdAbplejiqDi
 q7jPPojIs7SbfIGtDqYdKfRjTu2UQqY=
X-Google-Smtp-Source: AGHT+IGrm9QZRY6Z5O7YiUs3Atk8YKh6rzELLM5rRxdqb5JCD6nAkWiFyXV66f4Bq+hOPVjF92pwaw==
X-Received: by 2002:a05:6602:1655:b0:7a9:4090:b7d5 with SMTP id
 y21-20020a056602165500b007a94090b7d5mr35646256iow.13.1699161236351; 
 Sat, 04 Nov 2023 22:13:56 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 k8-20020a0566022a4800b007791e286fdbsm1619217iov.21.2023.11.04.22.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 22:13:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 23:13:52 -0600
Message-Id: <20231105051352.2833549-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699161236; x=1699766036; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vM2tQJ5wecWaF6gOrBZlKQxJNVjYxn9SI/hb/SHqMWA=;
 b=KonnIhcsdMXqQT9BSHm8BAsDfmoXnPiIVIGCq/Jp4BaQ0ONCcsFCGOQBUv+7QCG6Ju
 UDh9wSfP3Qc+2+SYY28FrBfWDJ2GP7b7sS9cFp8s0AhfckobVTx6fA/HXffnYqseKIru
 T4ThqLj0POd5YMfceH4Y5rNT1JOfboCHjpWcp7RXH6ffsFOmX4SpDTYhLJ+YxX1tI96t
 j9uGODnOt/Q9SgUXMN5HoSilb47hlYHAT1TpE4rZXQ8mu6WSahpYc+vAxLip4Yt3U82Z
 89IG7vV+1VjyyXYi+9YordoMFSdnlRAHvTYvRgAzX30xBz+nF7m1TOj3SrQ8V74U/aq4
 w0lg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KonnIhcs
Subject: [Buildroot] [PATCH 1/1] package/python-esptool: bump to version
 4.6.2
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-esptool/python-esptool.hash | 4 ++--
 package/python-esptool/python-esptool.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-esptool/python-esptool.hash b/package/python-esptool/python-esptool.hash
index e1d3188658..25fea229b0 100644
--- a/package/python-esptool/python-esptool.hash
+++ b/package/python-esptool/python-esptool.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/esptool/json
-md5  fbad6fb6024580fd2645331f92a74555  esptool-4.5.1.tar.gz
-sha256  e3eb59836123e5ebf793ef639311f7d85645526487d8b1c2b51159b455106b9a  esptool-4.5.1.tar.gz
+md5  17853949fd582550a7c270f08d7691d4  esptool-4.6.2.tar.gz
+sha256  549ef93eef42ee7e9462ce5a53c16df7a0c71d91b3f77e19ec15749804cdf300  esptool-4.6.2.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/python-esptool/python-esptool.mk b/package/python-esptool/python-esptool.mk
index 34bdf6cc96..c0709c64b1 100644
--- a/package/python-esptool/python-esptool.mk
+++ b/package/python-esptool/python-esptool.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ESPTOOL_VERSION = 4.5.1
+PYTHON_ESPTOOL_VERSION = 4.6.2
 PYTHON_ESPTOOL_SOURCE = esptool-$(PYTHON_ESPTOOL_VERSION).tar.gz
-PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/04/80/8eb97d1793cfaf830a4c0a7ea1d8f0674ccba8c23b7d02dcce074b5f44ea
+PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/a3/63/c757f50b606996a7e676f000b40626f65be63b3a10030563929c968e431c
 PYTHON_ESPTOOL_SETUP_TYPE = setuptools
 PYTHON_ESPTOOL_LICENSE = GPL-2.0+
 PYTHON_ESPTOOL_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
