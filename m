From: Chris Packham <judge.packham@gmail.com>
Date: Thu, 30 Jul 2009 15:10:53 +1200
Subject: [Buildroot] [PATCH/RFC] add tcpreplay tool
In-Reply-To: <4A71B59E0200006800015A5C@gwia.alliedtelesyn.co.nz>
References: <4A71B59E0200006800015A5C@gwia.alliedtelesyn.co.nz>
Message-ID: <a038bef50907292010o634882f2p268bceac900afc6f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot,

Is there any interest in incorporating tcpreplay as a package?

The tcpreplay tool can be used to generate packets out a specified interface
based on a pcap file from tcpdump or wireshark or anyother tool that generates
a "standard" pcap file.

The tcpreplay suite also ships with other tools (tcprewrite, tcpreplay-edit)
for manipulating pcap files.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
?package/Config.in ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?| ? ?1 +
?package/tcpreplay/Config.in ? ? ? ? ? ? ? ? ? ? ? ?| ? ?9 ++
?.../tcpreplay-3.4.3-010-cross-compile.patch ? ? ? ?| ? 92 ++++++++++++++++++++
?package/tcpreplay/tcpreplay.mk ? ? ? ? ? ? ? ? ? ? | ? 73 ++++++++++++++++
?4 files changed, 175 insertions(+), 0 deletions(-)
?create mode 100644 package/tcpreplay/Config.in
?create mode 100644 package/tcpreplay/tcpreplay-3.4.3-010-cross-compile.patch
?create mode 100644 package/tcpreplay/tcpreplay.mk

