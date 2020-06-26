From: Norbert Lange <nolange79@gmail.com>
Date: Sat, 27 Jun 2020 00:06:02 +0200
Subject: [Buildroot] [PATCH 4/4] package/lttng-{libust,
 tools}: use proper systemd rundir
In-Reply-To: <20200626220603.29561-1-nolange79@gmail.com>
References: <20200626220603.29561-1-nolange79@gmail.com>
Message-ID: <20200626220603.29561-4-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set the rundir to /run/lttng, if systemd is the init system.
/var/run is "legacy" in systemd's view.

Perhaps a better way would be to define a variable
BR2_PACKAGE_RUNDIR to /var/run or /run depending on ini system.
(systemd will for example issue warnings for the dbus service,
using a socket in /var/run)

Signed-off-by: Norbert Lange <nolange79@gmail.com>
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
index b1b0a24a4f..0f3dc84ebd 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -13,6 +13,10 @@ LTTNG_TOOLS_LICENSE_FILES = LICENSE $(addprefix LICENSES/,BSD-2-Clause BSD-3-Cla
 LTTNG_TOOLS_CONF_OPTS += --disable-man-pages
 LTTNG_TOOLS_DEPENDENCIES = liburcu libxml2 popt util-linux
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+LTTNG_LIBUST_CONF_OPTS += --with-lttng-system-rundir=/run/lttng
+endif
+
 ifeq ($(BR2_PACKAGE_LTTNG_LIBUST),y)
 LTTNG_TOOLS_CONF_OPTS += --with-lttng-ust
 LTTNG_TOOLS_DEPENDENCIES += lttng-libust
-- 
2.27.0
