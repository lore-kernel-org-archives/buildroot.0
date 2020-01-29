From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 29 Jan 2020 22:05:43 +0100
Subject: [Buildroot] [PATCH v2,2/2] package/snort3: new package
In-Reply-To: <20200129210543.244766-1-fontaine.fabrice@gmail.com>
References: <20200129210543.244766-1-fontaine.fabrice@gmail.com>
Message-ID: <20200129210543.244766-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Snort 3 is the next generation Snort IPS (Intrusion
Prevention System).

 - Support multiple packet processing threads
 - Shared configuration and attribute table
 - Use a simple, scriptable configuration
 - Make key components pluggable
 - Autodetect services for portless configuration
 - Support sticky buffers in rules
 - Autogenerate reference documentation
 - Provide better cross platform support

https://www.snort.org/snort3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix duplicate "depends on" error in Config.in

 DEVELOPERS                                    |   1 +
 package/Config.in                             |   1 +
 .../0001-Replace-u_int8_t-by-uint8_t.patch    | 165 ++++++++++++++++++
 ...cip_definitions.h-include-sys-time.h.patch |  29 +++
 package/snort3/Config.in                      |  41 +++++
 package/snort3/snort3.hash                    |   6 +
 package/snort3/snort3.mk                      |  57 ++++++
 7 files changed, 300 insertions(+)
 create mode 100644 package/snort3/0001-Replace-u_int8_t-by-uint8_t.patch
 create mode 100644 package/snort3/0002-cip_definitions.h-include-sys-time.h.patch
 create mode 100644 package/snort3/Config.in
 create mode 100644 package/snort3/snort3.hash
 create mode 100644 package/snort3/snort3.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e9cc2442ce..0a37857d0d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -887,6 +887,7 @@ F:	package/python-jedi/
 F:	package/python-parso/
 F:	package/rygel/
 F:	package/safeclib/
+F:	package/snort3/
 F:	package/suricata/
 F:	package/tinycbor/
 F:	package/tinydtls/
diff --git a/package/Config.in b/package/Config.in
index 31396650cf..91b378f91c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2138,6 +2138,7 @@ endif
 	source "package/sngrep/Config.in"
 	source "package/snmpclitools/Config.in"
 	source "package/snort/Config.in"
+	source "package/snort3/Config.in"
 	source "package/socat/Config.in"
 	source "package/socketcand/Config.in"
 	source "package/softether/Config.in"
