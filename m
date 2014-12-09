From: kiwi <gregd72002@gmail.com>
Date: Tue,  9 Dec 2014 20:58:59 +0000
Subject: [Buildroot] [PATCH 1/7] Adding janus-gateway and dependencies
Message-ID: <1418158739-863-1-git-send-email-gregd72002@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds ding-libs

To be included:
ding-libs
gengetopt
libnice
libsrtp
libwebsock
sofia-sip
janus-gateway

Signed-off-by: kiwi <gregd72002@gmail.com>
---
 package/Config.in                                  |  7 ++++++
 package/Config.in.host                             |  1 +
 package/ding-libs/Config.in                        | 14 +++++++++++
 package/ding-libs/ding-libs.mk                     | 16 +++++++++++++
 package/gengetopt/Config.in                        |  7 ++++++
 package/gengetopt/Config.in.host                   |  7 ++++++
 package/gengetopt/gengetopt.mk                     | 16 +++++++++++++
 package/janus-gateway/Config.in                    | 14 +++++++++++
 .../janus-gateway-0001-disable-ssp.patch           | 12 ++++++++++
 package/janus-gateway/janus-gateway.mk             | 27 ++++++++++++++++++++++
 package/libnice/Config.in                          |  8 +++++++
 .../libnice/libnice-0001-build-IPV6_RECVERR.patch  | 20 ++++++++++++++++
 package/libnice/libnice.mk                         | 13 +++++++++++
 package/libsrtp/Config.in                          |  6 +++++
 package/libsrtp/libsrtp.mk                         | 12 ++++++++++
 package/libwebsock/Config.in                       |  7 ++++++
 package/libwebsock/libwebsock.mk                   | 22 ++++++++++++++++++
 package/sofia-sip/Config.in                        |  6 +++++
 package/sofia-sip/sofia-sip.mk                     | 18 +++++++++++++++
 19 files changed, 233 insertions(+)
 create mode 100644 package/ding-libs/Config.in
 create mode 100644 package/ding-libs/ding-libs.mk
 create mode 100644 package/gengetopt/Config.in
 create mode 100644 package/gengetopt/Config.in.host
 create mode 100644 package/gengetopt/gengetopt.mk
 create mode 100644 package/janus-gateway/Config.in
 create mode 100644 package/janus-gateway/janus-gateway-0001-disable-ssp.patch
 create mode 100644 package/janus-gateway/janus-gateway.mk
 create mode 100644 package/libnice/Config.in
 create mode 100644 package/libnice/libnice-0001-build-IPV6_RECVERR.patch
 create mode 100644 package/libnice/libnice.mk
 create mode 100644 package/libsrtp/Config.in
 create mode 100644 package/libsrtp/libsrtp.mk
 create mode 100644 package/libwebsock/Config.in
 create mode 100644 package/libwebsock/libwebsock.mk
 create mode 100644 package/sofia-sip/Config.in
 create mode 100644 package/sofia-sip/sofia-sip.mk

diff --git a/package/Config.in b/package/Config.in
index dd3a46e..f3af26c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -115,6 +115,7 @@ endif
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/gawk/Config.in"
 endif
+	source "package/gengetopt/Config.in"
 	source "package/gettext/Config.in"
 	source "package/git/Config.in"
 	source "package/gperf/Config.in"
@@ -821,6 +822,7 @@ menu "Networking"
 	source "package/libmnl/Config.in"
 	source "package/libmodbus/Config.in"
 	source "package/libndp/Config.in"
+	source "package/libnice/Config.in"
 	source "package/libnetfilter_acct/Config.in"
 	source "package/libnetfilter_conntrack/Config.in"
 	source "package/libnetfilter_cthelper/Config.in"
@@ -839,6 +841,7 @@ menu "Networking"
 	source "package/libshairplay/Config.in"
 	source "package/libshout/Config.in"
 	source "package/libsoup/Config.in"
+	source "package/libsrtp/Config.in"
 	source "package/libstrophe/Config.in"
 	source "package/libtirpc/Config.in"
 	source "package/libtorrent/Config.in"
@@ -846,6 +849,7 @@ menu "Networking"
 	source "package/libupnpp/Config.in"
 	source "package/liburiparser/Config.in"
 	source "package/libvncserver/Config.in"
+	source "package/libwebsock/Config.in"
 	source "package/libwebsockets/Config.in"
 	source "package/neon/Config.in"
 	source "package/nss-mdns/Config.in"
@@ -856,6 +860,7 @@ menu "Networking"
 	source "package/rtmpdump/Config.in"
 	source "package/slirp/Config.in"
 	source "package/snmppp/Config.in"
+	source "package/sofia-sip/Config.in"
 	source "package/thrift/Config.in"
 	source "package/usbredir/Config.in"
 	source "package/wvstreams/Config.in"
