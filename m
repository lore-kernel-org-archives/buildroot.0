Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB80C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3BC64F968;
	Fri, 28 Feb 2025 16:43:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EET5mySAlcwr; Fri, 28 Feb 2025 16:43:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B5074F96A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B5074F96A;
	Fri, 28 Feb 2025 16:43:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AC5968
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57D5242AED
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jky0_zS-75L2 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1AC242514
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1AC242514
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE3FB818CF; Fri, 28 Feb 2025 16:29:45 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Dec 2024 17:55:22 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 87706103a6bdee8ed3b6ea51b45626aa9d2185ab
X-Git-Newrev: 621ebccf3f1ca70443160103ae12ab3ea89f63bd
X-Patchwork-Hint: ignore
Message-Id: <20250228162945.BE3FB818CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-autocommand:
 add patch to fix build issue
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=621ebccf3f1ca70443160103ae12ab3ea89f63bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...nse-declaration-and-rely-instead-on-Trove.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
