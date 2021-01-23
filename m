From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 21:49:01 +0100
Subject: [Buildroot] [git commit] package/nvme: add systemd optional
 dependency
Message-ID: <20210123202929.60567815D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=282c7b6e64a328389dbf29fdea7e4f68916c1c8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

systemd is an optional dependency (enabled by default) since version
1.10 and
https://github.com/linux-nvme/nvme-cli/commit/48c10dbfaf00777170e209db20f7d07e47f7a983

Fixes:
 - http://autobuild.buildroot.org/results/8d14a5702aa1ffe3f036d1e1505e9596e3d4d466

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
