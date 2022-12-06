Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36B8C3A5A7
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 05:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F9F260B70;
	Tue,  6 Dec 2022 05:09:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F9F260B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1QkHQiJ3ajmL; Tue,  6 Dec 2022 05:09:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2D6660A91;
	Tue,  6 Dec 2022 05:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2D6660A91
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 954DB1BF34C
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 05:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7070040529
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 05:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7070040529
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6i5RMIZMaD9s for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 05:08:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 798CA40527
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 798CA40527
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 05:08:57 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id z144so4784136iof.3
 for <buildroot@buildroot.org>; Mon, 05 Dec 2022 21:08:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3mARWoNxteVlh+tj+/8jNy8cqkV7dZJdYE5Mahrd4Z8=;
 b=0I90djm8dpZa4Xd0qZZxyeiWPwSkivRs8x6MSZrC5jeo/v0S35mygsr0fy1G+j7PNV
 JmdqIEA3ntB3FKqHYt9Pj3ngsQ2w58dejbvjp5umrXyF1D3ScAzWbVP4mSQxZT73gev9
 al+8vmpmdYAM0Ub624wATrOxUjhYsav7lpTwfNi+7LSN5q+DeQfgKny/29eV/XuzNY/o
 AXiIDyKZG+OJgceWZRIMC3drTd0kx4+yTpWK5sQAyZE9stiLEhlqKjxdQ64ZSfk8vlOg
 Bdcx/auSeH3nzGNDhsiHZ7XRnilP9FNc2EuXKnQowGTnUFBnS7JkEjpMlaXUloaq8Zyi
 1KiA==
X-Gm-Message-State: ANoB5plG2o2jXn3rmmQjHH8zzr/mJ9GjJyUN9dXQ46/1c/yuIv5HCJV+
 fKOoK6tqrmdJRx9oBF26FE10gmbvWYVElejd
X-Google-Smtp-Source: AA0mqf6u+5OwhxA8qDhYYrd/903dlsgjClsopCXQlmbFSQ/3617avjC66KGcLjTv3eRe+9DCfzFZUA==
X-Received: by 2002:a02:6348:0:b0:374:f89e:99d6 with SMTP id
 j69-20020a026348000000b00374f89e99d6mr39859186jac.188.1670303334986; 
 Mon, 05 Dec 2022 21:08:54 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 s8-20020a92d908000000b00302f8863878sm5800959iln.24.2022.12.05.21.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 21:08:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Dec 2022 22:08:53 -0700
Message-Id: <20221206050853.2889800-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3mARWoNxteVlh+tj+/8jNy8cqkV7dZJdYE5Mahrd4Z8=;
 b=TcJXRPtorTkuR8/l149cqar+VZmiZ0y9cFX3sb3JUu7PfTLv9R7uN8cP3kgl31CQAr
 vfohY43j+69abjJkgInCLLQTDCfcDeja0nFBl0ZAMq0tyCdzrthClYE1u1/ZTA4/CUGb
 OduPBFD6oTjnG/YtigbMdKO80Z6NhF6YPICuwd1eB50QKELOt69gawE1pEpJDZVP2K4a
 Y0FDSHj35Hm1vwawIU5ODTQTS2e1OYK8cywhdG6/GrQ+SybPTcK67VA6HsQpru9uhykX
 UvmjZSuHUzBAg1S/iFXhC1AKXr2C2DM53SzoR18Y7Gl8EzFQhm9AF8AuiTYrXHKdb6Z+
 yloQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TcJXRPto
Subject: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 0.14.4
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
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index b9936fe8bf..d642119786 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  54976d46be5d1e0d94ae8fbcfb8e72212b1ec9fe9752e3d14510c17a4000efeb  maturin-0.14.1.tar.gz
+sha256  dd1ee5cd1bb76c434319f305cd30873be2f8221e310168fc376b53b7d0e166ff  maturin-0.14.4.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index ab87df3842..09d77c70d4 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 0.14.1
+PYTHON_MATURIN_VERSION = 0.14.4
 PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/a3/54/6bac789ab775b5ef1f07977e998cf719857e2675c3442f3f24e0399e1483
+PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/7c/51/36749c1a0881a4292e4f334bd9ddb0865e0991a83070834d1aaa1af7443f
 PYTHON_MATURIN_SETUP_TYPE = setuptools
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
 PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
