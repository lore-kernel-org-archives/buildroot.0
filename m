From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Nov 2015 22:01:43 +0100
Subject: [Buildroot] [git commit] iodine: fix build issue with musl
Message-ID: <20151125210443.EB7467FC51@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f0cf937502c9be28ff6d560e39efe3bf16c1e493
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fxies:
http://autobuild.buildroot.net/results/1ab/1ab4f284c9cfc2a6a42aebc6da12a766b09acc4c/
http://autobuild.buildroot.net/results/a39/a39603a143821eb4e07af42ee4ee44fdde02f9e0/
http://autobuild.buildroot.net/results/384/3847e8ef28e1527764eee18224f361115aa7063b/
http://autobuild.buildroot.net/results/899/899f8844291d384cde96475e7a9ee98b69f8c803/

Iodine contains a local implementation of daemon(3) for older systems,
unless __GLIBC__ is defined.  Musl does provide it, but unlike uClibc it
doesn't define __GLIBC__.  Work around it by pretending to be glibc as we
otherwise end up with symbol conflicts.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iodine/iodine.mk |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/package/iodine/iodine.mk b/package/iodine/iodine.mk
index 3239249..9de54e0 100644
--- a/package/iodine/iodine.mk
+++ b/package/iodine/iodine.mk
@@ -10,8 +10,19 @@ IODINE_DEPENDENCIES = zlib
 IODINE_LICENSE = MIT
 IODINE_LICENSE_FILES = README
 
+IODINE_CFLAGS = $(TARGET_CFLAGS)
+
+# iodine contains a local implementation of daemon(3) for older
+# systems, unless __GLIBC__ is defined. Musl does provide it, but
+# unlike uClibc it doesn't define __GLIBC__. Work around it by
+# pretending to be glibc as we otherwise end up with symbol conflicts.
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+IODINE_CFLAGS += -D__GLIBC__
+endif
+
 define IODINE_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(BR2_ARCH) -C $(@D)
+	$(TARGET_CONFIGURE_OPTS) CFLAGS="$(IODINE_CFLAGS)" \
+		$(MAKE) ARCH=$(BR2_ARCH) -C $(@D)
 endef
 
 define IODINE_INSTALL_TARGET_CMDS
