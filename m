From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 11 Oct 2019 22:16:40 +0200
Subject: [Buildroot] [git commit] package/collectd: switch to official
 tarball
Message-ID: <20191011201330.D21058D424@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1d9a5e804b82341484a3b5975278d5d8d170bfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use official tarball to avoid host-bison (and host-flex) dependencies
due to missing src/liboconfig/parser.c file

Fixes:
 - http://autobuild.buildroot.org/results/cd5deacbe6f4f97aa0bbc8040ac9aa7860ceaa6e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/collectd/collectd.hash | 6 +++---
 package/collectd/collectd.mk   | 7 +++----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/collectd/collectd.hash b/package/collectd/collectd.hash
index b180e2dfe0..779e16d70a 100644
--- a/package/collectd/collectd.hash
+++ b/package/collectd/collectd.hash
@@ -1,5 +1,5 @@
 # Locally computed checksums
-sha512	cbbc8d6409242108550b974f388d15c6084753dd51c6056614db34bceb3b72abb0237892ea65086093b9a5c5569087666c0430eb16021d22c3dde8e6d1ae7922	collectd-5.9.2.tar.gz
-sha256	961116e74ac505b920578932fd2bd9904febbc7d5aefba3e0ea3d44337c00119	collectd-5.9.2.tar.gz
-sha1	19541b8df0115f8e66cb6f11b9826a921cb5a3c7	collectd-5.9.2.tar.gz
+sha512	5386e4d0b9c350a0719924bf440f53bf3cdedefefe6bc7b154501dfdf7d2d98fa5dd31341cbed41023f7a129f68bda694e9d06f2da69ea2e61372d1b237b64a7	collectd-5.9.2.tar.bz2
+sha256	917c483608b9b38438b121737b510c3d68f335c091bc286aa6ebcc0c8e372a09	collectd-5.9.2.tar.bz2
+sha1	e8d0cb152194f3b51ee762a62ab647f7bb42e259	collectd-5.9.2.tar.bz2
 sha256	ed0409b2b1c30566dab5fcdaf46ee70e140c99788e22f0267645a9357b476ae4	COPYING
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 2f60b4561e..5d94dec46d 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -5,7 +5,9 @@
 ################################################################################
 
 COLLECTD_VERSION = 5.9.2
-COLLECTD_SITE = $(call github,collectd,collectd,collectd-$(COLLECTD_VERSION))
+COLLECTD_SITE = \
+	https://github.com/collectd/collectd/releases/download/collectd-$(COLLECTD_VERSION)
+COLLECTD_SOURCE = collectd-$(COLLECTD_VERSION).tar.bz2
 COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
 COLLECTD_INSTALL_STAGING = YES
 COLLECTD_LICENSE = MIT (daemon, plugins), GPL-2.0 (plugins), LGPL-2.1 (plugins)
@@ -143,10 +145,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITETSDB),--enable-write_tsdb,--disable-write_tsdb) \
 	$(if $(BR2_PACKAGE_COLLECTD_ZOOKEEPER),--enable-zookeeper,--disable-zookeeper)
 
-# since 5.9.1 the file src/liboconfig/parser.c is missing from the tar
-# download file, triggering the need for host-bison
 COLLECTD_DEPENDENCIES = \
-	host-bison \
 	host-pkgconf \
 	$(if $(BR2_PACKAGE_COLLECTD_AMQP),rabbitmq-c) \
 	$(if $(BR2_PACKAGE_COLLECTD_APACHE),libcurl) \
