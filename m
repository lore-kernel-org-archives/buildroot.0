From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 May 2020 14:04:51 +0200
Subject: [Buildroot] [git commit] package/pistache: new package
Message-ID: <20200501115132.79FB490C55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=65d891efc2fb069f9cf707f47302776f7076b80c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The upstream project http://pistache.io/ does not provide release
tarballs. However, commit 73f248acd6db4c53 has been successfully
used for some time now.

The use of BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 is for C++14 support.
Tested it with gcc-linaro-4.9-2016.02-x86_64_arm-linux-gnueabi
and buildroot's ./utils/test-pkg

Pistache does not build with uClibc, the macro RUSAGE_THREAD for
getrusage() is not properly declared. This is an upstream issue:
https://github.com/oktal/pistache/issues/175
Hence the dependecy !BR2_TOOLCHAIN_USES_UCLIBC

Signed-off-by: Thomas Ruschival <thomas@ruschival.de>
[yann.morin.1998 at free.fr:
  - fix PISTACHE_LICENSE_FILES (missing trailing 'S')
  - add hash for license file
  - two spaces in license file
  - tweaks in commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in              |  1 +
 package/pistache/Config.in     | 20 ++++++++++++++++++++
 package/pistache/pistache.hash |  3 +++
 package/pistache/pistache.mk   | 21 +++++++++++++++++++++
 4 files changed, 45 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 53c8ce0e29..c12676d859 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1754,6 +1754,7 @@ menu "Networking"
 	source "package/ortp/Config.in"
 	source "package/paho-mqtt-c/Config.in"
 	source "package/paho-mqtt-cpp/Config.in"
+	source "package/pistache/Config.in"
 	source "package/qdecoder/Config.in"
 	source "package/qpid-proton/Config.in"
 	source "package/rabbitmq-c/Config.in"
diff --git a/package/pistache/Config.in b/package/pistache/Config.in
new file mode 100644
index 0000000000..64d6340827
--- /dev/null
+++ b/package/pistache/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_PISTACHE
+	bool "pistache"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	help
+	  Pistache is a modern and elegant HTTP and REST framework
+	  for C++. It is entirely written in pure C++14 and provides
+	  a clear and pleasant API.
+
+	  https://github.com/oktal/pistache
+
+comment "pistache needs a glibc toolchain w/ C++, gcc >= 4.9, threads, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+	BR2_TOOLCHAIN_USES_UCLIBC || \
+	!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+	!BR2_TOOLCHAIN_HAS_THREADS || \
+	!BR2_USE_WCHAR
diff --git a/package/pistache/pistache.hash b/package/pistache/pistache.hash
new file mode 100644
index 0000000000..63597b4149
--- /dev/null
+++ b/package/pistache/pistache.hash
@@ -0,0 +1,3 @@
+#locally computed
+sha256  bcc7640eb4ae4b178e504f18ebf29dd0a6f8189710cdc0fa4703fa27728145e4  pistache-73f248acd6db4c53e6604577b7e13fd5e756f96f.tar.gz
+sha256  c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08  LICENSE
diff --git a/package/pistache/pistache.mk b/package/pistache/pistache.mk
new file mode 100644
index 0000000000..c182754cee
--- /dev/null
+++ b/package/pistache/pistache.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# pistache
+#
+################################################################################
+
+PISTACHE_VERSION = 73f248acd6db4c53e6604577b7e13fd5e756f96f
+PISTACHE_SITE = $(call github,oktal,pistache,$(PISTACHE_VERSION))
+PISTACHE_LICENSE = Apache-2.0
+PISTACHE_LICENSE_FILES = LICENSE
+
+PISTACHE_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+PISTACHE_DEPENDENCIES += openssl
+PISTACHE_CONF_OPTS += -DPISTACHE_USE_SSL=ON
+else
+PISTACHE_CONF_OPTS += -DPISTACHE_USE_SSL=OFF
+endif
+
+$(eval $(cmake-package))
