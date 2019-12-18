From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 18 Dec 2019 16:51:44 +0100
Subject: [Buildroot] [git commit] package/systemd: add host variant
Message-ID: <20191218172934.1898E8C005@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35c11a027c88a3c943554eefbbed051fd2d98a50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the infrastructure to build the host version of systemd
* disable all optional features, they can be re-added when needed
* systemd has creative way of dealing with cross compile
  we build a "normal" host systemd, but install it in $HOST_DIR
  we use systemctl --root to correctly act on TARGET_DIR
* we need to adjust RPATH using patchelf because meson can't do it
  correctly by itsel

The first question is: why do we use --prefix=/usr ?

systemd will store its --prefix in all the executables it generates. As
such, systemctl will have a hardcoded 'prefix', where it will manipulate
and create files/symlinks in. When called natively, this is nice and
shinny.

However, for cross-setup, that does not work obviously.

So, systemd has its tools know about the 'root' directory where this
prefix should be related to. We can call systemctl --root=$(TARGET_DIR)
and systemctl wil do the links and such in there.

However, it does so by appending its known prefix to it.

So, if we were to configure host-systemd as we usually do, with
--prefix=$(HOST_DIR), then when we would call host systemctl --root=$(TARGET_DIR)
it would look for files in $(TARGET_DIR)/$(HOST_DIR), which is wrong.

Calling the host systemctl without --root is also wrong, as it would look for
files in $(HOST_DIR)

So, there is no satisfying official support for this case.

The trick then, is to configure systemd with the prefix it would expect
at runtime (on the target!), that is with /usr, but install out-of-tree.

That was it for the first part of the question: why do we use --prefix.

Now, the second question is: why do we need to muck up with the rpath
after installation?

Well, this boils down to meson (and not systemd itself). When it
installs executables, meson will handily insert whatever rpath the
package meson.build would tell it to use. systemd installs libs in
$(prefix)/lib/systemd and has a NEEDED to those libs, so it uses an
RPATH to find those libs, and meson does inject that RPATH into the
installed executables.

However, we Buildroot also want to insert our own RPATH, because systemd
uses util-linux' libs and libcap, installed in $(HOST_DIR), so it needs
our RPATH.

However, meson can not extend the RPATH from the LDFLAGS in the
environment; meson can only set the RPATH from what it knows about from
the package's meson.build.

That, in addition to the --prefix=/usr issue above, means that the
executables installed by host-systemd have an RPATH set to
/usr/lib/systemd. when we would want it to be set to
$(HOST_DIR)/lib:$(HOST_DIR)/lib/systemd

That's what is done in the post-install hook: set the RPATH to the
appropriate values.

Signed-off-by: J??r??my Rosen <jeremy.rosen@smile.fr>
[yann.morin.1998 at free.fr:
  - reformatting in commit log
  - declare host variant after target variant
  - simplify comments
  - slight reordering of variable (HOST_SYSTEMD_NINJA_ENV moved)
  - reformatting for mutli-line variable (HOST_SYSTEMD_HOST_TOOLS)
  - don't split HOST_SYSTEMD_CONF_OPTS in two sets
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in.host         |  1 +
 package/systemd/Config.in.host |  3 ++
 package/systemd/systemd.mk     | 88 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 92 insertions(+)

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
index a292a7512b..84ca64e588 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -550,4 +550,92 @@ endef
 SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
 SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
 
+# We need a very minimal host variant, so we disable as much as possible.
+HOST_SYSTEMD_CONF_OPTS = \
+	-Dsplit-bin=true \
+	-Dsplit-usr=false \
+	--prefix=/usr \
+	--libdir=lib \
+	--sysconfdir=/etc \
+	--localstatedir=/var \
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
+# * systemd provides a install_rpath instruction to meson because the binaries
+#   need to link with libsystemd which is not in a standard path
+# * meson can only replace the RPATH, not append to it
+# * the original rpath is thus lost.
+# * the original path had been tweaked by buildroot via LDFLAGS to add
+#   $(HOST_DIR)/lib
+# * thus re-tweak rpath after the installation for all binaries that need it
+HOST_SYSTEMD_HOST_TOOLS = \
+	systemd-analyze \
+	systemd-mount \
+	systemctl \
+	udevadm
+
+HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
+
+define HOST_SYSTEMD_FIX_RPATH
+	$(foreach f,$(HOST_SYSTEMD_HOST_TOOLS), \
+		$(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib:$(HOST_DIR)/lib/systemd $(HOST_DIR)/bin/$(f)
+	)
+endef
+HOST_SYSTEMD_POST_INSTALL_HOOKS += HOST_SYSTEMD_FIX_RPATH
+
 $(eval $(meson-package))
+$(eval $(host-meson-package))
