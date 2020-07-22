From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 13:35:33 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/e2fsprogs:
 explicitly do not install udev and systemd files for host variant
Message-ID: <20200722114332.EBB1187B52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1356c195132c98bc8365fcb3d59908f04e2f6c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Explicitly do not install udev rules and systemd units when installing
the host version of e2fsprogs, as we do not need those files when
calling host tools provided by e2fsprogs from Buildroot.

This fixes a weird issue I encountered: host-e2fsprogs was built and
installed without any issue when building an image from scratch. But
any attempt to rebuild host-e2fsprogs alone was failing during the
installation steps as it tried to install files to the host system.

This is because e2fsprogs' build system (autotools) is using the
prefix given at configuration time when installing its binaries,
configuration files, man pages, etc... but not when installing its
systemd units and udev rules.

The issue did not arise when building it from scratch, as
host-e2fsprogs do not have a dependency on host-udev/systemd, so its
configure script did not automatically enable udev/systemd
installation steps at first.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ea6ddd367140f38bb512cf35de9f84d0ac853cff)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/e2fsprogs/e2fsprogs.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 41986eec58..f6642d8de1 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -29,7 +29,9 @@ HOST_E2FSPROGS_CONF_OPTS = \
 	--disable-testio-debug \
 	--enable-symlink-install \
 	--enable-elf-shlibs \
-	--with-crond-dir=no
+	--with-crond-dir=no \
+	--with-udev-rules-dir=no \
+	--with-systemd-unit-dir=no
 
 # Set the binary directories to "/bin" and "/sbin", as busybox does,
 # so that we do not end up with two versions of e2fs tools.
