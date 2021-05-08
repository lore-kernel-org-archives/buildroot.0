From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 May 2021 18:24:01 +0200
Subject: [Buildroot] [git commit] package/cryptsetup: disable tmpfiles.d for
 host build
Message-ID: <20210508155612.0F5A786BE1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2e82f9fa5fc7ab60ad2965edb404362b37673dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building host-cryptsetup, if tmpfiles.d support is enabled then the
install step tries to install /usr/lib/tmpfiles.d/cryptsetup.conf
globally on the host system.

Even if the tmpfiles.d config were installed correctly in the host
directory, nothing would ever run these rules, so disable this feature
via configure.

Signed-off-by: John Keeping <john@metanate.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
