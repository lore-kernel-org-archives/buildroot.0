From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 May 2014 16:31:42 +0200
Subject: [Buildroot] [git commit] zeromq: explicitly add -lstdc++ for static
	build
Message-ID: <20140509143214.0DF7A9CB24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ebb5692f358833e4fb6f3ed5f3075241d80c6667
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/7c552e514f8c13ba8cdd420dc5bbf5edac915a83

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zeromq/zeromq.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 7802916..c1eee3e 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -12,9 +12,15 @@ ZEROMQ_LICENSE = LGPLv3+ with exceptions
 ZEROMQ_LICENSE_FILES = COPYING COPYING.LESSER
 ZEROMQ_AUTORECONF = YES
 
+# Only tools/curve_keygen.c needs this, but it doesn't hurt to pass it
+# for the rest of the build as well (which automatically includes stdc++).
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+	ZEROMQ_CONF_OPT += LIBS=-lstdc++
+endif
+
 ifeq ($(BR2_PACKAGE_ZEROMQ_PGM),y)
 	ZEROMQ_DEPENDENCIES += host-pkgconf openpgm
-	ZEROMQ_CONF_OPT = --with-system-pgm
+	ZEROMQ_CONF_OPT += --with-system-pgm
 endif
 
 $(eval $(autotools-package))
