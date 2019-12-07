From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
Date: Sat,  7 Dec 2019 19:00:37 +0100
Subject: [Buildroot] [PATCH v3 01/13] new recipe : host-systemd
In-Reply-To: <20191207180049.3245578-1-jeremy.rosen@smile.fr>
References: <20191207180049.3245578-1-jeremy.rosen@smile.fr>
Message-ID: <20191207180049.3245578-2-jeremy.rosen@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the infrastructure to build the host version of systemd
* disable all optional features, they can be re-added when needed
* systemd has creative way of dealing with cross compile
  we build a "normal" host systemd, but install it in $HOST_DIR
  we use systemctl --root to correctly act on TARGET_DIR
* we need to adjust RPATH using patchelf because meson can't do it
  correctly by itsel

Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
---
 package/Config.in.host         |  1 +
 package/systemd/Config.in.host |  3 ++
 package/systemd/systemd.mk     | 93 ++++++++++++++++++++++++++++++++++
 3 files changed, 97 insertions(+)
 create mode 100644 package/systemd/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 758c268e00..62e860d7c3 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -70,6 +70,7 @@ menu "Host utilities"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
 	source "package/swig/Config.in.host"
+	source "package/systemd/Config.in.host"
 	source "package/tegrarcm/Config.in.host"
 	source "package/ti-cgt-pru/Config.in.host"
 	source "package/uboot-tools/Config.in.host"
diff --git a/package/systemd/Config.in.host b/package/systemd/Config.in.host
new file mode 100644
index 0000000000..219f24239e
--- /dev/null
+++ b/package/systemd/Config.in.host
@@ -0,0 +1,3 @@
+# Select this if you need host systemd tools (e.g. systemctl)
+config BR2_PACKAGE_HOST_SYSTEMD
+	bool
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index ebec9bdd91..5aeaef3904 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -551,3 +551,96 @@ SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
 SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
 
 $(eval $(meson-package))
+
+#
+# Host-systemd configuration
+#
+#Options tweaked for buildroot
+HOST_SYSTEMD_CONF_OPTS= \
+	-Dsplit-bin=true \
+	-Dsplit-usr=false \
+	--prefix=/usr \
+	--libdir=lib \
+	--sysconfdir=/etc \
+	--localstatedir=/var
+
+#disable everything else
+HOST_SYSTEMD_CONF_OPTS+= \
+	-Dutmp=false \
+	-Dhibernate=false \
+	-Dldconfig=false \
+	-Dresolve=false \
+	-Defi=false \
+	-Dtpm=false \
+	-Denvironment-d=false \
+	-Dbinfmt=false \
+	-Dcoredump=false \
+	-Dpstore=false \
+	-Dlogind=false \
+	-Dhostnamed=false \
+	-Dlocaled=false \
+	-Dmachined=false \
+	-Dportabled=false \
+	-Dnetworkd=false \
+	-Dtimedated=false \
+	-Dtimesyncd=false \
+	-Dremote=false \
+	-Dcreate-log-dirs=false \
+	-Dnss-myhostname=false \
+	-Dnss-mymachines=false \
+	-Dnss-resolve=false \
+	-Dnss-systemd=false \
+	-Dfirstboot=false \
+	-Drandomseed=false \
+	-Dbacklight=false \
+	-Dvconsole=false \
+	-Dquotacheck=false \
+	-Dsysusers=false \
+	-Dtmpfiles=false \
+	-Dimportd=false \
+	-Dhwdb=false \
+	-Drfkill=false \
+	-Dman=false \
+	-Dhtml=false \
+	-Dsmack=false \
+	-Dpolkit=false \
+	-Dblkid=false \
+	-Didn=false \
+	-Dadm-group=false \
+	-Dwheel-group=false \
+	-Dzlib=false \
+	-Dgshadow=false \
+	-Dima=false \
+	-Dtests=false \
+	-Dglib=false \
+	-Dacl=false \
+	-Dsysvinit-path=''
+
+HOST_SYSTEMD_DEPENDENCIES = \
+	host-util-linux \
+	host-patchelf \
+	host-libcap \
+	host-gperf
+
+# Fix RPATH After installation
+# * systemd provides a install_rpath instruction to meson because the binaries need to link with
+#   libsystemd which is not in a standard path
+# * meson can only replace the RPATH, not append to it
+# * the original rpatch is thus lost.
+# * the original path had been tweaked by buildroot vial LD_FLAGS to add $(HOST_DIR)/lib
+# * thus re-tweak rpath after the installation for all binaries that need it
+#buildroot detects incorrect RPATH, so adding new binaries should be safe (it won't compile
+#unless properly integrated).
+HOST_SYSTEMD_HOST_TOOLS = \
+	systemd-analyze  systemd-mount systemctl udevadm
+
+define HOST_SYSTEMD_FIX_RPATH
+	$(foreach f,$(HOST_SYSTEMD_HOST_TOOLS), \
+		$(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib:$(HOST_DIR)/lib/systemd $(HOST_DIR)/bin/$(f)
+	)
+endef
+
+HOST_SYSTEMD_POST_INSTALL_HOOKS +=  HOST_SYSTEMD_FIX_RPATH
+HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
+
+$(eval $(host-meson-package))
-- 
2.24.0
