From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 18:17:35 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/quagga:
 unconditionally create /etc/quagga
Message-ID: <20190902161338.B50917FCE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=347f3e3e3f31b5f79f1bbcb4fbafdb9b9a48647f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

/etc/quagga is listed in QUAGGA_PERMISSIONS, but is only created when
some of the quagga sub-options are enabled. When none of those
sub-options are enabled, /etc/quagga is not created, causing a build
failure when the filesystem images are created:

makedevs: line 1: recursive failed for /home/thomas/projets/outputs/quagga-minimal/build/buildroot-fs/tar/target/etc/quagga: No such file or directory

Since it is too cumbersome to maintain which sub-options exactly lead
to /etc/quagga being created, simply create /etc/quagga
unconditionally. It will simply be empty when the quagga package
doesn't install anything in it.

For the record, here is the list of files installed in /etc/quagga
when all quagga sub-options are enabled:

  bgpd.conf.sample bgpd.conf.sample2 isisd.conf.sample
  ospf6d.conf.sample ospfd.conf.sample pimd.conf.sample
  ripd.conf.sample ripngd.conf.sample vtysh.conf.sample
  zebra.conf.sample

Fixes:

  http://autobuild.buildroot.net/results/cdb66589909fd3996186f7db7d1f19a3b03d58a0/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 939c0187cae92793cb282e447a65f39e407a515c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/quagga/quagga.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 8aa58aceef..ef18c42a81 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -63,6 +63,16 @@ define QUAGGA_PERMISSIONS
 	/etc/quagga d 755 quagga quagga - - - - -
 endef
 
+# In order for the QUAGGA_PERMISSIONS variable above to work,
+# /etc/quagga has to exist. However, this package without any
+# sub-option enabled will not create /etc/quagga, so let's create it
+# unconditionally in a post-install hook, in case it hasn't been
+# already created by the quagga installation.
+define QUAGGA_CREATE_ETC_QUAGGA
+	mkdir -p $(TARGET_DIR)/etc/quagga
+endef
+QUAGGA_POST_INSTALL_TARGET_HOOKS += QUAGGA_CREATE_ETC_QUAGGA
+
 ifeq ($(BR2_PACKAGE_QUAGGA_NHRPD),y)
 QUAGGA_CONF_OPTS += --enable-nhrpd
 QUAGGA_DEPENDENCIES += c-ares
