From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jun 2015 22:02:35 +0200
Subject: [Buildroot] [git commit] systemd: bump to version 221
Message-ID: <20150629200958.C646F8046C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ac0a31090ad44531fd14a3e3b1bb7e23c1577f68
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump to version 221
- Update hash file

- Add --disable-gnuefi to configure options to avoid a failure like this
  one:

  checking for /usr/lib/gnuefi/elf_ia32_efi.lds... configure: error:
  cannot check for file existence when cross compiling

- Remove gudev logic since it has been removed from the systemd tree and
  it is now an external project.

Announcement URL:

  http://lists.freedesktop.org/archives/systemd-devel/2015-June/033170.html

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/systemd.hash |    2 +-
 package/systemd/systemd.mk   |   10 ++--------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index d2ac740..f746051 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  5c57113454e37c040d0cb481bd960ae7cf3a3fe0a231ff4945259bc74503f2d9  systemd-219.tar.xz
+sha256  085e088650afbfc688ccb13459aedb1fbc7c8810358605b076301f472d51cc4f  systemd-221.tar.xz
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 98bda02..ee17bc8 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 219
+SYSTEMD_VERSION = 221
 SYSTEMD_SITE = http://www.freedesktop.org/software/systemd
 SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.xz
 SYSTEMD_LICENSE = LGPLv2.1+; GPLv2+ for udev; MIT-like license for few source files listed in README
@@ -39,6 +39,7 @@ SYSTEMD_CONF_OPTS += \
 	--with-dbussystemservicedir=/usr/share/dbus-1/system-services \
 	--enable-split-usr \
 	--disable-efi \
+	--disable-gnuefi \
 	--disable-tests \
 	--disable-dbus \
 	--without-python
@@ -63,13 +64,6 @@ else
 SYSTEMD_CONF_OPTS += --disable-acl
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
-SYSTEMD_CONF_OPTS += --enable-gudev
-SYSTEMD_DEPENDENCIES += libglib2
-else
-SYSTEMD_CONF_OPTS += --disable-gudev
-endif
-
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 SYSTEMD_CONF_OPTS += --enable-seccomp
 SYSTEMD_DEPENDENCIES += libseccomp
