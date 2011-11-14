From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Nov 2011 16:17:14 +0100
Subject: [Buildroot] [git commit] rpm: use external (BR versions) of file
	and pcre
Message-ID: <20111114153837.B04B58F3AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=03d9092659216bd02b7447b55c8e4a105b6ba89e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Saves space in rootfs, and fixes build issues (internal pcre needs
C++ support for unit test, internal file breaks with incompatible
file versions on host).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/rpm/rpm.mk |   18 ++++++++++++++++--
 1 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 3407f49..4d8fe21 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -10,14 +10,28 @@ RPM_AUTORECONF = NO
 RPM_DEPENDENCIES = zlib beecrypt neon popt
 
 RPM_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/beecrypt -I$(STAGING_DIR)/usr/include/neon -DHAVE_MUTEX_THREAD_ONLY" \
-		ac_cv_va_copy=yes 
+		ac_cv_va_copy=yes
 
 RPM_CONF_OPT = --disable-build-versionscript --disable-rpath \
 	--without-selinux \
 	--without-python --without-perl \
 	--with-zlib=$(STAGING_DIR) \
 	--with-libbeecrypt=$(STAGING_DIR) \
-	--with-popt=$(STAGING_DIR) 
+	--with-popt=$(STAGING_DIR)
+
+ifeq ($(BR2_PACKAGE_PCRE),y)
+RPM_DEPENDENCIES += pcre
+RPM_CONF_OPT += --with-pcre=external
+else
+RPM_CONF_OPT += --with-pcre=no
+endif
+
+ifeq ($(BR2_PACKAGE_FILE),y)
+RPM_DEPENDENCIES += file
+RPM_CONF_OPT += --with-file=external
+else
+RPM_CONF_OPT += --with-file=no
+endif
 
 ifeq ($(BR2_PACKAGE_RPM_XZ_PAYLOADS),y)
 RPM_CONF_OPT+=--with-xz
