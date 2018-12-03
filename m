From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Dec 2018 23:11:42 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] infra/pkg-golang: enforce
 number of parallel jobs
Message-ID: <20181203220853.B82F58A626@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64c939f4abd2a2c58f3f3772a6b813af4087fef9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

By default, the go compiler will spawn as many jobs as there are CPUs
available, thus possibily over-shooting the limits set by the user.

Make it abide by the user's wish, and specify the number of jobs allowed
to run.

We can do so without fear of a package failing to build in parallel,
because they were already all building in parallel, as that is the
default for the go compiler.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5af65f65570de0d5cdd704fa120a80d12a51c1ae)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-golang.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 6eacd14180..4f2c7e77e1 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -55,8 +55,10 @@ ifeq ($(BR2_STATIC_LIBS),y)
 $(2)_LDFLAGS += -extldflags '-static'
 endif
 
-$(2)_BUILD_OPTS += -ldflags "$$($(2)_LDFLAGS)"
-$(2)_BUILD_OPTS += -tags "$$($(2)_TAGS)"
+$(2)_BUILD_OPTS += \
+	-ldflags "$$($(2)_LDFLAGS)" \
+	-tags "$$($(2)_TAGS)" \
+	-p $(PARALLEL_JOBS)
 
 # Target packages need the Go compiler on the host.
 $(2)_DEPENDENCIES += host-go
