From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 May 2020 07:26:27 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/polkit: install
 service file
Message-ID: <20200506051932.149D87FFD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4cbe3e5d3bb95b7d5a64e57d2cdf32e14e42a909
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The default installed service file is missing a target, which causes preset-all
to not enable the service.

Add the service file to package/polkit with the addition of:

[Install]
WantedBy=multi-user.target

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3f885d9dfe061e0401a6c13871ae9301e68db862)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/polkit/polkit.mk      |  6 ++++++
 package/polkit/polkit.service | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 8572d8b9ba..ee0b3674de 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -43,4 +43,10 @@ define POLKIT_PERMISSIONS
 	/usr/bin/pkexec f 4755 root root - - - - -
 endef
 
+define POLKIT_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(POLKIT_PKGDIR)/polkit.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/polkit.service
+
+endef
+
 $(eval $(autotools-package))
diff --git a/package/polkit/polkit.service b/package/polkit/polkit.service
new file mode 100644
index 0000000000..a69b28cd93
--- /dev/null
+++ b/package/polkit/polkit.service
@@ -0,0 +1,12 @@
+[Unit]
+
+Description=Authorization Manager
+Documentation=man:polkit(8)
+
+[Service]
+Type=dbus
+BusName=org.freedesktop.PolicyKit1
+ExecStart=/usr/lib/polkit-1/polkitd --no-debug
+
+[Install]
+WantedBy=multi-user.target
