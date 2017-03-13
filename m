From: Matthew Fornero <mfornero@mathworks.com>
Date: Mon, 13 Mar 2017 15:35:02 -0400
Subject: [Buildroot] [PATCH] libiio: Disable MATLAB Bindings on Target
Message-ID: <1489433702-3044-1-git-send-email-mfornero@mathworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If building on a machine with MATLAB installed, the MATLAB bindings will
default to ON, which is not the desired behavior for a cross build.

The bindings are designed to be called from within MATLAB, and we are
not currently running MATLAB on buildroot-generated targets.

This does not preclude the use of the bindings from a host connecting
over the network backend (assuming libiio on the host has the bindings
enabled).

Signed-off-by: Matthew Fornero <mfornero@mathworks.com>
---
 package/libiio/libiio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index 8977610..aaa6c70 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -14,6 +14,7 @@ LIBIIO_CONF_OPTS = -DENABLE_IPV6=ON \
 	-DWITH_LOCAL_BACKEND=$(if $(BR2_PACKAGE_LIBIIO_LOCAL_BACKEND),ON,OFF) \
 	-DWITH_NETWORK_BACKEND=$(if $(BR2_PACKAGE_LIBIIO_NETWORK_BACKEND),ON,OFF) \
 	-DWITH_MATLAB_BINDINGS_API=OFF \
+	-DMATLAB_BINDINGS=OFF \
 	-DINSTALL_UDEV_RULE=$(if $(BR2_PACKAGE_HAS_UDEV),ON,OFF) \
 	-DWITH_TESTS=$(if $(BR2_PACKAGE_LIBIIO_TESTS),ON,OFF) \
 	-DWITH_DOC=OFF
-- 
2.1.4
