From: Romain Naour <romain.naour@smile.fr>
Date: Wed, 11 Apr 2018 18:48:33 +0200
Subject: [Buildroot] [PATCH] package/llvm: remove $ORIGIN/../lib from
 RPATH
In-Reply-To: <20180411153022.13335-1-valentin.korenblit@smile.fr>
References: <20180411153022.13335-1-valentin.korenblit@smile.fr>
Message-ID: <6c53d700-695d-32ab-8e0d-eb8591625703@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Valentin,

Le 11/04/2018 ? 17:30, Valentin Korenblit a ?crit?:
> AddLLVM.cmake adds $ORIGIN/../lib to the RPATH of llvm binaries.
> This causes a problem when llvm-config from host installed in
> STAGING_DIR is executed under the following conditions:
> 
> *Target architecture same as host architecture (normally x86_64)
> *Target's libc different from host's libc (normally glibc)
> 
> llvm-config will try to link with the target's libc, resulting in:
> 
> ./llvm-config: error while loading shared libraries: libc.so.0:
> cannot open shared object file: No such file or directory.
> 
> Link to autobuild error:
> http://autobuild.buildroot.net/results/b81c12d529c66a028e2297ea5ce1d6930324fa69/
> 
> To avoid this, remove the code from llvm_setup_rpath in AddLLVM.cmake
> 
> Link to discussion:
> http://lists.busybox.net/pipermail/buildroot/2018-April/218627.html
> 
> Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
> ---

[...]

> +diff --git a/cmake/modules/AddLLVM.cmake b/cmake/modules/AddLLVM.cmake
> +index 1c922651b13..e70c9fbdb8e 100644
> +--- a/cmake/modules/AddLLVM.cmake
> ++++ b/cmake/modules/AddLLVM.cmake
> +@@ -1440,37 +1440,7 @@ function(llvm_externalize_debuginfo name)
> + endfunction()
> + 
> + function(llvm_setup_rpath name)
> +-  if(CMAKE_INSTALL_RPATH)
> +-    return()
> +-  endif()

If CMAKE_INSTALL_PATH is defined on the cmake command line, this function just
return :)

So, you have to add HOST_LLVM_CONF_OPTS +=
-DCMAKE_INSTALL_RPATH="$(HOST_DIR)/lib" and drop this patch.

$ readelf -d
/home/romnao/buildroot/test/llvm/host/x86_64-buildroot-linux-uclibc/sysroot/usr/bin/llvm-config

(RPATH)              Biblioth?que rpath: [/home/romnao/buildroot/test/llvm/host/lib]

Thoughts ?

Best regards,
Romain

> +-
> +-  if(LLVM_INSTALL_PREFIX AND NOT (LLVM_INSTALL_PREFIX STREQUAL CMAKE_INSTALL_PREFIX))
> +-    set(extra_libdir ${LLVM_LIBRARY_DIR})
> +-  elseif(LLVM_BUILD_LIBRARY_DIR)
> +-    set(extra_libdir ${LLVM_LIBRARY_DIR})
> +-  endif()
> +-
> +-  if (APPLE)
> +-    set(_install_name_dir INSTALL_NAME_DIR "@rpath")
> +-    set(_install_rpath "@loader_path/../lib" ${extra_libdir})
> +-  elseif(UNIX)
> +-    set(_install_rpath "\$ORIGIN/../lib${LLVM_LIBDIR_SUFFIX}" ${extra_libdir})
> +-    if(${CMAKE_SYSTEM_NAME} MATCHES "(FreeBSD|DragonFly)")
> +-      set_property(TARGET ${name} APPEND_STRING PROPERTY
> +-                   LINK_FLAGS " -Wl,-z,origin ")
> +-    elseif(${CMAKE_SYSTEM_NAME} STREQUAL "Linux" AND NOT LLVM_LINKER_IS_GOLD)
> +-      # $ORIGIN is not interpreted at link time by ld.bfd
> +-      set_property(TARGET ${name} APPEND_STRING PROPERTY
> +-                   LINK_FLAGS " -Wl,-rpath-link,${LLVM_LIBRARY_OUTPUT_INTDIR} ")
> +-    endif()
> +-  else()
> +-    return()
> +-  endif()
> + 
> +-  set_target_properties(${name} PROPERTIES
> +-                        BUILD_WITH_INSTALL_RPATH On
> +-                        INSTALL_RPATH "${_install_rpath}"
> +-                        ${_install_name_dir})
> + endfunction()
> + 
> + function(setup_dependency_debugging name)
> +-- 
> +2.14.3
> +
> 
