From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  7 May 2017 15:32:46 +0200
Subject: [Buildroot] [PATCH v2] package/protobuf: needs gcc >= 4.5
Message-ID: <20170507133246.23481-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even with an upstream patch from protobuf v3.3 [1], the build fail with another issue:

In file included from google/protobuf/dynamic_message.cc:80:
./google/protobuf/map_field.h: In member function 'void google::protobuf::internal::MapField<Key, T, key_wire_type, value_wire_type, default_enum_value>::Swap(google::protobuf::internal::MapFieldLite<Key, T, kKeyFieldType, kValueFieldType, default_enum_value>*)':
./google/protobuf/map_field.h:139: error: object missing in reference to 'google::protobuf::internal::MapFieldBase::repeated_field_'
./google/protobuf/map_field_inl.h:342: error: from this location
./google/protobuf/map_field.h:150: error: object missing in reference to 'google::protobuf::internal::MapFieldBase::state_'
./google/protobuf/map_field_inl.h:344: error: from this location

Add a dependency on gcc >= 4.5.

[1] https://github.com/google/protobuf/commit/a83ac8663fb8042a881bc60b12a8bd3a0c03a3ff

Fixes:
http://autobuild.buildroot.org/results/77d/77dbb6bbbc0ea9e9bcdd22b10011ef9728c20d54
http://autobuild.buildroot.org/results/21f/21f5e1ea4f37e1d174604d6da78c0e916c89f1e3
http://autobuild.buildroot.org/results/24e/24e880086c87d40b5d79a90d805acc75b33d484c

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Mario J. Rugiero <mrugiero@gmail.com>
---
v2: fix missing reverse dependencies (collectd and riemann-c-client) (ThomasP)
---
 package/collectd/Config.in         | 10 ++++++----
 package/mosh/Config.in             |  7 +++++--
 package/ola/Config.in              |  7 +++++--
 package/protobuf-c/Config.in       |  6 ++++--
 package/protobuf/Config.in         |  7 +++++--
 package/python-protobuf/Config.in  |  1 +
 package/riemann-c-client/Config.in |  6 ++++--
 7 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 47bfe95..d270494 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -548,9 +548,10 @@ comment "rrdtool support needs a toolchain w/ wchar"
 
 config BR2_PACKAGE_COLLECTD_RIEMANN
 	bool "riemann"
-	depends on BR2_INSTALL_LIBSTDCPP # protobuf
-	# protobuf-c -> host-protobuf
+	# riemann-c-client -> protobuf-c
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_HOST_GCC_AT_LEAST_4_5
 	select BR2_PACKAGE_RIEMANN_C_CLIENT
 	select BR2_PACKAGE_LIBTOOL
 	help
@@ -577,14 +578,15 @@ config BR2_PACKAGE_COLLECTD_WRITEPROMETHEUS
 	bool "write_prometheus"
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf-c
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # protobuf-c
+	depends on BR2_HOST_GCC_AT_LEAST_4_5 # protobuf-c
 	select BR2_PACKAGE_LIBMICROHTTPD
 	select BR2_PACKAGE_PROTOBUF_C
 	help
 	  Publishes values using an embedded HTTP server, in a format
 	  compatible with Prometheus' collectd_exporter.
 
-comment "write_prometheus needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "write_prometheus needs a toolchain w/ C++, host gcc >= 4.5"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_HOST_GCC_AT_LEAST_4_5
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 
 config BR2_PACKAGE_COLLECTD_WRITESENSU
diff --git a/package/mosh/Config.in b/package/mosh/Config.in
index d1fbd63..e0ff2cf 100644
--- a/package/mosh/Config.in
+++ b/package/mosh/Config.in
@@ -1,6 +1,7 @@
-comment "mosh needs a toolchain w/ C++, threads, dynamic library, wchar"
+comment "mosh needs a toolchain w/ C++, threads, dynamic library, wchar, host and target gcc >= 4.5"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
-		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
+		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
+		|| !BR2_HOST_GCC_AT_LEAST_4_5 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
 config BR2_PACKAGE_MOSH
