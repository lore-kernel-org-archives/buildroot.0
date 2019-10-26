From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Oct 2019 16:05:24 +0200
Subject: [Buildroot] [PATCH 1/2] package/docker-compose: bump version to
 1.24.1
Message-ID: <20191026140526.19489-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes https://gitlab.com/buildroot.org/buildroot/-/jobs/332656041

The recent bump of a number of python packages broke docker-compose, as
docker-compose specifies both minimum and maximum versions for (most of) its
dependencies:

Dependencies of docker-compse 1.20.1 (! = unmet):
cached-property: < 2 (currently 1.51)
docopt: < 0.7 (currently 0.6.2)
! pyyaml: < 4.0, patched to < 4.3 (currently 5.1.2)
requests: < 2.19, patched to < 3 (currently 2.22.0)
! texttable: < 0.10 (currently 1.6.2)
websocket-client: < 1.0 (currently 0.56.0)
! docker: < 4.0 (currently 4.1.0)
dockerpty: < 0.5 (currently 0.4.1)
six: < 2 (currently 1.12.0)
jsonschema: < 3 (currently 2.5.1)
enum34: < 2 (currently 1.1.6)
backports.ssl-match-hostname: >= 3.5 (currently 3.7.0.1)
ipaddress: >= 1.0.16 (currently 1.0.23)

To fix this, bump docker-compose to the most recent release (1.24.1).  This
is unfortunately not enough, as our docker, pyyaml, requests and texttable
packages are too new, so add 3 patches from upstream to relax the version
checks of dependencies.  Notice that patch 0003 is from
https://github.com/docker/compose/pull/6623 and has not been merged yet.

Discussions around the problem of these maximum versions of the dependencies
and the fact that all downstream users have to patch it is ongoing here:

https://github.com/docker/compose/issues/6756

docker-compose 1.24.1 added a requirement for ssh support in python-docker in:
https://github.com/docker/compose/commit/7b82b2e8c721010b73f664e9d4657746a1fcd92b

So add a dependency for python-paramiko and update the toolchain dependency
for C++ (from python-paramiko -> python-cryptography) and adjust the
toolchain configuration of the runtime test to match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...p-generic-versions-and-bump-requests.patch | 66 +++++++++++++++++++
 ...low-all-recent-2.x-requests-releases.patch | 34 ----------
 ...2-Bump-texttable-from-0.9.1-to-1.6.2.patch | 41 ++++++++++++
 .../0002-Upgrade-pyyaml-to-4.2b1.patch        | 27 --------
 ...003-support-PyYAML-up-to-5.1-version.patch | 43 ++++++++++++
 package/docker-compose/Config.in              |  7 +-
 package/docker-compose/docker-compose.hash    |  7 +-
 package/docker-compose/docker-compose.mk      |  4 +-
 .../tests/package/test_docker_compose.py      |  1 +
 9 files changed, 162 insertions(+), 68 deletions(-)
 create mode 100644 package/docker-compose/0001-Strip-up-generic-versions-and-bump-requests.patch
 delete mode 100644 package/docker-compose/0001-setup.py-allow-all-recent-2.x-requests-releases.patch
 create mode 100644 package/docker-compose/0002-Bump-texttable-from-0.9.1-to-1.6.2.patch
 delete mode 100644 package/docker-compose/0002-Upgrade-pyyaml-to-4.2b1.patch
 create mode 100644 package/docker-compose/0003-support-PyYAML-up-to-5.1-version.patch

