Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8FAC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 05:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1A1180F6B;
	Wed, 10 Jan 2024 05:34:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1A1180F6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Qyu3oRg5gg9; Wed, 10 Jan 2024 05:34:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E700980F92;
	Wed, 10 Jan 2024 05:34:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E700980F92
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D252B1BF34C
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 05:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A88B143810
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 05:34:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A88B143810
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zW4KvbXJRd2o for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 05:34:52 +0000 (UTC)
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 96B11437FC
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 05:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96B11437FC
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-36074b286d8so20879675ab.1
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 21:34:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704864891; x=1705469691;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PSJf4qBsXZSDmjjYfmPNSrl6yxZUT57AeavqvBFuHH8=;
 b=KG4UukeS1FYZrU1vvw6Qy+Upl+tLtBMlaRDrsGNCHgTz+oFd8oPEhUYfBYFMjrsbR9
 i3IGypmEYoBRpOM0aTj1y2sOh50XcsDfprv9n1Z9XPEzpTwSNlYv6ykCJrAhQPUckTy1
 /BUVQuBAPVD1z10nHWf1hwHDGEIyplgDnINHD1LdUrgMOA4dt4ekFfR+vxlBYBkmzk4z
 xY9hSQHBiXpTca34nNJ0x+Ws3LJ3zh6z2qu9Mq+R6Ozc186hsk/8cznLb4S6J5P6r62A
 NCd9poEASdE75YvvK2vULTZJDddg4O9agw8cS1HYzxsNd04//OKiw4AZj9+TKj1Qf5mP
 z24w==
X-Gm-Message-State: AOJu0Yz46y1A2YgluGgRvUCvfQxb/d26MJz6jsIXEgR2XdRGO2kzqDLQ
 /YOVnbYO5M6H9aorAsbbOvAAlMCdbXzHHA==
X-Google-Smtp-Source: AGHT+IHl9K+sZC2G6eadhQaIWZdUknYBHuh3yIrEvhxAnqTmaaxCq2EotZOfDTVfYWYefQDm/fctjA==
X-Received: by 2002:a05:6e02:1a85:b0:35f:f383:ac7b with SMTP id
 k5-20020a056e021a8500b0035ff383ac7bmr752018ilv.16.1704864891122; 
 Tue, 09 Jan 2024 21:34:51 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 u16-20020a056e02111000b0035fb70434fesm1039990ilk.53.2024.01.09.21.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 21:34:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 22:34:49 -0700
Message-Id: <20240110053449.1157385-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704864891; x=1705469691; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PSJf4qBsXZSDmjjYfmPNSrl6yxZUT57AeavqvBFuHH8=;
 b=PMYzca/h2hcmPYcviJ+ELIrGqz/lkTWXqYDejc9OyM5E/4lJxzc8kOmlYXF3PQqxgp
 tkptMw/WscwheyWfH2h93hv/WDTPb9tNhVMfnDB1WIrtvqhuh0PccLOiCghMPcU/wZlb
 k26m1O7g7FsGQxacPZoUe1Rp1Ac7u7Cxy4+2HwbubBqUGISmdwUbEsIHoezyKUwqcHJ8
 GcjqGOUG2Lc1xOiE0aPr7oTopLZDbbSsfiKI0G1lGH/fyjyAmJI8dn8P4sHARy2m97nB
 X8Vsz2fF7TDF3bxuLIrXpyk3RkSEO7u4wO7EAHfRy6rhftryLLqrv1X9emchYMEUcFko
 0umg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PMYzca/h
Subject: [Buildroot] [PATCH 1/1] package/python-pylibftdi: bump to version
 0.21.0
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
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to year update:
https://github.com/codedstructure/pylibftdi/commit/c96231bb8134a2afeb0b77c12474b97a3355d2dc

