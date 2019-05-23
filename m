From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 May 2019 11:09:24 +0200
Subject: [Buildroot] [git commit] package/norm: bump to version 1.5.8
Message-ID: <20190602201235.799398EDA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0dae84942c37a976f69cf9c9de0377b0b6f00bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop first and third patches (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/norm/0001-fix-bigendian-build.patch        | 17 --------
 ...> 0001-protolib-drop-linux-version-check.patch} |  0
 package/norm/0003-fix-const-qualifier-gcc7.patch   | 46 ----------------------
 package/norm/norm.hash                             |  3 +-
 package/norm/norm.mk                               |  4 +-
 5 files changed, 4 insertions(+), 66 deletions(-)

diff --git a/package/norm/0001-fix-bigendian-build.patch b/package/norm/0001-fix-bigendian-build.patch
deleted file mode 100644
index cf999c27cf..0000000000
--- a/package/norm/0001-fix-bigendian-build.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Fix big-endian build breakage in protolib.
-Patch status: submitted to author via email.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura norm-1.5r6.orig/protolib/include/protoSpace.h norm-1.5r6/protolib/include/protoSpace.h
---- norm-1.5r6.orig/protolib/include/protoSpace.h	2016-03-08 19:48:21.326357963 -0300
-+++ norm-1.5r6/protolib/include/protoSpace.h	2016-03-08 19:48:46.647234075 -0300
-@@ -89,7 +89,7 @@
-                 }
- #else               
-                 ProtoTree::Endian GetEndian() const
--                        return ProtoTree::ENDIAN_BIG;
-+                    {return ProtoTree::ENDIAN_BIG;}
-                 void SetNode(Node* theNode)
-                     {memcpy(key+sizeof(double), &theNode, sizeof(Node*));}
-                 Node* GetNode() const
diff --git a/package/norm/0002-protolib-drop-linux-version-check.patch b/package/norm/0001-protolib-drop-linux-version-check.patch
similarity index 100%
rename from package/norm/0002-protolib-drop-linux-version-check.patch
rename to package/norm/0001-protolib-drop-linux-version-check.patch
diff --git a/package/norm/0003-fix-const-qualifier-gcc7.patch b/package/norm/0003-fix-const-qualifier-gcc7.patch
deleted file mode 100644
index 57e01f9c13..0000000000
--- a/package/norm/0003-fix-const-qualifier-gcc7.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-protolib: remove const qualifiers in ProtoSortedTreeTemplate
-
-The methods PeekPrevItem() and PeekNextItem() in
-ProtoSortedTreeTemplate were using a const qualifier, but not the
-corresponding methods in ProtoSortedTree, causing a build failure with
-gcc 7.x:
-
-norm-1.5r6/protolib/include/protoTree.h: In member function 'ITEM_TYPE* ProtoSortedTreeTemplate<ITEM_TYPE>::Iterator::PeekPrevItem() const':
-norm-1.5r6/protolib/include/protoTree.h:652:93: error: no matching function for call to 'ProtoSortedTreeTemplate<ITEM_TYPE>::Iterator::PeekPrevItem() const'
-                     {return static_cast<ITEM_TYPE*>(ProtoSortedTree::Iterator::PeekPrevItem());}
-                                                                                             ^
-norm-1.5r6/protolib/include/protoTree.h:565:23: note: candidate: ProtoSortedTree::Item* ProtoSortedTree::Iterator::PeekPrevItem() <near match>
-                 Item* PeekPrevItem()
-                       ^~~~~~~~~~~~
-
-Since the same methods in ProtoTreeTemplate don't have the const
-qualifier, we take the simple solution of dropping such qualifiers
-from ProtoSortedTreeTemplate as well, which fixes the build of norm
-with gcc 7.x.
-
-Many thanks to Romain Naour <romain.naour@gmail.com> for pointing out
-the solution.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Patch has been submitted upstream and accepted, but mailing list
-archive not updated.]
-
-Index: b/protolib/include/protoTree.h
-===================================================================
---- a/protolib/include/protoTree.h
-+++ b/protolib/include/protoTree.h
-@@ -648,12 +648,12 @@
-                 
-                 ITEM_TYPE* GetPrevItem()
-                     {return static_cast<ITEM_TYPE*>(ProtoSortedTree::Iterator::GetPrevItem());}
--                ITEM_TYPE* PeekPrevItem() const
-+                ITEM_TYPE* PeekPrevItem()
-                     {return static_cast<ITEM_TYPE*>(ProtoSortedTree::Iterator::PeekPrevItem());}
-                 
-                 ITEM_TYPE* GetNextItem()
-                     {return static_cast<ITEM_TYPE*>(ProtoSortedTree::Iterator::GetNextItem());}
--                ITEM_TYPE* PeekNextItem() const
-+                ITEM_TYPE* PeekNextItem()
-                     {return static_cast<ITEM_TYPE*>(ProtoSortedTree::Iterator::PeekNextItem());}
- 
-         };  // end class ProtoSortedTreeTemplate::Iterator
diff --git a/package/norm/norm.hash b/package/norm/norm.hash
index 4693eed6bf..b4fd8e171a 100644
--- a/package/norm/norm.hash
+++ b/package/norm/norm.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	20ea2e8dd5d5e1ff1ff91dc7dab6db53a77d7b7183d8cf2425c215fd294f22a7	src-norm-1.5r6.tgz
+sha256	4480a6ea53fb7ce45b4bc2061d18fbfd46ee9990fc2ed9a9dc303ce4d87888a6	src-norm-1.5.8.tgz
+sha256	ba4b7e49b0163d6839830e3f47505696c6eaac77ccd93531831dc837b2160608	LICENSE.TXT
diff --git a/package/norm/norm.mk b/package/norm/norm.mk
index 8af76f8345..d5f7d0400b 100644
--- a/package/norm/norm.mk
+++ b/package/norm/norm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NORM_VERSION = 1.5r6
-NORM_SITE = http://downloads.pf.itd.nrl.navy.mil/norm/archive
+NORM_VERSION = 1.5.8
+NORM_SITE = http://downloads.pf.itd.nrl.navy.mil/norm
 NORM_SOURCE = src-norm-$(NORM_VERSION).tgz
 NORM_INSTALL_STAGING = YES
 NORM_LICENSE = NRL License
