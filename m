From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Aug 2018 21:14:55 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] cryptsetup: fix build
 with old host kernel headers
Message-ID: <20180823190734.D2DD78E245@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6250b3460a3279f83bcc52233aca30c3a2d6b945
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

By default cryptsetup configure fails when the if_alg.h kernel header is
not available. Kernels older than 2.6.38, like the one in RHEL 6 hosts,
do not provide this header. Since we don't need the kernel crypto
feature for host tools, just disable this feature to allow successful
completion of the configure script.

While at it, fix a typo in the --with-crypto_backend option (hyphen ->
underscore).

Should fix:
http://autobuild.buildroot.net/results/ffd/ffda2579b215b53161025b7bc703091cb30ef95d/
http://autobuild.buildroot.net/results/c48/c48015f76b13fec38f650f66824e7b986eb28572/
http://autobuild.buildroot.net/results/be6/be621f71bf9da8719bf7fc943eccc9b4dc2cc43e/

Cc: Martin Hicks <mort@bork.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bef1786475a743bd2cf76484b5d6a3158c0d7bc5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cryptsetup/cryptsetup.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index d5ab022b77..d81aa7b341 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -36,7 +36,8 @@ HOST_CRYPTSETUP_DEPENDENCIES = \
 	host-json-c \
 	host-openssl
 
-HOST_CRYPTSETUP_CONF_OPTS = --with-crypto-backend=openssl
+HOST_CRYPTSETUP_CONF_OPTS = --with-crypto_backend=openssl \
+	--disable-kernel_crypto
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
