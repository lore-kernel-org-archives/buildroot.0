From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  3 Jul 2017 12:24:05 +0200
Subject: [Buildroot] [PATCH] Makefile: generate wrapper makefile when
	running make without a .config
Message-ID: <20170703102405.25977-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The recent change to error out instead of running menuconfig when no .config
is available broke an existing use case:

make O=output-foo; cd output-foo; br-init-conf (or similar to get a sensible .config); make

As there is no wrapper makefile in output-foo.

Fix it by ensuring the wrapper gets created if needed.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 36231fa9d6..bfe6fa3e07 100644
--- a/Makefile
+++ b/Makefile
@@ -816,7 +816,7 @@ else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 # rule for it.
 # Also for 'all' we error out and ask the user to configure first.
 .PHONY: linux toolchain
-linux toolchain all:
+linux toolchain all: outputmakefile
 	$(error Please configure Buildroot first (e.g. "make menuconfig"))
 	@exit 1
 
-- 
2.11.0
