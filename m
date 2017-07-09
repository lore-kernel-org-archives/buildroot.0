From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Jul 2017 18:13:39 +0200
Subject: [Buildroot] [git commit] pcre2: new package
Message-ID: <20170709162524.5C35C820E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49dfb3306f4985907672a3734957b2198c068b15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Naoki Matsumoto <n-matsumoto@melcoinc.co.jp>
Signed-off-by: Brent Sink <brents_3@hotmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas:
 - reassign authorship to Naoki Matsumoto
 - add entry to DEVELOPERS file
 - fix broken patch
 - add comment about where the PGP signature was coming from]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS               |  3 +++
 package/Config.in        |  1 +
 package/pcre2/Config.in  | 22 ++++++++++++++++++++++
 package/pcre2/pcre2.hash |  2 ++
 package/pcre2/pcre2.mk   | 20 ++++++++++++++++++++
 5 files changed, 48 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c997500..1ec405a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1239,6 +1239,9 @@ N:	Murat Demirten <mdemirten@yh.com.tr>
 F:	package/jpeg-turbo/
 F:	package/libgeotiff/
 
+N:	Naoki Matsumoto <n-matsumoto@melcoinc.co.jp>
+F:	package/pcre2/
+
 N:	Nathan Lynch <ntl@pobox.com>
 F:	package/chrony/
 
diff --git a/package/Config.in b/package/Config.in
index e675bca..db943df 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1494,6 +1494,7 @@ menu "Text and terminal handling"
 	source "package/ncurses/Config.in"
 	source "package/newt/Config.in"
 	source "package/pcre/Config.in"
+	source "package/pcre2/Config.in"
 	source "package/popt/Config.in"
 	source "package/readline/Config.in"
 	source "package/slang/Config.in"
diff --git a/package/pcre2/Config.in b/package/pcre2/Config.in
new file mode 100644
index 0000000..b49d306
--- /dev/null
+++ b/package/pcre2/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_PCRE2
+	bool "pcre2"
+	help
+	  Perl Compatible Regular Expressions. By default, only the
+	  8-bits libpcre2 is built. To get the 16-bits and/or 32-bits
+	  variants libpcre2-16/libpcre2-32, use the package sub-options.
+
+	  http://www.pcre.org/
+
+if BR2_PACKAGE_PCRE2
+
+config BR2_PACKAGE_PCRE2_16
+	bool "16-bit pcre2"
+	help
+	  This option builds the 16-bits pcre2 library, i.e 'libpcre2-16'
+
+config BR2_PACKAGE_PCRE2_32
+	bool "32-bit pcre2"
+	help
+	  This option builds the 32-bits pcre2 library, i.e 'libpcre2-32'
+
+endif
diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
new file mode 100644
index 0000000..97a5d5e
--- /dev/null
+++ b/package/pcre2/pcre2.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature at https://ftp.pcre.org/pub/pcre/pcre2-10.23.tar.bz2.sig
+sha256	dfc79b918771f02d33968bd34a749ad7487fa1014aeb787fad29dd392b78c56e	pcre2-10.23.tar.bz2
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
new file mode 100644
index 0000000..5b7a163
--- /dev/null
+++ b/package/pcre2/pcre2.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# pcre2
+#
+################################################################################
+
+PCRE2_VERSION = 10.23
+PCRE2_SITE = https://ftp.pcre.org/pub/pcre
+PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
+PCRE2_LICENSE = BSD-3-Clause
+PCRE2_LICENSE_FILES = LICENCE
+PCRE2_INSTALL_STAGING = YES
+PCRE2_CONFIG_SCRIPTS = pcre2-config
+
+PCRE2_CONF_OPTS += --enable-pcre2-8
+PCRE2_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE2_16),--enable-pcre2-16,--disable-pcre2-16)
+PCRE2_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE2_32),--enable-pcre2-32,--disable-pcre2-32)
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
