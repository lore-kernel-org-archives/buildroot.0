From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Apr 2020 14:45:50 +0200
Subject: [Buildroot] [git commit] package/polkit: install service file
Message-ID: <20200418123232.AEC258ED79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f885d9dfe061e0401a6c13871ae9301e68db862
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The default installed service file is missing a target, which causes preset-all
to not enable the service.

Add the service file to package/polkit with the addition of:

[Install]
WantedBy=multi-user.target

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
