Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD276C43217
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 20:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46D3E61038;
	Thu,  3 Nov 2022 20:40:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46D3E61038
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2aok8YU93gt9; Thu,  3 Nov 2022 20:40:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F31A605A9;
	Thu,  3 Nov 2022 20:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F31A605A9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A0611BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74C89414E0
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:40:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74C89414E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hTZpB4ciDfFO for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:40:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BB0A410DE
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4BB0A410DE
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:40:38 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id 63so2363868iov.8
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 13:40:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BzylSdJjweABtFn4K+9HF3p56uHshzh1pwcW9hUr1Fo=;
 b=ieYIi+wr/Pa4YbfeuuyOyxICpONVtw9b2rRu02oH6r8c1of4f++dWnhrSuP3/qYie8
 0vPsRnyXEfttBQq1IDfEjLY59QhkhAFsz7bEdM6464L5l5iCi9Y5+AFeIn+z518axzCl
 +Uw+8bQkebUr6P5RCdRBEZx22fmAwRcx/bckZfWrE/vdcpNaImQqJEcJTvlUfSc/NVcW
 hjzsSOxpFLsqsitJHaat+tL/dqGqzMKr+9vd+9JyJj6EvPe0diRty1h/JPCKCEoTtm/Q
 m08PfHhZLu65zzPzL+XgAxBa2K3J/nrXBpPXe1XEdzSdRLr7tEiJ/oi/K5obuOdiBYh/
 CR2Q==
X-Gm-Message-State: ACrzQf0xbYZlHX/euGZrX1tRDJNLenWnNLCgcfJAM5YfVi6m61y/g/33
 2BRCmBmECm6pYkGue4D7aQyOAhP/ZnRvcHo5
X-Google-Smtp-Source: AMsMyM5VaAy46Wj/h0XA+uoJ+JIdp3b0QN5dT96gQ3yhMEKb/Vkc4veeuX+mAWCvUzLnJu6CfrwewA==
X-Received: by 2002:a05:6638:ce:b0:373:fccb:63e3 with SMTP id
 w14-20020a05663800ce00b00373fccb63e3mr19499067jao.66.1667508037167; 
 Thu, 03 Nov 2022 13:40:37 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 x17-20020a927c11000000b00300e7a459aasm432968ilc.38.2022.11.03.13.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 13:40:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 14:40:35 -0600
Message-Id: <20221103204035.1098102-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BzylSdJjweABtFn4K+9HF3p56uHshzh1pwcW9hUr1Fo=;
 b=Zw4IGqWYvpJiVFXVLfxRp+PlrQk5Bh7XgRXmoDXq4ue1eXdgoKqKrJP+wyvQ48R7kT
 d7U60GZNaTfgFGn6kwFKSAaHr/5LPMlHt5lE4G2JYyI88oZzFFZv29r8z5KenVum7LDy
 QYlvl5M6BTkYk0f5YgH4eOmEcfgjJE+2gz4DotXTyjcAjXULePqBknAVPBVhEoUnhSQ4
 MRLZHlEUjgkldI3A5U5vFQsWIHHRBFmI9IyBehAShtTyjl4dn+VW30Rr9daK24f/6ys2
 mAI8bZ07EGTtvbffT4QiDUHjJa2zU3A6Iboya2h3I49aON44b9VnNFihA7x5RH9lFEQO
 SG4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Zw4IGqWY
Subject: [Buildroot] [PATCH 1/1] package/python-webpy: bump to version 0.62
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

License file was accidentially removed in latest release but project
is still public domain licensed.

Details:
https://github.com/webpy/webpy/commit/04bf405dd86485c8f3774c526e6a869a1eb73408

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-webpy/python-webpy.hash | 6 ++----
 package/python-webpy/python-webpy.mk   | 5 ++---
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/python-webpy/python-webpy.hash b/package/python-webpy/python-webpy.hash
index ed3da6b1ab..540771a244 100644
--- a/package/python-webpy/python-webpy.hash
+++ b/package/python-webpy/python-webpy.hash
@@ -1,5 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/web.py/json
-md5  4e7ec89e7ae1e938d01fff01ba752606  web.py-0.40.tar.gz
-sha256  dc5e42ffbc42d77d07f75b7acca9975a3368ae609774e49ddebb497a784131f3  web.py-0.40.tar.gz
-# Locally computed sha256 checksums
-sha256  791bf6e9419435f114a19fc6519ff33738021eb3c41b18490943230ab0894df9  LICENSE.txt
+md5  cd2c0296ceffa1acb96ae5315214eb42  web.py-0.62.tar.gz
+sha256  5ce684caa240654cae5950da8b4b7bc178812031e08f990518d072bd44ab525e  web.py-0.62.tar.gz
diff --git a/package/python-webpy/python-webpy.mk b/package/python-webpy/python-webpy.mk
index 187a481286..06d4ae039b 100644
--- a/package/python-webpy/python-webpy.mk
+++ b/package/python-webpy/python-webpy.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-PYTHON_WEBPY_VERSION = 0.40
+PYTHON_WEBPY_VERSION = 0.62
 PYTHON_WEBPY_SOURCE = web.py-$(PYTHON_WEBPY_VERSION).tar.gz
-PYTHON_WEBPY_SITE = https://files.pythonhosted.org/packages/e3/23/ed84b174add09153329c6357984c8433e2f350de91c3859fa48c3cdbf7dc
+PYTHON_WEBPY_SITE = https://files.pythonhosted.org/packages/cd/6e/338a060bb5b52ee8229bdada422eaa5f71b13f8d33467f37f870ed2cae4b
 PYTHON_WEBPY_SETUP_TYPE = setuptools
 PYTHON_WEBPY_LICENSE = Public Domain
-PYTHON_WEBPY_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
