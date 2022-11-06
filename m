Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129CEC433FE
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 15:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 999AC40283;
	Sun,  6 Nov 2022 15:34:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 999AC40283
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jy7HMn6_hD35; Sun,  6 Nov 2022 15:34:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E26A4013E;
	Sun,  6 Nov 2022 15:34:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E26A4013E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 127761BF287
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 15:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE09B607C0
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 15:34:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE09B607C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mLugAP9FIFl6 for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 15:34:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71D8A60783
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71D8A60783
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 15:34:18 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id bp12so3463869ilb.9
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 07:34:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IPCXANv8QigWhcaEBhY3Es84yPLDExmxZzWyUvx1gP4=;
 b=M1xOO/LXhVa2Uzv4tZvXox4q6gMWxxPa8U1TSJ2ionp8hy72VX9lQ1Q/LYfXf77n0c
 6VXVvEyPpa/DzTnnc81frKEhCTOX63VVn/65D4Um6GHnymHfSgUz7VF04bVZIqLjgEBh
 OyRDzjsbV1AZWKHthCWBT90QEzMS7GSTCMvNpI6SI2uFt8nvx9FhAAJz7uJeLMLjnuAg
 vLcbbZ40gs5GLTAw+pamFyGiwzICrx21VIuUYKE/DeDbKzcCo+8qOz1HGHIieOSzgjPY
 r368q41FuNUZfp3XJQN+1x66xLZXHAxR12088T/+d4c2h545x5y4G8+eUtbPTCoyOSi6
 6C2w==
X-Gm-Message-State: ANoB5pnT33/41KrTlIDreEByV4BJ7qFSBSURiFXtb7VpDudxgerYQVGG
 DMieWkSL+Y7NQqCA4I42MgECT4tyCIZ6Ag==
X-Google-Smtp-Source: AA0mqf7cPenGGirmE6EslrYS8sdKR4Fi9S9EeRw+TcNdUTCXqzwrbMWVTEyltdtiv/s30BfPKuZO+Q==
X-Received: by 2002:a05:6e02:1c09:b0:302:971:5348 with SMTP id
 l9-20020a056e021c0900b0030209715348mr3085900ilh.149.1667748857080; 
 Sun, 06 Nov 2022 07:34:17 -0800 (PST)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 r17-20020a056638045100b00372bbd04b75sm1778131jap.87.2022.11.06.07.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 07:34:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Nov 2022 08:34:14 -0700
Message-Id: <20221106153415.4112489-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IPCXANv8QigWhcaEBhY3Es84yPLDExmxZzWyUvx1gP4=;
 b=q0dXG3YbzsHNatHaNPAQaHw9xI0GqrBTaqgFnzv8G8Y24z/JgE1OhRzXvNhZ7XrDB2
 aM6WDownLr6/Alu1Irc462PHWcwaWsbf8gDJp9ZTZHFgizY4tulvGD43k/TbpeueZDvq
 E+BuHKNNQcMegxbpB3uRfWbM6uzwzvi+uSfs7NssHA85+PFLEk4tw7XWaGgw4pymdNxm
 oTUFHDYj+NkEDoG0AbOLxYu0dUnYXPE3GIaAdKrfnwXSlZvfRjwgPpQu4+9Agz5L9otu
 b4BKygWl1i8bXASC6uzJA+s4dcEO42SiP8YgjaKwveCjOXbu/Fs9dtFr8M4rnBI1Hfjv
 80zw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=q0dXG3Yb
Subject: [Buildroot] [PATCH 1/1] package/python-flit-core: bump to version
 3.8.0
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

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...sion-parser-for-multiple-assignments.patch | 80 -------------------
 .../python-flit-core/python-flit-core.hash    |  4 +-
 package/python-flit-core/python-flit-core.mk  |  4 +-
 3 files changed, 4 insertions(+), 84 deletions(-)
 delete mode 100644 package/python-flit-core/0001-Fix-ast-version-parser-for-multiple-assignments.patch

