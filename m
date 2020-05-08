From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 May 2020 09:15:43 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/libglib2: restore
 use of system printf
Message-ID: <20200508080227.554CD90F63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6808e122f6ae9cca3966877e865e35b8922a9e9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Prior to commit 4102db0f7a ("package/libglib2: bump to version 2.60.3")
which converted libglib2 to meson, Buildroot used to set a range of
autoconf options to bypass tests that require running binaries.

The meson version of libglib2's build system has many fewer of these
checks, but there are still some and these can be fed the "correct"
answer by adding properties to cross-compilation.conf.

Add the necessary properties to indicate that we have C99 compliant
print functions to avoid pulling in the gnulib fallback.

Signed-off-by: John Keeping <john@metanate.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4f91198f0d878adee4f3fd6c6991879c1255951a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libglib2/libglib2.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index f00818f69c..a206639f74 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -52,6 +52,11 @@ LIBGLIB2_CONF_OPTS = \
 	-Dinstalled_tests=false \
 	-Doss_fuzz=disabled
 
+LIBGLIB2_MESON_EXTRA_PROPERTIES = \
+	have_c99_vsnprintf=true \
+	have_c99_snprintf=true \
+	have_unix98_printf=true
+
 ifneq ($(BR2_ENABLE_LOCALE),y)
 LIBGLIB2_DEPENDENCIES += libiconv
 endif