@@ -874,6 +879,7 @@ menu "Other"
 	source "package/clapack/Config.in"
 	source "package/classpath/Config.in"
 	source "package/cppcms/Config.in"
+	source "package/ding-libs/Config.in"
 	source "package/eigen/Config.in"
 	source "package/elfutils/Config.in"
 	source "package/fftw/Config.in"
@@ -1047,6 +1053,7 @@ endif
 	source "package/iptraf-ng/Config.in"
 	source "package/iputils/Config.in"
 	source "package/iw/Config.in"
+	source "package/janus-gateway/Config.in"
 	source "package/kismet/Config.in"
 	source "package/knock/Config.in"
 	source "package/leafnode2/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index 0b7bc36..dd89bd3 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -8,6 +8,7 @@ menu "Host utilities"
 	source "package/e2tools/Config.in.host"
 	source "package/genext2fs/Config.in.host"
 	source "package/genimage/Config.in.host"
+	source "package/gengetopt/Config.in.host"
 	source "package/genpart/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/mke2img/Config.in.host"
diff --git a/package/ding-libs/Config.in b/package/ding-libs/Config.in
new file mode 100644
index 0000000..4840c51
--- /dev/null
+++ b/package/ding-libs/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_DING_LIBS
+	bool "ding-libs"
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	help
+	  DING-LIBS (DING Is Not Glib) are a set of small, useful libraries that SSSD uses and makes available to other projects. They provide:
+	    dhash - A dynamic hash table
+	    ini_config - A library for parsing and managing INI files
+	    path_utils - Manage UNIX paths and subsets of paths
+	    collection - A generic, hierarchical grouping mechanism for complex data sets
+	    ref_array - A dynamically-growing, reference-counted array
+	    libbasicobjects - A set of fundamental object types for C
+
+	  https://git.fedorahosted.org/git/ding-libs.git
diff --git a/package/ding-libs/ding-libs.mk b/package/ding-libs/ding-libs.mk
new file mode 100644
index 0000000..c49a9b7
--- /dev/null
+++ b/package/ding-libs/ding-libs.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# ding-libs
+#
+#############################################################
+DING_LIBS_VERSION = 0_4_0
+DING_LIBS_SOURCE = ding_libs-$(DING_LIBS_VERSION).tar.xz
+DING_LIBS_SITE = https://git.fedorahosted.org/cgit/ding-libs.git/snapshot 
+DING_LIBS_DEPENDENCIES = $(if !$(BR2_ENABLE_LOCALE),libiconv) $(if $(BR2_NEEDS_GETTEXT),gettext) 
+DING_LIBS_AUTORECONF = YES
+DING_LIBS_INSTALL_STAGING = YES
+DING_LIBS_LICENSE = GPLv3
+DING_LIBS_LICENSE_FILES = COPYING
+DING_LIBS_MAKE=$(MAKE1)
+
+$(eval $(autotools-package))
diff --git a/package/gengetopt/Config.in b/package/gengetopt/Config.in
new file mode 100644
index 0000000..6236029
--- /dev/null
+++ b/package/gengetopt/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_GENGETOPT
+	bool "gengetopt"
+	help
+	  Adds GNU Gengetopt
+	  Gengetopt is a tool to write command line option parsing code for C programs. 
+	  
+	  http://www.gnu.org/software/gengetopt/gengetopt.html
diff --git a/package/gengetopt/Config.in.host b/package/gengetopt/Config.in.host
new file mode 100644
index 0000000..f0de678
--- /dev/null
+++ b/package/gengetopt/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_GENGETOPT
+	bool "host gengetopt"
+	help
+	  Adds GNU Gengetopt
+	  Gengetopt is a tool to write command line option parsing code for C programs. 
+	
+	  http://www.gnu.org/software/gengetopt/gengetopt.html
diff --git a/package/gengetopt/gengetopt.mk b/package/gengetopt/gengetopt.mk
new file mode 100644
index 0000000..692dfe1
--- /dev/null
+++ b/package/gengetopt/gengetopt.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# gengetopt
+#
+#############################################################
+GENGETOPT_VERSION = 2.22.6
+GENGETOPT_SITE = ftp://ftp.gnu.org/gnu/gengetopt/
+GENGETOPT_AUTORECONF = YES
+GENGETOPT_LICENSE = GPLv3 
+GENGETOPT_LICENSE_FILES = COPYING
+
+GENGETOPT_MAKE=$(MAKE1)
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
+
diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
new file mode 100644
index 0000000..fef35f6
--- /dev/null
+++ b/package/janus-gateway/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_JANUS_GATEWAY
+	bool "janus-gateway"
+	select BR2_PACKAGE_LIBMICROHTTPD
+	select BR2_PACKAGE_JANSSON
+	select BR2_PACKAGE_LIBNICE
+	select BR2_PACKAGE_SOFIA_SIP
+	select BR2_PACKAGE_LIBSRTP
+	select BR2_PACKAGE_DING_LIBS
+	select BR2_PACKAGE_LIBWEBSOCK
+	select BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Adds janus-gateway, an open source, general purpose, WebRTC gateway 
+	  
+	  https://github.com/meetecho/janus-gateway
diff --git a/package/janus-gateway/janus-gateway-0001-disable-ssp.patch b/package/janus-gateway/janus-gateway-0001-disable-ssp.patch
new file mode 100644
index 0000000..5de8b3b
--- /dev/null
+++ b/package/janus-gateway/janus-gateway-0001-disable-ssp.patch
@@ -0,0 +1,12 @@
+diff -rupN janus-gateway-master.orig/Makefile.am janus-gateway-master/Makefile.am
+--- janus-gateway-master.orig/Makefile.am	2014-11-27 14:36:31.000000000 +0000
++++ janus-gateway-master/Makefile.am	2014-12-01 16:39:50.551935028 +0000
+@@ -14,7 +14,7 @@ AM_CFLAGS += -Wredundant-decls  # sophia
+ # some fairly big refactoring though, which can wait.
+ # AM_CFLAGS += -Wshadow -Wstrict-aliasing=2
+ 
+-AM_CFLAGS += -fstack-protector-all -g -ggdb -fPIC -rdynamic
++AM_CFLAGS += -g -ggdb -fPIC -rdynamic
+ 
+ # FIXME: make docs work with distcheck
+ DISTCHECK_CONFIGURE_FLAGS = --disable-docs --enable-post-processing
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
new file mode 100644
index 0000000..277a38c
--- /dev/null
+++ b/package/janus-gateway/janus-gateway.mk
@@ -0,0 +1,27 @@
+#############################################################
+#
+# janus-gateway
+#
+#############################################################
+JANUS_GATEWAY_VERSION = c632c1e9da5ffd8c34df6086a1aa5a8511a2a02d
+JANUS_GATEWAY_SITE_METHOD = git
+JANUS_GATEWAY_SITE = https://github.com/meetecho/janus-gateway.git
+JANUS_GATEWAY_LICENSE = GPLv3
+JANUS_GATEWAY_LICENSE_FILES = COPYING
+
+JANUS_GATEWAY_DEPENDENCIES = host-pkgconf libmicrohttpd jansson libnice sofia-sip libsrtp ding-libs libwebsock host-gengetopt
+
+# Straight out of the repository, no ./configure
+JANUS_GATEWAY_AUTORECONF = YES
+ 
+define JANUS_GATEWAY_M4
+        mkdir -p $(@D)/m4
+endef
+JANUS_GATEWAY_POST_PATCH_HOOKS += JANUS_GATEWAY_M4
+
+JANUS_GATEWAY_CONF_OPTS = --disable-data-channels \
+				--disable-rabbitmq 
+
+JANUS_GATEWAY_MAKE=$(MAKE1)
+
+$(eval $(autotools-package))
diff --git a/package/libnice/Config.in b/package/libnice/Config.in
new file mode 100644
index 0000000..240e3e7
--- /dev/null
+++ b/package/libnice/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBNICE
+	bool "libnice"
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  Adds libnice - The GLib ICE implementation
+	  Libnice is an implementation of the IETF's Interactive Connectivity Establishment (ICE) standard (RFC 5245) and the Session Traversal Utilities for NAT (STUN) standard (RFC 5389).
+	  
+	  http://nice.freedesktop.org/wiki/
diff --git a/package/libnice/libnice-0001-build-IPV6_RECVERR.patch b/package/libnice/libnice-0001-build-IPV6_RECVERR.patch
new file mode 100644
index 0000000..39ef617
--- /dev/null
+++ b/package/libnice/libnice-0001-build-IPV6_RECVERR.patch
@@ -0,0 +1,20 @@
+diff -rupN libnice-0.1.8.orig/stun/usages/bind.c libnice-0.1.8/stun/usages/bind.c
+--- libnice-0.1.8.orig/stun/usages/bind.c	2014-09-22 18:01:28.000000000 +0100
++++ libnice-0.1.8/stun/usages/bind.c	2014-12-01 13:28:32.144707407 +0000
+@@ -257,12 +257,16 @@ static int stun_socket (int family, int
+     int yes = 1;
+     switch (family)
+     {
++#ifdef IP_RECVERR
+       case AF_INET:
+         setsockopt (fd, SOL_IP, IP_RECVERR, &yes, sizeof (yes));
++#endif
+         break;
++#ifdef IPV6_RECVERR
+       case AF_INET6:
+         setsockopt (fd, SOL_IPV6, IPV6_RECVERR, &yes, sizeof (yes));
+         break;
++#endif
+       default:
+         /* Nothing to do. */
+         break;
diff --git a/package/libnice/libnice.mk b/package/libnice/libnice.mk
new file mode 100644
index 0000000..f3339bb
--- /dev/null
+++ b/package/libnice/libnice.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# libnice 
+#
+#############################################################
+LIBNICE_VERSION = 0.1.8
+LIBNICE_SITE = http://nice.freedesktop.org/releases/
+LIBNICE_DEPENDENCIES = libglib2
+LIBNICE_INSTALL_STAGING = YES
+LIBNICE_LICENSE = LGPLv2.1+
+LIBNICE_LICENSE_FILE = COPYING.MPL COPYING.LGPL
+
+$(eval $(autotools-package))
diff --git a/package/libsrtp/Config.in b/package/libsrtp/Config.in
new file mode 100644
index 0000000..073f811
--- /dev/null
+++ b/package/libsrtp/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBSRTP
+	bool "libsrtp"
+	help
+	  Adds libsrtp - Secure RTP (SRTP) Reference Implementation
+
+	  https://github.com/cisco/libsrtp
diff --git a/package/libsrtp/libsrtp.mk b/package/libsrtp/libsrtp.mk
new file mode 100644
index 0000000..2af6a02
--- /dev/null
+++ b/package/libsrtp/libsrtp.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# libsrtp
+#
+#############################################################
+LIBSRTP_VERSION = v1.5.0
+LIBSRTP_SITE_METHOD = git
+LIBSRTP_INSTALL_STAGING = YES
+LIBSRTP_LICENSE = BSD-3c 
+LIBSRTP_LICENSE_FILE = LICENSE
+
+$(eval $(autotools-package))
diff --git a/package/libwebsock/Config.in b/package/libwebsock/Config.in
new file mode 100644
index 0000000..7b4b2dc
--- /dev/null
+++ b/package/libwebsock/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBWEBSOCK
+	bool "libwebsock"
+	select BR2_PACKAGE_LIBEVENT
+	help
+	  Adds libwebsock - C library for easy WebSockets servers
+
+	  https://github.com/payden/libwebsock
diff --git a/package/libwebsock/libwebsock.mk b/package/libwebsock/libwebsock.mk
new file mode 100644
index 0000000..e562630
--- /dev/null
+++ b/package/libwebsock/libwebsock.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# libwebsock
+#
+#############################################################
+LIBWEBSOCK_VERSION = 3c1615eeadb0b582b63851073bfe3e5132f31ebc 
+LIBWEBSOCK_SITE_METHOD = git
+
+LIBWEBSOCK_SITE = https://github.com/payden/libwebsock.git
+LIBWEBSOCK_DEPENDENCIES = libevent
+# straight out of git - not ./configure
+LIBWEBSOCK_AUTORECONF = YES
+LIBWEBSOCK_INSTALL_STAGING = YES
+LIBWEBSOCK_LICENSE = LGPLv3
+LIBWEBSOCK_LICENSE_FILES = COPYING
+
+LIBWEBSOCK_LIBS += -lpthread -levent
+
+LIBWEBSOCK_CONF_ENV += \
+        LIBS="$(LIBWEBSOCK_LIBS)"
+
+$(eval $(autotools-package))
diff --git a/package/sofia-sip/Config.in b/package/sofia-sip/Config.in
new file mode 100644
index 0000000..3d85ffc
--- /dev/null
+++ b/package/sofia-sip/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_SOFIA_SIP
+	bool "sofia-sip"
+	help
+	  Adds Sofia-SIP - an open-source SIP User-Agent library, compliant with the IETF RFC3261 specification
+
+	  http://sofia-sip.sourceforge.net
diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
new file mode 100644
index 0000000..5258844
--- /dev/null
+++ b/package/sofia-sip/sofia-sip.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# sofiasip
+#
+#############################################################
+SOFIA_SIP_VERSION = 1.12.11
+SOFIA_SIP_SITE = http://downloads.sourceforge.net/project/sofia-sip/sofia-sip/$(SOFIA_SIP_VERSION) 
+SOFIA_SIP_INSTALL_STAGING = YES
+SOFIA_SIP_LICENSE = LGPLv2.1+ 
+SOFIA_SIP_LICENSE_FILE = COPYING COPYRIGHTS
+
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_INET_IPV6),y)
+	SOFIA_SIP_CONF_OPTS = --enable-ip6
+else
+	SOFIA_SIP_CONF_OPTS = --disable-ip6
+endif
+
+$(eval $(autotools-package))
-- 
1.9.1
