Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299D7C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 16:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFDE141514;
	Sat, 10 Dec 2022 16:02:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFDE141514
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9xpV_tHxphVz; Sat, 10 Dec 2022 16:02:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B63B641505;
	Sat, 10 Dec 2022 16:02:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B63B641505
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC4C81BF860
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 16:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B34F98199D
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 16:02:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B34F98199D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DMV1rkmCenZU for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 16:02:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADBD2818A7
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADBD2818A7
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 16:02:50 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id h6so3626302iof.9
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 08:02:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=28niJCohX/1JO0Hn6mn4rHaJj20sK+6WAbXwyxUfdH8=;
 b=m2gWDNjz7ZIcVvPZImnP8UXVzbDH9pdq3TiPL5izcv9SfM3mR3Lv/OBfvzw9FxS9l1
 /PVK7FfTZIqRxI9U3RRuczFiJO3z6twHE4r5V+MShkVSJloTFzQZ2uRBYHnMptoPbCDQ
 EOeMwcAcEkMy0U5CAipcW9cry92B29X1flCW6rF3sOyzdPO69LeRP+PZwunKZgsWDOje
 B/U7TZ5P5QrYPcfystPClVOj0TC7/+DNpbkP11DBHYnrUk97tvSizJmoM3Dypv0Do+/H
 0o8n8plWTEqad63LqBa5YRgThgCu4U1BhVwu0DUDnllVfnUp79XY6LtpR9YXOid9q188
 rMbA==
X-Gm-Message-State: ANoB5pksHXZjPWHqlGLAChNMQ8g3/TjzT9N788kce8YLi6xQXqYozSKW
 ml6mFnv96fH8M74xc4vuYu5+qNAAsbfcaQ==
X-Google-Smtp-Source: AA0mqf6KGFwzRPZECb5XAZTSfOn5jema7vLn5adkiWzZva+EASW5umZzmie7i1roLm0k9o1sF2Pxrg==
X-Received: by 2002:a5d:96c3:0:b0:6df:3e46:ab2b with SMTP id
 r3-20020a5d96c3000000b006df3e46ab2bmr5921116iol.6.1670688162110; 
 Sat, 10 Dec 2022 08:02:42 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 m205-20020a6b3fd6000000b006e005dc3670sm1926119ioa.39.2022.12.10.08.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 08:02:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 09:02:39 -0700
Message-Id: <20221210160239.2420653-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=28niJCohX/1JO0Hn6mn4rHaJj20sK+6WAbXwyxUfdH8=;
 b=pjI8TSEy4BMcRMGD/RWAB3oFsHYoXmyA8dPBP8xHbNKCzD9h/Xszq/bzLO+nBaLAO5
 WwZkaHVahDia1CTxhx5GwvHFydwpnC+GiWH3hoOuRuIlPrKhY9ujFaaQpRmPvnnJM12l
 O5bci4P7bXXV2DVOQUshDztmgXSydkyxu5abb0eonN6r1OOR+6VXZnAsEM+mkqu41LZb
 b2ekgIBYbu0Djr98Ucna131ny3qC5Ph/3pAcvy8Z/v4/Gzz8WYeE8sg4jJLrB2XrqFOM
 omn2X3n0wxbEvlf5w0Opbfnuz62pgGvlGhRm4LxuBFtiYduMS2nZ+SwakXJ+AJA+6PEn
 UJwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pjI8TSEy
Subject: [Buildroot] [PATCH 1/1] package/python-can: bump to version 4.1.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop spurious setuptools runtime dependency.

Add new msgpack runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-can/Config.in       | 2 +-
 package/python-can/python-can.hash | 5 +++--
 package/python-can/python-can.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-can/Config.in b/package/python-can/Config.in
index e92d9668e0..5d21e29d88 100644
--- a/package/python-can/Config.in
+++ b/package/python-can/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_PYTHON_CAN
 	bool "python-can"
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
 	select BR2_PACKAGE_PYTHON_AENUM # runtime
+	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
 	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	select BR2_PACKAGE_PYTHON_WRAPT # runtime
diff --git a/package/python-can/python-can.hash b/package/python-can/python-can.hash
index dd8a9b107d..73be230201 100644
--- a/package/python-can/python-can.hash
+++ b/package/python-can/python-can.hash
@@ -1,4 +1,5 @@
-# sha256 from https://pypi.org/pypi/python-can
-sha256  59d92846ffb981e634e9e0f2d14a6b4967a875e3869bd2ba168c92c4db6b8b5d  python-can-4.0.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/python-can/json
+md5  d8365b7a09e49f47dac0da75d8518808  python-can-4.1.0.tar.gz
+sha256  3f2b6b0dc5f459591d171ee0c0136dce79acedc2740ce695024aa3444e911bb9  python-can-4.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.txt
diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
index 9284a9cf99..ba98337d5d 100644
--- a/package/python-can/python-can.mk
+++ b/package/python-can/python-can.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_CAN_VERSION = 4.0.0
-PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/1f/f7/a643cba269d59e108fe4c1854a8e71d5cdadadd4de1b9c8862b190171122
+PYTHON_CAN_VERSION = 4.1.0
+PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/90/55/898e69e37d5d4692bf21ba8750e095493d2ecbb29be7394d5cb735f0ab0f
 PYTHON_CAN_SETUP_TYPE = setuptools
 PYTHON_CAN_LICENSE = LGPL-3.0
 PYTHON_CAN_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