@@ -8,6 +9,8 @@ config BR2_PACKAGE_MOSH
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf
+	depends on BR2_HOST_GCC_AT_LEAST_4_5 # protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 # protobuf
 	depends on !BR2_STATIC_LIBS # protobuf
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_PROTOBUF
diff --git a/package/ola/Config.in b/package/ola/Config.in
index 656e825..45e8f8f 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -1,6 +1,7 @@
-comment "ola needs a toolchain w/ C++, threads, dynamic library"
+comment "ola needs a toolchain w/ C++, threads, dynamic library, host and target gcc >= 4.5"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS
+		|| BR2_STATIC_LIBS || !BR2_HOST_GCC_AT_LEAST_4_5 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
 	depends on BROKEN
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
@@ -16,6 +17,8 @@ menuconfig BR2_PACKAGE_OLA
 	depends on !BR2_STATIC_LIBS # protobuf
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_HOST_GCC_AT_LEAST_4_5 # protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 # protobuf
 	help
 	  Open Lighting Architecture provides applications
 	  with a mechanism to send and receive DMX512 & RDM
diff --git a/package/protobuf-c/Config.in b/package/protobuf-c/Config.in
index a32e6cd..6f916c5 100644
--- a/package/protobuf-c/Config.in
+++ b/package/protobuf-c/Config.in
@@ -4,12 +4,14 @@ config BR2_PACKAGE_PROTOBUF_C
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# host-protobuf only builds on certain architectures
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_HOST_GCC_AT_LEAST_4_5 # host-protobuf
 	help
 	  Code generator and runtime libraries to use Protocol Buffers
 	  from pure C (not C++).
 
 	  https://github.com/protobuf-c/protobuf-c
 
-comment "protobuf-c needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "protobuf-c needs a toolchain w/ C++, threads, host gcc >= 4.5"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_HOST_GCC_AT_LEAST_4_5
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index 03d118c..8287035 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -30,6 +30,8 @@ config BR2_PACKAGE_PROTOBUF
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_HOST_GCC_AT_LEAST_4_5
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
 	depends on !BR2_STATIC_LIBS
 	help
 	  Protocol buffers are Google's language-neutral, platform-neutral,
@@ -37,7 +39,8 @@ config BR2_PACKAGE_PROTOBUF
 
 	  https://developers.google.com/protocol-buffers
 
-comment "protobuf needs a toolchain w/ C++, threads, dynamic library"
+comment "protobuf needs a toolchain w/ C++, threads, dynamic library, host and target gcc >= 4.5"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS
+		|| BR2_STATIC_LIBS || !BR2_HOST_GCC_AT_LEAST_4_5 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
diff --git a/package/python-protobuf/Config.in b/package/python-protobuf/Config.in
index 3cfddd3..68523e9 100644
--- a/package/python-protobuf/Config.in
+++ b/package/python-protobuf/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON_PROTOBUF
 	depends on BR2_PACKAGE_PYTHON
 	# host-protobuf only builds on certain architectures
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_HOST_GCC_AT_LEAST_4_5 # host-protobuf
 	help
 	  Python implementation of the Google Protocol Buffers.
 
diff --git a/package/riemann-c-client/Config.in b/package/riemann-c-client/Config.in
index e9982b2..91b13b7 100644
--- a/package/riemann-c-client/Config.in
+++ b/package/riemann-c-client/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_RIEMANN_C_CLIENT
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf-c
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf-c
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # protobuf-c
+	depends on BR2_HOST_GCC_AT_LEAST_4_5 # protobuf-c
 	select BR2_PACKAGE_PROTOBUF_C
 	help
 	  Riemann-c-client is a C client library for the Riemann
@@ -12,6 +13,7 @@ config BR2_PACKAGE_RIEMANN_C_CLIENT
 
 	  https://github.com/algernon/riemann-c-client
 
-comment "riemann-c-client needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "riemann-c-client needs a toolchain w/ C++, threads, host gcc >= 4.5"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_HOST_GCC_AT_LEAST_4_5
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-- 
2.9.3
