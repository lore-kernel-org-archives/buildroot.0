From: John Keeping <john@metanate.com>
Date: Fri,  7 May 2021 16:21:59 +0100
Subject: [Buildroot] [PATCH] package/cryptsetup: disable tmpfiles.d for host
 build
Message-ID: <20210507152159.542208-1-john@metanate.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building host-cryptsetup, if tmpfiles.d support is enabled then the
install step tries to install /usr/lib/tmpfiles.d/cryptsetup.conf
globally on the host system.

Even if the tmpfiles.d config were installed correctly in the host
directory, nothing would ever run these rules, so disable this feature
via configure.

Signed-off-by: John Keeping <john@metanate.com>
---
 package/cryptsetup/cryptsetup.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 719885b59c..cd5883d0b4 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -43,7 +43,8 @@ HOST_CRYPTSETUP_DEPENDENCIES = \
 
 HOST_CRYPTSETUP_CONF_OPTS = --with-crypto_backend=openssl \
 	--disable-kernel_crypto \
-	--enable-blkid
+	--enable-blkid \
+	--with-tmpfilesdir=no
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.31.1