diff --git a/package/python-flit-core/0001-Fix-ast-version-parser-for-multiple-assignments.patch b/package/python-flit-core/0001-Fix-ast-version-parser-for-multiple-assignments.patch
deleted file mode 100644
index 5a94e1dcab..0000000000
--- a/package/python-flit-core/0001-Fix-ast-version-parser-for-multiple-assignments.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 2cd8b5708be88b90ea2fa0fb35407a5ec2038c8e Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Sat, 27 Nov 2021 02:36:15 -0700
-Subject: [PATCH] Fix ast version parser for multiple assignments
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[Upstream status:
-https://github.com/takluyver/flit/pull/474]
----
- flit_core/common.py                 | 21 +++++++++++--------
- .../tests/samples/moduleunimportabledouble.py |  8 +++++++
- flit_core/tests/test_common.py      |  5 +++++
- 3 files changed, 25 insertions(+), 9 deletions(-)
- create mode 100644 flit_core/tests/samples/moduleunimportabledouble.py
-
-diff --git a/flit_core/common.py b/flit_core/common.py
-index f1f378f..86bcf4b 100644
---- a/flit_core/common.py
-+++ b/flit_core/common.py
-@@ -132,15 +132,18 @@ def get_docstring_and_version_via_ast(target):
-     for child in node.body:
-         # Only use the version from the given module if it's a simple
-         # string assignment to __version__
--        is_version_str = (
--                isinstance(child, ast.Assign)
--                and len(child.targets) == 1
--                and isinstance(child.targets[0], ast.Name)
--                and child.targets[0].id == "__version__"
--                and isinstance(child.value, ast.Str)
--        )
--        if is_version_str:
--            version = child.value.s
-+        if isinstance(child, ast.Assign):
-+            for target in child.targets:
-+                is_version_str = (
-+                    isinstance(target, ast.Name)
-+                    and target.id == "__version__"
-+                    and isinstance(child.value, ast.Str)
-+                )
-+                if is_version_str:
-+                    version = child.value.s
-+                    break
-+            else:
-+                continue
-             break
-     else:
-         version = None
-diff --git a/flit_core/tests/samples/moduleunimportabledouble.py b/flit_core/tests/samples/moduleunimportabledouble.py
-new file mode 100644
-index 0000000..42d51f3
---- /dev/null
-+++ b/flit_core/tests/samples/moduleunimportabledouble.py
-@@ -0,0 +1,8 @@
-+
-+"""
-+A sample unimportable module with double assignment
-+"""
-+
-+raise ImportError()
-+
-+VERSION = __version__ = "0.1"
-diff --git a/flit_core/tests/test_common.py b/flit_core/tests/test_common.py
-index 02cfab7..42e230b 100644
---- a/flit_core/tests/test_common.py
-+++ b/flit_core/tests/test_common.py
-@@ -70,6 +70,11 @@ class ModuleTests(TestCase):
-                                 'version': '0.1'}
-                          )
- 
-+        info = get_info_from_module(Module('moduleunimportabledouble', samples_dir))
-+        self.assertEqual(info, {'summary': 'A sample unimportable module with double assignment',
-+                                'version': '0.1'}
-+                         )
-+
-         info = get_info_from_module(Module('module1', samples_dir / 'constructed_version'))
-         self.assertEqual(info, {'summary': 'This module has a __version__ that requires runtime interpretation',
-                                 'version': '1.2.3'}
--- 
-2.33.1
-
diff --git a/package/python-flit-core/python-flit-core.hash b/package/python-flit-core/python-flit-core.hash
index 135be93660..9281635f1a 100644
--- a/package/python-flit-core/python-flit-core.hash
+++ b/package/python-flit-core/python-flit-core.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/flit_core/json
-md5  4a4791e97f3a8c9a1645064a35636ee6  flit_core-3.7.1.tar.gz
-sha256  14955af340c43035dbfa96b5ee47407e377ee337f69e70f73064940d27d0a44f  flit_core-3.7.1.tar.gz
+md5  7c41da13273f7787709a24f74e0f5a99  flit_core-3.8.0.tar.gz
+sha256  b305b30c99526df5e63d6022dd2310a0a941a187bd3884f4c8ef0418df6c39f3  flit_core-3.8.0.tar.gz
diff --git a/package/python-flit-core/python-flit-core.mk b/package/python-flit-core/python-flit-core.mk
index 2dc67bd517..4d7bee81da 100644
--- a/package/python-flit-core/python-flit-core.mk
+++ b/package/python-flit-core/python-flit-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLIT_CORE_VERSION = 3.7.1
+PYTHON_FLIT_CORE_VERSION = 3.8.0
 PYTHON_FLIT_CORE_SOURCE = flit_core-$(PYTHON_FLIT_CORE_VERSION).tar.gz
-PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/15/d1/d8798b83e953fd6f86ca9b50f93eec464a9305b0661469c8234e61095481
+PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/10/e5/be08751d07b30889af130cec20955c987a74380a10058e6e8856e4010afc
 PYTHON_FLIT_CORE_LICENSE = BSD-3-Clause
 PYTHON_FLIT_CORE_SETUP_TYPE = flit-bootstrap
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
