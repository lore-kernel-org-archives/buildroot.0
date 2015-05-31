From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 May 2015 21:42:07 +0200
Subject: [Buildroot] [git commit] upmpdcli: fix static linking issue
Message-ID: <20150531194305.36A6680501@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=62d925ee68fd3aa3fece9af11f19cf61fb6b5140
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/7ed/7ed85071bc06b4806e90b278a0736ea70c01b456/

Upmpdcli forgets to take the dependencies of libupnpp into consideration,
breaking static linking, so help it.

Libupnpp unfortunately doesn't provide a .pc file, so manually handle its
dependencies here.

The build system doesn't expand LIBS from the configure step, so manually
pass it to make.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/upmpdcli/upmpdcli.mk |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index 0be4d91..a5c6370 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -10,6 +10,18 @@ UPMPDCLI_LICENSE = GPLv2+
 UPMPDCLI_LICENSE_FILES = COPYING
 UPMPDCLI_DEPENDENCIES = libmpdclient libupnpp
 
+ifeq ($(BR2_STATIC_LIBS),y)
+# Upmpdcli forgets to take the dependencies of libupnpp into
+# consideration, breaking static linking, so help it.
+# Libupnpp unfortunately doesn't provide a .pc file, so manually
+# handle the dependencies here.
+# The build system doesn't expand LIBS from the configure step, so
+# manually pass it to make.
+UPMPDCLI_DEPENDENCIES += host-pkgconf
+UPMPDCLI_MAKE_OPTS = \
+	LIBS='$(shell $(PKG_CONFIG_HOST_BINARY) --libs expat libcurl libupnp)'
+endif
+
 # Upmpdcli only runs if user upmpdcli exists
 define UPMPDCLI_USERS
 	upmpdcli -1 upmpdcli -1 * - - - Upmpdcli MPD UPnP Renderer Front-End
