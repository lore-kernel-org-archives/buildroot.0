From: Christian Stewart <christian@paral.in>
Date: Thu, 24 Jan 2019 00:18:34 -0800
Subject: [Buildroot] [PATCH 1/1] pkg-golang: add strip, asmflags,
 gcflags support
Message-ID: <20190124081834.17534-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding package-level variables to set asmflags, gcflags.

Conditionally sets ldflags -s -w when buildroot is configured to strip binaries.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/pkg-golang.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 4f2c7e77e1..79ebec94be 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -55,7 +55,15 @@ ifeq ($(BR2_STATIC_LIBS),y)
 $(2)_LDFLAGS += -extldflags '-static'
 endif
 
+ifeq ($(BR2_STRIP_strip),y)
+$(2)_LDFLAGS += -s -w
+endif
+
+$(2)_ASMFLAGS += -trimpath=$(BUILD_DIR)
+$(2)_GCFLAGS  += -trimpath=$(BUILD_DIR)
 $(2)_BUILD_OPTS += \
+	-asmflags "$$($(2)_ASMFLAGS)" \
+	-gcflags "$$($(2)_GCFLAGS)" \
 	-ldflags "$$($(2)_LDFLAGS)" \
 	-tags "$$($(2)_TAGS)" \
 	-p $(PARALLEL_JOBS)
-- 
2.19.2
