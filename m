Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73427C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 20:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1866C81E8C;
	Wed,  2 Nov 2022 20:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1866C81E8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8kW3Pq4tbNQg; Wed,  2 Nov 2022 20:06:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BE2D81E6A;
	Wed,  2 Nov 2022 20:06:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BE2D81E6A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7057E1BF476
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A737416B7
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:06:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A737416B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bhmBpuf49klO for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 20:06:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F100241673
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F100241673
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 20:06:34 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id e19so17299ili.4
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 13:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mAOMPuUwezFNSbLmE8huvuAIODrN+6DrucWzWhPasGk=;
 b=nM0ik5cElCqAF6Do0swQfqkhs8EAN0BcIkji8MbhKJzmQ3mfJmbTCxPCVv/EB6MaWq
 FHTQ8IFtNdllkS4U2lNlUVbW/G+cv76D5bAN7TG7LK9DucI2zulk7Bl0QEndjaehIl6b
 tyQZ+cBd89mJ/iJ7rKaqlF55CVp4F1zgk6Wsqr5bYmk74GISZf/dh20k+hrZ8ciJXJv9
 IZFdELWUFi/bLuHsWB1a55ZjEmkP6baLoWO+ss1s7HWwQI+RVZdjojR3NKuSqSLOVlV7
 EMAYKj4zfEbkDk9K4xZSiGrlhE6rqaFDaOpdCGoi8593kiPpNoxBlBhlcTyUhR1Tb3vN
 /Xpg==
X-Gm-Message-State: ACrzQf0DhkdFHye61+dSK9JVCv9CPKEryKJIa1SMtBXPLqN6azTkRgZ7
 Mj9bIpCGWmZ/QlX6oo19Ib1aZRN28DlnOA==
X-Google-Smtp-Source: AMsMyM6HldU/HeCEeydBIyaEZfCcWaVqMiGjrz2Qo93rP+1202Q/KF533ZJRentgz5Zvq0KBziXGvQ==
X-Received: by 2002:a05:6e02:889:b0:300:a824:ce62 with SMTP id
 z9-20020a056e02088900b00300a824ce62mr12604920ils.0.1667419593710; 
 Wed, 02 Nov 2022 13:06:33 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 i66-20020a6bb845000000b006bb5af55ddfsm5504653iof.19.2022.11.02.13.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 13:06:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 14:06:31 -0600
Message-Id: <20221102200631.1640150-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mAOMPuUwezFNSbLmE8huvuAIODrN+6DrucWzWhPasGk=;
 b=N0EdNt70Dfu3nZabQitdm9ivVnaOcyt4vbOG0g14Z/Vuul2/6yTafMhP4uPbjFIMcJ
 vyW2je4RDDdOl2P2Pyaz7i+oCLim4Sg9bC9TCC+kOVB9KM6Eu4IsOx/z5d7HbaaelwLq
 raj1PrEGiKDFvJAnPiWpP8VmCrxbuziO7DGp7Eu3HwY2LmuWpP769UXqVJPTcQMarkGW
 Z1mhLfgpcXp6NDE+wj8Mn3+Qoi+LJwzXbPki0yecjMibftgQx38VosZT8wuwnNDZN3q1
 n1dKJKXcLrlUOn53jZSjgXp6V+8LQKLz3zJ6bhp8TTdOHtiSKeIrVpAxNLnXGjH9QOEI
 GRUw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=N0EdNt70
Subject: [Buildroot] [PATCH 1/1] package/python-docker: bump to version 6.0.1
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

Add new host-python-setuptools-scm build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-docker/python-docker.hash | 4 ++--
 package/python-docker/python-docker.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-docker/python-docker.hash b/package/python-docker/python-docker.hash
index 678245a979..3fc3c4f0f4 100644
--- a/package/python-docker/python-docker.hash
+++ b/package/python-docker/python-docker.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/docker/json
-md5  e1e8dc73e3220fe9eec1faf80b0290de  docker-4.1.0.tar.gz
-sha256  6e06c5e70ba4fad73e35f00c55a895a448398f3ada7faae072e2bb01348bafc1  docker-4.1.0.tar.gz
+md5  8e85e23ed30a3d07129e197d35e56eb4  docker-6.0.1.tar.gz
+sha256  896c4282e5c7af5c45e8b683b0b0c33932974fe6e50fc6906a0a83616ab3da97  docker-6.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  f2f0b07fa5e492c11d27aa0d2f3f1a0e64b9d17f32d8aa489ae2af9609af33b2  LICENSE
diff --git a/package/python-docker/python-docker.mk b/package/python-docker/python-docker.mk
index f476a1badd..4da972e017 100644
--- a/package/python-docker/python-docker.mk
+++ b/package/python-docker/python-docker.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-PYTHON_DOCKER_VERSION = 4.1.0
+PYTHON_DOCKER_VERSION = 6.0.1
 PYTHON_DOCKER_SOURCE = docker-$(PYTHON_DOCKER_VERSION).tar.gz
-PYTHON_DOCKER_SITE = https://files.pythonhosted.org/packages/de/54/a822d7116ff2f726f3da2b3e6c87659657bdcb7a36e382860ed505ed5e45
+PYTHON_DOCKER_SITE = https://files.pythonhosted.org/packages/79/26/6609b51ecb418e12d1534d00b888ce7e108f38b47dc6cd589598d5c6aaa2
 PYTHON_DOCKER_SETUP_TYPE = setuptools
 PYTHON_DOCKER_LICENSE = Apache-2.0
 PYTHON_DOCKER_LICENSE_FILES = LICENSE
 PYTHON_DOCKER_CPE_ID_VENDOR = docker
 PYTHON_DOCKER_CPE_ID_PRODUCT = docker-py
+PYTHON_DOCKER_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
