From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 20 Jan 2021 21:16:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/nvme: add systemd optional
 dependency
Message-ID: <20210120201622.179090-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd is an optional dependency (enabled by default) since version
1.10 and
https://github.com/linux-nvme/nvme-cli/commit/48c10dbfaf00777170e209db20f7d07e47f7a983

Fixes:
 - http://autobuild.buildroot.org/results/8d14a5702aa1ffe3f036d1e1505e9596e3d4d466

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nvme/nvme.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/nvme/nvme.mk b/package/nvme/nvme.mk
index 678b978211..53f9dff753 100644
--- a/package/nvme/nvme.mk
+++ b/package/nvme/nvme.mk
@@ -18,6 +18,15 @@ else
 NVME_MAKE_OPTS += LIBUUID=1
 endif
 
+# Yes, HAVE_SYSTEMD=0 means systemd support enabled.
+# HAVE_SYSTEMD=1 means systemd support disabled.
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+NVME_DEPENDENCIES += systemd
+NVME_MAKE_OPTS += HAVE_SYSTEMD=0
+else
+NVME_MAKE_OPTS += HAVE_SYSTEMD=1
+endif
+
 define NVME_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
 		$(NVME_MAKE_OPTS) -C $(@D)
-- 
2.29.2
