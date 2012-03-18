From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Mar 2012 21:41:23 +0100
Subject: [Buildroot] [git commit] netsnmp: add option to enable debugging
	code
Message-ID: <20120318215009.CF9B190D89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a0b75003521e695e5ac852e8aba19ca90e30ed1c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/netsnmp/Config.in  |    9 +++++++++
 package/netsnmp/netsnmp.mk |    6 +++++-
 2 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/package/netsnmp/Config.in b/package/netsnmp/Config.in
index 431be2d..108ab83 100644
--- a/package/netsnmp/Config.in
+++ b/package/netsnmp/Config.in
@@ -14,3 +14,12 @@ config BR2_PACKAGE_NETSNMP_ENABLE_MIBS
 	  The net-snmp package contains a selection of MIB files.
 	  Say yes if you want those MIB files installed on the target
 	  and enable the code that parses the MIB files.
+
+config BR2_PACKAGE_NETSNMP_ENABLE_DEBUGGING
+	bool "Enable debugging code"
+	depends on BR2_PACKAGE_NETSNMP
+	help
+	  By default net-snmp is compiled without debugging support
+	  (--disable-debugging). Enable this options if you need debugging
+	  support, including the ability to log with DEBUGMSG(),
+	  DEBUGMSGTL() and companion macros.
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 959e39f..448e3fd 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -12,7 +12,7 @@ NETSNMP_CONF_ENV = ac_cv_NETSNMP_CAN_USE_SYSCTL=yes
 NETSNMP_CONF_OPT = --with-persistent-directory=/var/lib/snmp --disable-static \
 		--with-defaults --enable-mini-agent --without-rpm \
 		--with-logfile=none --without-kmem-usage $(DISABLE_IPV6) \
-		--enable-as-needed --disable-debugging --without-perl-modules \
+		--enable-as-needed --without-perl-modules \
 		--disable-embedded-perl --disable-perl-cc-checks \
 		--disable-scripts --with-default-snmp-version="1" \
 		--enable-silent-libtool --enable-mfd-rewrites \
@@ -55,6 +55,10 @@ define NETSNMP_REMOVE_MIBS_IPV6
 endef
 endif
 
+ifneq ($(BR2_PACKAGE_NETSNMP_ENABLE_DEBUGGING),y)
+	NETSNMP_CONF_OPT += --disable-debugging
+endif
+
 define NETSNMP_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		DESTDIR=$(TARGET_DIR) install
