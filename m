From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 27 Jun 2020 16:44:35 +0200
Subject: [Buildroot] [git commit] package/lttng-{libust,
 tools}: use proper systemd rundir
Message-ID: <20200627144242.5738C815FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c393d2c6f766fc757329893997f48e5dc641474
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set the rundir to /run/lttng, if systemd is the init system.
/var/run is "legacy" in systemd's view.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lttng-libust/lttng-libust.mk | 4 ++++
 package/lttng-tools/lttng-tools.mk   | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index 8e6537690b..f3c660c56f 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -13,6 +13,10 @@ LTTNG_LIBUST_INSTALL_STAGING = YES
 LTTNG_LIBUST_DEPENDENCIES = liburcu util-linux
 LTTNG_LIBUST_CONF_OPTS += --disable-man-pages --disable-examples
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+LTTNG_LIBUST_CONF_OPTS += --with-lttng-system-rundir=/run/lttng
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 LTTNG_LIBUST_DEPENDENCIES += python
 LTTNG_LIBUST_CONF_OPTS += --enable-python-agent
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index b1b0a24a4f..e0e99e3270 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -13,6 +13,10 @@ LTTNG_TOOLS_LICENSE_FILES = LICENSE $(addprefix LICENSES/,BSD-2-Clause BSD-3-Cla
 LTTNG_TOOLS_CONF_OPTS += --disable-man-pages
 LTTNG_TOOLS_DEPENDENCIES = liburcu libxml2 popt util-linux
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+LTTNG_TOOLS_CONF_OPTS += --with-lttng-system-rundir=/run/lttng
+endif
+
 ifeq ($(BR2_PACKAGE_LTTNG_LIBUST),y)
 LTTNG_TOOLS_CONF_OPTS += --with-lttng-ust
 LTTNG_TOOLS_DEPENDENCIES += lttng-libust
