From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Jan 2016 22:36:37 +0100
Subject: [Buildroot] [git commit] package/boost: add patch to fix host build
	with gcc 4.4
Message-ID: <20160105214315.1441481ED7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d0b17497572a4bcb97d5c8ea9f8d844b8fb9b9ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add patch from upstream [1] to fix a host build with gcc 4.4.x:
  gcc.compile.c++ bin.v2/libs/container/build/gcc-4.4.5/release/threading-multi/pool_resource.o
  libs/container/src/pool_resource.cpp:35: error: declaration of 'typedef class boost::container::pmr::block_slist_base<boost::container::pmr::block_slist_header> boost::container::pmr::pool_data_t::block_slist_base'
  ./boost/container/detail/block_slist.hpp:67: error: changes meaning of 'block_slist_base' from 'class boost::container::pmr::block_slist_base<boost::container::pmr::block_slist_header>'

Fixes:
http://autobuild.buildroot.org/results/3cd/3cdc30a5b6e05de99787a20bf71fcf82842c15b3/
http://autobuild.buildroot.net/results/852/85212dd41db76d4e32efd98736ad8506e1917a8d/
http://autobuild.buildroot.org/results/963/963d102aa1c42efd84447d68d0856074421fbe05/
http://autobuild.buildroot.org/results/a39/a395f91969f79a8a4c0deffca4cdfdad33d48bd0/
.. and many more.

Host build tested on Scientific Linux 6.7 with gcc 4.4.7.

Backported from: a4e9686f8a0258bc30f9da2abab65673d6b9bd50

[1] https://github.com/boostorg/container/commit/a4e9686f8a0258bc30f9da2abab65673d6b9bd50

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0004-fix-declaration-error-with-gcc-4-4.patch  | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/package/boost/0004-fix-declaration-error-with-gcc-4-4.patch b/package/boost/0004-fix-declaration-error-with-gcc-4-4.patch
new file mode 100644
index 0000000..073ec04
--- /dev/null
+++ b/package/boost/0004-fix-declaration-error-with-gcc-4-4.patch
@@ -0,0 +1,50 @@
+From a4e9686f8a0258bc30f9da2abab65673d6b9bd50 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jupp=20M=C3=BCller?= <jupp0r@gmail.com>
+Date: Wed, 23 Dec 2015 09:18:51 +0100
+Subject: [PATCH] Fix declaration changes meaning error with GCC 4.4.7 (#11856)
+
+Backported from a4e9686f8a0258bc30f9da2abab65673d6b9bd50
+
+[J??rg Krause: adjust pathes to match sourceforge release tarball]
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+
+---
+ libs/container/src/pool_resource.cpp | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libs/container/src/pool_resource.cpp b/libs/container/src/pool_resource.cpp
+index 4df7ee2..45f1564 100644
+--- a/libs/container/src/pool_resource.cpp
++++ b/libs/container/src/pool_resource.cpp
+@@ -32,11 +32,11 @@ namespace pmr {
+ class pool_data_t
+    : public block_slist_base<>
+ {
+-   typedef block_slist_base<> block_slist_base;
++   typedef block_slist_base<> block_slist_base_t;
+ 
+    public:
+    explicit pool_data_t(std::size_t initial_blocks_per_chunk)
+-      : block_slist_base(), next_blocks_per_chunk(initial_blocks_per_chunk)
++      : block_slist_base_t(), next_blocks_per_chunk(initial_blocks_per_chunk)
+    {  slist_algo::init_header(&free_slist);  }
+ 
+    void *allocate_block() BOOST_NOEXCEPT
+@@ -59,7 +59,7 @@ class pool_data_t
+    void release(memory_resource &upstream)
+    {
+       slist_algo::init_header(&free_slist);
+-      this->block_slist_base::release(upstream);
++      this->block_slist_base_t::release(upstream);
+       next_blocks_per_chunk = pool_options_minimum_max_blocks_per_chunk;
+    }
+ 
+@@ -72,7 +72,7 @@ class pool_data_t
+       
+       //Minimum block size is at least max_align, so all pools allocate sizes that are multiple of max_align,
+       //meaning that all blocks are max_align-aligned.
+-      char *p = static_cast<char *>(block_slist_base::allocate(blocks_per_chunk*pool_block, mr));
++      char *p = static_cast<char *>(block_slist_base_t::allocate(blocks_per_chunk*pool_block, mr));
+ 
+       //Create header types. This is no-throw
+       for(std::size_t i = 0, max = blocks_per_chunk; i != max; ++i){
