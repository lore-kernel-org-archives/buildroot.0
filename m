From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 21:14:46 +0200
Subject: [Buildroot] [PATCH] yajl: disable parallel build
In-Reply-To: <1459450861-1074-1-git-send-email-joerg.krause@embedded.rocks>
References: <1459450861-1074-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160331211446.4727873e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 31 Mar 2016 21:01:01 +0200, J?rg Krause wrote:
> The yajl build system contains a race condition, which gets triggered by
> high BR2_JLEVEL settings - It tries to link the executable gen-extra-close
> against libyajl before it is created:
> 
> [ 21%] Linking C executable gen-extra-close
> [ 26%] Building C object src/CMakeFiles/yajl_s.dir/yajl_buf.c.o
> /home/test/autobuild/instance-3/output/host/opt/ext-toolchain/bfin-uclinux/bfin-uclinux/bin/ld.real: cannot find -lyajl
> 
> Fix it by disabling parallel build.
> 
> Fixes:
> http://autobuild.buildroot.net/results/a9b/a9b5209377acb51e69f376e0c008ee71fe00397a/
> http://autobuild.buildroot.net/results/55f/55fe22463d49addb42b635d10be5176522f4a561/
> http://autobuild.buildroot.net/results/808/808acca0cfed93465845c2aa055a7a4fc56a8a17/
> http://autobuild.buildroot.net/results/b92/b92a9c84b71a8a2d022d307245ca6be36a000e6c/
> http://autobuild.buildroot.net/results/55d/55df698ab53f7d94235166e8576eb681ed68668e/
> .. and more.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

yajl is using a reasonable build system, so there should be a
reasonable way of getting parallel build to work.

Can you try the following patch:

diff --git a/test/api/CMakeLists.txt b/test/api/CMakeLists.txt
index cd65a54..f7b6be1 100644
--- a/test/api/CMakeLists.txt
+++ b/test/api/CMakeLists.txt
@@ -22,4 +22,5 @@ FOREACH (test ${TESTS})
   GET_FILENAME_COMPONENT(testProg ${test} NAME_WE)
   ADD_EXECUTABLE(${testProg} ${test})
   TARGET_LINK_LIBRARIES(${testProg} yajl)
+  ADD_DEPENDENCIES(${testProg} yajl)
 ENDFOREACH()

And see if it helps ?

Note: this is only fixing the dependency of the gen-extra-close test
program against the yajl library. Probably other ADD_DEPENDENCIES()
invocations need to be added.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
