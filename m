From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 8 Jun 2019 21:35:46 +0200
Subject: [Buildroot] [git commit] package/poppler: fix build with cmake <
 3.10
Message-ID: <20190608193718.BD0B581094@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa25bf1d69df6290d2dd19d6fa4ba6fea4ebe88a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

poppler requires threads, and our compiler always accepts the -pthread
argument, so THREADS_HAVE_PTHREAD_ARG can safely be set to ON.

Fixes:
 - http://autobuild.buildroot.org/results/f9e24d38d3aa4519615c5a0ae7f62af610df976f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Arnout: set THREADS_HAVE_PTHREAD_ARG instead of THREADS_PTHREAD_ARG,
and set it to ON instead of OFF because we always have threads.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/poppler/poppler.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index a2bb7e3049..37566504e9 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -20,6 +20,9 @@ POPPLER_CONF_OPTS = \
 	-DENABLE_GOBJECT_INTROSPECTION=OFF \
 	-DENABLE_GTK_DOC=OFF
 
+# cmake older than 3.10 requires this to avoid try_run() in FindThreads
+POPPLER_CONF_OPTS += -DTHREADS_HAVE_PTHREAD_ARG=ON
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 POPPLER_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
 endif
