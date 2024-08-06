Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B56C3DA64
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 07:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8069040189;
	Tue,  6 Aug 2024 07:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eGsmQqzuesfw; Tue,  6 Aug 2024 07:54:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F95440192
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F95440192;
	Tue,  6 Aug 2024 07:54:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 496E51BF2F1
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 07:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 373E660733
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 07:54:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6zIQdxmHhC7y for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 07:54:51 +0000 (UTC)
X-Greylist: delayed 519 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 06 Aug 2024 07:54:50 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 55B6C605BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55B6C605BE
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.103.80.155;
 helo=mx.kolabnow.com; envelope-from=zgyarmati@zgyarmati.de;
 receiver=<UNKNOWN> 
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.155])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55B6C605BE
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 07:54:50 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id 585B323C9F50
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 09:46:09 +0200 (CEST)
X-Virus-Scanned: amavis at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out011.mykolab.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id EAXB1GfZKmuN for <buildroot@buildroot.org>;
 Tue,  6 Aug 2024 09:46:06 +0200 (CEST)
Received: from int-mx011.mykolab.com (unknown [10.9.13.11])
 by mx.kolabnow.com (Postfix) with ESMTPS id AE61B235DF4F
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 09:46:04 +0200 (CEST)
Received: from ext-subm010.mykolab.com (unknown [10.9.6.10])
 by int-mx011.mykolab.com (Postfix) with ESMTPS id 9AD283118E3B
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 09:46:04 +0200 (CEST)
From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
To: buildroot@buildroot.org
Date: Tue,  6 Aug 2024 09:45:39 +0200
Message-Id: <20240806074539.1261315-1-zgyarmati@zgyarmati.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kolabnow.com; h=
 content-transfer-encoding:mime-version:message-id:date:date
 :subject:subject:from:from:received:received:received; s=
 dkim20240523; t=1722930366; x=1724744767; bh=SClpxUDjfn7fijNks7a
 yg9IXXR1+MmQ5ZdHBww1r+NU=; b=NQncaqhBSBeZ2dlJje4U3PNTuEQovDICtn7
 9lM8fm4XmSE+ZglV/hR38QqaqCuKRVARPdTygpfUftJXFTyA2eZYbhb+oCEJqk3T
 /ZqfFV6wkcpxqzr0whWjh+KH3oiJRriGbCM76ZAMnxz1L/cnf0pk1lq6v3OIKvvK
 ozbSHxYQNRymnV6SViveu0e3m9NfyCg6nZvXh8VA2sWTLgtvqbkj32kX012MUnYi
 8zS9dilYkKnkNCcVdqy2Hx3RWcUsJxKSaF0Pu1CyjN1IqFYiwAJ9Q6oRi+Uf3QdP
 8QqGCuywuT+5PH0lRT0o6erFy8wEF1hwckgNK3uamLKQww9qidQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zgyarmati.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kolabnow.com header.i=@kolabnow.com header.a=rsa-sha256
 header.s=dkim20240523 header.b=NQncaqhB
X-Mailman-Original-Authentication-Results: ext-mx-out011.mykolab.com (amavis); 
 dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
Subject: [Buildroot] [PATCH 1/1] package/crudini: bump to 0.9.5
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removing backported patch and introducing new dependency
setuptools-scm.
As setuptools-scm doesn't work with github release tarballs, also
switching back to download the tarball from pypi...

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
---
 .../0001-prefer-shlex-over-pipes.patch        | 41 -------------------
 package/crudini/crudini.hash                  |  3 +-
 package/crudini/crudini.mk                    |  7 ++--
 3 files changed, 6 insertions(+), 45 deletions(-)
 delete mode 100644 package/crudini/0001-prefer-shlex-over-pipes.patch

diff --git a/package/crudini/0001-prefer-shlex-over-pipes.patch b/package/crudini/0001-prefer-shlex-over-pipes.patch
deleted file mode 100644
index 16296f619f..0000000000
--- a/package/crudini/0001-prefer-shlex-over-pipes.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From d81b703f3e8e29c1547386135c7e9ca539c1f054 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?P=C3=A1draig=20Brady?= <P@draigBrady.com>
-Date: Tue, 2 Aug 2022 14:40:37 +0100
-Subject: [PATCH] prefer shlex over pipes
-
-pipes is deprecated since python 3.10
-and slated for removal in python 3.13
-
-[Romain backport to 0.9.3]
-Upstream: https://github.com/pixelb/crudini/commit/e1650941054822faad4cda788bff6fe364eb4ca3
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- crudini | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/crudini b/crudini
-index 669596b..a136241 100755
---- a/crudini
-+++ b/crudini
-@@ -17,15 +17,17 @@ import getopt
- import hashlib
- import iniparse
- import os
--import pipes
-+import re
- import shutil
- import string
- import tempfile
- 
- if sys.version_info[0] >= 3:
-+    import shlex as pipes
-     from io import StringIO
-     import configparser
- else:
-+    import pipes
-     from cStringIO import StringIO
-     import ConfigParser as configparser
- 
--- 
-2.34.3
-
diff --git a/package/crudini/crudini.hash b/package/crudini/crudini.hash
index 6f2563dfdd..5b92c0e4da 100644
--- a/package/crudini/crudini.hash
+++ b/package/crudini/crudini.hash
@@ -1,3 +1,4 @@
+# from https://pypi.org/project/crudini/#files
+sha256  59ae650f45af82a64afc33eb876909ee0c4888dc4e8711ef59731c1edfda5e24  crudini-0.9.5.tar.gz
 # locally computed
-sha256  e1b8125ac4373ece3bb0bb047ba9336e5bd55ed5d56b9729968058c9385ab546  crudini-0.9.3.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/crudini/crudini.mk b/package/crudini/crudini.mk
index 48e0ebde8f..0f5cfcedd9 100644
--- a/package/crudini/crudini.mk
+++ b/package/crudini/crudini.mk
@@ -4,14 +4,15 @@
 #
 ################################################################################
 
-CRUDINI_VERSION = 0.9.3
-CRUDINI_SITE = $(call github,pixelb,crudini,$(CRUDINI_VERSION))
+CRUDINI_VERSION = 0.9.5
+CRUDINI_SITE = https://files.pythonhosted.org/packages/32/67/c4e838930e2f434db08d6a6aadffca3d14e7455d1c2c2332e22003ad453d
 CRUDINI_SETUP_TYPE = setuptools
+CRUDINI_DEPENDENCIES = host-python-setuptools-scm
 CRUDINI_LICENSE = GPL-2.0
 CRUDINI_LICENSE_FILES = COPYING
 # This is a runtime dependency, but we don't have the concept of
 # runtime dependencies for host packages.
-HOST_CRUDINI_DEPENDENCIES = host-python-iniparse
+HOST_CRUDINI_DEPENDENCIES = host-python-iniparse host-python-setuptools-scm
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
