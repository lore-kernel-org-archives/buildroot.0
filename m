Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AACCC00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 20:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF1094091F;
	Mon,  8 Aug 2022 20:27:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF1094091F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IymVUV6ShAMh; Mon,  8 Aug 2022 20:27:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DBC540909;
	Mon,  8 Aug 2022 20:27:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DBC540909
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C6D1B1BF365
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1D59607F2
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:27:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1D59607F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zdt2VlAXgClA for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 20:27:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B9F0607B4
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 20:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B9F0607B4
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 378A787013; Mon,  8 Aug 2022 20:13:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Aug 2022 22:27:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6826595759d1978633008479d305abb8a894d442
X-Git-Newrev: bfafb08c62a214fc24f6f33ce4c0b18ad6f67dfd
X-Patchwork-Hint: ignore
Message-Id: <20220808201330.378A787013@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-crossbar: adjust
 dependencies based on requirements-min.txt
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

commit: https://git.buildroot.net/buildroot/commit/?id=bfafb08c62a214fc24f6f33ce4c0b18ad6f67dfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit makes sure that the python-crossbar package pulls in the
right dependencies, based on the requirements-min.txt.

It does so by:

 - Changing the 0002-Remove-idna-requirement patch by a more thorough
   patch that drops all indirect dependencies from
   requirements-min.txt, making it easier to have a 1:1 mapping
   between lines in requirements-min.txt and Buildroot selects.

 - Changing the
   0003-crossbar-webservice-wap-use-markupsafe-instead-of-we patch to
   update requirements-min.txt to indicate the new MarkupSafe
   dependency. Here again, to have a 1:1 mapping between lines in
   requirements-min.txt and Buildroot selects.

 - Updating the Buildroot selects to match requirements-min.txt, with
   relevant comments when it does not.

 - Fixing up the Crossbar test case to no longer force autobahn to use
   umsgpack. Instead, we now use the default of msgpack that is
   expected by autobahn.

Fixes bug #14556, https://bugs.busybox.net/show_bug.cgi?id=14556.

Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-Remove-idna-requirement.patch             | 29 ---------
 ...ements-min.txt-drop-indirect-dependencies.patch | 74 ++++++++++++++++++++++
 ...bservice-wap-use-markupsafe-instead-of-we.patch | 19 +++++-
 package/python-crossbar/Config.in                  | 39 +++++++++---
 .../tests/package/sample_python_crossbar.py        |  1 -
 5 files changed, 119 insertions(+), 43 deletions(-)

