Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55793C433FE
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 21:05:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC3AA61186
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 21:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC3AA61186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EA31605B2;
	Tue, 21 Sep 2021 21:05:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dkE-BqqRdaSy; Tue, 21 Sep 2021 21:05:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE4C9605DA;
	Tue, 21 Sep 2021 21:05:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C303C1BF255
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 21:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2463605B2
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 21:04:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AkZ3VEXf4_LC for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 21:04:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 96FDB605A9
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 21:04:47 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id g8so1406487edt.7
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 14:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qvJQEV6+aKuOSJmePeYn5Rfeqb9A1vYoQs+rAb8xoyQ=;
 b=UqbmlKpg8vmj2SjUYl/yne56x04Bwc++yA7ki8c9xPzASZfzjn3spbWX6c/DiO82do
 AYsSOVIz5F8NC5SPBYmHZEvO6mMP4EtkbI0LCE2+gG/uRnatV9epRqSuApJYVdtAgksD
 bIstNzkTfywheNxPhu6nPIGO8o/maXcqjarSZ8EcLa0W0Zefv1IY1FjcOY1V8B7kUiXg
 AhjJdBfVfLi7T7YeELZWRjFSMgPcBEAlkU2dP1Zgm6toKMP9znkr0On6d3bPPgXQrftI
 qJkcoYjQStMFK8ZmNDk+X0b3Tesz1e6EKp+SC3bUC2fXgE8Vrelf8nydBeCgYzjtjP/X
 I3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qvJQEV6+aKuOSJmePeYn5Rfeqb9A1vYoQs+rAb8xoyQ=;
 b=Kwreln9j9gdd/avkkBcYQHz7ycdD3NZL1CoBDWDh2hFq5ScgYrJ87qG1cHh8rERj1+
 2beyWctLlQQZ/Vfi9Slz77pd7b9jJjaALqz96YbK+6wBiRNO1363Vk1NYNWbM1VPrfdg
 y+oSoQkF+saZHtkJfigiZ8VNrYW/d9fJlBBtzDpJXkdM2MPQLbzzXnQgrtkmJdItY7Lp
 kS5CNcB4KVCSGGyuFpjKALAc7M3qmEa2BDffFCtEY1kK2a2YOB+cb7FgsU95503faemW
 6uEIpC4wud0junbKbS8GIbsAwSlJKXiZNZS87V5jn3c6f6ZFhMHMpqEmmkr9ryid2q5K
 f3BQ==
X-Gm-Message-State: AOAM533qAytsKF4iIsrCr+vGUncyHR/JrwFXJ8VovI14sAEfJD1TAsOQ
 oU/A4CYgYk3UTLqZ8SmdwBaljTwHOTo=
X-Google-Smtp-Source: ABdhPJxv8cTK7oYOAXghWvtqp9aijw7bVfRysFQxy4vRXxLIJLxISIdkgymzARIJxrZhrcp5gNNiww==
X-Received: by 2002:a50:e188:: with SMTP id k8mr17304145edl.119.1632258285810; 
 Tue, 21 Sep 2021 14:04:45 -0700 (PDT)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id h8sm29606ejj.22.2021.09.21.14.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 14:04:45 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 23:04:37 +0200
Message-Id: <20210921210438.41808-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921210438.41808-1-petr.vorel@gmail.com>
References: <20210921210438.41808-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH v3 1/2] support: utils: use python3
 explicitly
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 David Laight <David.Laight@ACULAB.COM>, Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Python 2 is EOL sice 2020 [1], it's still available on distros, but may not
be installed by default (as being replaced by python3).

Thus remove compatibility imports:
from __future__ import print_function
from __future__ import absolute_import

Tested with python3 -m py_compile.

