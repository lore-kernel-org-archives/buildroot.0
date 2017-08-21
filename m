From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Aug 2017 23:14:57 +0200
Subject: [Buildroot] [git commit] norm: fix build with gcc 7.x
Message-ID: <20170821210837.11AEC80428@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a2cf6268890c715467d5aa8c606f2de299464de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch to the norm package that fixes the build with
gcc 7.x. Many thanks to Romain Naour for pointing out the solution to
this C++ build problem.

Fixes:

  http://autobuild.buildroot.net/results/c79dc84cdc34d62199099eb4438b1aed3e7459bb/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
[Thomas: add information that the patch has been submitted upstream
and accepted.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/norm/0003-fix-const-qualifier-gcc7.patch | 46 ++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/norm/0003-fix-const-qualifier-gcc7.patch b/package/norm/0003-fix-const-qualifier-gcc7.patch
new file mode 100644
index 0000000..57e01f9
--- /dev/null
+++ b/package/norm/0003-fix-const-qualifier-gcc7.patch
@@ -0,0 +1,46 @@
+protolib: remove const qualifiers in ProtoSortedTreeTemplate
+
+The methods PeekPrevItem() and PeekNextItem() in
+ProtoSortedTreeTemplate were using a const qualifier, but not the
+corresponding methods in ProtoSortedTree, causing a build failure with
+gcc 7.x:
+
+norm-1.5r6/protolib/include/protoTree.h: In member function 'ITEM_TYPE* ProtoSortedTreeTemplate<ITEM_TYPE>::Iterator::PeekPrevItem() const':
+norm-1.5r6/protolib/include/protoTree.h:652:93: error: no matching function for call to 'ProtoSortedTreeTemplate<ITEM_TYPE>::Iterator::PeekPrevItem() const'
+                     {return static_cast<ITEM_TYPE*>(ProtoSortedTree::Iterator::PeekPrevItem());}
+                                                                                             ^
+norm-1.5r6/protolib/include/protoTree.h:565:23: note: candidate: ProtoSortedTree::Item* ProtoSortedTree::Iterator::PeekPrevItem() <near match>
+                 Item* PeekPrevItem()
+                       ^~~~~~~~~~~~
+
+Since the same methods in ProtoTreeTemplate don't have the const
+qualifier, we take the simple solution of dropping such qualifiers
+from ProtoSortedTreeTemplate as well, which fixes the build of norm
+with gcc 7.x.
+
+Many thanks to Romain Naour <romain.naour@gmail.com> for pointing out
+the solution.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Patch has been submitted upstream and accepted, but mailing list
+archive not updated.]
+
+Index: b/protolib/include/protoTree.h
+===================================================================
+--- a/protolib/include/protoTree.h
++++ b/protolib/include/protoTree.h
+@@ -648,12 +648,12 @@
+                 
+                 ITEM_TYPE* GetPrevItem()
+                     {return static_cast<ITEM_TYPE*>(ProtoSortedTree::Iterator::GetPrevItem());}
+-                ITEM_TYPE* PeekPrevItem() const
++                ITEM_TYPE* PeekPrevItem()
+                     {return static_cast<ITEM_TYPE*>(ProtoSortedTree::Iterator::PeekPrevItem());}
+                 
+                 ITEM_TYPE* GetNextItem()
+                     {return static_cast<ITEM_TYPE*>(ProtoSortedTree::Iterator::GetNextItem());}
+-                ITEM_TYPE* PeekNextItem() const
++                ITEM_TYPE* PeekNextItem()
+                     {return static_cast<ITEM_TYPE*>(ProtoSortedTree::Iterator::PeekNextItem());}
+ 
+         };  // end class ProtoSortedTreeTemplate::Iterator
