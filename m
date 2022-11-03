Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD32CC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 18:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 315AF41850;
	Thu,  3 Nov 2022 18:53:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 315AF41850
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3CU3dCxCbXsz; Thu,  3 Nov 2022 18:53:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 141564184D;
	Thu,  3 Nov 2022 18:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 141564184D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8BD8F1BF3DE
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 18:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 664244184D
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 18:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 664244184D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HahA31sBSqfr for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 18:53:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D4254184C
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D4254184C
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 18:53:21 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id 63so2118608iov.8
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 11:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LKixGTDblLRTFD9XoveC5pk0RaDvUenPhXhkfNcrzSQ=;
 b=AYM7eHipUIiQc22E0rUiwVxe3GOh9aeUjpoI6opk1uhy7DJLNt9bm3n4spkN5vIh7U
 0+9PPCNSVMFGTmXk77TxOppbo/XA+F2loAap1qWtmpM3wF8OjP6GauoxbTANTD9KEIRh
 EWlch2I9h+BBtogIDZFLEJABBAq3YHftd6q5rXt8PSOLYYIfN7SN0UTu9f+GNOcAXjtj
 jtnlJSQ6aM3E7TVgKbY/x6sUD3Wu2qkOSHk5sIX5QMrC7q73zhsvt6HQOmoflrBF2ns4
 uvq+eu6a/FFeCfo92gpULYjo8z/lcHjCpwWCcEwuwToXfAqzb+19fKwh8OGvFN49DzN2
 UrpA==
X-Gm-Message-State: ACrzQf1bjuDK5CLGCdl+k5nekkO1j8lPOzikmnAlTu+drlCdkh004k9B
 SvWnO1HeTiMC7kZsf18hRuDmZbWL+2O2vuN4
X-Google-Smtp-Source: AMsMyM45TkgZeZ+EenuT7bXo6v+DKzcbro2Sm1UO901QkIlPqHX1CH1Rav6X8Re8tQxrkC/I5GPK7g==
X-Received: by 2002:a02:cf8f:0:b0:373:9526:ff08 with SMTP id
 w15-20020a02cf8f000000b003739526ff08mr20829796jar.298.1667501600686; 
 Thu, 03 Nov 2022 11:53:20 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 q130-20020a6b2a88000000b006a102cb4900sm621058ioq.39.2022.11.03.11.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 11:53:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 12:53:18 -0600
Message-Id: <20221103185318.2719978-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LKixGTDblLRTFD9XoveC5pk0RaDvUenPhXhkfNcrzSQ=;
 b=BIiXNTAUyWqwzxTm7Tawaly0EJPkRpC+e5mwfHQkenHI/sPOmJeHsJCbAmlhLIZRmI
 fnoS9gJ5EpEAbDCeS9q1K8mby8exiW4vJfUtjwctnAWx9Vg7KAFtnkzaZrI1XG9IFLM6
 kh5At+0lJ+rnfM4WbEEuXMJPvWog+2thObK6xi9xSL23Dfl2eh+X7JchU7n/G4AIcJ61
 UqPC/hq+dZLNRm3Y6uu1jHQVIdTdWhDqXP8XF6gxXA+YDdjTDe87rfqtAoVl/ounJGFV
 kbWOh831yCNXaR5vVv9jBVUf2qDGhV1YbMtcOnCgIUvq1OjCbm6j7t+qm4v4AXfhL9Dq
 4kMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BIiXNTAU
Subject: [Buildroot] [PATCH 1/1] package/python-requests-toolbelt: bump to
 version 0.10.1
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

License hash changed due to url changing to https:
https://github.com/requests/toolbelt/commit/e9875f91861c81e437deb3d76a641e4cf0146ea4

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-requests-toolbelt/python-requests-toolbelt.hash  | 6 +++---
 .../python-requests-toolbelt/python-requests-toolbelt.mk    | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-requests-toolbelt/python-requests-toolbelt.hash b/package/python-requests-toolbelt/python-requests-toolbelt.hash
index 833570b113..28abf2c628 100644
--- a/package/python-requests-toolbelt/python-requests-toolbelt.hash
+++ b/package/python-requests-toolbelt/python-requests-toolbelt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/requests-toolbelt/json
-md5  b1509735c4b4cf95df2619facbc3672e  requests-toolbelt-0.9.1.tar.gz
-sha256  968089d4584ad4ad7c171454f0a5c6dac23971e9472521ea3b6d49d610aa6fc0  requests-toolbelt-0.9.1.tar.gz
+md5  636d226d03632d013269aebbc85f4f4b  requests-toolbelt-0.10.1.tar.gz
+sha256  62e09f7ff5ccbda92772a29f394a49c3ad6cb181d568b1337626b2abb628a63d  requests-toolbelt-0.10.1.tar.gz
 # Locally computed sha256 checksums
-sha256  3a1a3cffa7abc000cbd726a664f56c33c532a55480f9e056dfe941cf93b7c37f  LICENSE
+sha256  1f8cf8bdacd98ed6d36d0fec0c07f7765acebd6e81205962ab5146023b3c858d  LICENSE
diff --git a/package/python-requests-toolbelt/python-requests-toolbelt.mk b/package/python-requests-toolbelt/python-requests-toolbelt.mk
index 119c402785..8c141e3aa9 100644
--- a/package/python-requests-toolbelt/python-requests-toolbelt.mk
+++ b/package/python-requests-toolbelt/python-requests-toolbelt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REQUESTS_TOOLBELT_VERSION = 0.9.1
+PYTHON_REQUESTS_TOOLBELT_VERSION = 0.10.1
 PYTHON_REQUESTS_TOOLBELT_SOURCE = requests-toolbelt-$(PYTHON_REQUESTS_TOOLBELT_VERSION).tar.gz
-PYTHON_REQUESTS_TOOLBELT_SITE = https://files.pythonhosted.org/packages/28/30/7bf7e5071081f761766d46820e52f4b16c8a08fef02d2eb4682ca7534310
+PYTHON_REQUESTS_TOOLBELT_SITE = https://files.pythonhosted.org/packages/0c/4c/07f01c6ac44f7784fa399137fbc8d0cdc1b5d35304e8c0f278ad82105b58
 PYTHON_REQUESTS_TOOLBELT_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_TOOLBELT_LICENSE = Apache-2.0
 PYTHON_REQUESTS_TOOLBELT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
