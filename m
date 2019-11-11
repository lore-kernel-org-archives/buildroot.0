From: Christian Stewart <christian@paral.in>
Date: Mon, 11 Nov 2019 00:33:48 -0800
Subject: [Buildroot] [PATCH 1/1] package/systemd: hybrid cgroupfs hierarchy
 for docker compatibility
Message-ID: <20191111083348.3964650-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Docker fails to start with "Devices cgroup isn't mounted" as of systemd 243.
According to the systemd documentation:

  systemd now defaults to the "unified" cgroup hierarchy setup during
  build-time, i.e. -Ddefault-hierarchy=unified is now the build-time default.
  Previously, -Ddefault-hierarchy=hybrid was the default. [...] Downstream
  production distributions might want to continue to use
  -Ddefault-hierarchy=hybrid (or even =legacy) for their builds as unfortunately
  the popular container managers have not caught up with the kernel API changes.

Changing this option to "hybrid" or "legacy" fixes the Docker startup.

Reference: https://github.com/opencontainers/runc/issues/654

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/systemd/systemd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 94d5f703cd..92490eb86b 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -26,6 +26,7 @@ SYSTEMD_CONF_OPTS += \
 	-Dima=false \
 	-Dldconfig=false \
 	-Ddefault-dnssec=no \
+	-Ddefault-hierarchy=hybrid \
 	-Dtests=false \
 	-Dsplit-bin=true \
 	-Dsplit-usr=false \
-- 
2.24.0
