From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 7 May 2015 22:44:58 +0200
Subject: [Buildroot] [git commit] package/efl/expedite: x-includes and
	x-libraries must be set for cross-compiling
Message-ID: <20150507204701.855F581DFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=131c520da84824e7f682b26cfd916fea2147e49d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If those flags are not explicitly passed, the libecore configure
script will include -I/usr/X11R6/include and -L/usr/X11R6/lib in the
compile flags, which are obviously unsafe for cross-compilation.

The fix is similar to 0d9d8984a9240a27f5ed2e15f1977ada67266906 and
da50b6b61c4a566fd28888f5a3a6dcb06fe1b495.

Fixes:
http://autobuild.buildroot.org/results/24b/24b578a28455409b7bcc0277abc6b478c51ae67f

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efl/expedite/expedite.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/efl/expedite/expedite.mk b/package/efl/expedite/expedite.mk
index f0361bf..02a4ca0 100644
--- a/package/efl/expedite/expedite.mk
+++ b/package/efl/expedite/expedite.mk
@@ -11,4 +11,10 @@ EXPEDITE_LICENSE_FILES = COPYING
 
 EXPEDITE_DEPENDENCIES = libevas libeina libeet
 
+ifeq ($(BR2_PACKAGE_LIBEVAS_X11),y)
+EXPEDITE_CONF_OPTS += --with-x=$(STAGING_DIR) \
+	--x-includes=$(STAGING_DIR)/usr/include \
+	--x-libraries=$(STAGING_DIR)/usr/lib
+endif
+
 $(eval $(autotools-package))
