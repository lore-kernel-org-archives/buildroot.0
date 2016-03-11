From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 19:19:57 +0100
Subject: [Buildroot] [PATCH 4/6] linux/perf: conditionally enable support
	for gz/xz compression
In-Reply-To: <cover.1457720152.git.yann.morin.1998@free.fr>
References: <cover.1457720152.git.yann.morin.1998@free.fr>
Message-ID: <0fb73f64e517e4b64786e746d244dca6888fd2bd.1457720152.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 linux/linux-tool-perf.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/linux/linux-tool-perf.mk b/linux/linux-tool-perf.mk
index d4b8f0e..8143474 100644
--- a/linux/linux-tool-perf.mk
+++ b/linux/linux-tool-perf.mk
@@ -75,6 +75,19 @@ else
 PERF_MAKE_FLAGS += NO_LIBELF=1 NO_DWARF=1
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+PERF_DEPENDENCIES += zlib
+else
+PERF_MAKE_FLAGS += NO_ZLIB=1
+endif
+
+# lzma is provided by xz
+ifeq ($(BR2_PACKAGE_XZ),y)
+PERF_DEPENDENCIES += xz
+else
+PERF_MAKE_FLAGS += NO_LZMA=1
+endif
+
 # We really do not want to build the perf documentation, because it
 # has stringent requirement on the documentation generation tools,
 # like xmlto and asciidoc), which may be lagging behind on some
-- 
1.9.1
