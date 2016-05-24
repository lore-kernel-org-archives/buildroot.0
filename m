From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 May 2016 21:50:36 +0200
Subject: [Buildroot] [git commit] libgpgme: fix musl build with
	argp-standalone
Message-ID: <20160524195857.63A3D81EE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d217aa4dd987128ba874d3c6ee2255ffed10305
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libgpgme configure script does not detect the error_t type under musl,
because musl does not define error_t in errno.h. As a result config.h adds a
local definition of error_t. When argp-standalone is present this local
definition collides with the error_t typedef in argp.h. Assume we always have
error_t when argp-standalone is present.

Fixes:
http://autobuild.buildroot.net/results/656/6566a1c77983404d90920997bfd15bd98c7ddde7/
http://autobuild.buildroot.net/results/a7b/a7b92ad68ff6e13d20ff44e955dc5748b2efd6a4/
http://autobuild.buildroot.net/results/0db/0db1b2aa0969d6cbae57b1400b7b766a5988abf9/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgpgme/libgpgme.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 1868099..574ddd6 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -23,7 +23,9 @@ LIBGPGME_CONF_OPTS = --with-gpg=/usr/bin/gpg \
 
 # Handle argp-standalone or it errors out during build
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
-LIBGPGME_CONF_ENV += LIBS="-largp"
+# musl libc does not define error_t in errno.h, but argp.h does.
+# Assume we have error_t to avoid collision with the argp.h error_t.
+LIBGPGME_CONF_ENV += LIBS="-largp" ac_cv_type_error_t=yes
 LIBGPGME_DEPENDENCIES += argp-standalone
 endif
 
