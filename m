From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Nov 2018 10:19:48 +0100
Subject: [Buildroot] [PATCH 1/3 v2] infra/pkg-golang: enforce number of
 parallel jobs
In-Reply-To: <cover.1543137559.git.yann.morin.1998@free.fr>
References: <cover.1543137559.git.yann.morin.1998@free.fr>
Message-ID: <951dd893ccaa0d4a894bfcac76dc04e28d9acafb.1543137559.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, the go compiler will spawn as many jobs as there are CPUs
available, thus possibily over-shooting the limits set by the user.

Make it abide by the user's wish, and specify the number of jobs allowed
to run.

We can do so without fear of a package failing to build in parallel,
because they were already all building in parallel, as that is the
default for the go compiler.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
-- 
2.14.1
