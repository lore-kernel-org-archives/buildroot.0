From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Mar 2021 18:21:35 +0100
Subject: [Buildroot] [git commit] package/siproxd: new package
Message-ID: <20210314165949.E24E1826AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3efc5a250c1c98598ba4c91a7d71d11343d937ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Siproxd is a masquerading SIP Proxy Server.  We had a buildroot package
for that in the fli4l Linux router distribution for years with different
authors contributing.

Co-authored-by: Christoph Schulz <fli4l@kristov.de>
Co-authored-by: Claas Hilbrecht <babel@fli4l.de>
Signed-off-by: Alexander Dahl <post@lespocky.de>
[yann.morin.1998 at free.fr: unconditionally use an external libtool]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/siproxd/Config.in    | 17 +++++++++++++++++
 package/siproxd/siproxd.hash | 11 +++++++++++
 package/siproxd/siproxd.mk   | 17 +++++++++++++++++
 5 files changed, 47 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1358971782..6eef9f988d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -70,6 +70,7 @@ F:	package/odhcp6c/
 N:	Alexander Dahl <post@lespocky.de>
 F:	package/fastd/
 F:	package/libuecc/
+F:	package/siproxd/
 F:	package/putty/
 
 N:	Alexander Egorenkov <egorenar-dev@posteo.net>
diff --git a/package/Config.in b/package/Config.in
index 1a7d54d12f..9a2596e729 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1829,6 +1829,7 @@ menu "Networking"
 	source "package/resiprocate/Config.in"
 	source "package/restclient-cpp/Config.in"
 	source "package/rtmpdump/Config.in"
+	source "package/siproxd/Config.in"
 	source "package/slirp/Config.in"
 	source "package/snmppp/Config.in"
 	source "package/sofia-sip/Config.in"
diff --git a/package/siproxd/Config.in b/package/siproxd/Config.in
new file mode 100644
index 0000000000..0a471553e4
--- /dev/null
+++ b/package/siproxd/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_SIPROXD
+	bool "siproxd"
+	select BR2_PACKAGE_LIBOSIP2
+	select BR2_PACKAGE_LIBTOOL
+	select BR2_PACKAGE_SQLITE
+	help
+	  Siproxd is a proxy/masquerading daemon for SIP (Session
+	  Initiation Protocol), which is used in IP telephony. It
+	  handles registrations of SIP clients on a private IP network
+	  and performs rewriting of the SIP message bodies to make SIP
+	  connections work via a masquerading firewall (NAT). It allows
+	  SIP software clients (like kphone, linphone) or SIP hardware
+	  clients (Voice over IP phones which are SIP-compatible, such
+	  as those from Cisco, Grandstream or Snom) to work behind an IP
+	  masquerading firewall or NAT router.
+
+	  http://siproxd.sourceforge.net/
diff --git a/package/siproxd/siproxd.hash b/package/siproxd/siproxd.hash
new file mode 100644
index 0000000000..be6815725a
--- /dev/null
+++ b/package/siproxd/siproxd.hash
@@ -0,0 +1,11 @@
+# Locally calculated after checking pgp signature from:
+# https://downloads.sourceforge.net/project/siproxd/siproxd/0.8.3/siproxd-0.8.3.tar.gz.asc
+sha256  9a6d7a6bb6fff162775b1e1fb7018de9c69642cbf8626185dc6ffceeeba07736  siproxd-0.8.3.tar.gz
+
+# https://sourceforge.net/projects/siproxd/files/siproxd/0.8.3/
+sha1  d13d4a05b8a16dbe20d04b99b535610e49050d9d  siproxd-0.8.3.tar.gz
+md5  9a9d2c89e5f0c59fdde9444a66d8372c  siproxd-0.8.3.tar.gz
+
+# Hash for license files:
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
+sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  libltdl/COPYING.LIB
diff --git a/package/siproxd/siproxd.mk b/package/siproxd/siproxd.mk
new file mode 100644
index 0000000000..228f0855a6
--- /dev/null
+++ b/package/siproxd/siproxd.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# siproxd
+#
+################################################################################
+
+SIPROXD_VERSION = 0.8.3
+SIPROXD_SITE = https://downloads.sourceforge.net/project/siproxd/siproxd/$(SIPROXD_VERSION)
+
+SIPROXD_LICENSE = GPL-2.0+
+SIPROXD_LICENSE_FILES = COPYING
+
+SIPROXD_DEPENDENCIES = libosip2 libtool sqlite
+
+SIPROXD_CONF_OPTS = --without-included-ltdl
+
+$(eval $(autotools-package))
