Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD0BC4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 20:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3171281E90;
	Wed,  2 Nov 2022 20:12:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3171281E90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yNoxjYFCJbVY; Wed,  2 Nov 2022 20:12:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ADA881E8C;
	Wed,  2 Nov 2022 20:12:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5ADA881E8C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9AE4C1BF476
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 768BB408D2
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:12:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 768BB408D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lhhIqX9aomTm for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 20:12:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F4AD400D0
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F4AD400D0
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 20:12:27 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id 63so15978711iov.8
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 13:12:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zQpjvNn2VXMlvRkya4Lr3U596GkDb2EGpnaqoO/KpDs=;
 b=o0f5JdYzEUdzlVFEmLFl1zoo+85rAP3csM0VCyYL5iqOLQKPmiQZET7oWSSyl8cezu
 s3Q6MgVbeBZZpUB15EnkcuLf8GV32B8Ad9edCd5pgwio/brvpwRSbCMxKOnRZOdLlefk
 9UYQwKdIk/Q+QDmc2JAydk3FU0BhCNhXTagOD9Xv3TcN8ZOvz5sj5R1hkvUDipYK+7Lq
 H14fk1RSrvq+yahudLtfAn/qqnlWsfbjKeKmWMDVWkgB8sY0HoEmCJxNYseng4jeG8V4
 1ohN63zCJOaRCeYugj9JMAe3rokBqVuKnlphhGTBAHwAwRmMSqy+DwxlsxcCyxx5g3nY
 GNag==
X-Gm-Message-State: ACrzQf3whVkoYa6CY+j2Keim8yHJgW1uX7ROihRkwIYX9km2dJQMK0YM
 L9uBKDlGULsiDAV9l4uQ6tWwGJ9mVo/LPQ==
X-Google-Smtp-Source: AMsMyM6hsMVegk4e/4CBGXXAYZjH+BFnuZxpUBtTX/wP8Wa0sP19NEdypWuF7jIm2ahT1F5REQxefQ==
X-Received: by 2002:a5d:8913:0:b0:6a4:71b5:8036 with SMTP id
 b19-20020a5d8913000000b006a471b58036mr16490778ion.171.1667419946269; 
 Wed, 02 Nov 2022 13:12:26 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 h7-20020a05660208c700b006bbddd49984sm5423147ioz.9.2022.11.02.13.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 13:12:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 14:12:24 -0600
Message-Id: <20221102201224.1972919-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zQpjvNn2VXMlvRkya4Lr3U596GkDb2EGpnaqoO/KpDs=;
 b=aVCjfb0cu9ZrsPXSYfmbFaWBsSwerG3U7xnQvMrw4/iTcxDTJFJJmwfMMCvCeqjkaE
 nz+HlXL2MAY7G82agE0EZyGtfaqVgvtQGR6Ivh7WSrniPmR+LKcTjU8bkOtJm4gpCPy0
 0n2pRrO39JkjuWxWCf5gAPJKytVNuweFR/Yd5EAMaO6TLMMlRMphtsCAM90U3i7mwFuC
 KOL47E1l+TXhIwMIK++UaXcWWfxao5p/PULQ+7Zw3SO0vpn/lfPFMbKbwhY1h9q5VyEx
 jrtp5okL58ZN//sHfxzAtO5Oe2io6z+voX8urUmQZA4Rt13r4cttzhcpKlvMQl8AoRbD
 nhrQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aVCjfb0c
Subject: [Buildroot] [PATCH 1/1] package/python-dominate: bump to version
 2.7.0
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
 package/python-dominate/python-dominate.hash | 4 ++--
 package/python-dominate/python-dominate.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dominate/python-dominate.hash b/package/python-dominate/python-dominate.hash
index 2e77d72a2e..89293baec6 100644
--- a/package/python-dominate/python-dominate.hash
+++ b/package/python-dominate/python-dominate.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dominate/json
-md5  9f714324ca99eee98bb3c3cdbe838de6  dominate-2.6.0.tar.gz
-sha256  76ec2cde23700a6fc4fee098168b9dee43b99c2f1dd0ca6a711f683e8eb7e1e4  dominate-2.6.0.tar.gz
+md5  77bba29beaaac4dfb657092cd89db033  dominate-2.7.0.tar.gz
+sha256  520101360892ebf9d0553f67d37e359ff92403d8a1e33814030503088a05da49  dominate-2.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  9ccf26cfe845e0eb8bb58053e47366e7ab6b697ae010f7650978d4b71b7d1fc1  LICENSE.txt
diff --git a/package/python-dominate/python-dominate.mk b/package/python-dominate/python-dominate.mk
index 79fc058737..0f3687de5f 100644
--- a/package/python-dominate/python-dominate.mk
+++ b/package/python-dominate/python-dominate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOMINATE_VERSION = 2.6.0
+PYTHON_DOMINATE_VERSION = 2.7.0
 PYTHON_DOMINATE_SOURCE = dominate-$(PYTHON_DOMINATE_VERSION).tar.gz
-PYTHON_DOMINATE_SITE = https://files.pythonhosted.org/packages/29/23/edf8e470f1053245c1aa99d92c8a3da9e83f6c7d3eb39205486965425be5
+PYTHON_DOMINATE_SITE = https://files.pythonhosted.org/packages/12/d7/5e5f50f5d5bdd4282d2a70b9479c1d91d6628bebd4829e455cdf7366a92e
 PYTHON_DOMINATE_SETUP_TYPE = setuptools
 PYTHON_DOMINATE_LICENSE = LGPL-3.0+
 PYTHON_DOMINATE_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
