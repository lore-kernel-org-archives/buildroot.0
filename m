From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Sep 2018 23:42:41 +0200
Subject: [Buildroot] [git commit] glibc: move autoconf cache variables to
 GLIBC_CONF_ENV
Message-ID: <20180925194643.ADCCA88D1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03e2bad8687c882b85d213fff9354c788b5c1bf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

glibc is not using the autotools-package infrastructure, so we are
calling the ./configure script manually. Currently, the few autoconf
cache variables are passed as arguments to the ./configure script,
while we pass them through the environment in the autotools-package
infrastructure.

So let's pass them in the environment, and use a GLIBC_CONF_ENV
variable to store them. This will allow in a follow-up commit to
conditionally add more autoconf cache variables to the glibc build.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/glibc.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index a2eb8714b1..4e50f5aa0c 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -71,6 +71,11 @@ define GLIBC_ADD_MISSING_STUB_H
 endef
 endif
 
+GLIBC_CONF_ENV = \
+	ac_cv_path_BASH_SHELL=/bin/bash \
+	libc_cv_forced_unwind=yes \
+	libc_cv_ssp=no
+
 # Even though we use the autotools-package infrastructure, we have to
 # override the default configure commands for several reasons:
 #
@@ -89,10 +94,8 @@ define GLIBC_CONFIGURE_CMDS
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="-O2 $(GLIBC_EXTRA_CFLAGS)" CPPFLAGS="" \
 		CXXFLAGS="-O2 $(GLIBC_EXTRA_CFLAGS)" \
+		$(GLIBC_CONF_ENV) \
 		$(SHELL) $(@D)/configure \
-		ac_cv_path_BASH_SHELL=/bin/bash \
-		libc_cv_forced_unwind=yes \
-		libc_cv_ssp=no \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