[1] https://www.python.org/doc/sunset-python-2/

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v2->v3:
* remove __future__ from utils/getdeveloperlib.py (previously in 3rd

 support/scripts/cve.py                                 | 2 +-
 support/scripts/graph-build-time                       | 2 +-
 support/scripts/graph-depends                          | 2 +-
 support/scripts/pycompile.py                           | 4 +---
 support/scripts/size-stats                             | 2 +-
 support/testing/tests/package/sample_gst1_python.py    | 2 +-
 support/testing/tests/package/sample_python_gobject.py | 2 +-
 utils/check-package                                    | 3 +--
 utils/genrandconfig                                    | 4 +---
 utils/get-developers                                   | 2 +-
 utils/getdeveloperlib.py                               | 1 -
 utils/size-stats-compare                               | 2 +-
 12 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 13c29fabe0..7cd6fce4d8 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Copyright (C) 2009 by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 # Copyright (C) 2020 by Gregory CLEMENT <gregory.clement@bootlin.com>
diff --git a/support/scripts/graph-build-time b/support/scripts/graph-build-time
index ba3cdad85b..742c9a7a50 100755
--- a/support/scripts/graph-build-time
+++ b/support/scripts/graph-build-time
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Copyright (C) 2011 by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 # Copyright (C) 2013 by Yann E. MORIN <yann.morin.1998@free.fr>
diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index d42bebce9d..a66fb28f41 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Usage (the graphviz package must be installed in your distribution)
 #  ./support/scripts/graph-depends [-p package-name] > test.dot
diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
index b8cd3cee6c..8774144a90 100644
--- a/support/scripts/pycompile.py
+++ b/support/scripts/pycompile.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 """
 Byte compile all .py files from provided directories. This script is an
@@ -6,8 +6,6 @@ alternative implementation of compileall.compile_dir written with
 cross-compilation in mind.
 """
 
-from __future__ import print_function
-
 import argparse
 import os
 import py_compile
diff --git a/support/scripts/size-stats b/support/scripts/size-stats
index dea3a6007c..bf3d12a9b7 100755
--- a/support/scripts/size-stats
+++ b/support/scripts/size-stats
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Copyright (C) 2014 by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
diff --git a/support/testing/tests/package/sample_gst1_python.py b/support/testing/tests/package/sample_gst1_python.py
index fab7e74f40..2d7e0e1ed9 100644
--- a/support/testing/tests/package/sample_gst1_python.py
+++ b/support/testing/tests/package/sample_gst1_python.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 """A simple test that uses gst1-python to run a fake videotestsrc for 100
 frames
 """
diff --git a/support/testing/tests/package/sample_python_gobject.py b/support/testing/tests/package/sample_python_gobject.py
index 50564aa79f..4490a73613 100644
--- a/support/testing/tests/package/sample_python_gobject.py
+++ b/support/testing/tests/package/sample_python_gobject.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 """A simple test that uses python-gobject to find the path of sh."""
 from gi.repository import GLib
 
diff --git a/utils/check-package b/utils/check-package
index dd18d19c25..a959fef079 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -1,7 +1,6 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 # See utils/checkpackagelib/readme.txt before editing this file.
 
-from __future__ import print_function
 import argparse
 import inspect
 import os
diff --git a/utils/genrandconfig b/utils/genrandconfig
index 622cfd4891..a1431bf1a8 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Copyright (C) 2014 by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 #
@@ -18,8 +18,6 @@
 
 # This script generates a random configuration for testing Buildroot.
 
-from __future__ import print_function
-
 import contextlib
 import csv
 import os
diff --git a/utils/get-developers b/utils/get-developers
index 9182b2d85f..22accaf181 100755
--- a/utils/get-developers
+++ b/utils/get-developers
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 import argparse
 import getdeveloperlib
diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index ce822320f8..438d26d68d 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -1,4 +1,3 @@
-from __future__ import print_function
 from io import open
 import os
 import re
diff --git a/utils/size-stats-compare b/utils/size-stats-compare
index a3d7f250c6..422972e488 100755
--- a/utils/size-stats-compare
+++ b/utils/size-stats-compare
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Copyright (C) 2016 Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
