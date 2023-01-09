Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13C0C54EBC
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 02:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DF5E402D7;
	Mon,  9 Jan 2023 02:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DF5E402D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DaSLkzy4xIs6; Mon,  9 Jan 2023 02:55:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7901240127;
	Mon,  9 Jan 2023 02:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7901240127
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D5C0B1BF3B0
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 02:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B12A9817AD
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 02:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B12A9817AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MXgFFXFxKSt7 for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 02:55:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8F69817A6
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8F69817A6
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 02:55:31 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id h26so4302844ila.11
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 18:55:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D1olJxZZEd+DjOLVFUEBEQmp6dFEkIEX84lDq4PXtxM=;
 b=aelKnuKQCHy9VqIuLwoELeDtHqqYXA6yozfpoFaUlz2N4SuMlLgGEo6hciT5giMqmK
 mckPi6D8vewFHo+Ex2JKShAZRi8alZ9m0Dt6pZ6hMOBTUaIUBauSKZFvgXSNVRt0YTEm
 wmz4lKAQlIotsMWchaEQzkVTwMK+cxPM+C3kkxiKB5j6aC16vZtBbkSH8TaDTpcu/Yr1
 xvFwyMfadu/v74Nw6/rDpQkwX7WMRcyG244VahahuLIbvOvYPayMvGqfj7jNTP9g35nm
 YmqWrAa8skf5mh5oyVuZHDThU0EuVWYvDq7f0AARbmvRxeVUUqY0gVmq4af04euwO4Xk
 /axQ==
X-Gm-Message-State: AFqh2krNYI0m4kRs8yTg4rRtdOpF81orj2aQ5ZRZuhIUbvagIh6qVnl5
 NPZRTy/CIJgCfmNO8Ev0lIgvoNaK9LlZug==
X-Google-Smtp-Source: AMrXdXuFIBbJB/nkFPZB4t06LRCq4E4raoq1RVgN5MilT3wgVfhccYoMOlCWO/QdjLv5bP/1E5Twvg==
X-Received: by 2002:a92:6f06:0:b0:304:cf5a:16d4 with SMTP id
 k6-20020a926f06000000b00304cf5a16d4mr36284238ilc.20.1673232930651; 
 Sun, 08 Jan 2023 18:55:30 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 g11-20020a05663810eb00b0037477c3d04asm2377714jae.130.2023.01.08.18.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 18:55:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 19:55:28 -0700
Message-Id: <20230109025528.1954397-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D1olJxZZEd+DjOLVFUEBEQmp6dFEkIEX84lDq4PXtxM=;
 b=n9hSIcHdykjbxWvkPfeenFUGa+QH1OvHT5fr8TsbzbBTVkstJSPYQFmXYG6vyZSIBd
 S3Y6YASa0tG5dLVU9VxrD1OGsB/PyrAyNBV0RGj8g2nQEWPfiv/b316TtJtDHaCeS+rx
 /i4eVCkc8dXSco5NIEPjzGOUJ8toVHDf3S8nxltmMguMEIXm8JMwPHK3zrvSrJo53mo/
 pp+0le3gp50hARPL42CNio/ABLOnssYySSTl/XxR4SeO8fF79+zfS7DcheTE+0DDmQ8Q
 3nsjO06GY/sCw+caFSTHD2TCumKV7v/Vm72YQBXTkKl1CioblqNM8kvXlSaUsAgiD4r4
 z2UQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=n9hSIcHd
Subject: [Buildroot] [PATCH 1/1] package/python-alembic: bump to version
 1.9.1
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
 =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-alembic/python-alembic.hash | 4 ++--
 package/python-alembic/python-alembic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-alembic/python-alembic.hash b/package/python-alembic/python-alembic.hash
index e256e9dc08..f94f5ab10a 100644
--- a/package/python-alembic/python-alembic.hash
+++ b/package/python-alembic/python-alembic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/alembic/json
-md5  667a722df7dbef926a4ce760b9917622  alembic-1.8.1.tar.gz
-sha256  cd0b5e45b14b706426b833f06369b9a6d5ee03f826ec3238723ce8caaf6e5ffa  alembic-1.8.1.tar.gz
+md5  999392ffc900da18afbf10d2ac31bdc6  alembic-1.9.1.tar.gz
+sha256  f9f76e41061f5ebe27d4fe92600df9dd612521a7683f904dab328ba02cffa5a2  alembic-1.9.1.tar.gz
 # Locally computed sha256 checksums
 sha256  f0e3f7a5080879ccae798882d9bee3d48fe335d0bad84ca8eec86fa594375ea0  LICENSE
diff --git a/package/python-alembic/python-alembic.mk b/package/python-alembic/python-alembic.mk
index 735678b384..64ce85bead 100644
--- a/package/python-alembic/python-alembic.mk
+++ b/package/python-alembic/python-alembic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ALEMBIC_VERSION = 1.8.1
+PYTHON_ALEMBIC_VERSION = 1.9.1
 PYTHON_ALEMBIC_SOURCE = alembic-$(PYTHON_ALEMBIC_VERSION).tar.gz
-PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/37/ab/80e6d86ca81235ea1a7104089dddf74de4b45f8af0a05d4b265be44d6ff9
+PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/81/87/5c531d2923c61e7ae68b23c8660df289ae4241a0d38f3fbcbd8dba64ca6b
 PYTHON_ALEMBIC_SETUP_TYPE = setuptools
 PYTHON_ALEMBIC_LICENSE = MIT
 PYTHON_ALEMBIC_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
