From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Wed, 11 Apr 2018 17:30:22 +0200
Subject: [Buildroot] [PATCH] package/llvm: remove $ORIGIN/../lib from RPATH
Message-ID: <20180411153022.13335-1-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

AddLLVM.cmake adds $ORIGIN/../lib to the RPATH of llvm binaries.
This causes a problem when llvm-config from host installed in
STAGING_DIR is executed under the following conditions:

*Target architecture same as host architecture (normally x86_64)
*Target's libc different from host's libc (normally glibc)

llvm-config will try to link with the target's libc, resulting in:

./llvm-config: error while loading shared libraries: libc.so.0:
cannot open shared object file: No such file or directory.

Link to autobuild error:
http://autobuild.buildroot.net/results/b81c12d529c66a028e2297ea5ce1d6930324fa69/

To avoid this, remove the code from llvm_setup_rpath in AddLLVM.cmake

Link to discussion:
http://lists.busybox.net/pipermail/buildroot/2018-April/218627.html

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
---
 .../llvm/0001-Avoid-adding-RPATH-to-binaries.patch | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 package/llvm/0001-Avoid-adding-RPATH-to-binaries.patch

diff --git a/package/llvm/0001-Avoid-adding-RPATH-to-binaries.patch b/package/llvm/0001-Avoid-adding-RPATH-to-binaries.patch
new file mode 100644
index 0000000000..861eed1f1e
--- /dev/null
+++ b/package/llvm/0001-Avoid-adding-RPATH-to-binaries.patch
@@ -0,0 +1,55 @@
+From 134fe34a0b737003a9728f77d37fd3a6d763f757 Mon Sep 17 00:00:00 2001
+From: Valentin Korenblit <valentin.korenblit@smile.fr>
+Date: Wed, 11 Apr 2018 16:26:10 +0200
+Subject: [PATCH] Avoid adding RPATH to binaries
+
+Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
+---
+ cmake/modules/AddLLVM.cmake | 30 ------------------------------
+ 1 file changed, 30 deletions(-)
+
+diff --git a/cmake/modules/AddLLVM.cmake b/cmake/modules/AddLLVM.cmake
+index 1c922651b13..e70c9fbdb8e 100644
+--- a/cmake/modules/AddLLVM.cmake
++++ b/cmake/modules/AddLLVM.cmake
+@@ -1440,37 +1440,7 @@ function(llvm_externalize_debuginfo name)
+ endfunction()
+ 
+ function(llvm_setup_rpath name)
+-  if(CMAKE_INSTALL_RPATH)
+-    return()
+-  endif()
+-
+-  if(LLVM_INSTALL_PREFIX AND NOT (LLVM_INSTALL_PREFIX STREQUAL CMAKE_INSTALL_PREFIX))
+-    set(extra_libdir ${LLVM_LIBRARY_DIR})
+-  elseif(LLVM_BUILD_LIBRARY_DIR)
+-    set(extra_libdir ${LLVM_LIBRARY_DIR})
+-  endif()
+-
+-  if (APPLE)
+-    set(_install_name_dir INSTALL_NAME_DIR "@rpath")
+-    set(_install_rpath "@loader_path/../lib" ${extra_libdir})
+-  elseif(UNIX)
+-    set(_install_rpath "\$ORIGIN/../lib${LLVM_LIBDIR_SUFFIX}" ${extra_libdir})
+-    if(${CMAKE_SYSTEM_NAME} MATCHES "(FreeBSD|DragonFly)")
+-      set_property(TARGET ${name} APPEND_STRING PROPERTY
+-                   LINK_FLAGS " -Wl,-z,origin ")
+-    elseif(${CMAKE_SYSTEM_NAME} STREQUAL "Linux" AND NOT LLVM_LINKER_IS_GOLD)
+-      # $ORIGIN is not interpreted at link time by ld.bfd
+-      set_property(TARGET ${name} APPEND_STRING PROPERTY
+-                   LINK_FLAGS " -Wl,-rpath-link,${LLVM_LIBRARY_OUTPUT_INTDIR} ")
+-    endif()
+-  else()
+-    return()
+-  endif()
+ 
+-  set_target_properties(${name} PROPERTIES
+-                        BUILD_WITH_INSTALL_RPATH On
+-                        INSTALL_RPATH "${_install_rpath}"
+-                        ${_install_name_dir})
+ endfunction()
+ 
+ function(setup_dependency_debugging name)
+-- 
+2.14.3
+
-- 
2.14.3
