From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 16:18:59 +0100
Subject: [Buildroot] [git commit] package/libfribidi: remove optional
	dependency to libglib
Message-ID: <20161101151903.572C680DE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bcb98949a6850e14431780ba53197f70f5f30401
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes vdr compile error:
http://autobuild.buildroot.net/results/725/7252decffe29e19051eed0554786651aee216573/

Instead of fixing fribidi.pc or adding optional CFLAGS to the vdr
package we remove the optional libglib dependency because it does not
contain "any thing substantial" as pointed out in an pull request sent
upstream: https://github.com/behdad/fribidi/pull/14

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libfribidi/libfribidi.mk | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index 4e82a5e..86e722a 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -14,11 +14,9 @@ LIBFRIBIDI_INSTALL_STAGING = YES
 # Run autoreconf to regenerate ltmain.sh.
 LIBFRIBIDI_AUTORECONF = YES
 LIBFRIBIDI_DEPENDENCIES = host-pkgconf
-
-ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
-LIBFRIBIDI_DEPENDENCIES += libglib2
-else
-LIBFRIBIDI_CONF_OPTS += --with-glib=no
-endif
+# libglib2 dependency causes a build failure, and this optional
+# dependency is going to be removed usptream, see
+# https://github.com/behdad/fribidi/pull/14
+LIBFRIBIDI_CONF_OPTS = --with-glib=no
 
 $(eval $(autotools-package))
