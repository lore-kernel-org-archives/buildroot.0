Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E16BC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 12:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A70C401ED;
	Fri,  5 Jan 2024 12:47:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A70C401ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mnF9959vWPBi; Fri,  5 Jan 2024 12:47:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD250436BD;
	Fri,  5 Jan 2024 12:47:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD250436BD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8ED4B1BF422
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7615E421B8
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:47:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7615E421B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JeS8ajaG_52l for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 12:47:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 892A941E84
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 12:47:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 892A941E84
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6EE268444D; Fri,  5 Jan 2024 12:47:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Jan 2024 13:47:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b12863107cb73d8263dd24eab1fb15bd9cb5e0f
X-Git-Newrev: d1eea4f90ce9238cae36a8d4ae0161a8a3748616
X-Patchwork-Hint: ignore
Message-Id: <20240105124738.6EE268444D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pysensors: fix build
 without host lm-sensors
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d1eea4f90ce9238cae36a8d4ae0161a8a3748616
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the
package in commit c8ff8d41c06f6b1cbc5cf8702a516411084ead16:

  File "/home/buildroot/autobuild/instance-2/output-1/build/python-pysensors-0.0.4/setup.py", line 3, in <module>
    import sensors
  File "/home/buildroot/autobuild/instance-2/output-1/build/python-pysensors-0.0.4/sensors/__init__.py", line 20, in <module>
    raise ImportError("can't find the sensors library.")

Fixes:
 - http://autobuild.buildroot.org/results/acd8583fb635ea27811405a2478182ddcd5642f7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Remove-import-sensors-from-setup-py.patch | 55 ++++++++++++++++++++++
 package/python-pysensors/Config.in                 |  2 +-
 2 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/package/python-pysensors/0001-Remove-import-sensors-from-setup-py.patch b/package/python-pysensors/0001-Remove-import-sensors-from-setup-py.patch
new file mode 100644
index 0000000000..737f194fd4
--- /dev/null
+++ b/package/python-pysensors/0001-Remove-import-sensors-from-setup-py.patch
@@ -0,0 +1,55 @@
+Remove import sensors from setup.py
+
+Don't import sensors in setup.py to avoid adding a dependency on host
+lm-sensors. Instead, move __version__, __author__, __contact__ and
+__license__ to setup.py
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: upstream is dead since 2019
+
+diff '--color=auto' -Nura PySensors-0.0.4.orig/sensors/__init__.py PySensors-0.0.4/sensors/__init__.py
+--- PySensors-0.0.4.orig/sensors/__init__.py	2024-01-04 13:47:07.114179107 +0100
++++ PySensors-0.0.4/sensors/__init__.py	2024-01-04 14:07:24.701178768 +0100
+@@ -6,12 +6,6 @@
+ 
+ from sensors import stdc
+ 
+-__version__ = "0.0.4"
+-__date__ = "2019-09-19"
+-__author__ = "Marc 'BlackJack' Rintsch"
+-__contact__ = 'marc@rintsch.de'
+-__license__ = 'LGPL v2.1'
+-
+ API_VERSION = 4
+ DEFAULT_CONFIG_FILENAME = b"/etc/sensors3.conf"
+ 
+diff '--color=auto' -Nura PySensors-0.0.4.orig/setup.py PySensors-0.0.4/setup.py
+--- PySensors-0.0.4.orig/setup.py	2024-01-04 13:47:07.114179107 +0100
++++ PySensors-0.0.4/setup.py	2024-01-04 14:07:04.657260411 +0100
+@@ -1,17 +1,21 @@
+ #!/usr/bin/env python3
+ from setuptools import setup
+-import sensors
++
++__version__ = "0.0.4"
++__author__ = "Marc 'BlackJack' Rintsch"
++__contact__ = 'marc@rintsch.de'
++__license__ = 'LGPL v2.1'
+ 
+ setup(
+     name='PySensors',
+-    version=sensors.__version__,
+-    author=sensors.__author__,
+-    author_email=sensors.__contact__,
++    version=__version__,
++    author=__author__,
++    author_email=__contact__,
+     packages=['sensors'],
+     # scripts=[],
+     url='http://pypi.python.org/pypi/PySensors/',
+     # download_url='',
+-    license=sensors.__license__,
++    license=__license__,
+     description='Python bindings to libsensors (via ctypes)',
+     long_description=open('README.rst').read(),
+     long_description_content_type="text/x-rst",
diff --git a/package/python-pysensors/Config.in b/package/python-pysensors/Config.in
index f8e056506b..952d14c351 100644
--- a/package/python-pysensors/Config.in
+++ b/package/python-pysensors/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYSENSORS
 	bool "python-pysensors"
-	select BR2_PACKAGE_LM_SENSORS
+	select BR2_PACKAGE_LM_SENSORS # runtime
 	help
 	  Python bindings for libsensors.so from the lm-sensors project
 	  via ctypes. Supports API version 4, i.e. libsensors version
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
