From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2020 10:55:37 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/zstd: avoid
 compilation during host-zstd install step
Message-ID: <20201002085245.57CC18E818@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72dcbcf42c4f5f2f04cea78436907386464de26a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

The host-zstd-build step was not actually compiling the library:

make[1]: Entering directory '/buildroot/output/build/host-zstd-1.4.5/lib'
make[1]: Nothing to be done for 'default'.
make[1]: Leaving directory '/buildroot/output/build/host-zstd-1.4.5/lib'

and the actual compilation was part of the install step.
This is not how other Buildroot packages work.

Make sure to specify which library targets we want instead. The total amount
of compiled files does not change with this patch.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2e8bf36dc4421f2213f8fa6de91b2c9bf3d64e45)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zstd/zstd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index e2ba12b058..35002da332 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -71,7 +71,7 @@ endef
 # note: no 'HAVE_...' options for host library build only
 define HOST_ZSTD_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
-		-C $(@D)/lib
+		-C $(@D)/lib libzstd.a libzstd
 	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
 		-C $(@D) zstd
 endef
