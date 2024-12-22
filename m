Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB594E7718D
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 16:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F78960F3F;
	Sun, 22 Dec 2024 16:26:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i95jkhmDiMWh; Sun, 22 Dec 2024 16:26:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6335A60F76
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6335A60F76;
	Sun, 22 Dec 2024 16:26:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1036DD3
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 16:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E52FB42A0F
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 16:26:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TZ6G9op92cIC for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 16:26:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A214C42A03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A214C42A03
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A214C42A03
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 16:26:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id BDC4C60002;
 Sun, 22 Dec 2024 16:26:16 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 22 Dec 2024 17:26:14 +0100
Message-ID: <20241222162615.1872897-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1734884777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zu0PcjEwcLW0QypxJGDSE5uRUQODfdXzlNwRCLYnRzA=;
 b=RmF1UQtreKRZFRdMnFsIQfv4htDOfzHWVLJP8Ucu6HIW1YiTNQjghgjJvaA0IHToCeqtfV
 fqq5CK4EAS2sVYhj0phjUOkmHkyXQGHSWvSpFcG98zlJnWtshXOIYy872qf0UgLJbqUE1X
 /WmbxbJOaL2/zcN7VHWTCzsXFrfYPq17blYc6F1p6t0pSQCvFtvImTH7eixvUJCztFcUVg
 1dfqRPVQPtfPdlcsGQ2fY95VmiZmiXSbedMleFnpU5Qsg15/OCYfoJAB+acAq3xhspfYrv
 udDimToHt97NeXIBrIC6Vi7TTPskcApHmMhH12hM0k0REU5wL3im9Tl0JZDKlw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RmF1UQtr
Subject: [Buildroot] [PATCH] package/python-autocommand: add patch to fix
 build issue
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the python-autocommand package has been introduced in commit
b6f3278539216f55fb18ff7e63ce2da39ed0c3e1 ("package/python-autocommand:
new package"), it has consistently been failing to build with:

Traceback (most recent call last):
  File "/home/autobuild/autobuild/instance-12/output-1/host/lib/python3.12/site-packages/pyproject_hooks/_in_process/_in_process.py", line 353, in <module>
    main()
  File "/home/autobuild/autobuild/instance-12/output-1/host/lib/python3.12/site-packages/pyproject_hooks/_in_process/_in_process.py", line 335, in main
    json_out['return_val'] = hook(**hook_input['kwargs'])
                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/autobuild/autobuild/instance-12/output-1/host/lib/python3.12/site-packages/pyproject_hooks/_in_process/_in_process.py", line 118, in get_requires_for_build_wheel
    return hook(config_settings)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/home/autobuild/autobuild/instance-12/output-1/host/lib/python3.12/site-packages/setuptools/build_meta.py", line 327, in get_requires_for_build_wheel
    return self._get_build_requires(config_settings, requirements=[])
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/autobuild/autobuild/instance-12/output-1/host/lib/python3.12/site-packages/setuptools/build_meta.py", line 297, in _get_build_requires
    self.run_setup()
  File "/home/autobuild/autobuild/instance-12/output-1/host/lib/python3.12/site-packages/setuptools/build_meta.py", line 497, in run_setup
    super().run_setup(setup_script=setup_script)
  File "/home/autobuild/autobuild/instance-12/output-1/host/lib/python3.12/site-packages/setuptools/build_meta.py", line 313, in run_setup
    exec(code, locals())
  File "<string>", line 8, in <module>
  File "/home/autobuild/autobuild/instance-12/output-1/host/lib/python3.12/site-packages/setuptools/__init__.py", line 108, in setup
    return distutils.core.setup(**attrs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/autobuild/autobuild/instance-12/output-1/host/lib/python3.12/site-packages/setuptools/_distutils/core.py", line 158, in setup
    dist.parse_config_files()
  File "/home/autobuild/autobuild/instance-12/output-1/host/lib/python3.12/site-packages/setuptools/dist.py", line 632, in parse_config_files
    pyprojecttoml.apply_configuration(self, filename, ignore_option_errors)
  File "/home/autobuild/autobuild/instance-12/output-1/host/lib/python3.12/site-packages/setuptools/config/pyprojecttoml.py", line 71, in apply_configuration
    return _apply(dist, config, filepath)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/autobuild/autobuild/instance-12/output-1/host/lib/python3.12/site-packages/setuptools/config/_apply_pyprojecttoml.py", line 53, in apply
    _apply_project_table(dist, config, root_dir)
  File "/home/autobuild/autobuild/instance-12/output-1/host/lib/python3.12/site-packages/setuptools/config/_apply_pyprojecttoml.py", line 79, in _apply_project_table
    corresp(dist, value, root_dir)
  File "/home/autobuild/autobuild/instance-12/output-1/host/lib/python3.12/site-packages/setuptools/config/_apply_pyprojecttoml.py", line 181, in _license
    _set_config(dist, "license", val["text"])
                                 ~~~^^^^^^^^
KeyError: 'text'

This is due to incorrect license information in pyproject.toml. This
was probably missed as the package was merged ~6 months after it was
submitted, so probably at the time it was submitted, it worked fine,
but got broken with more recent versions of setuptools.

Fixes:

  http://autobuild.buildroot.net/results/c9114834eb00569cdb8ec3251ccd5ecfd906c9c9/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...eclaration-and-rely-instead-on-Trove.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/python-autocommand/0001-Remove-license-declaration-and-rely-instead-on-Trove.patch

diff --git a/package/python-autocommand/0001-Remove-license-declaration-and-rely-instead-on-Trove.patch b/package/python-autocommand/0001-Remove-license-declaration-and-rely-instead-on-Trove.patch
new file mode 100644
index 0000000000..9e00269cb0
--- /dev/null
+++ b/package/python-autocommand/0001-Remove-license-declaration-and-rely-instead-on-Trove.patch
@@ -0,0 +1,29 @@
+From 4e54dc74f2d6f735cb187343f01c44693ea86f59 Mon Sep 17 00:00:00 2001
+From: "Jason R. Coombs" <jaraco@jaraco.com>
+Date: Thu, 4 Apr 2024 17:23:20 -0400
+Subject: [PATCH] Remove license declaration and rely instead on Trove
+ classifiers and LICENSE being included.
+
+Closes #32.
+
+Upstream: https://github.com/Lucretiel/autocommand/pull/33
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ setup.py | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 41f86a1..d154562 100644
+--- a/setup.py
++++ b/setup.py
+@@ -13,7 +13,6 @@ setup(
+     ],
+     package_dir={'': 'src'},
+     platforms='any',
+-    license='LGPLv3',
+     author='Nathan West',
+     url='https://github.com/Lucretiel/autocommand',
+     description='A library to create a command-line program from a function',
+-- 
+2.47.0
+
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
