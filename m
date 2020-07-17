From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Fri, 17 Jul 2020 14:06:54 +0200
Subject: [Buildroot] [PATCH] package/host-e2fsprogs: explicitly do not
 install udev and systemd files
Message-ID: <20200717120654.548833-1-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Explicitly do not install udev rules and systemd units when installing
the host version of e2fsprogs, as we do not need those files when
calling host tools provided by e2fsprogs from Buildroot.

This fixes a weird issue I encountered: host-e2fsprogs was built and
installed without any issue when building an image from scratch. But any
attempt to rebuild host-e2fsprogs alone was failing during the
installation steps as it tried to install files to the host system.

This is because e2fsprogs' build system (autotools) is using the prefix
given at configuration time when installing its binaries, configuration
files, man pages, etc... but not when installing its systemd units and
udev rules.

The issue did not arise when building it from scratch, as host-e2fsprogs
do not have a dependency on host-udev/systemd, so its configure script
did not automatically enable udev/systemd installation steps at first.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---

Hello,

When looking at this, I agree a good fix would be to fix it upstream, so
that systemd and udev files are correctly installed. I believe we would
see a similar issue for the target package (and the build configuration
to be wrong, depending on the build order of packages). I had a look at
the configure.ac file, but I have to admit I'm not familiar at all with
autotools, and coming up with a clean fix seemed not straightforward to
me. I can give pointers if someone wants to fix it.

I also believe this patch makes sense, even if not for the sole purpose
of fixing the host-e2fsprogs installation issue.

Thanks,
Antoine

 package/e2fsprogs/e2fsprogs.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 41986eec585e..f6642d8de164 100644
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
-- 
2.26.2
