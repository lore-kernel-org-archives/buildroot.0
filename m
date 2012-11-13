From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Nov 2012 21:00:55 +0100
Subject: [Buildroot] [PATCH 1/1] grantlee: fix lpthread build error
In-Reply-To: <1352808310-6303-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1352808310-6303-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <50A2A6F7.4050309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/11/12 13:05, Zoltan at osuosl.org wrote:
> From: "Zoltan Gyarmati"<mr.zoltan.gyarmati@gmail.com>
>
>
> Signed-off-by: Zoltan Gyarmati<mr.zoltan.gyarmati@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  (it already worked for me, but at least this patch doesn't break things)

  However, your patch still misses the following things:

- The commit message is too vague.  It should describe the problem in more detail,
including the root cause.  For example:

grantlee: fix -lpthread build error

Build fails because of missing -lpthread with toolchains that need it. It
gives an error log like:
Linking CXX executable testgenerictypes_exec
/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.6.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: 
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libQtCore.so: undefined reference 
to symbol 'pthread_cancel'
/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.6.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: 
note: 'pthread_cancel' is defined in DSO 
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/lib/libpthread.so.0 so try adding it to 
the linker command line
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/lib/libpthread.so.0: could not read 
symbols: Invalid operation
collect2: ld returned 1 exit status
make[3]: *** [templates/tests/testgenerictypes_exec] Error 1
make[3]: Leaving directory `/home/buildroot12git/output/build/grantlee-0.2.0'
make[2]: *** [templates/tests/CMakeFiles/testgenerictypes_exec.dir/all] Error 2
make[2]: Leaving directory `/home/buildroot12git/output/build/grantlee-0.2.0'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/buildroot12git/output/build/grantlee-0.2.0'
make: *** [/home/buildroot12git/output/build/grantlee-0.2.0/.stamp_built] Error


- The patch itself should contain an equally detailed description (can be a copy
of the commit message).  It should also have your Signed-off-by line.


  Both of these are minor things, however.

  Regards,
  Arnout

> ---
>   .../grantlee-0.2.0-fix-lphread-link-error.patch    |   13 +++++++++++++
>   1 file changed, 13 insertions(+)
>   create mode 100644 package/grantlee/grantlee-0.2.0-fix-lphread-link-error.patch
>
> diff --git a/package/grantlee/grantlee-0.2.0-fix-lphread-link-error.patch b/package/grantlee/grantlee-0.2.0-fix-lphread-link-error.patch
> new file mode 100644
> index 0000000..8293172
> --- /dev/null
> +++ b/package/grantlee/grantlee-0.2.0-fix-lphread-link-error.patch
> @@ -0,0 +1,13 @@
> +diff -rupN grantlee-0.2.0_orig/templates/tests/CMakeLists.txt grantlee-0.2.0/templates/tests/CMakeLists.txt
> +--- grantlee-0.2.0_orig/templates/tests/CMakeLists.txt	2012-11-13 12:11:44.583379820 +0100
> ++++ grantlee-0.2.0/templates/tests/CMakeLists.txt	2012-11-13 11:35:18.000000000 +0100
> +@@ -68,7 +68,8 @@ macro(GRANTLEE_TEMPLATES_UNIT_TESTS)
> +                   ${_testresource_rcc_src}
> +     )
> +     add_test(${_testname} ${_testname}_exec )
> +-    target_link_libraries(${_testname}_exec ${QT_QTTEST_LIBRARY} grantlee_core )
> ++    find_package (Threads)
> ++    target_link_libraries(${_testname}_exec ${QT_QTTEST_LIBRARY} ${CMAKE_THREAD_LIBS_INIT}  grantlee_core )
> +
> +     set_property(GLOBAL APPEND PROPERTY TEST_COVERAGE "${CMAKE_CURRENT_BINARY_DIR}/${_testname}_exec" )
> +   endforeach(_testname)

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
