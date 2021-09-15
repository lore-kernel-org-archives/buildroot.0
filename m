Return-Path: <SRS0=vgbW=OF=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00550C433FE
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 19:49:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97A01610A4
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 19:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 97A01610A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EA15819C8;
	Wed, 15 Sep 2021 19:49:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qAaXS-ybAXbX; Wed, 15 Sep 2021 19:49:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E39781D68;
	Wed, 15 Sep 2021 19:49:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 83F001BF30F
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 19:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8035B401D0
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 19:48:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9luXbrnNxp7j for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 19:48:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94FE440124
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 19:48:51 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id w29so5659121wra.8
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 12:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jo+EzZZMC/a36rElEah6gVwBJqpfMa8ZV3YdvtWFdIw=;
 b=EyNIuUYBNZYbu9KhGQCEQFZeUqmYWQLettkXhznXPy1iUJvieIXmlvKpQV7A4cv14L
 QVT8tfqyr5W9dFJdDIZshPeybDAfKYs/Wdc9swApYGrauxEQkfoWtwHHutkzeYuQkGUB
 8vb6pSbnuFTn2sBTBESjc91CeDh7HdQuDEMDV6tUBLz/DcT/WbEp2NpaD8/fg9NKMyTe
 phmsi1bKtwCtywgJy581M8beDH37RORIqqy8pjgBdhFpMae1ukNe12Udr8dDY2T44FrP
 +Q/7ctasK0o1drWJ9eI3ORwPSgD4C/6J4d6HJTS6KHnCXlBsZF1ZHHKPI+PYnoxZEHlE
 kxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jo+EzZZMC/a36rElEah6gVwBJqpfMa8ZV3YdvtWFdIw=;
 b=CBDsrbbCA2OhUhN5pFITe9XK5BUuOAD1ODA52NJSIW/ii3T+eD+9aI+Khj4JguFDPa
 DajuWUUJYluCuWH5seARFp2UiIHdUK7GvnVl3pZCZHGhoP8dayezL/5jLkwBJHQ3BQSi
 Ks5EjrugU8hwPDFJCMNJmXY0Pl3B/kE/hAYragilR3M0Cbnh+cDahKI/z4a0oHDAHPW7
 68V8nDQys9EpTY3pKmYSQn+WnUdeKxWnQAhz+v+wW3LhYdTN8Gw/rnuxsFC0n0DbZg2r
 3L8wDCXzK9F4dcAqNYwEgc3OuKzSy7SvZymosqJlbXoH6DgnVKK++cT0xjQ/LDzoT+Wh
 4z2A==
X-Gm-Message-State: AOAM533hSCusT8Cu9yfa/LG4stbX9JnFCnC5hCEdPkqr/sjE83ZlC9tT
 FYGfIZYqJFsKyxxMgrLmOkF4WaN1Fl8=
X-Google-Smtp-Source: ABdhPJxt5iO2J/0ly9S3Z3kCH1To0wLuM78qUO15HJrKHXRcoQEADb+rZ8+uKwdRGdypMoS2RmPpIw==
X-Received: by 2002:adf:fac7:: with SMTP id a7mr1854596wrs.341.1631735329749; 
 Wed, 15 Sep 2021 12:48:49 -0700 (PDT)
Received: from dell5510.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id l26sm5099699wmi.25.2021.09.15.12.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 12:48:49 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Sep 2021 21:48:39 +0200
Message-Id: <20210915194839.22122-5-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210915194839.22122-1-petr.vorel@gmail.com>
References: <20210915194839.22122-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 4/4] testing/tests/package: use python3
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
Cc: David Laight <David.Laight@ACULAB.COM>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

in all testing libraries. Although library does not require shebang,
it's better to state python3 use.

NOTE: keep code "from __future__ import print_function;" in
TestPythonBase() as code itself test both python versions.

