From: Lada Trimasova <Lada.Trimasova@synopsys.com>
Date: Thu, 25 Feb 2016 14:37:09 +0300
Subject: [Buildroot] [PATCH 1/2] host-tar: fix build when -std=gnu99 and
	inline functions are used
In-Reply-To: <1456400230-4187-1-git-send-email-ltrimas@synopsys.com>
References: <1456400230-4187-1-git-send-email-ltrimas@synopsys.com>
Message-ID: <1456400230-4187-2-git-send-email-ltrimas@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A lot of the glibc header files use extern inline, which causes
GCC to emit a symbol for each extern inline functions and it causes
functions multiple definition error when "-std=gnu99" is used.
To fix this problem it's necessary to use "-fgnu89-inline" option, which
tells GCC to use the traditional GNU semantics for inline functions when
in C99 mode.

Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/tar/tar.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index 2b47e33..e59aedb 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -38,6 +38,7 @@ $(eval $(autotools-package))
 # host-tar: use cpio.gz instead of tar.gz to prevent chicken-egg problem
 # of needing tar to build tar.
 HOST_TAR_SOURCE = tar-$(TAR_VERSION).cpio.gz
+HOST_TAR_MAKE_OPTS = CFLAGS="-fgnu89-inline"
 define HOST_TAR_EXTRACT_CMDS
 	mkdir -p $(@D)
 	cd $(@D) && \
-- 
2.5.0
