From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Aug 2019 00:13:37 +0200
Subject: [Buildroot] [git commit] docs/manual: document providers from
 br2-external
Message-ID: <20190803221405.180718E02E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91251ceddece5f5fc807f49b340f1aa372cf95f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add documentation about how a br2-external tree can provide an external
toolchain or a libjpeg or openssl alternative implementation.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/customize-outside-br.txt | 89 +++++++++++++++++++++++++++++++++++-
 1 file changed, 88 insertions(+), 1 deletion(-)

diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index 353b2ed75f..6ab01bcb1f 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -81,7 +81,8 @@ in the following chapters:
 
 Apart from those mandatory files, there may be additional and optional
 content that may be present in a br2-external tree, like the +configs/+
-directory. They are described in the following chapters as well.
+or +provides/+ directories. They are described in the following chapters
+as well.
 
 A complete example br2-external tree layout is also described later.
 
@@ -186,6 +187,22 @@ the one from the last br2-external tree is used. It is thus possible
 to override a defconfig bundled in Buildroot or another br2-external
 tree.
 
+===== The +provides/+ directory
+
+For some packages, Buildroot provides a choice between two (or more)
+implementations of API-compatible such packages. For example, there is
+a choice to choose either libjpeg ot jpeg-turbo, and another choice
+between openssl or libressl. Finally, there is a choice to select one
+of the known, pre-configured toolchains.
+
+It is possible for a br2-external to extend those choices, by providing
+a set of files that define those alternatives:
+
+* +provides/toolchains.in+ defines the pre-configured toolchains, which
+  will then be listed in the toolchain selection;
+* +provides/jpeg.in+ defines the alternative libjpeg implementations;
+* +provides/openssl.in+ defines the alternative openssl implementations.
+
 ===== Free-form content
 
 One can store all the board-specific configuration files there, such
@@ -217,8 +234,10 @@ illustration, of course):
   |     `----
   |
   |- Config.in
+  |     |source "$BR2_EXTERNAL_BAR_42_PATH/toolchain/toolchain-external-mine/Config.in.options"
   |     |source "$BR2_EXTERNAL_BAR_42_PATH/package/pkg-1/Config.in"
   |     |source "$BR2_EXTERNAL_BAR_42_PATH/package/pkg-2/Config.in"
+  |     |source "$BR2_EXTERNAL_BAR_42_PATH/package/my-jpeg/Config.in"
   |     |
   |     |config BAR_42_FLASH_ADDR
   |     |    hex "my-board flash address"
@@ -259,6 +278,42 @@ illustration, of course):
   |- package/pkg-2/pkg-2.hash
   |- package/pkg-2/pkg-2.mk
   |
+  |- provides/jpeg.in
+  |     |config BR2_PACKAGE_MY_JPEG
+  |     |    bool "my-jpeg"
+  |     `----
+  |- package/my-jpeg/Config.in
+  |     |config BR2_PACKAGE_PROVIDES_JPEG
+  |     |    default "my-jpeg" if BR2_PACKAGE_MY_JPEG
+  |     `----
+  |- package/my-jpeg/my-jpeg.mk
+  |     |# This is a normal package .mk file
+  |     |MY_JPEG_VERSION = 1.2.3
+  |     |MY_JPEG_SITE = https://example.net/some/place
+  |     |MY_JPEG_PROVIDES = jpeg
+  |     |$(eval $(autotools-package))
+  |     `----
+  |
+  |- provides/toolchains.in
+  |     |config BR2_TOOLCHAIN_EXTERNAL_MINE
+  |     |    bool "my custom toolchain"
+  |     |    depends on BR2_some_arch
+  |     |    select BR2_INSTALL_LIBSTDCPP
+  |     `----
+  |- toolchain/toolchain-external-mine/Config.in.options
+  |     |if BR2_TOOLCHAIN_EXTERNAL_MINE
+  |     |config BR2_TOOLCHAIN_EXTERNAL_PREFIX
+  |     |    default "arch-mine-linux-gnu"
+  |     |config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+  |     |    default "toolchain-external-mine"
+  |     |endif
+  |     `----
+  |- toolchain/toolchain-external-mine/toolchain-external-mine.mk
+  |     |TOOLCHAIN_EXTERNAL_MINE_SITE = https://example.net/some/place
+  |     |TOOLCHAIN_EXTERNAL_MINE_SOURCE = my-toolchain.tar.gz
+  |     |$(eval $(toolchain-external-package))
+  |     `----
+  |
   |- configs/my-board_defconfig
   |     |BR2_GLOBAL_PATCH_DIR="$(BR2_EXTERNAL_BAR_42_PATH)/patches/"
   |     |BR2_ROOTFS_OVERLAY="$(BR2_EXTERNAL_BAR_42_PATH)/board/my-board/overlay/"
@@ -311,3 +366,35 @@ External options  --->
         [ ] foo
         [ ] bar
 ----
+
+Additionally, the jpeg provider will be visible in the jpeg choice:
+
+----
+Target packages  --->
+    Libraries  --->
+        Graphics  --->
+            [*] jpeg support
+                jpeg variant ()  --->
+                    ( ) jpeg
+                    ( ) jpeg-turbo
+                        *** jpeg from: Example br2-external tree ***
+                    (X) my-jpeg
+                        *** jpeg from: FOO_27 ***
+                    ( ) another-jpeg
+----
+
+And similarly for the toolchains:
+
+----
+Toolchain  --->
+    Toolchain ()  --->
+        ( ) Custom toolchain
+            *** Toolchains from: Example br2-external tree ***
+        (X) my custom toolchain
+----
+
+.Note
+The toolchain options in +toolchain/toolchain-external-mine/Config.in.options+
+will not appear in the `Toolchain` menu. They must be explicitly included
+from within the br2-external's top-level +Config.in+ and will thus appear
+in the `External options` menu.
