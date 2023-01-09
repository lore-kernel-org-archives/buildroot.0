Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734E7C54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 05:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1056E60B0C;
	Mon,  9 Jan 2023 05:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1056E60B0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tAlowvrK7joP; Mon,  9 Jan 2023 05:03:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A02660A9D;
	Mon,  9 Jan 2023 05:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A02660A9D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CA8181BF357
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 05:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC9B360A9D
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 05:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC9B360A9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qjFQfwco2NEu for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 05:03:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED1C5606ED
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED1C5606ED
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 05:03:03 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id y4so4120812iof.0
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 21:03:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yQ+Ik/zqnb8J+7XxySCWtPE8N3LLSnqgGGoW1QuoyWs=;
 b=o36jPFkUbEZad4DTkbTD6qdvvWx9A6UGCdWCgNXLC5LOF+WZiY5FEYdAV95/SSaAUF
 EZtSwTNL2cDFbKu9uboGuC5nClFYAT+6F5vVssJiUP9z0QMHSVZO6XTdRiZGp4h8Rfck
 36N10DgiDyz2DPmP41BeB53ypI6XSkWJLHEc58J4nEdOiknvlv8MhhK48mZs6MFI4Za3
 2NmA9H5cRLaqsQO/WRrAhBih7LHYfF3sDjgXIWEtQfrH0yweUmp5y4SuW8Ol5JTNaiT8
 azuMk0KxRk6SMmxI9A7X+BlFVlidmIuNWWcYS1ScoZOpfoG9edzipAkZh2l5qOX6dQL0
 twQA==
X-Gm-Message-State: AFqh2kpzehXMyspeIkGiLfaBlQLL0QR7B3IqPOFynnRz187uxRuULj0e
 qzwo8uwtheKRsuxost869FlywYaeaXsnqy4r
X-Google-Smtp-Source: AMrXdXsYOsjbeTIuUVT0Hr9EJZ3/uwjLALriDH+EwduXlgNcr4iVxnI8oS9mnHhIN1zDQB0kEnUY8A==
X-Received: by 2002:a5e:c307:0:b0:6df:df0c:6ce1 with SMTP id
 a7-20020a5ec307000000b006dfdf0c6ce1mr43256111iok.10.1673240582812; 
 Sun, 08 Jan 2023 21:03:02 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 d5-20020a023f05000000b0039d83030978sm2526675jaa.109.2023.01.08.21.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 21:03:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 22:03:01 -0700
Message-Id: <20230109050301.2518247-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yQ+Ik/zqnb8J+7XxySCWtPE8N3LLSnqgGGoW1QuoyWs=;
 b=MXzKD72M7iwnIcRI2nsTl8uAWUpJORzdNfL9/L9IFqZBYpTgaUDVZW1C+u1oHz0VAW
 LFRYsxKZIQPgDZpQ5YvmKxUtHoE6Ah5S/xVvBpLbTSy750Y6tUBUdEy6WiyvA4mJdKaB
 DaufQp9rN72+dbaUf9EKO36Wv/HzRrcNT6Rz9csLBcQCRveOI8yACf+Wb9iJ6157ynZK
 ZZ0tp3tR8/oZYAwg8fqeA3ZeCI0ReoxiYgEs+dwRhNd98wSECr9pFGQfHRZbnt3EmNOV
 /fQq5j7VqtJ81mbzBDg3yYKcL2fkA5IOLq9cHoUpfkAolVewh3WkKhKqOfDXYR91mLkl
 +zlw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MXzKD72M
Subject: [Buildroot] [PATCH 1/1] package/python-pybind: bump to version
 2.10.3
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
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pybind/python-pybind.hash | 2 +-
 package/python-pybind/python-pybind.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pybind/python-pybind.hash b/package/python-pybind/python-pybind.hash
index 530cbf64af..971eceaa07 100644
--- a/package/python-pybind/python-pybind.hash
+++ b/package/python-pybind/python-pybind.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  111014b516b625083bef701df7880f78c2243835abdb263065b6b59b960b6bad  python-pybind-2.10.1.tar.gz
+sha256  5d8c4c5dda428d3a944ba3d2a5212cb988c2fae4670d58075a5a49075a6ca315  python-pybind-2.10.3.tar.gz
 # License files, locally calculated
 sha256  83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb  LICENSE
diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
index e89d77147e..1fd106b981 100644
--- a/package/python-pybind/python-pybind.mk
+++ b/package/python-pybind/python-pybind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYBIND_VERSION = 2.10.1
+PYTHON_PYBIND_VERSION = 2.10.3
 PYTHON_PYBIND_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
 PYTHON_PYBIND_LICENSE = BSD-3-Clause
 PYTHON_PYBIND_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
