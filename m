Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C9EC433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 08:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE88440935;
	Thu, 30 Dec 2021 08:52:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0iTcP65ORB_r; Thu, 30 Dec 2021 08:52:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32A9A401B6;
	Thu, 30 Dec 2021 08:52:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 820481BF33B
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 08:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 694864041C
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 08:52:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6BdWAJ-T-d2g for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 08:52:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5DBDE40297
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 08:52:31 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id s1so49224507wrg.1
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 00:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aYRNbgmoL085vrJbbdmS1gs9qpsGZH9So0ydvJsHAy0=;
 b=JMOJt4cLWgTQPo7Xh3S9AI1FV234Zr+dl3wy2L7c1aYCr1UmJUb10ZXEphL2fm3rSK
 WsJ0IJqP+3F/tPN5GmiMiZMXBbOzN/aDga/vGe0Wm00ZbzS2MSBYFbRRGTEcXjS9u9Kl
 z/32LmtSMMmf3bRWyBRhrTe5miUpl8/YWzZ8jEGzH1TxeTHMtgwaxnNzwYjBK0ezmXBE
 PVXYI8LdvIoOcVH3sGmRL1XMjE4mVRdw5j+At7E9+H8es7WwpoOOFMfuOHOVSJEwKbCR
 pxQI41R+6a4//l0q7UCFJEFoWNrKgv3gLxQTlEGEkw2ZG4mi6JPoXlmckILe6TozJAzY
 tHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aYRNbgmoL085vrJbbdmS1gs9qpsGZH9So0ydvJsHAy0=;
 b=HaBaMUv5p9Pm+SJQcTO6Yr7aenjvBRjv1f1DscGMlq1WsSZhpvlvrkexjJaUzSpHPK
 3XSGnnsJcc5EcJmObcZgd4GR7lTS2wiPcjSQ8Utw96IRSTypU0Bz7jW6wCkeg3nOLCJ4
 R+9OJ3MxiPhctmygMD43TkYk4m1TIAqLB5AtrxffCjAA9vP386MyFvDHU2IZJY+W/bqE
 vFMylS1iiFi1NEGJKI65cCg2JR8C8YJF1cRjxaRD/lBMNDFqWDzoUtPbtD0YeuQndnhp
 yY5ge7bE1CkbJp/ij3PfxV2w71HDJZ2XudMvHAbdd4ajqF6lMp8o58rm8r5W5VVTPgCo
 pYBA==
X-Gm-Message-State: AOAM531bWHAJwBR2FCZLKSbfkLER4W4PmsBk+iK6v87YUs3EMMByeRdd
 wZEoUdQcMurqLAHb1+kaM+mELtA7r84=
X-Google-Smtp-Source: ABdhPJx4Jlot1RdQXDG7NDbEbegO4qkZ1hdpCo8dJE4ZXFlRgkj53LRSdKQzxmOMzt8X7X65TNgDCg==
X-Received: by 2002:a05:6000:15cd:: with SMTP id
 y13mr24467122wry.28.1640854349331; 
 Thu, 30 Dec 2021 00:52:29 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id t12sm26393848wrs.72.2021.12.30.00.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 00:52:29 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 09:51:44 +0100
Message-Id: <20211230085144.1210474-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-django-enumfields: needs
 python3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python2 support has been dropped since version 2.0.0 and
https://github.com/hzdg/django-enumfields/commit/3a9f92d67b15d1ae57ef7fb087858b5597413f30
resulting in the following build failure since bump to version 2.1.1 in
commit bcb85b2e59902c1f570fb0545b38a677d088841f:

error:   File "/usr/lib/python2.7/site-packages/enumfields/fields.py", line 134
    *super().check(**kwargs),
    ^
SyntaxError: invalid syntax

Fixes:
 - http://autobuild.buildroot.org/results/3fd79ed7bbcad202fc7ac07252cdf57c599dac30

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-django-enumfields/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-django-enumfields/Config.in b/package/python-django-enumfields/Config.in
index 58dea365ee..51efbcbf53 100644
--- a/package/python-django-enumfields/Config.in
+++ b/package/python-django-enumfields/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_DJANGO_ENUMFIELDS
 	bool "python-django-enumfields"
-	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  Real Python Enums for Django.
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
