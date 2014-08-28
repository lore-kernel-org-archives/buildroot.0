From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Aug 2014 23:03:44 +0200
Subject: [Buildroot] [PATCH 1/2] pkg-autotools: use
	--disable-dependency-tracking
Message-ID: <1409259825-619-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, automake does "dependency tracking", which allows the
generated Makefile to contain the necessary dependencies to
automatically rebuild the appropriate C files when included header
files are changed. This dependency tracking is nice when doing active
development on the package, but not really useful when doing a
one-time build of the package. According to automake's
documentation[1], disabling the dependency tracking provides a small
speed-up.

In some very unscientific measurements (i.e repeated only once), we
have noticed a ~3.6% reduction of the total build time of a Buildroot
toolchain after applying this patch.

[1] http://www.gnu.org/software/automake/manual/html_node/Dependency-Tracking.html

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-autotools.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index bcc648d..83299cf 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -140,6 +140,7 @@ define $(2)_CONFIGURE_CMDS
 		--disable-documentation \
 		--with-xmlto=no \
 		--with-fop=no \
+		--disable-dependency-tracking \
 		$$(DISABLE_NLS) \
 		$$(DISABLE_LARGEFILE) \
 		$$(DISABLE_IPV6) \
@@ -169,6 +170,7 @@ define $(2)_CONFIGURE_CMDS
 		--disable-documentation \
 		--with-xmlto=no \
 		--with-fop=no \
+		--disable-dependency-tracking \
 		$$(QUIET) $$($$(PKG)_CONF_OPT) \
 	)
 endef
-- 
2.0.0