Tested with python3 -m py_compile.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
New in v2

 support/testing/tests/package/test_crudini.py                 | 2 ++
 support/testing/tests/package/test_gst1_python.py             | 2 ++
 support/testing/tests/package/test_ipython.py                 | 2 ++
 support/testing/tests/package/test_libftdi1.py                | 2 ++
 support/testing/tests/package/test_python.py                  | 2 ++
 support/testing/tests/package/test_python_argh.py             | 2 ++
 support/testing/tests/package/test_python_attrs.py            | 2 ++
 support/testing/tests/package/test_python_augeas.py           | 2 ++
 support/testing/tests/package/test_python_autobahn.py         | 2 ++
 support/testing/tests/package/test_python_automat.py          | 2 ++
 support/testing/tests/package/test_python_avro.py             | 2 ++
 support/testing/tests/package/test_python_bitstring.py        | 2 ++
 support/testing/tests/package/test_python_can.py              | 2 ++
 support/testing/tests/package/test_python_cbor.py             | 2 ++
 support/testing/tests/package/test_python_click.py            | 2 ++
 support/testing/tests/package/test_python_colorzero.py        | 2 ++
 support/testing/tests/package/test_python_constantly.py       | 2 ++
 support/testing/tests/package/test_python_crossbar.py         | 2 ++
 support/testing/tests/package/test_python_cryptography.py     | 2 ++
 support/testing/tests/package/test_python_dbus_next.py        | 2 ++
 support/testing/tests/package/test_python_django.py           | 2 ++
 support/testing/tests/package/test_python_gitdb2.py           | 2 ++
 support/testing/tests/package/test_python_gobject.py          | 2 ++
 support/testing/tests/package/test_python_gpiozero.py         | 2 ++
 support/testing/tests/package/test_python_incremental.py      | 2 ++
 support/testing/tests/package/test_python_passlib.py          | 2 ++
 support/testing/tests/package/test_python_pexpect.py          | 2 ++
 support/testing/tests/package/test_python_pynacl.py           | 2 ++
 support/testing/tests/package/test_python_pytest.py           | 2 ++
 support/testing/tests/package/test_python_pytest_asyncio.py   | 2 ++
 support/testing/tests/package/test_python_pyyaml.py           | 2 ++
 support/testing/tests/package/test_python_rpi_gpio.py         | 2 ++
 support/testing/tests/package/test_python_rsa.py              | 2 ++
 support/testing/tests/package/test_python_service_identity.py | 2 ++
 support/testing/tests/package/test_python_smmap2.py           | 2 ++
 support/testing/tests/package/test_python_subprocess32.py     | 2 ++
 support/testing/tests/package/test_python_treq.py             | 2 ++
 support/testing/tests/package/test_python_twisted.py          | 2 ++
 support/testing/tests/package/test_python_txaio.py            | 2 ++
 support/testing/tests/package/test_python_txtorcon.py         | 2 ++
 support/testing/tests/package/test_python_ubjson.py           | 2 ++
 41 files changed, 82 insertions(+)

diff --git a/support/testing/tests/package/test_crudini.py b/support/testing/tests/package/test_crudini.py
index e320d3207e..c86cf9de27 100644
--- a/support/testing/tests/package/test_crudini.py
+++ b/support/testing/tests/package/test_crudini.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 import os
 from tests.package.test_python import TestPythonPackageBase
 
diff --git a/support/testing/tests/package/test_gst1_python.py b/support/testing/tests/package/test_gst1_python.py
index caae3e6b2d..43b150b094 100644
--- a/support/testing/tests/package/test_gst1_python.py
+++ b/support/testing/tests/package/test_gst1_python.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 import os
 from tests.package.test_python import TestPythonPackageBase
 
diff --git a/support/testing/tests/package/test_ipython.py b/support/testing/tests/package/test_ipython.py
index 50b00da7c2..0bde89b729 100644
--- a/support/testing/tests/package/test_ipython.py
+++ b/support/testing/tests/package/test_ipython.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonBase
 #
 # The following pythong tests are not being used here:
diff --git a/support/testing/tests/package/test_libftdi1.py b/support/testing/tests/package/test_libftdi1.py
index 78c928484c..04718f7b7d 100644
--- a/support/testing/tests/package/test_libftdi1.py
+++ b/support/testing/tests/package/test_libftdi1.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
index 60da8765c4..98f6c68c50 100644
--- a/support/testing/tests/package/test_python.py
+++ b/support/testing/tests/package/test_python.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 import os
 
 import infra.basetest
