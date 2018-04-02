From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon,  2 Apr 2018 16:57:55 +0200
Subject: [Buildroot] [PATCH 1/8] pkg-generic: add a subdirectory to the
 DL_DIR
Message-ID: <20180402145802.17611-1-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With all the previous changes, we are now ready to add a subdirectory to
the DL_DIR.
The structure will now be DL_DIR/PKG_NAME/{FILE1,FILE2}

This is needed for multiple reasons:
    - Avoid patches with name like SHA1.patch laying flat in DL_DIR,
    which makes it hard to know to which packages they apply
    - Avoid possible collisions if two releases have the same name
    (e.g: v01.tar)
    - Allow the possibility to handle a git cache per package in the
    newly created subdirectory.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 01d61ac0ad..20ee73d438 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -432,7 +432,7 @@ endif
 
 $(2)_BASENAME	= $$(if $$($(2)_VERSION),$(1)-$$($(2)_VERSION),$(1))
 $(2)_BASENAME_RAW = $$(if $$($(2)_VERSION),$$($(2)_RAWNAME)-$$($(2)_VERSION),$$($(2)_RAWNAME))
-$(2)_DL_DIR	=  $$(DL_DIR)
+$(2)_DL_DIR 	=  $$(DL_DIR)/$$($(2)_RAWNAME)
 $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASENAME)
 
 ifndef $(2)_SUBDIR
-- 
2.16.2
