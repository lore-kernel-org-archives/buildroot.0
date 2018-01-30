From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Jan 2018 13:01:31 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] core/infra: fix build on
 toolchain without C++
Message-ID: <20180130122144.2A6958809F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a7cb6dcf648ab94c7878514c5754e1c8c2bdb93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Autotools-based packages that do not need C++ but check for it, and use
libtool, will fail to configure on distros that lack /lib/cpp.

This is the case for example on Arch Linux, where expat fails to build
with:

    configure: error: in `/home/dkc/src/buildroot/build/build/expat-2.2.4':
    configure: error: C++ preprocessor "/lib/cpp" fails sanity check

This is because libtool uses AC_PROC_CXXCPP, which can not be avoided,
and does require a cpp that passes some "sanity" checks (does not choke
on valid input, but does choke on invalid input). So we can use neither
/bin/false nor /bin/true...

We instead need something that can digest some basic C++ preprocessor
input. We can't use the target preprocessor: that does not work, because
it obviously has no C++ cupport:

    arm-linux-cpp.br_real: error: conftest.cpp: C++ compiler not
    installed on this system

We can however consider that the host machine does have a C++ compiler,
so we use the host' cpp, which is gcc's compiler wrapper that ends up
calling the host's C++ preprocessor.

That would give us a valid C++ preprocessor when we don't have one, in
fact. But autotools will then correctly fail anyway, because there is
indeed no C++ compiler at all, as we can see in this excerpt of a
configure log from expat:

    checking whether we are using the GNU C++ compiler... no
    checking whether false accepts -g... no
    checking dependency style of false... none
    checking how to run the C++ preprocessor... cpp
    checking whether the false linker (/home/ymorin/dev/buildroot/O/host/bin/arm-linux-ld) supports shared libraries... yes
    libtool.m4: error: problem compiling CXX test program
    checking for false option to produce PIC...  -DPIC
    checking if false PIC flag  -DPIC works... no
    checking if false static flag  works... no
    checking if false supports -c -o file.o... no
    checking if false supports -c -o file.o... (cached) no
    checking whether the false linker (/home/ymorin/dev/buildroot/O/host/bin/arm-linux-ld) supports shared libraries... yes

So, using the host's C++ preprocessor (by way of gcc's wrapper) leads to
a working situation, where the end result is as expected.

Reported-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Damien Riegel <damien.riegel@savoirfairelinux.com>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit bd39d11d2eaa679f09ab49fd3e4cd5511a168d1c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index b32ad8e447..523cc67808 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -388,7 +388,7 @@ DISABLE_NLS :=--disable-nls
 endif
 
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
-TARGET_CONFIGURE_OPTS += CXX=false
+TARGET_CONFIGURE_OPTS += CXX=false CXXCPP=cpp
 endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
