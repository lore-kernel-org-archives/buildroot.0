From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 2 Jul 2016 13:26:33 +0200
Subject: [Buildroot] [git commit] package/libuio: fix build with external
	intl library
Message-ID: <20160702113243.B29FF81D88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a728538c932a0626faf9371836fae49f9aa66c3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When intl library is not provided by the libc, libuio forgets to link
with -lintl.

Fixes:
http://autobuild.buildroot.net/results/8f7/8f715b4e9b826dac13f3d49da25576e6e1d79449

[Peter: simplify using LIBUIO_LIBS as suggested by Yann]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libuio/libuio.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/libuio/libuio.mk b/package/libuio/libuio.mk
index e019fe9..ed842a9 100644
--- a/package/libuio/libuio.mk
+++ b/package/libuio/libuio.mk
@@ -21,7 +21,16 @@ LIBUIO_CONF_ENV += MAKEINFO=true
 
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 LIBUIO_DEPENDENCIES += argp-standalone
-LIBUIO_CONF_ENV += LIBS="-largp"
+LIBUIO_LIBS += -largp
 endif
 
+# libuio pulls in libintl if needed, so ensure we also
+# link against it, otherwise static linking fails
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+LIBUIO_DEPENDENCIES += gettext
+LIBUIO_LIBS += -lintl
+endif
+
+LIBUIO_CONF_ENV += LIBS="$(LIBUIO_LIBS)"
+
 $(eval $(autotools-package))
