Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F73C433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 20:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 587BE81E73;
	Wed,  2 Nov 2022 20:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 587BE81E73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wGAjGdnvSlYZ; Wed,  2 Nov 2022 20:42:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96CA181E4E;
	Wed,  2 Nov 2022 20:42:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96CA181E4E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 45A311BF476
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2171260B08
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:42:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2171260B08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k_iWA4UHMQCT for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 20:42:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08D97606E7
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08D97606E7
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 20:42:15 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id y6so13075633iof.9
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 13:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yFPW1ThDyXE8BFhBFSZrAMDYEr8yUqiyomWlUSuI7xo=;
 b=O+2kXNTbtV0QcxDFs9274vDIJ5cxCedv6JhF5ExIylJ2P3J7rIfOI59mUclRnQ9zzd
 osYtfGrR7tvJNCb0DUu6YAJi1kSeFeG7W0nboDr9EudYCmB+oNw40rcRdZV19LSvYd/p
 qSt3zcSeAzUrhVfn3yjBSnI7LP2qhVPU6x8E91sriOT1jQeC/jrbPDXPQ5K6RcBfJ0hX
 g5FfD5+dT9l+9Mrw9B7p5hqLqho+G2HQwZqr/evUJsG8iafOnkberaa33VAvkgJnkS/L
 ovJJ1D1cD3pDflPydYE43jWdEuQlDiDpymrKxnki4rhXFEwhi84HnxQaYmS5I/RZBP8Q
 E1jg==
X-Gm-Message-State: ACrzQf3VKxk+VUXTSa6aSFVc+ASe0VSweHQ/wq36TuLpJn4+qOQASDnF
 jcQ+PVHGkLAJ97dTa89J8Tm3tqHa/UPwvg==
X-Google-Smtp-Source: AMsMyM57y6ZvOKB7HQXDC1wSpNxDF6Lsy0dDYY8S6bu+ZZ+D6sOWy/F2tuVXdf2bkYiYN5Rt5KPH1g==
X-Received: by 2002:a02:2b06:0:b0:363:4f24:c7dd with SMTP id
 h6-20020a022b06000000b003634f24c7ddmr17010623jaa.132.1667421734478; 
 Wed, 02 Nov 2022 13:42:14 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 f8-20020a02a108000000b0037465a1dd3fsm5011754jag.156.2022.11.02.13.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 13:42:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 14:42:12 -0600
Message-Id: <20221102204212.238062-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yFPW1ThDyXE8BFhBFSZrAMDYEr8yUqiyomWlUSuI7xo=;
 b=I9zkbavq70vfqCUVySAlMKho/wWXnyMh8jgBUGhD2Xh69OlYce6NWXOGxSF5w4auGu
 97AIokf2aKmjHIOXZQ0LdEHFd9p4vxSER55tKeO6GgYKqQs6Lu/f0E36yccWlL556mix
 lnVWLqbABkzXfazcViBEOXlvCn8nhD9lsHb66XQtbvfINjzHu+okZCYNVF2/aonGwdQK
 MhSHFcSOhpw+1kx1mjq2C4Dsu04/v+R5t56oFVo8gItb4lVOSR7igMDawRpI7V7+94db
 sHVJz1m/wiYKA6lPUzltQ1w+VB+uHs4J2dBSUqU/H6srPd1VL0FlB876qN+4o9OlgKQM
 ttzQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=I9zkbavq
Subject: [Buildroot] [PATCH 1/1] package/python-greenlet: bump to version
 2.0.0
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
 package/python-greenlet/python-greenlet.hash | 4 ++--
 package/python-greenlet/python-greenlet.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-greenlet/python-greenlet.hash b/package/python-greenlet/python-greenlet.hash
index 8e2a95b03e..b5fd1fd7b2 100644
--- a/package/python-greenlet/python-greenlet.hash
+++ b/package/python-greenlet/python-greenlet.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/greenlet/json
-md5  b3e86eb9ab0908e6e3ef542e9b94d7e1  greenlet-1.1.3.post0.tar.gz
-sha256  f5e09dc5c6e1796969fd4b775ea1417d70e49a5df29aaa8e5d10675d9e11872c  greenlet-1.1.3.post0.tar.gz
+md5  1d73a38c1c0b0c7e16ec17d6a19f3652  greenlet-2.0.0.tar.gz
+sha256  6c66f0da8049ee3c126b762768179820d4c0ae0ca46ae489039e4da2fae39a52  greenlet-2.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  769831d6e5dfaf2c20802faccff1fafb4c2025dd8f6253dfa47fcad59d4d0979  LICENSE
 sha256  e5ff3c23c110e494cd7d736c10fd96d462457bafeca310840db6527298c7d46b  LICENSE.PSF
diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
index b4a0e5af08..42bf7970d8 100644
--- a/package/python-greenlet/python-greenlet.mk
+++ b/package/python-greenlet/python-greenlet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GREENLET_VERSION = 1.1.3.post0
+PYTHON_GREENLET_VERSION = 2.0.0
 PYTHON_GREENLET_SOURCE = greenlet-$(PYTHON_GREENLET_VERSION).tar.gz
-PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/ea/37/e54ce453b298e890f59dba3db32461579328a07d5b65e3eabf80f971c099
+PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/23/6f/f72865c589d0c79f03b51520a4cdd65647de0513e9ad107a5731df89c235
 PYTHON_GREENLET_SETUP_TYPE = setuptools
 PYTHON_GREENLET_LICENSE = MIT, PSF-2.0
 PYTHON_GREENLET_LICENSE_FILES = LICENSE LICENSE.PSF
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