diff --git a/support/testing/tests/package/test_python_argh.py b/support/testing/tests/package/test_python_argh.py
index de4b4cbe74..66b5bc15b1 100644
--- a/support/testing/tests/package/test_python_argh.py
+++ b/support/testing/tests/package/test_python_argh.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python_attrs.py b/support/testing/tests/package/test_python_attrs.py
index 9f597034ae..917fa99771 100644
--- a/support/testing/tests/package/test_python_attrs.py
+++ b/support/testing/tests/package/test_python_attrs.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python_augeas.py b/support/testing/tests/package/test_python_augeas.py
index c1424668d6..59c58d413d 100644
--- a/support/testing/tests/package/test_python_augeas.py
+++ b/support/testing/tests/package/test_python_augeas.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python_autobahn.py b/support/testing/tests/package/test_python_autobahn.py
index a237ce465d..d97b743a3e 100644
--- a/support/testing/tests/package/test_python_autobahn.py
+++ b/support/testing/tests/package/test_python_autobahn.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python_automat.py b/support/testing/tests/package/test_python_automat.py
index 00a7ed6526..b71e44d3eb 100644
--- a/support/testing/tests/package/test_python_automat.py
+++ b/support/testing/tests/package/test_python_automat.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python_avro.py b/support/testing/tests/package/test_python_avro.py
index 6eee2760da..64b3b00aa3 100644
--- a/support/testing/tests/package/test_python_avro.py
+++ b/support/testing/tests/package/test_python_avro.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python_bitstring.py b/support/testing/tests/package/test_python_bitstring.py
index 63b3fdb69c..7a57f993e8 100644
--- a/support/testing/tests/package/test_python_bitstring.py
+++ b/support/testing/tests/package/test_python_bitstring.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python_can.py b/support/testing/tests/package/test_python_can.py
index d509d05dbb..07131fda01 100644
--- a/support/testing/tests/package/test_python_can.py
+++ b/support/testing/tests/package/test_python_can.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python_cbor.py b/support/testing/tests/package/test_python_cbor.py
index 9da3503763..2c0a5cc2e7 100644
--- a/support/testing/tests/package/test_python_cbor.py
+++ b/support/testing/tests/package/test_python_cbor.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python_click.py b/support/testing/tests/package/test_python_click.py
index db57d3aa9f..b64594354a 100644
--- a/support/testing/tests/package/test_python_click.py
+++ b/support/testing/tests/package/test_python_click.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python_colorzero.py b/support/testing/tests/package/test_python_colorzero.py
index d67f77bdd4..b62c4b3cbb 100644
--- a/support/testing/tests/package/test_python_colorzero.py
+++ b/support/testing/tests/package/test_python_colorzero.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python_constantly.py b/support/testing/tests/package/test_python_constantly.py
index 5be01c4f8c..4a12d11c5c 100644
--- a/support/testing/tests/package/test_python_constantly.py
+++ b/support/testing/tests/package/test_python_constantly.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python_crossbar.py b/support/testing/tests/package/test_python_crossbar.py
index d7843ddd8b..82076a99e5 100644
--- a/support/testing/tests/package/test_python_crossbar.py
+++ b/support/testing/tests/package/test_python_crossbar.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python_cryptography.py b/support/testing/tests/package/test_python_cryptography.py
index 62f0ca0def..1fb4fc9f98 100644
--- a/support/testing/tests/package/test_python_cryptography.py
+++ b/support/testing/tests/package/test_python_cryptography.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python_dbus_next.py b/support/testing/tests/package/test_python_dbus_next.py
index 3c597ad198..1a99f18039 100644
--- a/support/testing/tests/package/test_python_dbus_next.py
+++ b/support/testing/tests/package/test_python_dbus_next.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 import textwrap
 
 
diff --git a/support/testing/tests/package/test_python_django.py b/support/testing/tests/package/test_python_django.py
index 0b7d35bb6a..01b6c30c83 100644
--- a/support/testing/tests/package/test_python_django.py
+++ b/support/testing/tests/package/test_python_django.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python_gitdb2.py b/support/testing/tests/package/test_python_gitdb2.py
index fc55f20821..6b4d96ad36 100644
--- a/support/testing/tests/package/test_python_gitdb2.py
+++ b/support/testing/tests/package/test_python_gitdb2.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python_gobject.py b/support/testing/tests/package/test_python_gobject.py
index cd8a43252b..79cdc717c6 100644
--- a/support/testing/tests/package/test_python_gobject.py
+++ b/support/testing/tests/package/test_python_gobject.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 import os
 from tests.package.test_python import TestPythonPackageBase
 
