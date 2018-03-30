From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 14:22:49 +0200
Subject: [Buildroot] [git commit] core: alternate solution to disable C++
Message-ID: <20180330122524.9E65E83EA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4cd1ab15886a408b897104709ff87f15cc88ba16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
target, thus causing all sorts of trouble. For example, on ARM we'd have
to include different headers for soft-float vs hard-float, which is
decided based on a macro, which is not defined for x86, and thus may
redirect to the wrong (and missing) header.

Instead, we notice that libtool uses the magic value 'no' to decide that
a C++ compiler is not available, in which case it skips the call to
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
Tested-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 828e12e7d7..0af79dfb63 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -412,8 +412,16 @@ else
 NLS_OPTS = --disable-nls
 endif
 
+# We need anything that is invalid. Traditionally, we'd have used 'false' (and
+# we did so in the past). However, that breaks libtool for packages that have
+# optional C++ support (e.g. gnutls), because libtool will *require* a *valid*
+# C++ preprocessor as long as CXX is not 'no'.
+# Now, whether we use 'no' or 'false' for CXX as the same side effect: it is an
+# invalid C++ compiler, and thus will cause detection of C++ to fail (which is
+# expected and what we want), while at the same time taming libtool into
+# silence.
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
-TARGET_CONFIGURE_OPTS += CXX=false CXXCPP=cpp
+TARGET_CONFIGURE_OPTS += CXX=no
 endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