diff --git a/package/Config.in b/package/Config.in
index bd15b62..a97feaf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -206,6 +206,7 @@ source "package/socat/Config.in"
?source "package/spawn-fcgi/Config.in"
?source "package/stunnel/Config.in"
?source "package/tcpdump/Config.in"
+source "package/tcpreplay/Config.in"
?source "package/tftpd/Config.in"
?if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
?source "package/thttpd/Config.in"
diff --git a/package/tcpreplay/Config.in b/package/tcpreplay/Config.in
new file mode 100644
index 0000000..3cfbd91
--- /dev/null
+++ b/package/tcpreplay/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_TCPREPLAY
+ ? ? ? bool "tcpreplay"
+ ? ? ? default n
+ ? ? ? ?select BR2_PACKAGE_LIBPCAP
+ ? ? ? help
+ ? ? ? ? A tool for generating traffic.
+
+ ? ? ? ? http://tcpreplay.synfin.net/trac/
+
diff --git a/package/tcpreplay/tcpreplay-3.4.3-010-cross-compile.patch
b/package/tcpreplay/tcpreplay-3.4.3-010-cross-compile.patch
new file mode 100644
index 0000000..bbae66f
--- /dev/null
+++ b/package/tcpreplay/tcpreplay-3.4.3-010-cross-compile.patch
@@ -0,0 +1,92 @@
+--- tcpreplay-3.4.3/configure.ac ? ? ? 2009-06-26 06:45:55.000000000 +1200
++++ tcpreplay-3.4.3-new/configure.ac ? 2009-07-30 11:59:35.000000000 +1200
+@@ -420,6 +420,11 @@
+ ? ? exit(1);
+ ]]), [
+ ? ? libpcap_version_096=yes
++], [
++ ? ?libpcap_version_096=no
++], [
++ ? ?AC_MSG_WARN([Tests not run when cross compiling])
++ ? ?libpcap_version_096=no
+ ])
+
+ libpcap_ver8=no
+@@ -447,6 +452,9 @@
+ ? ? libpcap_ver8=yes
+ ], [
+ ? ? libpcap_ver8=no
++], [
++ ? ?AC_MSG_WARN([Tests not run when cross compiling])
++ ? ?libpcap_ver8=no
+ ])
+
+ libpcap_ver7=no
+@@ -472,25 +480,31 @@
+ ? ? libpcap_ver7=yes
+ ], [
+ ? ? libpcap_ver7=no
++], [
++ ? ?AC_MSG_WARN([Tests not run when cross compiling])
++ ? ?libpcap_ver7=no
+ ])
+
+-if test x$libpcap_ver8 = xyes ; then
+- ? ?AC_MSG_RESULT(>= 0.8.0)
+-elif test x$libpcap_ver7 = xyes ; then
+- ? ?AC_MSG_RESULT(>= 0.7.2)
+-else
+- ? ?AC_MSG_ERROR([Libpcap versions < 0.7.2 are not supported
+- ? ?Please upgrade to version 0.7.2 or better])
+-fi
+-
+-libpcap_version=unknown
+-if test x$libpcap_version_096 = xyes ; then
+- ? ?libpcap_version=">= 0.9.6"
+-elif test x$libpcap_ver8 = xyes ; then
+- ? ?libpcap_version=">= 0.8.0"
+-elif test x$libcap_ver7 = xyes ; then
+- ? ?libpcap_version=">= 0.7.0"
+-fi
++AC_CACHE_CHECK([for supported libpcap verision], [tr_cv_libpcap_version],
++[
++ ? ?if test x$libpcap_ver8 = xyes ; then
++ ? ? ? ?AC_MSG_RESULT(>= 0.8.0)
++ ? ?elif test x$libpcap_ver7 = xyes ; then
++ ? ? ? ?AC_MSG_RESULT(>= 0.7.2)
++ ? ?else
++ ? ? ? ?AC_MSG_ERROR([Libpcap versions < 0.7.2 are not supported
++ ? ? ? ?Please upgrade to version 0.7.2 or better])
++ ? ?fi
++
++ ? ?tr_cv_libpcap_version=unknown
++ ? ?if test x$tr_cv_libpcap_version_096 = xyes ; then
++ ? ? ? ?tr_cv_libpcap_version=">= 0.9.6"
++ ? ?elif test x$libpcap_ver8 = xyes ; then
++ ? ? ? ?tr_cv_libpcap_version=">= 0.8.0"
++ ? ?elif test x$libcap_ver7 = xyes ; then
++ ? ? ? ?tr_cv_libpcap_version=">= 0.7.0"
++ ? ?fi
++] )
+
+ dnl Check for pcap_setnonblock()
+ AC_MSG_CHECKING(for pcap_setnonblock)
+@@ -770,6 +784,9 @@
+ ? ? have_bpf=yes
+ ],[
+ ? ? AC_MSG_RESULT(no)
++],[
++ ? ?AC_MSG_WARN([Tests not run when cross compiling])
++ ? ?AC_MSG_RESULT(no)
+ ])
+
+
+@@ -1189,7 +1206,7 @@
+ ##########################################################################
+ ? ? ? ? ? ? ?TCPREPLAY Suite Configuration Results (${TCPREPLAY_VERSION})
+ ##########################################################################
+-libpcap: ? ? ? ? ? ? ? ? ? ?${foundpcap} (${libpcap_version})
++libpcap: ? ? ? ? ? ? ? ? ? ?${foundpcap} (${tr_cv_libpcap_version})
+ libdnet: ? ? ? ? ? ? ? ? ? ?${founddnet} (${libdnet_version})
+ autogen: ? ? ? ? ? ? ? ? ? ?${AUTOGEN} (${AUTOGEN_VERSION})
+ Use libopts tearoff: ? ? ? ?${enable_local_libopts}
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
new file mode 100644
index 0000000..e26c649
--- /dev/null
+++ b/package/tcpreplay/tcpreplay.mk
@@ -0,0 +1,73 @@
+#############################################################
+#
+# tcpreplay
+#
+#############################################################
+
+TCPREPLAY_VER:=3.4.3
+TCPREPLAY_DIR:=$(BUILD_DIR)/tcpreplay-$(TCPREPLAY_VER)
+TCPREPLAY_SITE:=http://prdownloads.sourceforge.net/tcpreplay/
+TCPREPLAY_SOURCE:=tcpreplay-$(TCPREPLAY_VER).tar.gz
+TCPREPLAY_CAT:=$(ZCAT)
+
+ifeq ($(TCPREPLAY_TARGET_DIR),)
+TCPREPLAY_TARGET_DIR:=$(TARGET_DIR)
+endif
+
+$(DL_DIR)/$(TCPREPLAY_SOURCE):
+ ? ? ? ?$(call DOWNLOAD,$(TCPREPLAY_SITE),$(TCPREPLAY_SOURCE))
+
+tcpreplay-source: $(DL_DIR)/$(TCPREPLAY_SOURCE)
+
+$(TCPREPLAY_DIR)/.unpacked: $(DL_DIR)/$(TCPREPLAY_SOURCE)
+ ? ? ? $(TCPREPLAY_CAT) $(DL_DIR)/$(TCPREPLAY_SOURCE) | tar -C
$(BUILD_DIR) $(TAR_OPTIONS) -
+ ? ? ? toolchain/patch-kernel.sh $(TCPREPLAY_DIR) package/tcpreplay/
tcpreplay-$(TCPREPLAY_VER)\*.patch
+ ? ? ? touch $(TCPREPLAY_DIR)/.unpacked
+
+$(TCPREPLAY_DIR)/.configured: $(TCPREPLAY_DIR)/.unpacked
+ ? ? ? ( cd $(TCPREPLAY_DIR) ; rm -f config.cache; \
+ ? ? ? ? ? ? ? autoconf; \
+ ? ? ? ? ? ? ? ac_cv_linux_vers=$(BR2_DEFAULT_KERNEL_HEADERS) \
+ ? ? ? ? ? ? ? tr_cv_libpcap_version=">= 0.7.0" \
+ ? ? ? ? ? ? ? BUILD_CC=$(TARGET_CC) HOSTCC="$(HOSTCC)" \
+ ? ? ? ? ? ? ? $(TARGET_CONFIGURE_OPTS) \
+ ? ? ? ? ? ? ? $(TARGET_CONFIGURE_ARGS) \
+ ? ? ? ? ? ? ? ./configure \
+ ? ? ? ? ? ? ? --target=$(GNU_TARGET_NAME) \
+ ? ? ? ? ? ? ? --host=$(GNU_TARGET_NAME) \
+ ? ? ? ? ? ? ? --build=$(GNU_HOST_NAME) \
+ ? ? ? ? ? ? ? --program-prefix="" \
+ ? ? ? ? ? ? ? --prefix=$(TCPREPLAY_TARGET_DIR)/usr \
+ ? ? ? ? ? ? ? --mandir=$(TCPREPLAY_TARGET_DIR)/usr/share/man \
+ ? ? ? ? ? ? ? --infodir=$(TCPREPLAY_TARGET_DIR)/usr/share/info \
+ ? ? ? ? ? ? ? --with-libpcap=$(STAGING_DIR) \
+ ? ? ? )
+ ? ? ? touch $(TCPREPLAY_DIR)/.configured
+
+$(TCPREPLAY_DIR)/src/tcpreplay: $(TCPREPLAY_DIR)/.configured
+ ? ? ? $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+ ? ? ? ? ? ? ? -C $(TCPREPLAY_DIR)
+
+$(TCPREPLAY_TARGET_DIR)/usr/bin/tcpreplay: $(TCPREPLAY_DIR)/src/tcpreplay
+ ? ? ? #mkdir -p $(TCPREPLAY_TARGET_DIR)/sbin
+ ? ? ? #cp -af $< $@
+ ? ? ? $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+ ? ? ? ? ? ? ? -C $(TCPREPLAY_DIR) install
+
+tcpreplay: uclibc libpcap $(TCPREPLAY_TARGET_DIR)/usr/bin/tcpreplay
+
+tcpreplay-clean:
+ ? ? ? -$(MAKE) -C $(TCPREPLAY_DIR) uninstall
+ ? ? ? -$(MAKE) -C $(TCPREPLAY_DIR) clean
+
+tcpreplay-dirclean:
+ ? ? ? -$(MAKE) -C $(TCPREPLAY_DIR) uninstall
+ ? ? ? rm -rf $(TCPREPLAY_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_TCPREPLAY)),y)
+TARGETS+=tcpreplay
+endif
--
1.6.3
