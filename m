From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Oct 2016 21:21:22 +0200
Subject: [Buildroot] [git commit] package.snappy: fix static builds with
	threads
Message-ID: <20161002193142.97AE881E3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e2ee0e6e8076d233402766086aa4c6297c62cb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For some toolchains, libstdc++ uses pthread symbols:

    .../lib/libstdc++.a(eh_alloc.o): In function `__gnu_cxx::__mutex::lock()':
    eh_alloc.cc:(.text._ZN9__gnu_cxx7__mutex4lockEv[_ZN9__gnu_cxx7__mutex4lockEv]+0x2):
    undefined reference to `pthread_mutex_lock'

and a lot of other pthread symbols...

However, when doing a static build, there is no way for the linker to know
what library to link in, so the build fails miserably if -pthread is not
specified at link time.

Fixes:
    http://autobuild.buildroot.org/results/15e/15ecaa23f0116e8120b3d62e553c838f0303df35/
    http://autobuild.buildroot.org/results/f0a/f0abe301816e39eb4ae26d3e8cd42d90901d5ac5/

[Peter: only perform workaround if toolchain has threads support, tweak comment]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/snappy/snappy.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index b00dddf..6f89cf1 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -16,4 +16,13 @@ SNAPPY_INSTALL_STAGING = YES
 # Disable tests
 SNAPPY_CONF_OPTS = --disable-gtest
 
+# libsnappy links with libstdc++. Some libstdc++/arch variants use
+# pthread symbols for internal locking if built with thead
+# support. libstdc++ does not have a .pc file, and its .la file does
+# not mention -pthread.  So, static linkig to libstdc++ will fail if
+# -pthread is not explicity linked to. Only do that for static builds.
+ifeq ($(BR2_STATIC_LIBS)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
+SNAPPY_CONF_OPTS += LIBS=-pthread
+endif
+
 $(eval $(autotools-package))
