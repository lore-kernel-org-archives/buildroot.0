From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 14 Oct 2020 22:35:31 +0200
Subject: [Buildroot] [git commit] docs/manual: add section about
 br2-external skeleton
Message-ID: <20201014210410.2A4DD818A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c71dbcf34a6a2ecbf8df4b0cf5d599314a58edd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
[yann.morin.1998 at free.fr:
  - alphabetical order (skeleton before toolchain)
  - leave the list of choices 'open'
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/customize-outside-br.txt | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index 5f7d623aea..2c3bc5243d 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -191,9 +191,9 @@ tree.
 
 For some packages, Buildroot provides a choice between two (or more)
 implementations of API-compatible such packages. For example, there is
-a choice to choose either libjpeg ot jpeg-turbo, and another choice
-between openssl or libressl. Finally, there is a choice to select one
-of the known, pre-configured toolchains.
+a choice to choose either libjpeg ot jpeg-turbo; there is one between
+openssl or libressl; there is one to select one of the known,
+pre-configured toolchains...
 
 It is possible for a br2-external to extend those choices, by providing
 a set of files that define those alternatives:
@@ -201,7 +201,8 @@ a set of files that define those alternatives:
 * +provides/toolchains.in+ defines the pre-configured toolchains, which
   will then be listed in the toolchain selection;
 * +provides/jpeg.in+ defines the alternative libjpeg implementations;
-* +provides/openssl.in+ defines the alternative openssl implementations.
+* +provides/openssl.in+ defines the alternative openssl implementations;
+* +provides/skeleton.in+ defines the alternative skeleton implementations.
 
 ===== Free-form content
 
@@ -301,6 +302,27 @@ illustration, of course):
   |     |$(eval $(autotools-package))
   |     `----
   |
+  |- provides/skeleton.in
+  |     |config BR2_ROOTFS_SKELETON_MINE
+  |     |    bool "my custom skeleton"
+  |     |    select BR2_PACKAGE_SKELETON_MINE
+  |     `----
+  |- package/skeleton-mine/Config.in
+  |     |config BR2_PACKAGE_SKELETON_MINE
+  |     |    bool
+  |     |    select BR2_PACKAGE_HAS_SKELETON
+  |     |
+  |     |config BR2_PACKAGE_PROVIDES_SKELETON
+  |     |    default "skeleton-mine" if BR2_PACKAGE_SKELETON_MINE
+  |     `----
+  |- package/skeleton-mine/skeleton-mine.mk
+  |     |SKELETON_MINE_ADD_TOOLCHAIN_DEPENDENCY = NO
+  |     |SKELETON_MINE_ADD_SKELETON_DEPENDENCY = NO
+  |     |SKELETON_MINE_PROVIDES = skeleton
+  |     |SKELETON_MINE_INSTALL_STAGING = YES
+  |     |$(eval $(generic-package))
+  |     `----
+  |
   |- provides/toolchains.in
   |     |config BR2_TOOLCHAIN_EXTERNAL_MINE
   |     |    bool "my custom toolchain"
