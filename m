From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Nov 2019 16:28:36 +0100
Subject: [Buildroot] [git commit] package/systemd: hybrid cgroupfs hierarchy
 for docker compatibility
Message-ID: <20191111152141.526E08ED42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=272695277e2eaef5fa34bfb23bb3eb815a8ed933
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Tested-by: J??r??my Rosen <jeremy.rosen@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
