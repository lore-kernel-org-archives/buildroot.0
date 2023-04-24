Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D5CC7618E
	for <buildroot@archiver.kernel.org>; Mon, 24 Apr 2023 20:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BCFD414EA;
	Mon, 24 Apr 2023 20:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BCFD414EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q7TmgrdIWG9S; Mon, 24 Apr 2023 20:27:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E58124179E;
	Mon, 24 Apr 2023 20:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E58124179E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 570761BF476
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 20:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3106381F34
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 20:25:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3106381F34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NX2gwoFQj0rS for <buildroot@lists.busybox.net>;
 Mon, 24 Apr 2023 20:25:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E39381F7B
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E39381F7B
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 20:25:31 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-63b35789313so3677201b3a.3
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 13:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682367930; x=1684959930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H1IKPR0k/zKh5eMsjVay8kcoPpVnUHyeKePtTJ23czo=;
 b=OFN6HuCIaa6X44R2SvQceRdcE8VmSyICmXxj/gINqyWcCBCkfV80XPiRAiX2V+9oS8
 t9XC0XQcfPydMYU2XrTnPJ6NobjnllgoO7oE+ftJlRMw3p6AV5ky8aIVd924XcGLHBPU
 eTJoKQM42xhidX79bQYsgl9ilvi90yy+T328epcwCnnWTGu6k/dtkPel2Qocm1pInV3D
 WW8DKYR72Zy2EFEGWiQ8Q9Balk9AQmXjyeZBau7QNhXTbFxwurq3DiC/xm5BsmJUVrwD
 Mu/I5TasbEULy7hff7KXAjaXm9liqfA28Is5FQMFAWO6XZRiBwqXVDe31S2232fdpax0
 ohxQ==
X-Gm-Message-State: AAQBX9cWYZBbweFUdgDWmyXZxrDTOfX5t5ZbQbgERmtK9Y2q4qkKg8Q+
 YlDXXIqVeuSyr6uoWLSH9ZY3jmKS9wBZtw==
X-Google-Smtp-Source: AKy350aMXNh6v82rhiPz+iJsml3VaZYgnNmkInPHiNIryJrGieQYxQEdfpHkeSkwnpaer6a52oIZ3w==
X-Received: by 2002:a05:6a20:840c:b0:ef:a31b:af90 with SMTP id
 c12-20020a056a20840c00b000efa31baf90mr20182121pzd.28.1682367930230; 
 Mon, 24 Apr 2023 13:25:30 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:603:2180:ebe0::e18])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a656806000000b0051b71e8f633sm6819592pgt.92.2023.04.24.13.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 13:25:29 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Apr 2023 13:25:13 -0700
Message-Id: <20230424202514.1546092-13-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230424202514.1546092-1-aduskett@gmail.com>
References: <20230424202514.1546092-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682367930; x=1684959930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H1IKPR0k/zKh5eMsjVay8kcoPpVnUHyeKePtTJ23czo=;
 b=Fx939xxtdsEVdSNmgY/NI3je6hqO5lmeXjTU22yRHyRGLHeIK8rhSGyphNFdfjQo9u
 9X2t3I+wvylRvQHKzeUBSbNPrwfO7Yd7BCD8soUMxCfaZDw7akx7T99zVlaGRZ1OlQbY
 ZieMvAbW7M2UDOmJm0XCzX4vNCwfvmoMnXUnfKsTE/GXcVgKr8ZpY6bfKEZmz4gpiAbr
 pyOTNNhNxxxDys2c30WjyiUyay16adx+pKX7zQ1uXvR3IpisnByRumxoF2dhRRvTRrSW
 BO33IDrN8qAaAnT1mpoDlTHNkDGGtEvdXdAIsc2lp1NL5X9GG47/sIJeZgcb12cr2pni
 mdcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Fx939xxt
