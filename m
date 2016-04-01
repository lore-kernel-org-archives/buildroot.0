From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Fri, 01 Apr 2016 21:16:22 +0200
Subject: [Buildroot] [PATCH v2] yajl: disable parallel build
In-Reply-To: <1459537807-6802-1-git-send-email-joerg.krause@embedded.rocks>
References: <1459537807-6802-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <1459538182.5657.8.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fr, 2016-04-01 at 21:10 +0200, J?rg Krause wrote:
> The yajl build system contains a race condition, which gets triggered
> by
> high BR2_JLEVEL settings - It tries to link the executable gen-extra-
> close
> against libyajl before it is created:
> 
> [ 21%] Linking C executable gen-extra-close
> [ 26%] Building C object src/CMakeFiles/yajl_s.dir/yajl_buf.c.o
> /home/test/autobuild/instance-3/output/host/opt/ext-toolchain/bfin-
> uclinux/bfin-uclinux/bin/ld.real: cannot find -lyajl
> 
> Fix it by linking against the static library libyajl_s like all other
> targets of
> the yajl build system do.
> 
> Fixes:
> http://autobuild.buildroot.net/results/a9b/a9b5209377acb51e69f376e0c0
> 08ee71fe00397a/
> http://autobuild.buildroot.net/results/55f/55fe22463d49addb42b635d10b
> e5176522f4a561/
> http://autobuild.buildroot.net/results/808/808acca0cfed93465845c2aa05
> 5a7a4fc56a8a17/
> http://autobuild.buildroot.net/results/b92/b92a9c84b71a8a2d022d307245
> ca6be36a000e6c/
> http://autobuild.buildroot.net/results/55d/55df698ab53f7d94235166e857
> 6eb681ed68668e/
> .. and more.
> 
> Upstream status: Pending
> https://github.com/lloyd/yajl/pull/187
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
> ?...make-Fix-static-linking-in-parallel-build.patch | 39
> ++++++++++++++++++++++
> ?1 file changed, 39 insertions(+)
> ?create mode 100644 package/yajl/0003-cmake-Fix-static-linking-in-
> parallel-build.patch
> 
> diff --git a/package/yajl/0003-cmake-Fix-static-linking-in-parallel-
> build.patch b/package/yajl/0003-cmake-Fix-static-linking-in-parallel-
> build.patch
> new file mode 100644
> index 0000000..793e38f
> --- /dev/null
> +++ b/package/yajl/0003-cmake-Fix-static-linking-in-parallel-
> build.patch
> @@ -0,0 +1,39 @@
> +From 24cbb6b482315d7659c04c9470ec9029e825e8ca Mon Sep 17 00:00:00
> 2001
> +From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
> +Date: Fri, 1 Apr 2016 20:45:35 +0200
> +Subject: [PATCH] cmake: Fix static linking in parallel build
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Building yajl in a static context fails in a parallel build:
> +
> +[ 21%] Linking C executable gen-extra-close
> +[ 26%] Building C object src/CMakeFiles/yajl_s.dir/yajl_buf.c.o
> +/home/test/autobuild/instance-3/output/host/opt/ext-toolchain/bfin-
> uclinux/bfin-uclinux/bin/ld.real: cannot find -lyajl
> +
> +Fix this by linking against the static library yajl_s as all other
> targets
> +in yajl does.
> +
> +Upstream status: Pending
> +https://github.com/lloyd/yajl/pull/187
> +
> +Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> +---
> + test/api/CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/test/api/CMakeLists.txt b/test/api/CMakeLists.txt
> +index e0ce2f6..efc85c5 100644
> +--- a/test/api/CMakeLists.txt
> ++++ b/test/api/CMakeLists.txt
> +@@ -21,5 +21,5 @@
> LINK_DIRECTORIES(${CMAKE_CURRENT_BINARY_DIR}/../../${YAJL_DIST_NAME}/
> lib)
> + FOREACH (test ${TESTS})
> +???GET_FILENAME_COMPONENT(testProg ${test} NAME_WE)
> +???ADD_EXECUTABLE(${testProg} ${test})
> +-??TARGET_LINK_LIBRARIES(${testProg} yajl m)
> ++??TARGET_LINK_LIBRARIES(${testProg} yajl_s m)
> + ENDFOREACH()
> +--?
> +2.8.0
> +

Oops, I forgot to update the commit message. Sorry! I'll resend with a
new commit header.

J?rg
