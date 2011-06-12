From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 Jun 2011 21:59:59 +0200
Subject: [Buildroot] [git commit] package/autotools: add --{enable,
	disable}-{shared, static} automatically
Message-ID: <20110612210711.838BA8733B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=009d8fceab4db7815502e4b0565fe0ef531d512c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For target packages, depending on BR2_PREFER_STATIC_LIB, add the
correct combination of --{enable,disable}-{shared,static} flags to
./configure calls.

  * When BR2_PREFER_STATIC_LIB is enabled, we pass --enable-static
  --disable-shared.

  * When BR2_PREFER_STATIC_LIB is disabled, we pass --enable-static
  --enable-shared. We enable static libraries since they can still be
  useful to statically link applications against some libraries
  (sometimes it is useful for size reasons). Static libraries are
  anyway only installed in the STAGING_DIR, so it doesn't increase in
  any way the size of the TARGET_DIR.

For host packages, always pass --enable-shared and --disable-static.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.autotools.in |    2 ++
 package/Makefile.in           |    6 ++++++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 917600c..46ab861 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -104,6 +104,7 @@ define $(2)_CONFIGURE_CMDS
 		$$(DISABLE_NLS) \
 		$$(DISABLE_LARGEFILE) \
 		$$(DISABLE_IPV6) \
+		$$(SHARED_STATIC_LIBS_OPTS) \
 		$$(QUIET) $$($$(PKG)_CONF_OPT) \
 	)
 endef
@@ -119,6 +120,7 @@ define $(2)_CONFIGURE_CMDS
 		./configure \
 		--prefix="$$(HOST_DIR)/usr" \
 		--sysconfdir="$$(HOST_DIR)/etc" \
+		--enable-shared --disable-static \
 		$$($$(PKG)_CONF_OPT) \
 	)
 endef
diff --git a/package/Makefile.in b/package/Makefile.in
index 31a9639..8e9637c 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -276,6 +276,12 @@ else
 ENABLE_DEBUG:=
 endif
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+SHARED_STATIC_LIBS_OPTS=--enable-static --disable-shared
+else
+SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared
+endif
+
 include package/Makefile.autotools.in
 include package/Makefile.cmake.in
 include package/Makefile.package.in
-- 
1.7.3.4
