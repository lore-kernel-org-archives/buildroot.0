From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Nov 2017 09:50:51 +0100
Subject: [Buildroot] [git commit] ethtool: Allow enabling/disabling pretty
 printing
Message-ID: <20171106084537.B78EF811F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b17351661b241a377f8f696a850d88243eb76dc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ethtool has a configure script option allowing the enabling or disabling of
pretty printing for drivers, SFP modules etc which can save a significant
amount of bytes on the root filesystem. Allow selecting that, and turn it on by
default (like ethtool's configure script).

[Peter: fix Config.in indentation/style]
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ethtool/Config.in  | 8 ++++++++
 package/ethtool/ethtool.mk | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/package/ethtool/Config.in b/package/ethtool/Config.in
index 0970497..48173bf 100644
--- a/package/ethtool/Config.in
+++ b/package/ethtool/Config.in
@@ -5,3 +5,11 @@ config BR2_PACKAGE_ETHTOOL
 	  ethernet-based network interface.
 
 	  https://www.kernel.org/pub/software/network/ethtool/
+
+config BR2_PACKAGE_ETHTOOL_PRETTY_PRINT
+	bool "enable pretty printing"
+	default y
+	depends on BR2_PACKAGE_ETHTOOL
+	help
+	  Enables ethtool's pretty printing for drivers
+	  and SFP modules.
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 991df49..d8ebba5 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -9,5 +9,7 @@ ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
 ETHTOOL_LICENSE_FILES = COPYING
+ETHTOOL_CONF_OPTS = \
+	$(if $(BR2_PACKAGE_ETHTOOL_PRETTY_PRINT),--enable-pretty-dump,--disable-pretty-dump)
 
 $(eval $(autotools-package))
