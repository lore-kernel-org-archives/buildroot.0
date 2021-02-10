From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 10:07:48 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/cereal: fix
 CVE-2020-11105
Message-ID: <20210210085149.1DA7A80DB3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0735f1fc4e0a05d95d066aa7552859d9f83278a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fix CVE-2020-11105: An issue was discovered in USC iLab cereal through
1.3.0. It employs caching of std::shared_ptr values, using the raw
pointer address as a unique identifier. This becomes problematic if an
std::shared_ptr variable goes out of scope and is freed, and a new
std::shared_ptr is allocated at the same address. Serialization fidelity
thereby becomes dependent upon memory layout. In short, serialized
std::shared_ptr variables cannot always be expected to serialize back
into their original values. This can have any number of consequences,
depending on the context within which this manifests.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 26a46564f395e08cf8c4514c62e38a7d637d8cec)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-serialized-shared_ptr-within-the-archive.patch | 67 ++++++++++++++++++++++
 package/cereal/cereal.mk                           |  3 +
 2 files changed, 70 insertions(+)

diff --git a/package/cereal/0001-Store-a-copy-of-each-serialized-shared_ptr-within-the-archive.patch b/package/cereal/0001-Store-a-copy-of-each-serialized-shared_ptr-within-the-archive.patch
new file mode 100644
index 0000000000..3458ec1b59
--- /dev/null
+++ b/package/cereal/0001-Store-a-copy-of-each-serialized-shared_ptr-within-the-archive.patch
@@ -0,0 +1,67 @@
+From f27c12d491955c94583512603bf32c4568f20929 Mon Sep 17 00:00:00 2001
+From: Michael Walz <code@serpedon.de>
+Date: Tue, 2 Feb 2021 00:50:29 +0100
+Subject: [PATCH] Store a copy of each serialized shared_ptr within the archive
+ to prevent the shared_ptr to be freed to early. (#667)
+
+The archives use the memory address pointed by the shared_ptr as a
+unique id which must not be reused during lifetime of the archive.
+Therefore, the archives stores a copy of it.
+This problem was also reported as CVE-2020-11105.
+
+[Retrieved from:
+https://github.com/USCiLab/cereal/commit/f27c12d491955c94583512603bf32c4568f20929]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/cereal/cereal.hpp       | 13 +++++++++++--
+ include/cereal/types/memory.hpp |  2 +-
+ 2 files changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/include/cereal/cereal.hpp b/include/cereal/cereal.hpp
+index 99bed9d6..f0d15e8b 100644
+--- a/include/cereal/cereal.hpp
++++ b/include/cereal/cereal.hpp
+@@ -369,12 +369,17 @@ namespace cereal
+           point to the same data.
+ 
+           @internal
+-          @param addr The address (see shared_ptr get()) pointed to by the shared pointer
++          @param sharedPointer The shared pointer itself (the adress is taked via get()).
++                               The archive takes a copy to prevent the memory location to be freed
++                               as long as the address is used as id. This is needed to prevent CVE-2020-11105.
+           @return A key that uniquely identifies the pointer */
+-      inline std::uint32_t registerSharedPointer( void const * addr )
++      inline std::uint32_t registerSharedPointer(const std::shared_ptr<const void>& sharedPointer)
+       {
++        void const * addr = sharedPointer.get();
++
+         // Handle null pointers by just returning 0
+         if(addr == 0) return 0;
++        itsSharedPointerStorage.push_back(sharedPointer);
+ 
+         auto id = itsSharedPointerMap.find( addr );
+         if( id == itsSharedPointerMap.end() )
+@@ -645,6 +650,10 @@ namespace cereal
+       //! Maps from addresses to pointer ids
+       std::unordered_map<void const *, std::uint32_t> itsSharedPointerMap;
+ 
++      //! Copy of shared pointers used in #itsSharedPointerMap to make sure they are kept alive
++      //  during lifetime of itsSharedPointerMap to prevent CVE-2020-11105.
++      std::vector<std::shared_ptr<const void>> itsSharedPointerStorage;
++
+       //! The id to be given to the next pointer
+       std::uint32_t itsCurrentPointerId;
+ 
+diff --git a/include/cereal/types/memory.hpp b/include/cereal/types/memory.hpp
+index 59e9da9b..cac1f334 100644
+--- a/include/cereal/types/memory.hpp
++++ b/include/cereal/types/memory.hpp
+@@ -263,7 +263,7 @@ namespace cereal
+   {
+     auto & ptr = wrapper.ptr;
+ 
+-    uint32_t id = ar.registerSharedPointer( ptr.get() );
++    uint32_t id = ar.registerSharedPointer( ptr );
+     ar( CEREAL_NVP_("id", id) );
+ 
+     if( id & detail::msb_32bit )
diff --git a/package/cereal/cereal.mk b/package/cereal/cereal.mk
index 3811fdf32f..c31c3b1adb 100644
--- a/package/cereal/cereal.mk
+++ b/package/cereal/cereal.mk
@@ -15,4 +15,7 @@ CEREAL_CONF_OPTS = \
 	-DTHREAD_SAFE=ON \
 	-DJUST_INSTALL_CEREAL=ON
 
+# 0001-Store-a-copy-of-each-serialized-shared_ptr-within-the-archive.patch
+CEREAL_IGNORE_CVES += CVE-2020-11105
+
 $(eval $(cmake-package))
