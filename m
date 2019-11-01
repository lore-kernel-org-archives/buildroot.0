From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Nov 2019 08:18:32 +0100
Subject: [Buildroot] [git commit] package/python-autobahn: add missing
 dependency on C++
Message-ID: <20191101071421.413068E449@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0e9caf40d7080c91279f2dbd6036c13d8ccd65a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The indirect dependency via python-cryptography was not set in the
Config.in.

Detected with randconfig.

And propagate this to the reverse dependencies.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Peter: also propagate to the reverse dependencies]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-autobahn/Config.in       | 4 ++++
 package/python-channels-redis/Config.in | 5 +++++
 package/python-channels/Config.in       | 5 +++++
 package/python-daphne/Config.in         | 5 +++++
 4 files changed, 19 insertions(+)

diff --git a/package/python-autobahn/Config.in b/package/python-autobahn/Config.in
index e08d5d58a1..ba54d8b12f 100644
--- a/package/python-autobahn/Config.in
+++ b/package/python-autobahn/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_AUTOBAHN
 	bool "python-autobahn"
+	depends on BR2_INSTALL_LIBSTDCPP # python-cryptography -> python-pyasn
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TXAIO # runtime
@@ -8,3 +9,6 @@ config BR2_PACKAGE_PYTHON_AUTOBAHN
 	  framework.
 
 	  https://pypi.python.org/pypi/autobahn
+
+comment "python-autobahn needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-channels-redis/Config.in b/package/python-channels-redis/Config.in
index d2d8a4707a..8946670180 100644
--- a/package/python-channels-redis/Config.in
+++ b/package/python-channels-redis/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_CHANNELS_REDIS
 	bool "python-channels-redis"
+	depends on BR2_INSTALL_LIBSTDCPP # python-channels -> python-daphne
 	depends on BR2_PACKAGE_PYTHON3 # python-channels
 	select BR2_PACKAGE_PYTHON_AIOREDIS # runtime
 	select BR2_PACKAGE_PYTHON_ASGIREF # runtime
@@ -11,3 +12,7 @@ config BR2_PACKAGE_PYTHON_CHANNELS_REDIS
 	  sharded configurations, as well as group support.
 
 	  http://github.com/django/channels_redis/
+
+comment "python-channels-redis needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_PYTHON3
diff --git a/package/python-channels/Config.in b/package/python-channels/Config.in
index 45c9dcc246..5c70f20d1c 100644
--- a/package/python-channels/Config.in
+++ b/package/python-channels/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_CHANNELS
 	bool "python-channels"
+	depends on BR2_INSTALL_LIBSTDCPP # python-daphne -> python-autobahn -> python-cryptography
 	depends on BR2_PACKAGE_PYTHON3 # python-daphne
 	select BR2_PACKAGE_PYTHON_ASGIREF # runtime
 	select BR2_PACKAGE_PYTHON_DAPHNE # runtime
@@ -13,3 +14,7 @@ config BR2_PACKAGE_PYTHON_CHANNELS
 	  own protocols and needs.
 
 	  http://github.com/django/channels
+
+comment "python-channels needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_PYTHON3
diff --git a/package/python-daphne/Config.in b/package/python-daphne/Config.in
index d0510928ea..896bcfe421 100644
--- a/package/python-daphne/Config.in
+++ b/package/python-daphne/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_DAPHNE
 	bool "python-daphne"
+	depends on BR2_INSTALL_LIBSTDCPP # python-autobahn -> python-cryptography
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_ASGIREF # runtime
 	select BR2_PACKAGE_PYTHON_AUTOBAHN # runtime
@@ -12,3 +13,7 @@ config BR2_PACKAGE_PYTHON_DAPHNE
 	  versus HTTP endpoints.
 
 	  https://github.com/django/daphne
+
+comment "python-daphne needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_PYTHON3
