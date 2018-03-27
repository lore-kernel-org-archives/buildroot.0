From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 27 Mar 2018 12:58:43 +0200
Subject: [Buildroot] [PATCH] core: alternate solution to disable C++
Message-ID: <20180327105843.19009-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages that use libtool really need some love to be able to
disable C++ support.

This is because libtool will want to call AC_PROG_CXXCPP as soon as CXX
is set non-empty to something different from 'no'. Then, AC_PROG_CXXCPP
will want a C++ preprocessor that works on valid input *and* fail on
invalid input.

So, providing 'false' as the C++ compiler will then require that we do
have a working C++ preprocessor. Which is totally counter-productive
since we do not have a C++ compiler to start with...

bd39d11d2e (core/infra: fix build on toolchain without C++) was a
previous attempt at fixing this, by using the host's C++ preprocessor.

However, that is very incorrect (that's my code, I can say so!) because
the set of defines will most probably be different for the host and the
target, thus causign all sorts of trouble. For example, on ARM we'd have
to include different headers for soft-float vs hard-float, which is
decided based on a macro, which is not defined for x86, and thus may
redirect to the wrong (and missing) header.

Instead, we notice that libtool uses the magic value 'no' to decide that
a C++ compiler is not available, in which case it skeips the call to
AC_PROG_CXXCPP.

Given that 'no' is not provided by any package in Debian and
derivatives, as well as in Fedora, we can assume that no system will
have an executable called 'no'. Hence, we use that as a magic value to
disable C++ detection altogether.

Fixes: #10846 (again)

Reported-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Damien Riegel <damien.riegel@savoirfairelinux.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index e387ce67fe..a1b6c0252f 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -410,7 +410,7 @@ NLS_OPTS = --disable-nls
 endif
 
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
-TARGET_CONFIGURE_OPTS += CXX=false CXXCPP=cpp
+TARGET_CONFIGURE_OPTS += CXX=no CXXCPP=no
 endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
-- 
2.14.1