diff --git a/package/snort3/0001-Replace-u_int8_t-by-uint8_t.patch b/package/snort3/0001-Replace-u_int8_t-by-uint8_t.patch
new file mode 100644
index 0000000000..f861e55914
--- /dev/null
+++ b/package/snort3/0001-Replace-u_int8_t-by-uint8_t.patch
@@ -0,0 +1,165 @@
+From cd2907c6c75fa43dd4d1016a04221e335e7a9f1f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 24 Jan 2020 22:47:39 +0100
+Subject: [PATCH] Replace u_int8_t by uint8_t
+
+u_int8_t is not supported on musl so replace it by uint8_t
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/snort3/snort3/pull/113]
+---
+ src/host_tracker/host_tracker.cc           |  4 ++--
+ src/host_tracker/host_tracker.h            | 10 +++++-----
+ src/host_tracker/test/host_tracker_test.cc |  6 +++---
+ src/network_inspectors/rna/rna_logger.cc   |  2 +-
+ src/network_inspectors/rna/rna_logger.h    |  6 +++---
+ src/network_inspectors/rna/rna_pnd.cc      |  2 +-
+ src/network_inspectors/rna/rna_pnd.h       |  2 +-
+ 7 files changed, 16 insertions(+), 16 deletions(-)
+
+diff --git a/src/host_tracker/host_tracker.cc b/src/host_tracker/host_tracker.cc
+index ecf9d7843..012408225 100644
+--- a/src/host_tracker/host_tracker.cc
++++ b/src/host_tracker/host_tracker.cc
+@@ -46,7 +46,7 @@ void HostTracker::update_last_event(uint32_t time)
+     last_event = time ? time : last_seen;
+ }
+ 
+-bool HostTracker::add_mac(const u_int8_t* mac, u_int8_t ttl, u_int8_t primary)
++bool HostTracker::add_mac(const uint8_t* mac, uint8_t ttl, uint8_t primary)
+ {
+     if ( !mac or !memcmp(mac, zero_mac, MAC_SIZE) )
+         return false;
+@@ -130,7 +130,7 @@ static inline string to_time_string(uint32_t p_time)
+     return buffer;
+ }
+ 
+-static inline string to_mac_string(const u_int8_t* mac)
++static inline string to_mac_string(const uint8_t* mac)
+ {
+     char mac_addr[18];
+     snprintf(mac_addr, 18, "%02X:%02X:%02X:%02X:%02X:%02X",
+diff --git a/src/host_tracker/host_tracker.h b/src/host_tracker/host_tracker.h
+index 60d6ce309..149283686 100644
+--- a/src/host_tracker/host_tracker.h
++++ b/src/host_tracker/host_tracker.h
+@@ -53,13 +53,13 @@ extern const uint8_t zero_mac[MAC_SIZE];
+ 
+ struct HostMac
+ {
+-    HostMac(u_int8_t p_ttl, const u_int8_t* p_mac, u_int8_t p_primary, uint32_t p_last_seen)
++    HostMac(uint8_t p_ttl, const uint8_t* p_mac, uint8_t p_primary, uint32_t p_last_seen)
+         : ttl(p_ttl), primary(p_primary), last_seen (p_last_seen) { memcpy(mac, p_mac, MAC_SIZE); }
+ 
+     // the type and order below should match logger's serialization
+-    u_int8_t ttl;
+-    u_int8_t mac[MAC_SIZE];
+-    u_int8_t primary;
++    uint8_t ttl;
++    uint8_t mac[MAC_SIZE];
++    uint8_t primary;
+     uint32_t last_seen;
+ };
+ 
+@@ -98,7 +98,7 @@ public:
+     }
+ 
+     // Returns true if a new mac entry is added, false otherwise
+-    bool add_mac(const u_int8_t* mac, u_int8_t ttl, u_int8_t primary);
++    bool add_mac(const uint8_t* mac, uint8_t ttl, uint8_t primary);
+ 
+     // The caller owns and deletes the copied list of mac addresses
+     void copy_data(uint8_t& p_hops, uint32_t& p_last_seen, std::list<HostMac>*& p_macs);
+diff --git a/src/host_tracker/test/host_tracker_test.cc b/src/host_tracker/test/host_tracker_test.cc
+index 9ac2b1fe3..01b05129d 100644
+--- a/src/host_tracker/test/host_tracker_test.cc
++++ b/src/host_tracker/test/host_tracker_test.cc
+@@ -81,7 +81,7 @@ TEST(host_tracker, copy_data_test)
+ {
+     test_time = 1562198400;
+     HostTracker ht;
+-    u_int8_t mac[6] = {254, 237, 222, 173, 190, 239};
++    uint8_t mac[6] = {254, 237, 222, 173, 190, 239};
+     ht.add_mac(mac, 50, 1);
+ 
+     uint8_t p_hops = 0;
+@@ -107,8 +107,8 @@ TEST(host_tracker, stringify)
+     test_time = 1562198400; // this time will be updated and should not be seen in stringify
+     HostTracker ht;
+ 
+-    u_int8_t mac1[6] = {254, 237, 222, 173, 190, 239};
+-    u_int8_t mac2[6] = {202, 254, 192, 255, 238, 0};
++    uint8_t mac1[6] = {254, 237, 222, 173, 190, 239};
++    uint8_t mac2[6] = {202, 254, 192, 255, 238, 0};
+     test_time = 1562198404; // this time should be the time of the first mac address
+     ht.update_last_seen();
+     ht.add_mac(mac1, 9, 0);
+diff --git a/src/network_inspectors/rna/rna_logger.cc b/src/network_inspectors/rna/rna_logger.cc
+index bd1708ddb..fe750c9d6 100644
+--- a/src/network_inspectors/rna/rna_logger.cc
++++ b/src/network_inspectors/rna/rna_logger.cc
+@@ -36,7 +36,7 @@
+ using namespace snort;
+ 
+ bool RnaLogger::log(uint16_t type, uint16_t subtype, const Packet* p, RnaTracker* ht,
+-    const struct in6_addr* src_ip, const u_int8_t* src_mac, uint32_t event_time,
++    const struct in6_addr* src_ip, const uint8_t* src_mac, uint32_t event_time,
+     void* cond_var)
+ {
+     if ( !enabled )
+diff --git a/src/network_inspectors/rna/rna_logger.h b/src/network_inspectors/rna/rna_logger.h
+index 0b72de6af..a8e984e09 100644
+--- a/src/network_inspectors/rna/rna_logger.h
++++ b/src/network_inspectors/rna/rna_logger.h
+@@ -34,11 +34,11 @@ using RnaTracker = std::shared_ptr<snort::HostTracker>;
+ struct RnaLoggerEvent : public Event
+ {
+     RnaLoggerEvent(uint16_t p_type, uint16_t p_subtype, const RnaTracker* p_ht,
+-        const u_int8_t* p_mac) : type(p_type), subtype(p_subtype), ht(p_ht), mac(p_mac) { }
++        const uint8_t* p_mac) : type(p_type), subtype(p_subtype), ht(p_ht), mac(p_mac) { }
+     uint16_t type;
+     uint16_t subtype;
+     const RnaTracker* ht;
+-    const u_int8_t* mac;
++    const uint8_t* mac;
+     const struct in6_addr* ip;
+     void* cond_var = nullptr;
+ };
+@@ -48,7 +48,7 @@ class RnaLogger
+ public:
+     RnaLogger(const bool enable) : enabled(enable) { }
+     bool log(uint16_t type, uint16_t subtype, const snort::Packet* p, RnaTracker* ht,
+-       const struct in6_addr* src_ip, const u_int8_t* src_mac,
++       const struct in6_addr* src_ip, const uint8_t* src_mac,
+        uint32_t event_time = 0, void* cond_var = nullptr);
+ 
+ private:
+diff --git a/src/network_inspectors/rna/rna_pnd.cc b/src/network_inspectors/rna/rna_pnd.cc
+index 1dd6c5ecd..f74ac4c9c 100644
+--- a/src/network_inspectors/rna/rna_pnd.cc
++++ b/src/network_inspectors/rna/rna_pnd.cc
+@@ -141,7 +141,7 @@ void RnaPnd::discover_network_udp(const Packet* p)
+         discover_network(p, ip_api.ttl());
+ }
+ 
+-void RnaPnd::discover_network(const Packet* p, u_int8_t ttl)
++void RnaPnd::discover_network(const Packet* p, uint8_t ttl)
+ {
+     bool new_host = false;
+     const auto& src_ip = p->ptrs.ip_api.get_src();
+diff --git a/src/network_inspectors/rna/rna_pnd.h b/src/network_inspectors/rna/rna_pnd.h
+index 5abe5d6b1..e00bf1520 100644
+--- a/src/network_inspectors/rna/rna_pnd.h
++++ b/src/network_inspectors/rna/rna_pnd.h
+@@ -62,7 +62,7 @@ private:
+     void discover_network_non_ip(const snort::Packet* p);
+     void discover_network_tcp(const snort::Packet* p);
+     void discover_network_udp(const snort::Packet* p);
+-    void discover_network(const snort::Packet* p, u_int8_t ttl);
++    void discover_network(const snort::Packet* p, uint8_t ttl);
+ 
+     RnaLogger logger;
+     DiscoveryFilter filter;
+-- 
+2.24.1
+
diff --git a/package/snort3/0002-cip_definitions.h-include-sys-time.h.patch b/package/snort3/0002-cip_definitions.h-include-sys-time.h.patch
new file mode 100644
index 0000000000..1d146c989b
--- /dev/null
+++ b/package/snort3/0002-cip_definitions.h-include-sys-time.h.patch
@@ -0,0 +1,29 @@
+From cb13e85aebb5848e42580314c9a5953868c7c3ef Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 24 Jan 2020 23:07:41 +0100
+Subject: [PATCH] cip_definitions.h: include <sys/time.h>
+
+Fix build on musl by including <sys/time.h> to be able to use timeval
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/snort3/snort3/pull/114]
+---
+ src/service_inspectors/cip/cip_definitions.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/service_inspectors/cip/cip_definitions.h b/src/service_inspectors/cip/cip_definitions.h
+index b9bba15f9..0cda06ca2 100644
+--- a/src/service_inspectors/cip/cip_definitions.h
++++ b/src/service_inspectors/cip/cip_definitions.h
+@@ -23,6 +23,8 @@
+ #ifndef CIP_DEFINITIONS_H
+ #define CIP_DEFINITIONS_H
+ 
++#include <sys/time.h>
++
+ namespace snort
+ {
+ struct Packet;
+-- 
+2.24.1
+
diff --git a/package/snort3/Config.in b/package/snort3/Config.in
new file mode 100644
index 0000000000..be9420c848
--- /dev/null
+++ b/package/snort3/Config.in
@@ -0,0 +1,41 @@
+config BR2_PACKAGE_SNORT3
+	bool "snort3"
+	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS # luajit
+	depends on !(BR2_PACKAGE_DAQ || BR2_PACKAGE_SNORT)
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS # daq3
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_HAS_THREADS # hwloc
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_DAQ3
+	select BR2_PACKAGE_HWLOC
+	select BR2_PACKAGE_LIBDNET
+	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_LUAJIT
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZLIB
+	help
+	  Snort 3 is the next generation Snort IPS (Intrusion
+	  Prevention System).
+
+	  - Support multiple packet processing threads
+	  - Shared configuration and attribute table
+	  - Use a simple, scriptable configuration
+	  - Make key components pluggable
+	  - Autodetect services for portless configuration
+	  - Support sticky buffers in rules
+	  - Autogenerate reference documentation
+	  - Provide better cross platform support
+
+	  https://www.snort.org/snort3
+
+comment "snort3 needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 4.9"
+	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+	depends on !(BR2_PACKAGE_DAQ || BR2_PACKAGE_SNORT)
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/snort3/snort3.hash b/package/snort3/snort3.hash
new file mode 100644
index 0000000000..e161e24165
--- /dev/null
+++ b/package/snort3/snort3.hash
@@ -0,0 +1,6 @@
+# Locally computed:
+sha256 008bbce6d6901078f32f2e5511b8cf2204d10c7b8c941bd39640a2833f20073c  snort3-3.0.0-267.tar.gz
+
+# Hash for license files:
+sha256 3f1cbfb20bb2c608e1a474421880d08b8cba6abb00ab7736d22c481d71656a6d  COPYING
+sha256 f98260a6d3e5ef4ede8a2a6b698e5ac91d64c09243f7171e1c5b17b920a835c7  LICENSE
diff --git a/package/snort3/snort3.mk b/package/snort3/snort3.mk
new file mode 100644
index 0000000000..17571cf272
--- /dev/null
+++ b/package/snort3/snort3.mk
@@ -0,0 +1,57 @@
+################################################################################
+#
+# snort3
+#
+################################################################################
+
+SNORT3_VERSION = 3.0.0-267
+SNORT3_SITE = $(call github,snort3,snort3,$(SNORT3_VERSION))
+SNORT3_LICENSE = GPL-2.0
+SNORT3_LICENSE_FILES = COPYING LICENSE
+
+SNORT3_DEPENDENCIES = \
+	host-pkgconf daq3 hwloc libdnet libpcap luajit openssl pcre zlib
+
+SNORT3_CONF_OPTS = \
+	-DENABLE_GDB=OFF \
+	-DENABLE_STATIC_DAQ=OFF \
+	-DMAKE_DOC=OFF
+
+ifeq ($(BR2_PACKAGE_FLATBUFFERS),y)
+SNORT3_DEPENDENCIES += flatbuffers
+SNORT3_CONF_OPTS += -DHAVE_FLATBUFFERS=ON
+else
+SNORT3_CONF_OPTS += -DHAVE_FLATBUFFERS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+SNORT3_DEPENDENCIES += libiconv
+SNORT3_CONF_OPTS += -DHAVE_ICONV=ON
+endif
+
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+SNORT3_DEPENDENCIES += libtirpc
+endif
+
+ifeq ($(BR2_PACKAGE_SAFECLIB),y)
+SNORT3_DEPENDENCIES += safeclib
+SNORT3_CONF_OPTS += -DENABLE_SAFEC=ON
+else
+SNORT3_CONF_OPTS += -DENABLE_SAFEC=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+SNORT3_DEPENDENCIES += util-linux
+SNORT3_CONF_OPTS += -DHAVE_UUID=ON
+else
+SNORT3_CONF_OPTS += -DHAVE_UUID=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XZ),y)
+SNORT3_DEPENDENCIES += xz
+SNORT3_CONF_OPTS += -DHAVE_LZMA=ON
+else
+SNORT3_CONF_OPTS += -DHAVE_LZMA=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.24.1