diff --git a/support/testing/tests/package/test_python_gpiozero.py b/support/testing/tests/package/test_python_gpiozero.py
index 4fe155e6ce..4088def82b 100644
--- a/support/testing/tests/package/test_python_gpiozero.py
+++ b/support/testing/tests/package/test_python_gpiozero.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python_incremental.py b/support/testing/tests/package/test_python_incremental.py
index 49800d8937..51ada9dea1 100644
--- a/support/testing/tests/package/test_python_incremental.py
+++ b/support/testing/tests/package/test_python_incremental.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python_passlib.py b/support/testing/tests/package/test_python_passlib.py
index 7c85882bf8..cb7a913685 100644
--- a/support/testing/tests/package/test_python_passlib.py
+++ b/support/testing/tests/package/test_python_passlib.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python_pexpect.py b/support/testing/tests/package/test_python_pexpect.py
index ba31cdbdbe..c506d95eea 100644
--- a/support/testing/tests/package/test_python_pexpect.py
+++ b/support/testing/tests/package/test_python_pexpect.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python_pynacl.py b/support/testing/tests/package/test_python_pynacl.py
index f4dd54940a..e78ccab291 100644
--- a/support/testing/tests/package/test_python_pynacl.py
+++ b/support/testing/tests/package/test_python_pynacl.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python_pytest.py b/support/testing/tests/package/test_python_pytest.py
index 1a631adfd3..b214b63793 100644
--- a/support/testing/tests/package/test_python_pytest.py
+++ b/support/testing/tests/package/test_python_pytest.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 import os
 
 from tests.package.test_python import TestPythonPackageBase
diff --git a/support/testing/tests/package/test_python_pytest_asyncio.py b/support/testing/tests/package/test_python_pytest_asyncio.py
index e09abf2abb..06373c3804 100644
--- a/support/testing/tests/package/test_python_pytest_asyncio.py
+++ b/support/testing/tests/package/test_python_pytest_asyncio.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 import os
 
 from tests.package.test_python import TestPythonPackageBase
diff --git a/support/testing/tests/package/test_python_pyyaml.py b/support/testing/tests/package/test_python_pyyaml.py
index cd45a57b86..e83b3f49e6 100644
--- a/support/testing/tests/package/test_python_pyyaml.py
+++ b/support/testing/tests/package/test_python_pyyaml.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python_rpi_gpio.py b/support/testing/tests/package/test_python_rpi_gpio.py
index c938ea39bb..83da2d893c 100644
--- a/support/testing/tests/package/test_python_rpi_gpio.py
+++ b/support/testing/tests/package/test_python_rpi_gpio.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python_rsa.py b/support/testing/tests/package/test_python_rsa.py
index e63d63e1de..58c9a4716a 100644
--- a/support/testing/tests/package/test_python_rsa.py
+++ b/support/testing/tests/package/test_python_rsa.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python_service_identity.py b/support/testing/tests/package/test_python_service_identity.py
index 09cfbe0a26..e501941892 100644
--- a/support/testing/tests/package/test_python_service_identity.py
+++ b/support/testing/tests/package/test_python_service_identity.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python_smmap2.py b/support/testing/tests/package/test_python_smmap2.py
index 07c0e6621e..61593886f2 100644
--- a/support/testing/tests/package/test_python_smmap2.py
+++ b/support/testing/tests/package/test_python_smmap2.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python_subprocess32.py b/support/testing/tests/package/test_python_subprocess32.py
index d2878046d1..cf90f0be5d 100644
--- a/support/testing/tests/package/test_python_subprocess32.py
+++ b/support/testing/tests/package/test_python_subprocess32.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python_treq.py b/support/testing/tests/package/test_python_treq.py
index d7a23829ea..43bb9aaa71 100644
--- a/support/testing/tests/package/test_python_treq.py
+++ b/support/testing/tests/package/test_python_treq.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python_twisted.py b/support/testing/tests/package/test_python_twisted.py
index e87312db13..b33be1616a 100644
--- a/support/testing/tests/package/test_python_twisted.py
+++ b/support/testing/tests/package/test_python_twisted.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python_txaio.py b/support/testing/tests/package/test_python_txaio.py
index f1bb2c79a6..d3e0db0d33 100644
--- a/support/testing/tests/package/test_python_txaio.py
+++ b/support/testing/tests/package/test_python_txaio.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python_txtorcon.py b/support/testing/tests/package/test_python_txtorcon.py
index 8e74190ee1..a43fd187e9 100644
--- a/support/testing/tests/package/test_python_txtorcon.py
+++ b/support/testing/tests/package/test_python_txtorcon.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
diff --git a/support/testing/tests/package/test_python_ubjson.py b/support/testing/tests/package/test_python_ubjson.py
index 85c707e292..5b86352774 100644
--- a/support/testing/tests/package/test_python_ubjson.py
+++ b/support/testing/tests/package/test_python_ubjson.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+
 from tests.package.test_python import TestPythonPackageBase
 
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
