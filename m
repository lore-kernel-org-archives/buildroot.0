From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Feb 2014 11:49:36 +0100
Subject: [Buildroot] [git commit] collectd: fix static linking
Message-ID: <20140215105025.CE7E29CA42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7341eb827656208690ef7f65bd50196e6e1b05f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

collectd-tg indirectly uses pthread, but forgets to link with -pthread.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/collectd.mk |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index e1fc104..84e17cd 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -6,7 +6,6 @@
 
 COLLECTD_VERSION = 5.4.1
 COLLECTD_SITE = http://collectd.org/files
-COLLECTD_MAKE_OPT = LDFLAGS="$(TARGET_LDFLAGS) -lm"
 COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
 COLLECTD_INSTALL_STAGING = YES
 COLLECTD_LICENSE = GPLv2 LGPLv2.1
@@ -22,6 +21,16 @@ COLLECTD_PLUGINS_DISABLE = amqp apple_sensors aquaero ascent dbi email \
 		tokyotyrant uuid varnish vserver write_mongodb write_redis \
 		xmms zfs_arc
 
+COLLECTD_LDFLAGS = $(TARGET_LDFLAGS) -lm
+
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+# collectd-tg indirectly needs pthread but doesn't link with -pthread,
+# causing static linker errors
+COLLECTD_LDFLAGS += -lpthread
+endif
+
+COLLECTD_CONF_ENV += LDFLAGS="$(COLLECTD_LDFLAGS)"
+
 COLLECTD_CONF_OPT += --with-nan-emulation --with-fp-layout=nothing \
 	--localstatedir=/var --with-perl-bindings=no \
 	$(foreach p, $(COLLECTD_PLUGINS_DISABLE), --disable-$(p)) \
