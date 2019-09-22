From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 22 Sep 2019 20:04:53 +0200
Subject: [Buildroot] [git commit] package/policycoreutils: drop
 host-python(3) dependency for host-policycoreutils
Message-ID: <20190922180710.82C468F0C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39e7c72aa56c5805e268f4661ca236f0487854d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since SELinux 2.7, the python tools that used to be in policycoreutils
have been moved into a separate package, called "python" in upstream
SELinux, and "selinux-python" in Buildroot. Therefore, we can drop the
host-python(3) dependency from host-policycoreutils.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/policycoreutils/policycoreutils.mk | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index b117aa6902..4f7176777c 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -73,22 +73,10 @@ HOST_POLICYCOREUTILS_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
 	CFLAGS="$(HOST_CFLAGS) -U_FILE_OFFSET_BITS" \
 	CPPFLAGS="$(HOST_CPPFLAGS) -U_FILE_OFFSET_BITS" \
-	PYTHON="$(HOST_DIR)/bin/python" \
-	PYTHON_INSTALL_ARGS="$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)" \
 	ARCH="$(HOSTARCH)" \
 	DESTDIR=$(HOST_DIR) \
 	PREFIX=$(HOST_DIR)
 
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-HOST_POLICYCOREUTILS_DEPENDENCIES += host-python3
-HOST_POLICYCOREUTILS_MAKE_OPTS += \
-	PYLIBVER="python$(PYTHON3_VERSION_MAJOR)"
-else
-HOST_POLICYCOREUTILS_DEPENDENCIES += host-python
-HOST_POLICYCOREUTILS_MAKE_OPTS += \
-	PYLIBVER="python$(PYTHON_VERSION_MAJOR)"
-endif
-
 # Note: We are only building the programs required by the refpolicy build
 HOST_POLICYCOREUTILS_MAKE_DIRS = \
 	load_policy newrole run_init \
