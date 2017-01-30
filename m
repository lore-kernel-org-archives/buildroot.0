From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 30 Jan 2017 12:09:00 -0500
Subject: [Buildroot] [PATCH 1/1] libselinux: Fix host installation issue.
Message-ID: <20170130170900.12471-1-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libselinux currently installs the python module in the host
directory starting with the full path to the buildroot directory.

IE: If buildroot was in /home/foo/buildroot, the python
module will be installed to:
/home/foo/buildroot/output/host/home/foo/buildroot/output/host/usr/lib/

This patch fixes this by not passing the DESTDIR=$(HOST_DIR) when running
the install commands, as passing DESTDIR during the build command will
set the proper directory to install to.  This only effects the pywrap
module.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/libselinux/libselinux.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 44120c4..bd3f984 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -80,9 +80,10 @@ define HOST_LIBSELINUX_INSTALL_CMDS
 		$(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) \
 		SHLIBDIR=$(HOST_DIR)/usr/lib SBINDIR=$(HOST_DIR)/usr/sbin install
 	(cd $(HOST_DIR)/usr/lib; $(HOSTLN) -sf libselinux.so.1 libselinux.so)
-	# Install python interface wrapper
+	# Install python interface wrapper. Do not pass destdir as this will
+	# case the python module to install in the incorrect location.
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
-		$(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) install-pywrap
+		$(HOST_LIBSELINUX_MAKE_OPTS) install-pywrap
 endef
 
 $(eval $(generic-package))
-- 
2.9.3
