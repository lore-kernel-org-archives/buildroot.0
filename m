From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2016 14:38:14 +0100
Subject: [Buildroot] [git commit] linux/perf: conditionally enable support
	for gz/xz compression
Message-ID: <20160319134800.09ED0807A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96668359444cba8cd4795c5dd376e1e10a7e1de6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
