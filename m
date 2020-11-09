From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Nov 2020 21:04:10 +0100
Subject: [Buildroot] [git commit branch/next] package/stress-ng: disable
 libbsd on static build
Message-ID: <20201117203826.4B5B38633A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2d6c5ff9092aa7735c7a739d15180910ae734df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Static link with libbsd fails because of multiple definition of the
strlcpy symbol. uClibc optionally provides these symbols.

Add make options that disable all libbsd tests when linking statically.

Fixes:
http://autobuild.buildroot.net/results/2c77271b33c9d0e9a39cced2eda6d0df0d6b8124/
http://autobuild.buildroot.net/results/2f98c5d9ca907dd62b30bedfe4e52b014bb3e8d1/
http://autobuild.buildroot.net/results/51c4c065b93a6d11f6b4583f80f932481518905a/

Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stress-ng/stress-ng.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 57464e9bbf..4afdb0a329 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -10,8 +10,11 @@ STRESS_NG_SITE = http://kernel.ubuntu.com/~cking/tarballs/stress-ng
 STRESS_NG_LICENSE = GPL-2.0+
 STRESS_NG_LICENSE_FILES = COPYING
 
-ifeq ($(BR2_PACKAGE_LIBBSD),y)
+ifeq ($(BR2_PACKAGE_LIBBSD):$(BR2_STATIC_LIBS),y:)
 STRESS_NG_DEPENDENCIES += libbsd
+else
+STRESS_NG_MAKE_OPTS += HAVE_LIB_BSD=0 HAVE_WCSLCAT=0 \
+	HAVE_WCSLCPY=0 HAVE_SETPROCTITLE=0
 endif
 
 ifeq ($(BR2_PACKAGE_KEYUTILS),y)
@@ -19,7 +22,7 @@ STRESS_NG_DEPENDENCIES += keyutils
 endif
 
 define STRESS_NG_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(STRESS_NG_MAKE_OPTS) -C $(@D)
 endef
 
 # Don't use make install otherwise stress-ng will be rebuild without
