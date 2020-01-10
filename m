From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 10 Jan 2020 18:37:41 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/wireshark: fix static build with snappy
In-Reply-To: <20190528203230.24558-1-fontaine.fabrice@gmail.com>
References: <20190528203230.24558-1-fontaine.fabrice@gmail.com>
Message-ID: <20200110173741.GC2478@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2019-05-28 22:32 +0200, Fabrice Fontaine spake thusly:
> Fixes:
>  - http://autobuild.buildroot.org/results/419468f0d7d3c2b64d420513aa9505c6de097ed2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I had been contemplating that patch for quite some time now, and was
really undecided what we were to be doing about it...

But now, we've accepted your patch to make woreshark depend on shared
libraries, so this build failure should no longer occur any more, or so
I hope.

Marked as "not applicable" in Patchwork.

Thank you!

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2 (after review of Arnout Vandecappelle):
>  - Set linker to CXX instead of adding -lstdc++ to LIBS
> 
>  ...s.txt-fix-static-linking-with-snappy.patch | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 package/wireshark/0005-CMakeLists.txt-fix-static-linking-with-snappy.patch
> 
> diff --git a/package/wireshark/0005-CMakeLists.txt-fix-static-linking-with-snappy.patch b/package/wireshark/0005-CMakeLists.txt-fix-static-linking-with-snappy.patch
> new file mode 100644
> index 0000000000..e9233aa90f
> --- /dev/null
> +++ b/package/wireshark/0005-CMakeLists.txt-fix-static-linking-with-snappy.patch
> @@ -0,0 +1,98 @@
> +From eb226af7ae998cda6b9747d9e77692fda85563bc Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Tue, 28 May 2019 21:26:19 +0200
> +Subject: [PATCH] CMakeLists.txt: fix static linking with snappy
> +
> +snappy is a C++ library so cxx linker must be used to avoid errors
> +when statically linking:
> +
> +/home/buildroot/autobuild/instance-1/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libsnappy.a(snappy.cc.o): In function `snappy::internal::WorkingMemory::GetHashTable(unsigned int, int*)':
> +snappy.cc:(.text+0x358): undefined reference to `operator new[](unsigned int)'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/faa65da84ace974426e220205f4665fc0a73bdfe
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + CMakeLists.txt | 30 ++++++++++++++++++++++++++++++
> + 1 file changed, 30 insertions(+)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index e2fdafc227..cf5b8dfd56 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -2191,6 +2191,11 @@ if(BUILD_wireshark AND QT_FOUND)
> + 	if(ENABLE_APPLICATION_BUNDLE OR WIN32)
> + 		set_target_properties(wireshark PROPERTIES OUTPUT_NAME Wireshark)
> + 	endif()
> ++	# epan links with snappy which is a C++ library so use cxx linker to
> ++	# avoid error when statically linking
> ++	if(SNAPPY_FOUND)
> ++		set_target_properties(wireshark PROPERTIES LINKER_LANGUAGE CXX)
> ++	endif(SNAPPY_FOUND)
> + 
> + 	if(ENABLE_APPLICATION_BUNDLE)
> + 		add_dependencies(wireshark manpages)
> +@@ -2306,6 +2311,11 @@ if(BUILD_tshark)
> + 	add_executable(tshark ${tshark_FILES})
> + 	set_extra_executable_properties(tshark "Executables")
> + 	target_link_libraries(tshark ${tshark_LIBS})
> ++	# epan links with snappy which is a C++ library so use cxx linker to
> ++	# avoid error when statically linking
> ++	if(SNAPPY_FOUND)
> ++		set_target_properties(tshark PROPERTIES LINKER_LANGUAGE CXX)
> ++	endif(SNAPPY_FOUND)
> + 	install(TARGETS tshark RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
> + endif()
> + 
> +@@ -2329,6 +2339,11 @@ if(BUILD_tfshark)
> + 	add_executable(tfshark ${tfshark_FILES})
> + 	set_extra_executable_properties(tfshark "Executables")
> + 	target_link_libraries(tfshark ${tfshark_LIBS})
> ++	# epan links with snappy which is a C++ library so use cxx linker to
> ++	# avoid error when statically linking
> ++	if(SNAPPY_FOUND)
> ++		set_target_properties(tfshark PROPERTIES LINKER_LANGUAGE CXX)
> ++	endif(SNAPPY_FOUND)
> + 	install(TARGETS tfshark RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
> + endif()
> + 
> +@@ -2352,6 +2367,11 @@ if(BUILD_rawshark AND PCAP_FOUND)
> + 	add_executable(rawshark ${rawshark_FILES})
> + 	set_extra_executable_properties(rawshark "Executables")
> + 	target_link_libraries(rawshark ${rawshark_LIBS})
> ++	# epan links with snappy which is a C++ library so use cxx linker to
> ++	# avoid error when statically linking
> ++	if(SNAPPY_FOUND)
> ++		set_target_properties(rawshark PROPERTIES LINKER_LANGUAGE CXX)
> ++	endif(SNAPPY_FOUND)
> + 	install(TARGETS rawshark RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
> + endif()
> + 
> +@@ -2383,6 +2403,11 @@ if(BUILD_sharkd)
> + 	if(WIN32)
> + 		target_link_libraries(sharkd "ws2_32.lib")
> + 	endif(WIN32)
> ++	# epan links with snappy which is a C++ library so use cxx linker to
> ++	# avoid error when statically linking
> ++	if(SNAPPY_FOUND)
> ++		set_target_properties(sharkd PROPERTIES LINKER_LANGUAGE CXX)
> ++	endif(SNAPPY_FOUND)
> + 
> + 	install(TARGETS sharkd RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
> + endif()
> +@@ -2400,6 +2425,11 @@ if(BUILD_dftest)
> + 	add_executable(dftest ${dftest_FILES})
> + 	set_extra_executable_properties(dftest "Tests")
> + 	target_link_libraries(dftest ${dftest_LIBS})
> ++	# epan links with snappy which is a C++ library so use cxx linker to
> ++	# avoid error when statically linking
> ++	if(SNAPPY_FOUND)
> ++		set_target_properties(dftest PROPERTIES LINKER_LANGUAGE CXX)
> ++	endif(SNAPPY_FOUND)
> + endif()
> + 
> + if(BUILD_randpkt)
> +-- 
> +2.20.1
> +
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
