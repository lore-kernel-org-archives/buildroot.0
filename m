From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Jun 2014 23:03:48 +0200
Subject: [Buildroot] [git commit] hdparm: prevent package makefile from
	stripping the hdparm binary
Message-ID: <20140611210500.36A4A9CFCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=11dbb615338cd768acc2c3138064ddf557e9b60b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Packages shouldn't strip executables by themselves, so that Buildroot
controls whether stripping should occur or not. This also fixes the
build on Blackfin FLAT where stripping actually doesn't work because
stripping FLAT binaries is not supported.

Fixes:

  http://autobuild.buildroot.org/results/7d4/7d4e59c96928a06db5091235bf2eacf462ba8a21/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hdparm/hdparm.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/hdparm/hdparm.mk b/package/hdparm/hdparm.mk
index 1a200fb..0ca3c39 100644
--- a/package/hdparm/hdparm.mk
+++ b/package/hdparm/hdparm.mk
@@ -12,7 +12,8 @@ HDPARM_LICENSE_FILES = LICENSE.TXT
 define HDPARM_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
 		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)"
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		STRIP=/bin/true
 endef
 
 define HDPARM_INSTALL_TARGET_CMDS
