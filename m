Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D5FC71136
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 12:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D2BE60B51;
	Tue, 17 Jun 2025 12:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ErekbBkYaKxh; Tue, 17 Jun 2025 12:32:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F09F160D5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F09F160D5E;
	Tue, 17 Jun 2025 12:32:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D25F5151
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 12:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFBA24003D
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 12:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MaEOQFoIJj67 for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 12:32:54 +0000 (UTC)
X-Greylist: delayed 85126 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 17 Jun 2025 12:32:53 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C28BB40547
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C28BB40547
Received-SPF: Neutral (mailfrom) identity=mailfrom; client-ip=54.37.254.54;
 helo=kmf2.trabucayre.com; envelope-from=gwenj@trabucayre.com;
 receiver=<UNKNOWN> 
Received: from kmf2.trabucayre.com (ns3108948.ip-54-37-254.eu [54.37.254.54])
 by smtp2.osuosl.org (Postfix) with ESMTP id C28BB40547
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 12:32:53 +0000 (UTC)
Received: from kmf3.. (localhost [IPv6:::1])
 by kmf2.trabucayre.com (Postfix) with ESMTP id 8A66F16022E;
 Tue, 17 Jun 2025 12:32:50 +0000 (UTC)
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: buildroot@buildroot.org
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Date: Tue, 17 Jun 2025 12:32:49 +0000
Message-Id: <20250617123249.1359316-1-gwenj@trabucayre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=trabucayre.com
Subject: [Buildroot] [PATCH] package/python-remi: bump to master commit and
 fixes build failure
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

REMI hasn't received new release since July 2022 and is currently broken
with error:

Traceback (most recent call last):
  File "<string>", line 26, in <module>
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/__init__.py", line 116, in setup
    _install_setup_requires(attrs)
    ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/__init__.py", line 89, in _install_setup_requires
    _fetch_build_eggs(dist)
    ~~~~~~~~~~~~~~~~~^^^^^^
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/__init__.py", line 94, in _fetch_build_eggs
    dist.fetch_build_eggs(dist.setup_requires)
    ~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/build_meta.py", line 80, in fetch_build_eggs
    raise SetupRequirementsError(specifier_list)
setuptools.build_meta.SetupRequirementsError: ['setuptools_scm']

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/pyproject_hooks/_in_process/_in_process.py", line 389, in <module>
    main()
    ~~~~^^
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/pyproject_hooks/_in_process/_in_process.py", line 373, in main
    json_out["return_val"] = hook(**hook_input["kwargs"])
                             ~~~~^^^^^^^^^^^^^^^^^^^^^^^^
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/pyproject_hooks/_in_process/_in_process.py", line 143, in get_requires_for_build_wheel
    return hook(config_settings)
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/build_meta.py", line 331, in get_requires_for_build_wheel
    return self._get_build_requires(config_settings, requirements=[])
           ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/build_meta.py", line 301, in _get_build_requires
    self.run_setup()
    ~~~~~~~~~~~~~~^^
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/build_meta.py", line 512, in run_setup
    super().run_setup(setup_script=setup_script)
    ~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/build_meta.py", line 317, in run_setup
    exec(code, locals())
    ~~~~^^^^^^^^^^^^^^^^
  File "<string>", line 31, in <module>
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/__init__.py", line 117, in setup
    return distutils.core.setup(**attrs)
           ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/_distutils/core.py", line 148, in setup
    _setup_distribution = dist = klass(attrs)
                                 ~~~~~^^^^^^^
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/dist.py", line 323, in __init__
    _Distribution.__init__(self, dist_attrs)
    ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/_distutils/dist.py", line 309, in __init__
    self.finalize_options()
    ~~~~~~~~~~~~~~~~~~~~~^^
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/dist.py", line 786, in finalize_options
    ep(self)
    ~~^^^^^^
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/dist.py", line 806, in _finalize_setup_keywords
    ep.load()(self, ep.name, value)
    ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools_scm/_integration/setuptools.py", line 82, in version_keyword
    assert isinstance(value, dict), "version_keyword expects a dict or True"
           ~~~~~~~~~~^^^^^^^^^^^^^
AssertionError: version_keyword expects a dict or True

ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
make: *** [package/pkg-generic.mk:273: /workdir/instance-0/output-1/build/python-remi-2022.7.27/.stamp_built] Error 1
make: Leaving directory '/workdir/instance-0/buildroot'

Since last release code has been corrected and now build end
successfully.

Another issue with remi is related to python CGI library no more available with
python 3.13. This patch also updates Config.in to add a select BR2_PACKAGE_PYTHON_LEGACY_CGI


Fix:
- https://autobuild.buildroot.org/results/f0409533ebdc31e522f2ee2ea8a5acc11dbc7430/
- https://autobuild.buildroot.org/results/a16cf5105d4b726b5d4136a2d8f82abcfdc0faba/
- https://autobuild.buildroot.org/results/e7ac28e20ad92863d337e96c225463346ee6c690/

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/python-remi/Config.in        | 1 +
 package/python-remi/python-remi.hash | 3 +--
 package/python-remi/python-remi.mk   | 5 ++---
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-remi/Config.in b/package/python-remi/Config.in
index da2c2f4cfb..2ecd310bf2 100644
--- a/package/python-remi/Config.in
+++ b/package/python-remi/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_REMI
 	bool "python-remi"
 	select BR2_PACKAGE_PYTHON3_SSL # runtime
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_LEGACY_CGI # runtime
 	help
 	  Remi is a GUI library for Python applications which transpiles
 	  an application's interface into HTML to be rendered in a web
diff --git a/package/python-remi/python-remi.hash b/package/python-remi/python-remi.hash
index e7937c3914..46bee6e664 100644
--- a/package/python-remi/python-remi.hash
+++ b/package/python-remi/python-remi.hash
@@ -1,4 +1,3 @@
-# sha256 from https://pypi.org/pypi/remi/json
-sha256  542df88e174bbd58fe763c49e5c2116f2c8413c1a934731069ed8c17bb9cd64c  remi-2022.7.27.tar.gz
 # Locally computed sha256
+sha256  8a84941a58952657c7940db2fd3adc6d1ae10a186a02ddc0f1963c353e6108b3  python-remi-18505f6439849c6e01695dd90dbf680d5ffb0a14.tar.gz
 sha256  3df7d3ad8904d7e99fc0810366483a7cbe5a43c13f7f913f1d7e5023f2ff7657  LICENSE
diff --git a/package/python-remi/python-remi.mk b/package/python-remi/python-remi.mk
index 419a3441a7..ed0fb2be1d 100644
--- a/package/python-remi/python-remi.mk
+++ b/package/python-remi/python-remi.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-PYTHON_REMI_VERSION = 2022.7.27
-PYTHON_REMI_SOURCE = remi-$(PYTHON_REMI_VERSION).tar.gz
-PYTHON_REMI_SITE = https://files.pythonhosted.org/packages/b7/5c/fca9d9273fc9d5f4ca0bc2f387ca19f8ba9979dcb75617d094e575dc2337
+PYTHON_REMI_VERSION = 18505f6439849c6e01695dd90dbf680d5ffb0a14
+PYTHON_REMI_SITE = $(call github,rawpython,remi,$(PYTHON_REMI_VERSION))
 
 PYTHON_REMI_LICENSE = Apache-2.0
 PYTHON_REMI_LICENSE_FILES = LICENSE
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
