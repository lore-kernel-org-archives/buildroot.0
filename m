From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 14:50:42 +0100
Subject: [Buildroot] [git commit] package/qemu: add option to enable virtual
 filesystem in host qemu
Message-ID: <20181202071558.B41E982855@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0f49e6484015351f697ab843da25b5421c23fd6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
[Thomas: tweak option prompt]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/Config.in.host | 6 ++++++
 package/qemu/qemu.mk        | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 957c7d2ae1..f99f3e05cf 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -67,4 +67,10 @@ config BR2_PACKAGE_HOST_QEMU_VDE2
 	  Ethernet and can be used to create virtual switches to
 	  "plug" both physical and virtual machines in them.
 
+config BR2_PACKAGE_HOST_QEMU_VIRTFS
+	bool "Virtual filesystem support"
+	help
+	  Enables support for virtual filesystem in Qemu allowing
+	  shared filesystem between Qemu and its emulated target.
+
 endif
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 5bdf390bc9..5ee6abf731 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -253,6 +253,10 @@ HOST_QEMU_OPTS += --enable-vde
 HOST_QEMU_DEPENDENCIES += host-vde2
 endif
 
+ifdef ($(BR2_PACKAGE_HOST_QEMU_VIRTFS),y)
+HOST_QEMU_OPTS += --enable-virtfs
+endif
+
 # Override CPP, as it expects to be able to call it like it'd
 # call the compiler.
 define HOST_QEMU_CONFIGURE_CMDS
