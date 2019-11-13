From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Nov 2019 22:32:10 +0100
Subject: [Buildroot] [git commit] package/ndisc6: needs c11
Message-ID: <20191113212548.7EC5A8EEA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7c4fce8084ae338f7215b09de93aee241409fbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ndisc needs c11 because of alignas since version 1.0.4 and
https://git.remlab.net/gitweb/?p=ndisc6.git;a=commit;h=d917e5172531dd72e896b317c07f64274e8024a1
https://git.remlab.net/gitweb/?p=ndisc6.git;a=commit;h=77a2efc350fdd52b76b1a4c874ec4029e722048b

So replace -std=gnu99 by -std=c11 and add a dependency on gcc 4.7

This will fix build with gcc 8

Fixes:
 - http://autobuild.buildroot.org/results/1cab1e5f7c4250a153fd1ab758f818078833972f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ndisc6/Config.in | 5 +++++
 package/ndisc6/ndisc6.mk | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/ndisc6/Config.in b/package/ndisc6/Config.in
index 5531123851..287dc9199f 100644
--- a/package/ndisc6/Config.in
+++ b/package/ndisc6/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NDISC6
 	bool "ndisc6 tools"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # c11
 	help
 	  NDisc6 is a small collection of useful tools for IPv6
 	  networking
@@ -45,3 +46,7 @@ config BR2_PACKAGE_NDISC6_TCPSPRAY
 	  TCP/IP bandwidth measurement tool (Discard and Echo client).
 
 endif
+
+comment "ndisc6 needs a toolchain w/ gcc >= 4.7"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
index 38eeb00567..9845aa2c9a 100644
--- a/package/ndisc6/ndisc6.mk
+++ b/package/ndisc6/ndisc6.mk
@@ -7,7 +7,7 @@
 NDISC6_VERSION = 1.0.4
 NDISC6_SOURCE = ndisc6-$(NDISC6_VERSION).tar.bz2
 NDISC6_SITE = http://www.remlab.net/files/ndisc6
-NDISC6_CONF_ENV = CC="$(TARGET_CC) -std=gnu99" LIBS=$(TARGET_NLS_LIBS)
+NDISC6_CONF_ENV = CC="$(TARGET_CC) -std=c11" LIBS=$(TARGET_NLS_LIBS)
 NDISC6_CONF_OPTS = --disable-rpath --disable-suid-install
 NDISC6_LICENSE = GPL-2.0 or GPL-3.0
 NDISC6_LICENSE_FILES = COPYING
