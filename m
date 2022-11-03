Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D89C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 20:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8664B4185A;
	Thu,  3 Nov 2022 20:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8664B4185A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tu6xXp5pBMaL; Thu,  3 Nov 2022 20:34:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3121A41852;
	Thu,  3 Nov 2022 20:34:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3121A41852
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D6FD1BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85D7961038
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85D7961038
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fyiTyY5pVWFD for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:34:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 927C261012
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 927C261012
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:34:03 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id 63so2350148iov.8
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 13:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JuOVooUjDK98dVIciVlZh7VAaJPLbAIugCQvkKajVac=;
 b=L6rtGPz2IbgRIEk3GVa6HVo6i6n81otdEYu/h1xij8iC9auJUNeFmy/x/ZfBYWlhge
 OdiHBxksBGVUsbHQcyIJHajoZS7SKdjdSl4vsdddCiQZkFlOH65TWeoYfuB7rZsSD8Sp
 E5nU/WWog/AU6hQXbPR4o79aSQee5OKI2Rbu2SvyISvnbSMM9iN9k6kVomHGRdZQhNgr
 QVNvdlhz3E//tzk1gw7sP/1vxbSYNPRVq0lvJrZQM0WgZ3IXzOEWNVajPxJj9cRihi1m
 akgrfrYTLweODlGJAR2kR9mJzHBtt7y0R6n/Ztzk6n10lTBNadThLdI9k4dk5CAhJdL+
 DKSQ==
X-Gm-Message-State: ACrzQf3bf1N3Qkz9yzaBfS66BBRGz7IMx3EV5/ZVnEyFqCa/leLLb1J9
 qCAcmZ7qDZahrwHIE/XfB5at0jXdklPajGuj
X-Google-Smtp-Source: AMsMyM61eBtMgN7qChl5gGxo0+m/lug/6MMUhfvzueri/nsyOa/2gps4kOqBbZhg/6xBht1gXan2Kg==
X-Received: by 2002:a02:7a4c:0:b0:375:5c6e:b23 with SMTP id
 z12-20020a027a4c000000b003755c6e0b23mr15057921jad.47.1667507642387; 
 Thu, 03 Nov 2022 13:34:02 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 b11-20020a02958b000000b0037477c3d04asm500357jai.130.2022.11.03.13.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 13:34:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 14:34:00 -0600
Message-Id: <20221103203400.664382-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JuOVooUjDK98dVIciVlZh7VAaJPLbAIugCQvkKajVac=;
 b=MlwuXrjd+rkw8TVXQKqD+zSn/HaqEl+FCO2Xl3H04F4feSeRXnZVS5kZs4/ITlA/kP
 ZCZOjh0c/rWveOyeDoWwS1296if5m47f7xwHw4PdrsMz1o+PEUsKNNz4lXIhcBlfjZc9
 QiEbO67v1XJNqcbYnnyyRJFpWLoo3rfZgaxrMj53BmmnYPpnxmPYH25elt34460XHjTB
 ELrEUXMphohw1q/IsTSO6OyUD/cfJCT8mSALER1rglyFbJdXahO4v9xzMv9/ICD6jqOo
 RBhRrHHu70zcyd8XqWTTulnHS2lJ/ggvUsJLgYWs+Fmt+bQ/Nqijk71+9jVlZeN8AeRp
 e8sg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MlwuXrjd
Subject: [Buildroot] [PATCH 1/1] package/python-wcwidth: bump to version
 0.2.5
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

License hash changed due to format change during move:
https://github.com/jquast/wcwidth/commit/4baf950b88a28a9fe21d132e088b4ffc58e66276

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-wcwidth/python-wcwidth.hash | 8 ++++----
 package/python-wcwidth/python-wcwidth.mk   | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-wcwidth/python-wcwidth.hash b/package/python-wcwidth/python-wcwidth.hash
index ed1d2cd61f..216182c2ed 100644
--- a/package/python-wcwidth/python-wcwidth.hash
+++ b/package/python-wcwidth/python-wcwidth.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wcwidth/json
-md5  b32584cd6084b4a8c81df13a2a6b4351  wcwidth-0.1.9.tar.gz
-sha256  ee73862862a156bf77ff92b09034fc4825dd3af9cf81bc5b360668d425f3c5f1  wcwidth-0.1.9.tar.gz
-# Locally computed
-sha256  0eddcc52cd3ef5d30798b8d43a14d3f0f1dcf0a6e4c1d0f2e177c44ce85bb69c  LICENSE.txt
+md5  a07a75f99d316e14838ac760c831ea37  wcwidth-0.2.5.tar.gz
+sha256  c4d647b99872929fdb7bdcaa4fbe7f01413ed3d98077df798530e5b04f116c83  wcwidth-0.2.5.tar.gz
+# Locally computed sha256 checksums
+sha256  70b98a95a2144eb70af8017fa8c6d95ce247e40867436e8bc649e137fe13d21a  LICENSE
diff --git a/package/python-wcwidth/python-wcwidth.mk b/package/python-wcwidth/python-wcwidth.mk
index ccbd0e99ca..a170a8e395 100644
--- a/package/python-wcwidth/python-wcwidth.mk
+++ b/package/python-wcwidth/python-wcwidth.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_WCWIDTH_VERSION = 0.1.9
+PYTHON_WCWIDTH_VERSION = 0.2.5
 PYTHON_WCWIDTH_SOURCE = wcwidth-$(PYTHON_WCWIDTH_VERSION).tar.gz
-PYTHON_WCWIDTH_SITE = https://pypi.python.org/packages/25/9d/0acbed6e4a4be4fc99148f275488580968f44ddb5e69b8ceb53fc9df55a0
+PYTHON_WCWIDTH_SITE = https://files.pythonhosted.org/packages/89/38/459b727c381504f361832b9e5ace19966de1a235d73cdbdea91c771a1155
 PYTHON_WCWIDTH_SETUP_TYPE = setuptools
 PYTHON_WCWIDTH_LICENSE = MIT
-PYTHON_WCWIDTH_LICENSE_FILES = LICENSE.txt
+PYTHON_WCWIDTH_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
