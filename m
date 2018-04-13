From: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Date: Fri, 13 Apr 2018 15:00:00 +0200
Subject: [Buildroot] [PATCH 1/1] cowpatty: new package
Message-ID: <1523624400-3162-1-git-send-email-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CowPatty is a C based tool to identify weak WPA passphrases
contained in a pcap file.

Use the github.com/gwbres/cowpatty fork at the moment because Makefile in the mainstream is faulty.
(-lssl flag is missing and some recipes had to be reordered).
I will have the buildroot configuration eventually point to the original mainstrean as soon as
Makefile is corrected.

The package is easy to build, it requires the -lssl -lpcap and -lcrypto flags.
Build tests passed for the 7 default toolchains with a simple
config snippet made of "BR2_PACKAGE_COWPATTY=y". But please
double check the proposed dependencies & package selections.
I set the package to select libpcap & libopenssl at the moment.

Tested & used on RPI 1 & 3 here:

	/usr/bin/cowpatty -r eap-test.dump -f dict -s somethingclever
	[...]
	1079 passphrases tested in 97.18 seconds:  11.10 passphrases/second

I put the package in network apps. but this is more of a util. tool
than anything, so you might want to change that to.
	
Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/cowpatty/Config.in     |  9 +++++++++
 package/cowpatty/cowpatty.hash |  3 +++
 package/cowpatty/cowpatty.mk   | 24 ++++++++++++++++++++++++
 5 files changed, 38 insertions(+)
 create mode 100644 package/cowpatty/Config.in
 create mode 100644 package/cowpatty/cowpatty.hash
 create mode 100644 package/cowpatty/cowpatty.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 05693d3..560494b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -793,6 +793,7 @@ F:	package/c-icap-modules/
 F:	package/sdl2/
 
 N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
+F:	package/cowpatty/
 F:	package/liquid-dsp/
 F:	package/pixiewps/
 F:	package/reaver/
diff --git a/package/Config.in b/package/Config.in
index ddbbcff..162280f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1683,6 +1683,7 @@ menu "Networking applications"
 	source "package/connman/Config.in"
 	source "package/connman-gtk/Config.in"
 	source "package/conntrack-tools/Config.in"
+	source "package/cowpatty/Config.in"
 	source "package/crda/Config.in"
 	source "package/ctorrent/Config.in"
 	source "package/cups/Config.in"
diff --git a/package/cowpatty/Config.in b/package/cowpatty/Config.in
new file mode 100644
index 0000000..7fb6814
--- /dev/null
+++ b/package/cowpatty/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_COWPATTY
+	bool "cowpatty"
+	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_OPENSSL
+	help
+	  CowPatty is a C based tool to identify
+	  weak WPA passphrases.
+
+	  https://wifinetnews.com/archives/2003/11/weakness_in_passphrase_choice_in_wpa_interface.html
diff --git a/package/cowpatty/cowpatty.hash b/package/cowpatty/cowpatty.hash
new file mode 100644
index 0000000..0725c11
--- /dev/null
+++ b/package/cowpatty/cowpatty.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256 131d5285fa64c072b80f87a5be5914828fc2c2816157d6dc40b8749ba02d69fa cowpatty-83fd1589c142676d26cabe1d56e9ff8bb288683a.tar.gz
+sha256 dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa COPYING
diff --git a/package/cowpatty/cowpatty.mk b/package/cowpatty/cowpatty.mk
new file mode 100644
index 0000000..8c7ec23
--- /dev/null
+++ b/package/cowpatty/cowpatty.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# cowpatty
+#
+################################################################################
+
+COWPATTY_VERSION = 83fd1589c142676d26cabe1d56e9ff8bb288683a
+COWPATTY_SITE = $(call github,gwbres,cowpatty,$(COWPATTY_VERSION))
+COWPATTY_LICENSE = GPL-2.0+
+COWPATTY_LICENSE_FILES = COPYING
+
+COWPATTY_DEPENDENCIES = libpcap
+COWPATTY_DEPENDENCIES += libopenssl
+
+define COWPATTY_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) CC=$(TARGET_CC) -C $(@D)
+endef
+
+define COWPATTY_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) \
+		PREFIX=/usr -C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
2.7.4
