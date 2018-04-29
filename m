From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Apr 2018 21:36:25 +0200
Subject: [Buildroot] [git commit] libtomcrypt: fix headers installation path
Message-ID: <20180429193811.EAD7B803F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73e1f9b0a46ccf55419f43c35ca762a8fdc3b32c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libtomcrypt installs its headers by default in /usr/local/include under
the staging sysroot. This path is not in the default search patch of
some toolchains. This breaks the build of dropbear. Set the PREFIX make
variable to fix that.

While at it, split the long install command for better readability.

Fixes (dropbear):
http://autobuild.buildroot.net/results/215/2157679e276623ae875d1b31f3e5a68caf586536/
http://autobuild.buildroot.net/results/956/956d254675e6500c19c3bb7ccdf12ce136858720/
http://autobuild.buildroot.net/results/01e/01ec89a81c4ec6e36e2f81b5a9394050a91df654/

Cc: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtomcrypt/libtomcrypt.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libtomcrypt/libtomcrypt.mk b/package/libtomcrypt/libtomcrypt.mk
index 974ef3f2f2..ff6222cc91 100644
--- a/package/libtomcrypt/libtomcrypt.mk
+++ b/package/libtomcrypt/libtomcrypt.mk
@@ -20,7 +20,9 @@ define LIBTOMCRYPT_BUILD_CMDS
 endef
 
 define LIBTOMCRYPT_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" NODOCS=1 INSTALL_USER=$(shell id -u) INSTALL_GROUP=$(shell id -g) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" \
+		PREFIX=/usr NODOCS=1 INSTALL_USER=$(shell id -u) \
+		INSTALL_GROUP=$(shell id -g) install
 endef
 
 $(eval $(generic-package))