Fixup patch so that it applies against 0.21.0.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../0001-do-not-use-find-library.patch            | 15 ++++++++-------
 package/python-pylibftdi/python-pylibftdi.hash    |  6 +++---
 package/python-pylibftdi/python-pylibftdi.mk      |  4 ++--
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/package/python-pylibftdi/0001-do-not-use-find-library.patch b/package/python-pylibftdi/0001-do-not-use-find-library.patch
index 192ed43e54..19dabebffe 100644
--- a/package/python-pylibftdi/0001-do-not-use-find-library.patch
+++ b/package/python-pylibftdi/0001-do-not-use-find-library.patch
@@ -15,17 +15,18 @@ this package.
 Signed-off-by: Christian Kellermann <christian.kellermann@solectrix.de>
 
 ---
-diff -purN pylibftdi-0.15.0.orig/pylibftdi/driver.py pylibftdi-0.15.0/pylibftdi/driver.py
---- pylibftdi-0.15.0.orig/pylibftdi/driver.py	2015-04-26 22:41:39.000000000 +0200
-+++ pylibftdi-0.15.0/pylibftdi/driver.py	2017-02-27 13:08:56.502958000 +0100
-@@ -121,8 +121,8 @@ class Driver(object):
+diff -purN pylibftdi-0.21.0.orig/src/pylibftdi/driver.py pylibftdi-0.21.0/src/pylibftdi/driver.py
+--- pylibftdi-0.21.0.orig/src/pylibftdi/driver.py	2015-04-26 22:41:39.000000000 +0200
++++ pylibftdi-0.21.0/src/pylibftdi/driver.py	2017-02-27 13:08:56.502958000 +0100
+@@ -148,9 +148,8 @@ class Driver:
                      lib = getattr(cdll, lib_path)
                      break
          if lib is None:
--            raise LibraryMissingError('{} library not found (search: {})'.format(
--                name, search_list))
+-            raise LibraryMissingError(
+-                f"{name} library not found (search: {str(search_list)})"
+-            )
 +            return cdll.LoadLibrary(name + '.so')
 +
          return lib
- 
+
      @property
diff --git a/package/python-pylibftdi/python-pylibftdi.hash b/package/python-pylibftdi/python-pylibftdi.hash
index ee0ba127ca..5d8a19647f 100644
--- a/package/python-pylibftdi/python-pylibftdi.hash
+++ b/package/python-pylibftdi/python-pylibftdi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pylibftdi/json
-md5  fb43ade3283b809d4ebe92bf4a60d7fc  pylibftdi-0.20.0.tar.gz
-sha256  f4a87fc4af2c9c7d42badd4192ca9b529f32c9d96fdc8daea7e29c509226df5f  pylibftdi-0.20.0.tar.gz
+md5  75b63f325b760cc6342b7d35fbb84fde  pylibftdi-0.21.0.tar.gz
+sha256  eb7e2f5052852547f4c6c46022a1665f9d7453439639171eade56fdc80a58832  pylibftdi-0.21.0.tar.gz
 # Locally computed sha256 checksums
-sha256  0d3f1af06b566a783091422061b60e864fc5d5853418b71643041e254b4ae7f9  LICENSE.txt
+sha256  b8a7b113cfaa2c01d0701183de16ba653465692b1e29e0229244eee42fb3a9a8  LICENSE.txt
diff --git a/package/python-pylibftdi/python-pylibftdi.mk b/package/python-pylibftdi/python-pylibftdi.mk
index 34040b72ac..7dca37e416 100644
--- a/package/python-pylibftdi/python-pylibftdi.mk
+++ b/package/python-pylibftdi/python-pylibftdi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYLIBFTDI_VERSION = 0.20.0
+PYTHON_PYLIBFTDI_VERSION = 0.21.0
 PYTHON_PYLIBFTDI_SOURCE = pylibftdi-$(PYTHON_PYLIBFTDI_VERSION).tar.gz
-PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/b8/03/4f778ce6dceea58dc5bfd555c22fdb265afc922d81d3c4496a791a54c479
+PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/d2/ce/ff3e83f3a14eb5b7950ff3657f07cdc3033dd0ded5c8ed093db515e1de33
 PYTHON_PYLIBFTDI_LICENSE = MIT
 PYTHON_PYLIBFTDI_LICENSE_FILES = LICENSE.txt
 PYTHON_PYLIBFTDI_DEPENDENCIES = libftdi
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
