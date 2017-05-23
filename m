From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 May 2017 16:28:25 +0200
Subject: [Buildroot] [git commit] mono: remove copy of host etc files on
	install
Message-ID: <20170523142834.320B782968@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=675101b0fe3e751b447818d8ce8d0d009bd39b25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the mono package is installed, the autotools installer installs
the /etc/mono files to the target. A post_install hook then copies
over the mono libraries to the target as well as the host /etc/mono
files which overrides the target files. The target specific mono
configuration file (/etc/mono/config) is overridden with the host
settings. This causes mono on the target to be unable to locate target
specific .so files as it overrides the changes enacted by the patches
for the package.

Signed-off-by: Dustin Johnson <dustin.r.johnson@gmail.com>
Tested-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Reviewed-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Acked-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mono/mono.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 58dfab7..c6e2cd3 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -29,7 +29,6 @@ MONO_CONF_OPTS = --with-mcs-docs=no \
 define MONO_INSTALL_LIBS
 	rsync -av --exclude=*.so --exclude=*.mdb \
 		$(HOST_DIR)/usr/lib/mono $(TARGET_DIR)/usr/lib/
-	rsync -av $(HOST_DIR)/etc/mono $(TARGET_DIR)/etc
 endef
 
 MONO_POST_INSTALL_TARGET_HOOKS += MONO_INSTALL_LIBS
