From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Dec 2017 22:33:53 +0100
Subject: [Buildroot] [git commit] tar: do not build SELinux support for host
 variant
Message-ID: <20171230213543.3BEB683594@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=121807c08927c0a0d04c965beb6a8785ea89e47f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If we don't explicitly disable SELinux support in the host-tar build,
it might pick up system-wide installed SELinux libraries, causing the
tar in HOST_DIR/bin/ to depend on the host SELinux libraries, which is
not desirable to make the SDK portable/relocatable.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tar/tar.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index cb2ddc0..a8a15d9 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -44,4 +44,7 @@ define HOST_TAR_EXTRACT_CMDS
 	mv $(@D)/tar-$(TAR_VERSION)/* $(@D)
 	rmdir $(@D)/tar-$(TAR_VERSION)
 endef
+
+HOST_TAR_CONF_OPTS = --without-selinux
+
 $(eval $(host-autotools-package))
