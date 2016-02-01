From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Feb 2016 23:46:45 +0100
Subject: [Buildroot] [git commit] binutils: ensure TARGET_CONFIGURE_ARGS is
	taken into consideration for subdirs
Message-ID: <20160201224716.068D67F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d42d0acca6fbae5fca01024314600369d99995e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Binutils runs the configure scripts of subdirs at make time, so we need a
custom build command to ensure TARGET_CONFIGURE_ARGS are taken into
consideration for those (E.G. for musl gettext handling).

Reported-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/binutils.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 7c5955e..a3e27be 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -74,6 +74,12 @@ HOST_BINUTILS_CONF_OPTS = \
 	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
 	$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
+# binutils run configure script of subdirs at make time, so ensure
+# our TARGET_CONFIGURE_ARGS are taken into consideration for those
+define BINUTILS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_ARGS) $(MAKE) -C $(@D)
+endef
+
 # We just want libbfd, libiberty and libopcodes,
 # not the full-blown binutils in staging
 define BINUTILS_INSTALL_STAGING_CMDS
