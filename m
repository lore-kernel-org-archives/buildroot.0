Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42B8C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 02:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CBDF84984;
	Sun, 24 Jul 2022 02:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CBDF84984
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tyVpwZK4aw7e; Sun, 24 Jul 2022 02:38:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CBAA84970;
	Sun, 24 Jul 2022 02:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CBAA84970
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 97DFF1BF4E7
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 02:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DC9661060
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 02:38:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DC9661060
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zlD8Ct3Ms6FL for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 02:38:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D62260C25
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D62260C25
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 02:38:07 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id u20so6341603iob.8
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RfYio3iEHi01ot0VYu+Y1bd31tZGHlqThY5l8c5xpqI=;
 b=t1UvPjecvvAsJ3ZJ7UobtnJMXJP2/KxNms+QeMrSIyKLaNy7V4k7LyT80PtUwfsX3a
 3ZrFSPJ36Dp+SOpz3/JTuPQBQnPos8Jiv3zyQ+8hO6pDMM3MV6QgvRqS57NCRzcc+8fL
 HdA/6vya9WsMytZMUG5iaAlxr3TTSZVkMUDg6axQ2i7Xei0xelFJgGeHgbPDqm8gO5+q
 0aITAlYQz/cxceMpoEjQfJLPj+z+v9Qp1wUZYjuKcQRss3VpOUwZQIlQ8ZhaPAfeIRAc
 7Uy5tdRzudu3sniGKkJLVLeVTTHECLg/sroIEtxSKETLjYizOa6Yp+wW59CEBo4PdKcP
 71Bw==
X-Gm-Message-State: AJIora9HLoBdnTZi8S3MTISk/zqIEyYQSqZ+cqVkcpzTytLo+2nk1nWA
 4vCE659hsIhQyrQZ97mKIlIocL9GxCBqyw==
X-Google-Smtp-Source: AGRyM1vIlxz/2ofTvruxC5jZq8r48PmZUy5ORvGp7ZTjhU/Nj+IkwxS3eVcwnlkTE5+VrCPX0SLaWA==
X-Received: by 2002:a05:6638:1654:b0:341:59e0:9958 with SMTP id
 a20-20020a056638165400b0034159e09958mr2642126jat.224.1658630286182; 
 Sat, 23 Jul 2022 19:38:06 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 c7-20020a6bfd07000000b0067c31b61f43sm4362053ioi.4.2022.07.23.19.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 19:38:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 20:38:03 -0600
Message-Id: <20220724023803.1027041-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RfYio3iEHi01ot0VYu+Y1bd31tZGHlqThY5l8c5xpqI=;
 b=IMcitnaKH4mj5VImn6U3CQ1fOo5coaIeTvMsqed6IZb27ukpuLjxbLuOXRh9783TON
 3y6EEv9VKRi2EVlyl+xjN/VXKpRFveR6//W+lbNQauTM+USuAgLKN96KDJJUSZgFZiQl
 m2JMC0sIrkAbO/7jA5E67VeLfcNBN1ZNIWeG0FT70+pmuI1Dll5S3gRjEGybSyYznOu7
 uLw9MkXQE+3ibBXCjxeCT5ZwScmIlM/miwIV5oMsBnPLqKE7ytQhGtihEaTsSLXkGoOY
 UdBRUTUKS2c9R7Q9V/DDt/eezlKz7+jLGiqPf23U4BLDzeHs5Hsl9KtYkEEZyThR5g7M
 OUlA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IMcitnaK
Subject: [Buildroot] [PATCH 1/1] package/python-cython: bump to version
 0.29.30
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cython/python-cython.hash | 4 ++--
 package/python-cython/python-cython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index 9c5f1225cf..19f5143b05 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5  2b2ba86abcf823985935d37f5e43b19a  Cython-0.29.27.tar.gz
-sha256  c6a442504db906dfc13a480e96850cced994ecdc076bcf492c43515b78f70da2  Cython-0.29.27.tar.gz
+md5  3cf4001b4be42a263f163865235c39d8  Cython-0.29.30.tar.gz
+sha256  2235b62da8fe6fa8b99422c8e583f2fb95e143867d337b5c75e4b9a1a865f9e3  Cython-0.29.30.tar.gz
 # Locally computed sha256 checksums
 sha256  a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
 sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index b9fbf7b11a..44efdd6b16 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYTHON_VERSION = 0.29.27
+PYTHON_CYTHON_VERSION = 0.29.30
 PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/eb/46/80dd9e5ad67ebc766ff3229901bde4a7bc82907efe93cd7007c4df458dd5
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/d4/ad/7ce0cccd68824ac9623daf4e973c587aa7e2d23418cd028f8860c80651f5
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
