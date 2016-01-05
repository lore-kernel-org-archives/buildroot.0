From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Jan 2016 22:40:27 +0100
Subject: [Buildroot] [git commit] pv: fix build error on sparc/sparc64
Message-ID: <20160105214315.4A5CD81ED7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ed37b14bc1160b0ddbbb1590bbd604bfae63563
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Relax linker option is enabled by default on sparc/sparc64
architectures, and it can't be used together with -r option, so disable
it.

Fixes:
http://autobuild.buildroot.net/results/fadc6fc5500d68b91aead58b1d74887db5244f52/
http://autobuild.buildroot.net/results/2f30486f2d72e0277fc30febd4012825a59e4f41/
http://autobuild.buildroot.net/results/82ccb8f0818d1909309eaef969548f963fc6cf04/
...

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pv/pv.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index 5346b10..47f570f 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -17,6 +17,13 @@ PV_LICENSE_FILES = doc/COPYING
 # ensuring that host-gettext is built if gettext support is enabled;
 PV_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext host-gettext)
 
+# --relax linker option is enabled by default on sparc/sparc64
+# architectures, and it can't be used together with -r option, so
+# disable it.
+ifeq ($(BR2_sparc)$(BR2_sparc64),y)
+PV_LDFLAGS = "-Wl,--no-relax"
+endif
+
 # While 'pv' uses autoconf, it does not use automake for its
 # makefiles. It uses $(LD) $(LDFLAGS) to achieve partial linking, but
 # using 'ld' directly doesn't work well with some toolchain
@@ -25,6 +32,6 @@ PV_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext host-gettext)
 # ensure that 'gcc' is used to do these partial linking steps.
 PV_MAKE_OPTS = \
 	LD="$(TARGET_CC)" \
-	LDFLAGS="-Wl,-r -nostdlib"
+	LDFLAGS="-Wl,-r -nostdlib $(PV_LDFLAGS)"
 
 $(eval $(autotools-package))
