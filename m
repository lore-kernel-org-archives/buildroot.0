From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Dec 2012 21:30:29 +0100
Subject: [Buildroot] [git commit] package/slirp: new package
Message-ID: <20121216204048.3150E9A2B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f6ce8ee9d13d32bbc43b23bf7ed7b7a3f0cbd2f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in       |    1 +
 package/slirp/Config.in |   25 +++++++++++++++++++++++++
 package/slirp/slirp.mk  |   21 +++++++++++++++++++++
 3 files changed, 47 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index de23724..eaf42e3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -497,6 +497,7 @@ source "package/libupnp/Config.in"
 source "package/libvncserver/Config.in"
 source "package/nss-mdns/Config.in"
 source "package/ortp/Config.in"
+source "package/slirp/Config.in"
 source "package/usbredir/Config.in"
 source "package/zeromq/Config.in"
 endmenu
diff --git a/package/slirp/Config.in b/package/slirp/Config.in
new file mode 100644
index 0000000..dedded3
--- /dev/null
+++ b/package/slirp/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_SLIRP
+	bool "slirp"
+	help
+	  The Spice project aims to provide a complete open source
+	  solution for interaction with virtualized desktop devices.
+	  The Spice project deals with both the virtualized devices
+	  and the front-end. Interaction between front-end and
+	  back-end is done using VD-Interfaces.
+	  
+	  This package implements the slirp-part for Spice.
+	  Slirp emulates a PPP or SLIP connection over a normal terminal.
+	  
+	  http://www.spice-space.org/
+	  
+	  NOTE:
+	  This package has some history of a unique kind:
+	    - originally developped as 'slirp' by Danny Gasparovski, and
+	      seemingly abandonned (developper /disapeared/)
+	    - then re-maintained at sourceforge by "Kelly", up to some
+	      time around 2009: http://slirp.sourceforge.net/
+	    - during that period, QEMU (Fabrice BELLARD) forked the code
+	      and included it in QEMU
+	    - and it was imported from this breed by the Spice project
+	      around May 2009
+	    - which is what we use here
diff --git a/package/slirp/slirp.mk b/package/slirp/slirp.mk
new file mode 100644
index 0000000..b3f4bcd
--- /dev/null
+++ b/package/slirp/slirp.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# Spice-slirp
+#
+#############################################################
+
+# There's no tarball releases of slirp, so we use the git repo
+# Also, there's no tag, so we use a random SHA1 (master's HEAD
+# of today)
+SLIRP_VERSION         = 8c2da74c1385242f20799fec8c04f8378edc6550
+SLIRP_SITE            = git://anongit.freedesktop.org/spice/slirp
+SLIRP_LICENSE         = BSD-4c BSD-2c
+# Note: The license file 'COPYRIGHT' is missing from the sources,
+# although some files refer to it.
+SLIRP_INSTALL_STAGING = YES
+
+# As we're using the git tree, there's no ./configure,
+# so we need to autoreconf.
+SLIRP_AUTORECONF      = YES
+
+$(eval $(autotools-package))
