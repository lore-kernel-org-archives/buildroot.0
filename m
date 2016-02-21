From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 21:28:55 +0100
Subject: [Buildroot] [git commit] package/lxc: add optional support for
	libseccomp
Message-ID: <20160221202911.ED24F81819@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e461df5dd0cc37bde6908a932528a74a512636d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When libseccomp was compiled before, lxc will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/libexec/lxc/lxc-monitord | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [liblxc.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libcap.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libseccomp.so.2]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lxc/lxc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index e382f4d..8190969 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -15,4 +15,11 @@ LXC_CONF_OPTS = --disable-apparmor --with-distro=buildroot \
 	--disable-lua --disable-python \
 	$(if $(BR2_PACKAGE_BASH),,--disable-bash)
 
+ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+LXC_CONF_OPTS += --enable-seccomp
+LXC_DEPENDENCIES += libseccomp
+else
+LXC_CONF_OPTS += --disable-seccomp
+endif
+
 $(eval $(autotools-package))