diff --git a/package/docker-compose/0001-Strip-up-generic-versions-and-bump-requests.patch b/package/docker-compose/0001-Strip-up-generic-versions-and-bump-requests.patch
new file mode 100644
index 0000000000..536a9590dd
--- /dev/null
+++ b/package/docker-compose/0001-Strip-up-generic-versions-and-bump-requests.patch
@@ -0,0 +1,66 @@
+From 2bb1a267aba3ca5fe414d0f79192def668c18bab Mon Sep 17 00:00:00 2001
+From: Ulysses Souza <ulysses.souza@docker.com>
+Date: Tue, 2 Jul 2019 15:49:07 +0200
+Subject: [PATCH] Strip up generic versions and bump requests
+
+Replaces generic limitations with a next major value
+Bump the minimal `requests` to 2.20.0
+
+Signed-off-by: Ulysses Souza <ulysses.souza@docker.com>
+(cherry picked from commit ce5451c5b4a3b449ce703168d2a568b0a4d25ee6)
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ setup.py | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 8371cc75..61447801 100644
+--- a/setup.py
++++ b/setup.py
+@@ -31,31 +31,31 @@ def find_version(*file_paths):
+ 
+ install_requires = [
+     'cached-property >= 1.2.0, < 2',
+-    'docopt >= 0.6.1, < 0.7',
+-    'PyYAML >= 3.10, < 4.3',
+-    'requests >= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0, < 2.21',
+-    'texttable >= 0.9.0, < 0.10',
+-    'websocket-client >= 0.32.0, < 1.0',
+-    'docker[ssh] >= 3.7.0, < 4.0',
+-    'dockerpty >= 0.4.1, < 0.5',
++    'docopt >= 0.6.1, < 1',
++    'PyYAML >= 3.10, < 5',
++    'requests >= 2.20.0, < 3',
++    'texttable >= 0.9.0, < 1',
++    'websocket-client >= 0.32.0, < 1',
++    'docker[ssh] >= 3.7.0, < 5',
++    'dockerpty >= 0.4.1, < 1',
+     'six >= 1.3.0, < 2',
+     'jsonschema >= 2.5.1, < 3',
+ ]
+ 
+ 
+ tests_require = [
+-    'pytest',
++    'pytest < 6',
+ ]
+ 
+ 
+ if sys.version_info[:2] < (3, 4):
+-    tests_require.append('mock >= 1.0.1')
++    tests_require.append('mock >= 1.0.1, < 2')
+ 
+ extras_require = {
+     ':python_version < "3.4"': ['enum34 >= 1.0.4, < 2'],
+-    ':python_version < "3.5"': ['backports.ssl_match_hostname >= 3.5'],
+-    ':python_version < "3.3"': ['ipaddress >= 1.0.16'],
+-    ':sys_platform == "win32"': ['colorama >= 0.4, < 0.5'],
++    ':python_version < "3.5"': ['backports.ssl_match_hostname >= 3.5, < 4'],
++    ':python_version < "3.3"': ['ipaddress >= 1.0.16, < 2'],
++    ':sys_platform == "win32"': ['colorama >= 0.4, < 1'],
+     'socks': ['PySocks >= 1.5.6, != 1.5.7, < 2'],
+ }
+ 
+-- 
+2.20.1
+
diff --git a/package/docker-compose/0001-setup.py-allow-all-recent-2.x-requests-releases.patch b/package/docker-compose/0001-setup.py-allow-all-recent-2.x-requests-releases.patch
deleted file mode 100644
index 1378c3b81a..0000000000
--- a/package/docker-compose/0001-setup.py-allow-all-recent-2.x-requests-releases.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From a79152d1d621ea9d477ecc6862a03cae80b2425b Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Sat, 15 Dec 2018 14:04:57 +0100
-Subject: [PATCH] setup.py: allow all recent 2.x requests releases
-
-Instead of having to update this for each new requests release.
-
-It it not quite clear why the restriction was added in the first place in
-commit b0480b4d04e (Bump SDK version to latest), but change it to simply
-disallow the upcoming 3.0 release to match what is done for the other
-modules.
-
-Submitted upstream: https://github.com/docker/compose/pull/6415
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 96530726..3c8c7d0e 100644
---- a/setup.py
-+++ b/setup.py
-@@ -33,7 +33,7 @@ install_requires = [
-     'cached-property >= 1.2.0, < 2',
-     'docopt >= 0.6.1, < 0.7',
-     'PyYAML >= 3.10, < 4',
--    'requests >= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0, < 2.19',
-+    'requests >= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0, < 3.0',
-     'texttable >= 0.9.0, < 0.10',
-     'websocket-client >= 0.32.0, < 1.0',
-     'docker >= 3.1.4, < 4.0',
--- 
-2.11.0
-
diff --git a/package/docker-compose/0002-Bump-texttable-from-0.9.1-to-1.6.2.patch b/package/docker-compose/0002-Bump-texttable-from-0.9.1-to-1.6.2.patch
new file mode 100644
index 0000000000..92c2e1f133
--- /dev/null
+++ b/package/docker-compose/0002-Bump-texttable-from-0.9.1-to-1.6.2.patch
@@ -0,0 +1,41 @@
+From e55dd65ba42a17ba4b017b42f14f7ee647efe64f Mon Sep 17 00:00:00 2001
+From: Ulysses Souza <ulysses.souza@docker.com>
+Date: Mon, 8 Jul 2019 14:52:30 +0200
+Subject: [PATCH] Bump texttable from 0.9.1 to 1.6.2
+
+Signed-off-by: Ulysses Souza <ulysses.souza@docker.com>
+(cherry picked from commit 0bfa1c34f054d86674434770d4d6340e02508e52)
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ requirements.txt | 2 +-
+ setup.py         | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/requirements.txt b/requirements.txt
+index 6007ee3f..d868fdeb 100644
+--- a/requirements.txt
++++ b/requirements.txt
+@@ -19,6 +19,6 @@ PySocks==1.6.7
+ PyYAML==4.2b1
+ requests==2.20.0
+ six==1.10.0
+-texttable==0.9.1
++texttable==1.6.2
+ urllib3==1.21.1; python_version == '3.3'
+ websocket-client==0.56.0
+diff --git a/setup.py b/setup.py
+index 61447801..c9e4729d 100644
+--- a/setup.py
++++ b/setup.py
+@@ -34,7 +34,7 @@ install_requires = [
+     'docopt >= 0.6.1, < 1',
+     'PyYAML >= 3.10, < 5',
+     'requests >= 2.20.0, < 3',
+-    'texttable >= 0.9.0, < 1',
++    'texttable >= 0.9.0, < 2',
+     'websocket-client >= 0.32.0, < 1',
+     'docker[ssh] >= 3.7.0, < 5',
+     'dockerpty >= 0.4.1, < 1',
+-- 
+2.20.1
+
diff --git a/package/docker-compose/0002-Upgrade-pyyaml-to-4.2b1.patch b/package/docker-compose/0002-Upgrade-pyyaml-to-4.2b1.patch
deleted file mode 100644
index a3b4bfb853..0000000000
--- a/package/docker-compose/0002-Upgrade-pyyaml-to-4.2b1.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 8419a670aed3364c39b86a0608782aaeae3ce5df Mon Sep 17 00:00:00 2001
-From: Quentin Brunet <hello@quentinbrunet.com>
-Date: Tue, 8 Jan 2019 14:04:54 +0100
-Subject: [PATCH] Upgrade pyyaml to 4.2b1
-
-Signed-off-by: Quentin Brunet <hello@quentinbrunet.com>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- setup.py         | 2 +-
- 1 file changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 4c49bab7..8b5f9d99 100644
---- a/setup.py
-+++ b/setup.py
-@@ -32,7 +32,7 @@ def find_version(*file_paths):
- install_requires = [
-     'cached-property >= 1.2.0, < 2',
-     'docopt >= 0.6.1, < 0.7',
--    'PyYAML >= 3.10, < 4',
-+    'PyYAML >= 3.10, < 4.3',
-     'requests >= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0, < 3.0',
-     'texttable >= 0.9.0, < 0.10',
-     'websocket-client >= 0.32.0, < 1.0',
--- 
-2.11.0
-
diff --git a/package/docker-compose/0003-support-PyYAML-up-to-5.1-version.patch b/package/docker-compose/0003-support-PyYAML-up-to-5.1-version.patch
new file mode 100644
index 0000000000..ae91b01d03
--- /dev/null
+++ b/package/docker-compose/0003-support-PyYAML-up-to-5.1-version.patch
@@ -0,0 +1,43 @@
+From 3be619b814c16c02a02499e7a157dabd065926dd Mon Sep 17 00:00:00 2001
+From: Sergey Fursov <geyser85@gmail.com>
+Date: Sun, 31 Mar 2019 12:45:50 +0700
+Subject: [PATCH] support PyYAML up to 5.1 version
+
+Signed-off-by: Sergey Fursov <geyser85@gmail.com>
+[Upstream: https://github.com/docker/compose/pull/6623]
+(cherry picked from commit d2ca096f46a56cd4db494c593ed84e5c255dc15d)
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ requirements.txt | 2 +-
+ setup.py         | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/requirements.txt b/requirements.txt
+index d868fdeb..e3dbc807 100644
+--- a/requirements.txt
++++ b/requirements.txt
+@@ -16,7 +16,7 @@ paramiko==2.4.2
+ pypiwin32==219; sys_platform == 'win32' and python_version < '3.6'
+ pypiwin32==223; sys_platform == 'win32' and python_version >= '3.6'
+ PySocks==1.6.7
+-PyYAML==4.2b1
++PyYAML==5.1
+ requests==2.20.0
+ six==1.10.0
+ texttable==1.6.2
+diff --git a/setup.py b/setup.py
+index c9e4729d..17ab678e 100644
+--- a/setup.py
++++ b/setup.py
+@@ -32,7 +32,7 @@ def find_version(*file_paths):
+ install_requires = [
+     'cached-property >= 1.2.0, < 2',
+     'docopt >= 0.6.1, < 1',
+-    'PyYAML >= 3.10, < 5',
++    'PyYAML >= 3.10, < 5.2',
+     'requests >= 2.20.0, < 3',
+     'texttable >= 0.9.0, < 2',
+     'websocket-client >= 0.32.0, < 1',
+-- 
+2.20.1
+
diff --git a/package/docker-compose/Config.in b/package/docker-compose/Config.in
index 393b5f1a0d..7f28af72f8 100644
--- a/package/docker-compose/Config.in
+++ b/package/docker-compose/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_DOCKER_COMPOSE
 	depends on BR2_USE_WCHAR # python
 	depends on BR2_TOOLCHAIN_HAS_THREADS # python
 	depends on !BR2_STATIC_LIBS # python
+	depends on BR2_INSTALL_LIBSTDCPP # python-paramiko -> python-cryptography
 	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME \
 	       if BR2_PACKAGE_PYTHON # runtime
@@ -11,6 +12,7 @@ config BR2_PACKAGE_DOCKER_COMPOSE
 	select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON_CACHED_PROPERTY # runtime
 	select BR2_PACKAGE_PYTHON_DOCOPT # runtime
+	select BR2_PACKAGE_PYTHON_PARAMIKO # runtime
 	select BR2_PACKAGE_PYTHON_PYYAML # runtime
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
 	select BR2_PACKAGE_PYTHON_TEXTTABLE # runtime
@@ -24,6 +26,7 @@ config BR2_PACKAGE_DOCKER_COMPOSE
 
 	  https://www.docker.com/
 
-comment "docker-compose needs a toolchain w/ wchar, threads, dynamic library"
+comment "docker-compose needs a toolchain w/ C++, wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS || BR2_INSTALL_LIBSTDCPP
diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
index 5a5e86abe8..aa29a6d6cb 100644
--- a/package/docker-compose/docker-compose.hash
+++ b/package/docker-compose/docker-compose.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/docker-compose/json, sha256 locally computed
-md5	8f9f6d59cc8e65dbfad6fda26b96fde7  docker-compose-1.20.1.tar.gz
-sha256	34c043ebd4c23e4b864812c16b41dad25cec6b675557b180ced52d372e1a9e66  docker-compose-1.20.1.tar.gz
+# from https://pypi.python.org/pypi/docker-compose/json
+sha256	a5d58e974fd717e24b0dda6669a46bc03548d9023ef38d965acdc32d4d5fa753  docker-compose-1.24.1.tar.gz
+
+# locally computed
 sha256	552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/docker-compose/docker-compose.mk b/package/docker-compose/docker-compose.mk
index 52c16dbc79..ec24157c56 100644
--- a/package/docker-compose/docker-compose.mk
+++ b/package/docker-compose/docker-compose.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DOCKER_COMPOSE_VERSION = 1.20.1
-DOCKER_COMPOSE_SITE = https://pypi.python.org/packages/25/4f/4e2b8ff942c9b3d96a81082590617c5c5fa006b066a4181b8d985ea3ac79
+DOCKER_COMPOSE_VERSION = 1.24.1
+DOCKER_COMPOSE_SITE = https://files.pythonhosted.org/packages/b6/a4/59c39df6a23144a6252ad33170dfbf781af5953651e4587e8ea5f995f95e
 DOCKER_COMPOSE_SETUP_TYPE = setuptools
 DOCKER_COMPOSE_LICENSE = Apache-2.0
 DOCKER_COMPOSE_LICENSE_FILES = LICENSE
diff --git a/support/testing/tests/package/test_docker_compose.py b/support/testing/tests/package/test_docker_compose.py
index de53a3da14..f12e2a6a3d 100644
--- a/support/testing/tests/package/test_docker_compose.py
+++ b/support/testing/tests/package/test_docker_compose.py
@@ -10,6 +10,7 @@ class TestDockerCompose(infra.basetest.BRTest):
         BR2_x86_core2=y
         BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
         BR2_KERNEL_HEADERS_4_19=y
+        BR2_TOOLCHAIN_BUILDROOT_CXX=y
         BR2_SYSTEM_DHCP="eth0"
         BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
         BR2_ROOTFS_POST_SCRIPT_ARGS="{}"
-- 
2.20.1
