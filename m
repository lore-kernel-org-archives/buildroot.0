From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Mar 2020 21:23:08 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/util-linux:
 disable systemd for host build
Message-ID: <20200307202451.5ED2B8FBF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=576113dc21afe5bbb3fff73afcada8bf5a84ebd1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

When building host-util-linux, the systemdsystemunitdir is set to the
real host directory, so the install step fails with:

/usr/bin/install: cannot remove '/usr/lib/systemd/system/fstrim.service': Permission denied
/usr/bin/install: cannot remove '/usr/lib/systemd/system/fstrim.timer': Permission denied

Since we don't need systemd support in host-util-linux, unconditionally
disable it for the host build.

Signed-off-by: John Keeping <john@metanate.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 86441b9fd6c8472d2e6f0917cc308ea740ee7fd7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/util-linux.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 549442232e..b6ccaaa78d 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -38,7 +38,10 @@ UTIL_LINUX_CONF_OPTS += \
 HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
 
 # We also don't want the host-python dependency
-HOST_UTIL_LINUX_CONF_OPTS = --without-python
+HOST_UTIL_LINUX_CONF_OPTS = \
+	--without-systemd \
+	--with-systemdsystemunitdir=no \
+	--without-python
 
 # Prevent the installation from attempting to move shared libraries from
 # ${usrlib_execdir} (/usr/lib) to ${libdir} (/lib), since both paths are