Subject: [Buildroot] [PATCH 12/13] package/setools: bump to version 4.4.2
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In addition:
  - Refresh 0001-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch
  - Update COPYING hash as the license file has been rewritten for clarity.
    However, the licenses have not been changed.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 ...e-setools.InfoFlowAnalysis-and-setoo.patch | 50 +++++++++----------
 package/setools/setools.hash                  |  4 +-
 package/setools/setools.mk                    |  2 +-
 3 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/package/setools/0001-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch b/package/setools/0001-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch
index 3c3ae97dff..36063a4e13 100644
--- a/package/setools/0001-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch
+++ b/package/setools/0001-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch
@@ -15,22 +15,22 @@ sedta and seinfoflow to require python3-networkx
 Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
 [Refreshed for 4.3.0]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
-[Refreshed for 4.4.0]
+[Refreshed for 4.4.2]
 ---
  sedta                       | 3 ++-
  seinfoflow                  | 5 +++--
  setools/__init__.py         | 4 ++--
  setoolsgui/apol/dta.py      | 2 +-
  setoolsgui/apol/infoflow.py | 2 +-
- tests/dta.py                | 2 +-
- tests/infoflow.py           | 2 +-
+ tests/test_dta.py           | 2 +-
+ tests/test_infoflow.py      | 2 +-
  7 files changed, 11 insertions(+), 9 deletions(-)
 
 diff --git a/sedta b/sedta
-index 60861ca630a5..0056172a55e5 100755
+index ffd9ede..4c53825 100755
 --- a/sedta
 +++ b/sedta
-@@ -23,6 +23,7 @@ import logging
+@@ -10,6 +10,7 @@ import logging
  import signal
  
  import setools
@@ -38,7 +38,7 @@ index 60861ca630a5..0056172a55e5 100755
  
  
  def print_transition(trans: setools.DomainTransition) -> None:
-@@ -114,7 +115,7 @@ else:
+@@ -104,7 +105,7 @@ else:
  
  try:
      p = setools.SELinuxPolicy(args.policy)
@@ -48,10 +48,10 @@ index 60861ca630a5..0056172a55e5 100755
      if args.shortest_path or args.all_paths:
          if args.shortest_path:
 diff --git a/seinfoflow b/seinfoflow
-index f10c39de4d8e..fe733bbd0787 100755
+index 5f4e764..a27b781 100755
 --- a/seinfoflow
 +++ b/seinfoflow
-@@ -18,6 +18,7 @@
+@@ -5,6 +5,7 @@
  #
  
  import setools
@@ -59,7 +59,7 @@ index f10c39de4d8e..fe733bbd0787 100755
  import argparse
  import sys
  import logging
-@@ -102,8 +103,8 @@ elif args.booleans is not None:
+@@ -91,8 +92,8 @@ elif args.booleans is not None:
  try:
      p = setools.SELinuxPolicy(args.policy)
      m = setools.PermissionMap(args.map)
@@ -71,10 +71,10 @@ index f10c39de4d8e..fe733bbd0787 100755
      if args.shortest_path or args.all_paths:
          if args.shortest_path:
 diff --git a/setools/__init__.py b/setools/__init__.py
-index d72d343..4d5aaaa 100644
+index ad9b36a..2bde01b 100644
 --- a/setools/__init__.py
 +++ b/setools/__init__.py
-@@ -91,11 +91,11 @@ from .pcideviceconquery import PcideviceconQuery
+@@ -77,11 +77,11 @@ from .pcideviceconquery import PcideviceconQuery
  from .devicetreeconquery import DevicetreeconQuery
  
  # Information Flow Analysis
@@ -89,10 +89,10 @@ index d72d343..4d5aaaa 100644
  # Policy difference
  from .diff import PolicyDifference
 diff --git a/setoolsgui/apol/dta.py b/setoolsgui/apol/dta.py
-index 4608b9dbf34e..2cde44c142e9 100644
+index a78d960..e71c70a 100644
 --- a/setoolsgui/apol/dta.py
 +++ b/setoolsgui/apol/dta.py
