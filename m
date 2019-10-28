From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Oct 2019 10:49:22 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/python-tornado:
 only available for Python 3
Message-ID: <20191028094350.866458B4E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47649b2a1c93201ad7daca1fcde19e4206380279
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Since the bump to 6.0.1, python-tornado has dropped support for Python 2
and now needs Python >= 3.5 (cfr. setup.cfg).

Apparently this is not checked by setuptools, and apparently
byte-compile is not done in the autobuilders, so there's not autobuild
failure.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 69c787de0401eb4056a85f68308c59882a12c71c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/circus/Config.in         |  6 +++---
 package/python-tomako/Config.in  |  1 +
 package/python-tornado/Config.in | 10 +++-------
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/package/circus/Config.in b/package/circus/Config.in
index f1cd93c733..832b04dfa4 100644
--- a/package/circus/Config.in
+++ b/package/circus/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_CIRCUS
 	bool "circus"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3 # python-tornado
 	depends on BR2_INSTALL_LIBSTDCPP # pyzmq -> zeromq
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pyzmq -> zeromq
 	select BR2_PACKAGE_PYTHON_IOWAIT # runtime
@@ -14,6 +14,6 @@ config BR2_PACKAGE_CIRCUS
 
 	  https://circus.readthedocs.org/en/latest/
 
-comment "circus needs Python and a toolchain w/ C++, threads"
+comment "circus needs Python 3 and a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!(BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3)
+		!BR2_PACKAGE_PYTHON3
diff --git a/package/python-tomako/Config.in b/package/python-tomako/Config.in
index bd6d29982a..1521035bb6 100644
--- a/package/python-tomako/Config.in
+++ b/package/python-tomako/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_TOMAKO
 	bool "python-tomako"
+	depends on BR2_PACKAGE_PYTHON3 # python-tornado
 	select BR2_PACKAGE_PYTHON_TORNADO # runtime
 	select BR2_PACKAGE_PYTHON_MAKO # runtime
 	help
diff --git a/package/python-tornado/Config.in b/package/python-tornado/Config.in
index 1afbdc5729..e1bf8343f0 100644
--- a/package/python-tornado/Config.in
+++ b/package/python-tornado/Config.in
@@ -1,12 +1,8 @@
 config BR2_PACKAGE_PYTHON_TORNADO
 	bool "python-tornado"
-	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
-	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3
-	select BR2_PACKAGE_PYTHON_SINGLEDISPATCH if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON_BACKPORTS_ABC	if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON_CERTIFI if BR2_PACKAGE_PYTHON # runtime
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_ZLIB
+	select BR2_PACKAGE_PYTHON3_SSL
 	help
 	  Tornado is a Python web framework and asynchronous networking
 	  library, originally developed at FriendFeed.
