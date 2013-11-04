From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Nov 2013 22:00:19 +0100
Subject: [Buildroot] [git commit] dhcpcd: needs MMU
Message-ID: <20131104211055.5B66E9BCBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=55227475957af0a6a9d1377bc9e2e6103febedba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dhcpcd fails to build on non-MMU platforms, even with the
--disable-fork option:

  bind.o: In function `_daemonise':
  bind.c:(.text+0x62): undefined reference to `_fork'
  collect2: ld returned 1 exit status

Therefore, we make dhcpcd depend on MMU support, and remove the
non-MMU condition in the .mk file. More recent versions of dhcpcd do
support non-MMU properly, but this commit intends to be only a fix.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Samuel Martin <s.martin49@gmail.com>
---
 package/dhcpcd/Config.in |    1 +
 package/dhcpcd/dhcpcd.mk |    4 ----
 2 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
index dbde548..ddbc6f4 100644
--- a/package/dhcpcd/Config.in
+++ b/package/dhcpcd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DHCPCD
 	depends on BR2_INET_IPV6
+	depends on BR2_USE_MMU # fork()
 	bool "dhcpcd"
 	help
 	  An RFC2131 compliant DHCP client
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 5296db8..13810f3 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -9,10 +9,6 @@ DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.bz2
 DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd/
 DHCPCD_LICENSE = BSD-2c
 
-ifeq ($(BR2_USE_MMU),)
-	DHCPCD_CONFIG_OPT += --disable-fork
-endif
-
 define DHCPCD_CONFIGURE_CMDS
 	(cd $(@D); \
 	./configure \
