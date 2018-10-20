From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 01:50:35 +0200
Subject: [Buildroot] [git commit] package/nss-myhostname: Add package
Message-ID: <20181020234905.0903F88085@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d25f4ce2eea4a42210b6c7ff4fbfd8a8e8845fcb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nss-myhostname is helpful to resolve local hostname without domain.
For instance, if we set hostname to myboard and ping myboard
without .local suffix, it fails if /etc/hosts stays unchanged.

nss-myhostname modifies /etc/nsswitch.conf file.
It set myhostname resolution just after files in hosts line,
for example:
    hosts: files myhostname mdns4_minimal [NOTFOUND=return] dns

This choice comes from Debian commit [1] and Yocto recipe [2].
Also, nss-myhostname author suggests myhostname should be used as
a backup and appended at the end of hosts line. Both choices are valid.

Discussion on Debian bug tracker [3] gives some details on issue
that may occurs using nss-myhostname (see fqdn).

Note nss-myhostname is already included in systemd, so ensure is conflicts
with it.

[1] http://git.nomeata.de/?p=libnss-myhostname.git;a=commit;h=5104d7f0045df55ee8be526e8c84078750e1e0ed
[2] https://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
[3] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=756224

[Peter: simplify sed invocation, adjust Config.in]
Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                 |  3 +++
 package/Config.in                          |  1 +
 package/nss-myhostname/Config.in           | 12 ++++++++++++
 package/nss-myhostname/nss-myhostname.hash |  3 +++
 package/nss-myhostname/nss-myhostname.mk   | 20 ++++++++++++++++++++
 5 files changed, 39 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 61f3cac9e4..3bcbf817f0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2139,6 +2139,9 @@ F:	package/openmpi/
 F:	package/pinentry/
 F:	package/trinity/
 
+N:	Vincent Prince <vincent.prince.fr@gmail.com>
+F:	package/nss-myhostname/
+
 N:	Vincent Stehl?? <vincent.stehle@laposte.net>
 F:	package/i7z/
 F:	package/msr-tools/
diff --git a/package/Config.in b/package/Config.in
index 8d53c72138..177861e358 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1555,6 +1555,7 @@ menu "Networking"
 	source "package/nghttp2/Config.in"
 	source "package/norm/Config.in"
 	source "package/nss-mdns/Config.in"
+	source "package/nss-myhostname/Config.in"
 	source "package/nss-pam-ldapd/Config.in"
 	source "package/omniorb/Config.in"
 	source "package/openldap/Config.in"
diff --git a/package/nss-myhostname/Config.in b/package/nss-myhostname/Config.in
new file mode 100644
index 0000000000..bdd9830e0a
--- /dev/null
+++ b/package/nss-myhostname/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_NSS_MYHOSTNAME
+	bool "nss-myhostname"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_PACKAGE_SYSTEMD_MYHOSTNAME
+	help
+	  Name Service Switch module for resolving the local hostname
+
+	  http://0pointer.de/lennart/projects/nss-myhostname
+
+comment "nss-myhostname needs a glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_PACKAGE_SYSTEMD_MYHOSTNAME
diff --git a/package/nss-myhostname/nss-myhostname.hash b/package/nss-myhostname/nss-myhostname.hash
new file mode 100644
index 0000000000..dfa531c94b
--- /dev/null
+++ b/package/nss-myhostname/nss-myhostname.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  2ba744ea8d578d1c57c85884e94a3042ee17843a5294434d3a7f6c4d67e7caf2 nss-myhostname-0.3.tar.gz
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861 LICENSE
diff --git a/package/nss-myhostname/nss-myhostname.mk b/package/nss-myhostname/nss-myhostname.mk
new file mode 100644
index 0000000000..08683a542b
--- /dev/null
+++ b/package/nss-myhostname/nss-myhostname.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+## nss-myhostname
+#
+################################################################################
+
+NSS_MYHOSTNAME_VERSION = 0.3
+NSS_MYHOSTNAME_SITE = http://0pointer.de/lennart/projects/nss-myhostname
+NSS_MYHOSTNAME_LICENSE = LGPL-2.1+
+NSS_MYHOSTNAME_LICENSE_FILES = LICENSE
+
+# add myhostname after files if missing
+define MYHOSTNAME_SET_NSSWITCH
+	$(SED) '/^hosts:/ {/myhostname/! s/files/files myhostname/}' \
+		$(TARGET_DIR)/etc/nsswitch.conf
+endef
+
+NSS_MYHOSTNAME_TARGET_FINALIZE_HOOKS += MYHOSTNAME_SET_NSSWITCH
+
+$(eval $(autotools-package))
