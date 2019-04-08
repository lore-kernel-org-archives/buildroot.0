From: Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Mon,  8 Apr 2019 17:04:42 +0300
Subject: [Buildroot] [PATCH] gettext-tiny: Make libiconv only target
 dependency
Message-ID: <20190408140442.29566-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Looks like a copy-paste issue in
commit ea1e7ee60682 ("package/gettext: turn into virtual package").

This creates a funny circular dependency in minimalistic configs
with uClibc:
------------------------->8---------------------
make libiconv-graph-depends
Getting dependency tree...

Recursion detected for  : toolchain
which is a dependency of: host-gettext-tiny
which is a dependency of: host-gettext
which is a dependency of: host-flex
which is a dependency of: host-binutils
which is a dependency of: host-gcc-final
which is a dependency of: toolchain-buildroot
which is a dependency of: toolchain
make: *** [libiconv-graph-depends] Error 1
------------------------->8---------------------

But real problem in build failure because we try to build
libiconv for target before toolchain is built.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Vadim Kochan <vadim4j@gmail.com>
---
 package/gettext-tiny/gettext-tiny.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
index 4fa014e8dd..f07903d203 100644
--- a/package/gettext-tiny/gettext-tiny.mk
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -50,7 +50,7 @@ endef
 HOST_GETTEXT_TINY_POST_PATCH_HOOKS += HOST_GETTEXT_TINY_COPY_EXTRA_FILES
 
 ifeq ($(BR2_ENABLE_LOCALE),)
-HOST_GETTEXT_TINY_DEPENDENCIES = libiconv
+GETTEXT_TINY_DEPENDENCIES = libiconv
 endif
 
 define HOST_GETTEXT_TINY_BUILD_CMDS
-- 
2.16.2