diff --git a/package/python-crossbar/0002-Remove-idna-requirement.patch b/package/python-crossbar/0002-Remove-idna-requirement.patch
deleted file mode 100644
index 5e19a467c2..0000000000
--- a/package/python-crossbar/0002-Remove-idna-requirement.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 9164d21cc66c1f78de37c9383528c5d528cbdbeb Mon Sep 17 00:00:00 2001
-From: Asaf Kahlon <asafka7@gmail.com>
-Date: Wed, 26 Sep 2018 15:33:43 +0300
-Subject: [PATCH] Remove idna requirement.
-
-The latest version of idna is 2.7, but it seems like idna is not a direct
-dependency anymore (a short "git grep" shows it's only written in requirement
-and readme files).
-
-Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
----
- requirements-min.txt | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/requirements-min.txt b/requirements-min.txt
-index 92fb0f8f..13cdac87 100644
---- a/requirements-min.txt
-+++ b/requirements-min.txt
-@@ -8,7 +8,6 @@ click>=6.7
- constantly>=15.1.0
- cryptography>=2.6.1
- h2>=3.2.0
--idna<2.6,>=2.5
- importlib-resources>=4.1.1
- incremental>=17.5.0
- jinja2>=2.10.1
--- 
-2.17.1
-
diff --git a/package/python-crossbar/0002-requirements-min.txt-drop-indirect-dependencies.patch b/package/python-crossbar/0002-requirements-min.txt-drop-indirect-dependencies.patch
new file mode 100644
index 0000000000..12027d779c
--- /dev/null
+++ b/package/python-crossbar/0002-requirements-min.txt-drop-indirect-dependencies.patch
@@ -0,0 +1,74 @@
+From 3ae2b36e48fc0f75f0bb6c89f893ece033bccd87 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 7 Aug 2022 18:44:29 +0200
+Subject: [PATCH] requirements-min.txt: drop indirect dependencies
+
+For some interesting reason, the crossbar maintainers have decided to
+include indirect dependencies in their requirements-min.txt, i.e
+dependencies that they don't use directly, but that packages they
+depend on themselves depend on.
+
+This makes the packaging in Buildroot confusing, as it means not all
+dependencies in requirements-min.txt should be taken into
+account. Also some of these indirect dependencies cause issues due to
+upper bounds set on the version (which is the case for idna and
+urllib3).
+
+This patch therefore clarifies the situation by removing such indirect
+dependencies from requirements-min.txt. As the patch is obviously not
+upstreamable, it will require some maintenance effort, but that effort
+is anyway already there to sort out direct dependencies from indirect
+dependencies when updating the Buildroot packaging for crossbar.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ requirements-min.txt | 12 ------------
+ 1 file changed, 12 deletions(-)
+
+diff --git a/requirements-min.txt b/requirements-min.txt
+index 5ac4e0ee..cdd82d27 100644
+--- a/requirements-min.txt
++++ b/requirements-min.txt
+@@ -1,20 +1,13 @@
+-attrs>=17.2.0
+ autobahn[asyncio,twisted,encryption,compress,serialization,scram]>=21.3.1
+ bitstring>=3.1.5
+-bcrypt>=3.1.6
+ cbor>=1.0.0
+ click>=6.7
+ colorama>=0.4.4
+-constantly>=15.1.0
+ cryptography>=2.6.1
+-h2>=3.2.0
+-idna<2.6,>=2.5
+ importlib-resources>=4.1.1
+-incremental>=17.5.0
+ jinja2>=2.10.1
+ lmdb>=0.92
+ mistune>=0.7.4
+-netaddr>=0.7.19
+ passlib>=1.7.1
+ priority>=1.3.0
+ psutil>=5.2.2
+@@ -28,7 +21,6 @@ pyqrcode>=1.2.1
+ pytrie>=0.3
+ pyyaml>=4.2b4
+ sdnotify>=0.3.1
+-service_identity>=17.0.0
+ setproctitle>=1.1.10
+ setuptools>=36.2.7
+ treq>=20.4.1
+@@ -37,10 +29,6 @@ twisted[tls,conch,http2,osx_platform]>=20.3.0; sys_platform == 'darwin'
+ twisted[tls,conch,http2,windows_platform]>=20.3.0; sys_platform == 'win32'
+ txaio>=21.2.1
+ txtorcon>=20.0.0
+-u-msgpack-python>=2.4.1
+-# urllib3 is an indirect dependency, but we force a recent version because of https://nvd.nist.gov/vuln/detail/CVE-2019-11324
+-# workaround for version conflict in requests vs sth else:
+-urllib3<1.25,>=1.21.1
+ vmprof>=0.4.12; platform_machine=='x86_64' or platform_machine=='i386' or platform_machine=='arm'
+ watchdog>=0.8.3
+ werkzeug>=0.14.1
+-- 
+2.37.1
+
diff --git a/package/python-crossbar/0003-crossbar-webservice-wap-use-markupsafe-instead-of-we.patch b/package/python-crossbar/0003-crossbar-webservice-wap-use-markupsafe-instead-of-we.patch
index 65ffc508ab..ab2d4709bd 100644
--- a/package/python-crossbar/0003-crossbar-webservice-wap-use-markupsafe-instead-of-we.patch
+++ b/package/python-crossbar/0003-crossbar-webservice-wap-use-markupsafe-instead-of-we.patch
@@ -1,4 +1,4 @@
-From ac5fc826e33492bb0c4283a954389d7fd355fa61 Mon Sep 17 00:00:00 2001
+From a6866509b0387ab6d6f99f68cd82bcac922fe839 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Mon, 30 May 2022 19:38:11 +0200
 Subject: [PATCH] crossbar/webservice/wap: use markupsafe instead of werkzeug
@@ -15,7 +15,8 @@ Replace with escape from markupsafe like upstream commit [2]
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
 ---
  crossbar/webservice/wap.py | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
+ requirements-min.txt       | 1 +
+ 2 files changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/crossbar/webservice/wap.py b/crossbar/webservice/wap.py
 index 825558b1..6daa9b21 100644
@@ -35,6 +36,18 @@ index 825558b1..6daa9b21 100644
  
  from jinja2 import Environment, FileSystemLoader
  from jinja2.sandbox import SandboxedEnvironment
+diff --git a/requirements-min.txt b/requirements-min.txt
+index cdd82d27..50cb1489 100644
+--- a/requirements-min.txt
++++ b/requirements-min.txt
+@@ -7,6 +7,7 @@ cryptography>=2.6.1
+ importlib-resources>=4.1.1
+ jinja2>=2.10.1
+ lmdb>=0.92
++MarkupSafe>=1.1.1
+ mistune>=0.7.4
+ passlib>=1.7.1
+ priority>=1.3.0
 -- 
-2.35.3
+2.37.1
 
diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
index 60b60b1740..fb06f7672a 100644
--- a/package/python-crossbar/Config.in
+++ b/package/python-crossbar/Config.in
@@ -1,23 +1,35 @@
 config BR2_PACKAGE_PYTHON_CROSSBAR
 	bool "python-crossbar"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
-	# All the following dependencies are runtime dependencies
-	select BR2_PACKAGE_PYTHON_ATTRS
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-numpy
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	# All the following dependencies are runtime dependencies. It
+	# matches almost 1:1 the requirements-min.txt from crossbar
+	# with the following exceptions:
+	# - importlib-resources is in Python itself, so no external
+	#   module is needed
+	# - vmprof, while listed as a needed dependency, isn't
+	#   actually strictly necesary
+	# - wsaccel is not a direct dependency, it is there to make
+	#   sure autobahn has the 'accelerate' feature, when the
+	#   Python implementation is CPython, and our package does
+	#   enable autobahn[accelerate]
 	select BR2_PACKAGE_PYTHON_AUTOBAHN
+	select BR2_PACKAGE_PYTHON_AUTOBAHN_ACCELERATE
+	select BR2_PACKAGE_PYTHON_AUTOBAHN_COMPRESS
+	select BR2_PACKAGE_PYTHON_AUTOBAHN_ENCRYPTION
+	select BR2_PACKAGE_PYTHON_AUTOBAHN_SCRAM
+	select BR2_PACKAGE_PYTHON_AUTOBAHN_SERIALIZATION
+	select BR2_PACKAGE_PYTHON_AUTOBAHN_TWISTED
 	select BR2_PACKAGE_PYTHON_BITSTRING
 	select BR2_PACKAGE_PYTHON_CBOR
-	select BR2_PACKAGE_PYTHON_CBOR2
 	select BR2_PACKAGE_PYTHON_CLICK
-	select BR2_PACKAGE_PYTHON_CONSTANTLY
+	select BR2_PACKAGE_PYTHON_COLORAMA
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
-	select BR2_PACKAGE_PYTHON_H2
-	select BR2_PACKAGE_PYTHON_IDNA
-	select BR2_PACKAGE_PYTHON_INCREMENTAL
 	select BR2_PACKAGE_PYTHON_JINJA2
 	select BR2_PACKAGE_PYTHON_LMDB
 	select BR2_PACKAGE_PYTHON_MARKUPSAFE
 	select BR2_PACKAGE_PYTHON_MISTUNE
-	select BR2_PACKAGE_PYTHON_NETADDR
 	select BR2_PACKAGE_PYTHON_PASSLIB
 	select BR2_PACKAGE_PYTHON_PRIORITY
 	select BR2_PACKAGE_PYTHON_PSUTIL
@@ -30,17 +42,19 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 	select BR2_PACKAGE_PYTHON_PYTRIE
 	select BR2_PACKAGE_PYTHON_PYYAML
 	select BR2_PACKAGE_PYTHON_SDNOTIFY
-	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
 	select BR2_PACKAGE_PYTHON_SETPROCTITLE
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS
 	select BR2_PACKAGE_PYTHON_TREQ
 	select BR2_PACKAGE_PYTHON_TWISTED
+	select BR2_PACKAGE_PYTHON_TWISTED_CONCH
+	select BR2_PACKAGE_PYTHON_TWISTED_HTTP2
+	select BR2_PACKAGE_PYTHON_TWISTED_TLS
 	select BR2_PACKAGE_PYTHON_TXAIO
 	select BR2_PACKAGE_PYTHON_TXTORCON
-	select BR2_PACKAGE_PYTHON_U_MSGPACK
 	select BR2_PACKAGE_PYTHON_UBJSON
 	select BR2_PACKAGE_PYTHON_WATCHDOG
 	select BR2_PACKAGE_PYTHON_WERKZEUG
+	select BR2_PACKAGE_PYTHON_ZLMDB
 	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE
 	help
 	  Crossbar.io is an open-source WAMP application router that
@@ -48,3 +62,8 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 	  components that can talk in real-time with each other.
 
 	  https://pypi.python.org/pypi/crossbar
+
+comment "python-crossbar needs glibc or musl"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
diff --git a/support/testing/tests/package/sample_python_crossbar.py b/support/testing/tests/package/sample_python_crossbar.py
index 374cccd837..8160a37219 100644
--- a/support/testing/tests/package/sample_python_crossbar.py
+++ b/support/testing/tests/package/sample_python_crossbar.py
@@ -1,5 +1,4 @@
 import os
 import crossbar
 
-os.environ["AUTOBAHN_USE_UMSGPACK"] = "1"
 crossbar.run(["version"])
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
