From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Nov 2018 21:43:34 +0100
Subject: [Buildroot] [git commit] package/pkg-luarocks: drop flock at
 installation time
Message-ID: <20181202071556.86D468843B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=867683022318ff061e52b31229f7850d2ca84e11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 22b327fc743b48a33aec0a9190bd67118641b294 ("pkg-luarocks: fix
top-level parallel makefile support"), a flock on $(TARGET_DIR) was
added to ensure that two Luarocks packages are not installed at the
same time.

However, to support top-level parallel build, we have now clearly
decided that per-package folders is a requirement. Therefore,
TARGET_DIR is anyway going to be different for each package, making
this flock unnecessary.

Trying to use top-level parallel build without per-package folder is
simply not supported, so this commit drops the unnecessary flock.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pkg-luarocks.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index 29c5e66cd1..f0985433b7 100644
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -63,7 +63,7 @@ endif
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	cd $$($(2)_SRCDIR) && $$(LUAROCKS_RUN_ENV) flock $$(TARGET_DIR) \
+	cd $$($(2)_SRCDIR) && $$(LUAROCKS_RUN_ENV) \
 		$$(LUAROCKS_RUN_CMD) make --keep $$($(2)_ROCKSPEC) $$($(2)_BUILD_OPTS)
 endef
 endif
