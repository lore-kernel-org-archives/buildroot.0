Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3706EC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 05:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E15E1837AD;
	Wed, 10 Jan 2024 05:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E15E1837AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B081aLETaVzd; Wed, 10 Jan 2024 05:19:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40E958378C;
	Wed, 10 Jan 2024 05:19:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40E958378C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4734C1BF34C
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 05:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CB0C6152D
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 05:19:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CB0C6152D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RmkgWPwREtoE for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 05:19:14 +0000 (UTC)
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5485561523
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 05:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5485561523
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7ba9f1cfe94so121577939f.1
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 21:19:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704863953; x=1705468753;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mmEaHPJ2gYmsX1AbRhAqxYtP3dZNTtv5wKxQYbbFCC4=;
 b=hTPc4GR+drF5br7163ITgHjiNH1Nm3DcXX5r4acY+n98m15AilVBBeBQOnYx51imsq
 xnp8zslXW8mGfMZX89zL4YX2T+rCcH0TmL/ci1x/QZXeNnzHkglHNsO1y4okE32CA+kC
 EuGN+CT/ybq0dLf47RWtgUVKzpVxDgzXU7aFgYPYufgM3AVq9nm7s8oEeMoK/CJvoiSq
 v3Zz6EzqchZeJfwCxQ977Z5jRyo9NKEfCzJELR5gcDhmN5PklgnUfmaHVzUqmV0AcpWO
 nqu+9LWEYPa4gnU7KBgK0bEXHoq6VvqbacQapmlHmmlWVUQAINw7e3vCTCX/JlNLCvBe
 yaPQ==
X-Gm-Message-State: AOJu0YzHbVd9EDfMvSZjaksl/tnFhMrZxOh3Zw9VeiA9dp67qY6y6LL6
 o8R0LLItNKBTVojJwrNd6GNdFOTQpu0u3g==
X-Google-Smtp-Source: AGHT+IFC8VnAgJZZ3ubqXKFRIM4h48u66ufA8PzRtqmr+I1mzwgowODco9Myi9U+ybH033KKE4Xdyw==
X-Received: by 2002:a05:6e02:1847:b0:360:73de:be5e with SMTP id
 b7-20020a056e02184700b0036073debe5emr629572ilv.14.1704863952943; 
 Tue, 09 Jan 2024 21:19:12 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 br9-20020a056e0223c900b0035f7f712c78sm1054633ilb.36.2024.01.09.21.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 21:19:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 22:19:10 -0700
Message-Id: <20240110051911.1137724-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704863953; x=1705468753; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mmEaHPJ2gYmsX1AbRhAqxYtP3dZNTtv5wKxQYbbFCC4=;
 b=XjYhvqbgvb2irFRWigNDAuAo5lzzVA7Qlm+NN8eYFi6+KH/gOwwcSYbA5vsqs1oJzA
 Jvy8UeDph1m0uOqqTF5OIx17U5rPa7j/R8TckJXx/loLVuf+HMyQc52uIoLu4JL6rJ9d
 uYkaFJHSPPhNWJcX/k77GJQyDZCCQyWBBxDuCmpSXpZ6bkAA/wi8d4/p/He+C/XsV5iA
 Gl3Ckj1bqpMTyvtba4pbzj+30NLCm0E3mbyKlALayN5ku6xksBv7eZBnXDBK3iG6omF7
 0DeKIZcXMOW6Lly30QN2+tCZ3pbUGTl2EgK5aFc7SbAKnXE/4cdLlT4IJhan3plTU9+L
 JIvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XjYhvqbg
Subject: [Buildroot] [PATCH 1/1] package/python-pyjwt: bump to version 2.8.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyjwt/python-pyjwt.hash | 4 ++--
 package/python-pyjwt/python-pyjwt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyjwt/python-pyjwt.hash b/package/python-pyjwt/python-pyjwt.hash
index 249f0e478e..06b91bc14a 100644
--- a/package/python-pyjwt/python-pyjwt.hash
+++ b/package/python-pyjwt/python-pyjwt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/PyJWT/json
-md5  228adbf1f9d2bcd42bbfb6d3b43dc48a  PyJWT-2.7.0.tar.gz
-sha256  bd6ca4a3c4285c1a2d4349e5a035fdf8fb94e04ccd0fcbe6ba289dae9cc3e074  PyJWT-2.7.0.tar.gz
+md5  a683445793adb7fcf39ad3e55c5c347c  PyJWT-2.8.0.tar.gz
+sha256  57e28d156e3d5c10088e0c68abb90bfac3df82b40a71bd0daa20c65ccd5c23de  PyJWT-2.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  797a7a20231d4c433e9f1911db1731d06b5828b98f499819a034f7c0f56f5ce5  LICENSE
diff --git a/package/python-pyjwt/python-pyjwt.mk b/package/python-pyjwt/python-pyjwt.mk
index 982bc758df..d4cf226941 100644
--- a/package/python-pyjwt/python-pyjwt.mk
+++ b/package/python-pyjwt/python-pyjwt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYJWT_VERSION = 2.7.0
+PYTHON_PYJWT_VERSION = 2.8.0
 PYTHON_PYJWT_SOURCE = PyJWT-$(PYTHON_PYJWT_VERSION).tar.gz
-PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/e0/f0/9804c72e9a314360c135f42c434eb42eaabb5e7ebad760cbd8fc7023be38
+PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/30/72/8259b2bccfe4673330cea843ab23f86858a419d8f1493f66d413a76c7e3b
 PYTHON_PYJWT_SETUP_TYPE = setuptools
 PYTHON_PYJWT_LICENSE = MIT
 PYTHON_PYJWT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