-@@ -24,7 +24,7 @@ from PyQt5.QtCore import pyqtSignal, Qt, QStringListModel, QThread
+@@ -11,7 +11,7 @@ from PyQt5.QtCore import pyqtSignal, Qt, QStringListModel, QThread
  from PyQt5.QtGui import QPalette, QTextCursor
  from PyQt5.QtWidgets import QCompleter, QHeaderView, QMessageBox, QProgressDialog, \
      QTreeWidgetItem
@@ -102,10 +102,10 @@ index 4608b9dbf34e..2cde44c142e9 100644
  from ..logtosignal import LogHandlerToSignal
  from .analysistab import AnalysisSection, AnalysisTab
 diff --git a/setoolsgui/apol/infoflow.py b/setoolsgui/apol/infoflow.py
-index 7bca299d23fc..7fee2778f35f 100644
+index fb9b409..738f1b8 100644
 --- a/setoolsgui/apol/infoflow.py
 +++ b/setoolsgui/apol/infoflow.py
-@@ -26,7 +26,7 @@ from PyQt5.QtCore import pyqtSignal, Qt, QStringListModel, QThread
+@@ -13,7 +13,7 @@ from PyQt5.QtCore import pyqtSignal, Qt, QStringListModel, QThread
  from PyQt5.QtGui import QPalette, QTextCursor
  from PyQt5.QtWidgets import QCompleter, QHeaderView, QMessageBox, QProgressDialog, \
      QTreeWidgetItem
@@ -114,11 +114,11 @@ index 7bca299d23fc..7fee2778f35f 100644
  from setools.exception import UnmappedClass, UnmappedPermission
  
  from ..logtosignal import LogHandlerToSignal
-diff --git a/tests/dta.py b/tests/dta.py
-index a0cc9381469c..177e6fb0b961 100644
---- a/tests/dta.py
-+++ b/tests/dta.py
-@@ -18,7 +18,7 @@
+diff --git a/tests/test_dta.py b/tests/test_dta.py
+index 7f9bbc9..48338c5 100644
+--- a/tests/test_dta.py
++++ b/tests/test_dta.py
+@@ -5,7 +5,7 @@
  import os
  import unittest
  
@@ -127,11 +127,11 @@ index a0cc9381469c..177e6fb0b961 100644
  from setools import TERuletype as TERT
  from setools.exception import InvalidType
  from setools.policyrep import Type
-diff --git a/tests/infoflow.py b/tests/infoflow.py
-index aa0e44a7e4f8..fca2848aeca5 100644
---- a/tests/infoflow.py
-+++ b/tests/infoflow.py
-@@ -18,7 +18,7 @@
+diff --git a/tests/test_infoflow.py b/tests/test_infoflow.py
+index 5a8f745..e25993b 100644
+--- a/tests/test_infoflow.py
++++ b/tests/test_infoflow.py
+@@ -5,7 +5,7 @@
  import os
  import unittest
  
diff --git a/package/setools/setools.hash b/package/setools/setools.hash
index fdb0919f11..c353e1f609 100644
--- a/package/setools/setools.hash
+++ b/package/setools/setools.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  202eac5f857475937bee8136cff278aa2b4a4b94a0dec63fbbbe18c9eb644a4e  setools-4.4.0.tar.gz
-sha256  2f7547e10f76a382c24c053595f38a5cc6dda9347f508f254ca490e0046a9624  COPYING
+sha256  998d12d01852feed1889110a4ca81090a47a2d9b47368e4dfe2b94d68696c813  setools-4.4.2.tar.gz
+sha256  0e58d74751e394f39748c7b7b4039d6a883b5def9711160668ba962b52e69e01  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index ea355f10c8..b80d25a6b9 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SETOOLS_VERSION = 4.4.0
+SETOOLS_VERSION = 4.4.2
 SETOOLS_SITE = $(call github,SELinuxProject,setools,$(SETOOLS_VERSION))
 SETOOLS_DEPENDENCIES = libselinux libsepol python-setuptools host-bison host-flex host-python-cython host-swig
 SETOOLS_INSTALL_STAGING = YES
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
