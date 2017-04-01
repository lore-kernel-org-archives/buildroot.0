From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 18:43:49 +0200
Subject: [Buildroot] [git commit] python-lxml: allow build as host package
Message-ID: <20170401164452.88C8682287@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f147ae0a0f940dfc7ec93af8e70b6625821d91d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While currently there is no in-tree Buildroot package which depends on
host-python-lxml, we (DATACOM) have some proprietary modules that use it
in their test scripts.

We tested python-lxml as host package and confirmed that it builds and
works correctly. Someone else might require it, so we are proposing its
inclusion.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
[Thomas: add Config.in.host entry.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in.host             | 1 +
 package/python-lxml/Config.in.host | 8 ++++++++
 package/python-lxml/python-lxml.mk | 5 +++++
 3 files changed, 14 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index bb91671..38f919a 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -36,6 +36,7 @@ menu "Host utilities"
 	source "package/patchelf/Config.in.host"
 	source "package/pru-software-support/Config.in.host"
 	source "package/pwgen/Config.in.host"
+	source "package/python-lxml/Config.in.host"
 	source "package/qemu/Config.in.host"
 	source "package/raspberrypi-usbboot/Config.in.host"
 	source "package/s6-rc/Config.in.host"
diff --git a/package/python-lxml/Config.in.host b/package/python-lxml/Config.in.host
new file mode 100644
index 0000000..580e440
--- /dev/null
+++ b/package/python-lxml/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_PYTHON_LXML
+	bool "host python-lxml"
+	help
+	  The lxml XML toolkit is a Pythonic binding for the C libraries
+	  libxml2 and libxslt.
+
+	  http://lxml.de/
+
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index bb060d7..40fb773 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -21,11 +21,16 @@ PYTHON_LXML_LICENSE_FILES = \
 PYTHON_LXML_SETUP_TYPE = setuptools
 
 PYTHON_LXML_DEPENDENCIES = libxml2 libxslt zlib
+HOST_PYTHON_LXML_DEPENDENCIES = host-libxml2 host-libxslt host-zlib
 
 # python-lxml needs these scripts in order to properly detect libxml2 and
 # libxslt compiler and linker flags
 PYTHON_LXML_BUILD_OPTS = \
 	--with-xslt-config=$(STAGING_DIR)/usr/bin/xslt-config \
 	--with-xml2-config=$(STAGING_DIR)/usr/bin/xml2-config
+HOST_PYTHON_LXML_BUILD_OPTS = \
+	--with-xslt-config=$(HOST_DIR)/usr/bin/xslt-config \
+	--with-xml2-config=$(HOST_DIR)/usr/bin/xml2-config
 
 $(eval $(python-package))
+$(eval $(host-python-package))
