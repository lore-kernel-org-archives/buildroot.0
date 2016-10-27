From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Oct 2016 10:41:44 +0200
Subject: [Buildroot] [git commit] toolchain-external: install libmvec.so
	from glibc toolchains
Message-ID: <20161027084254.272777FD45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=447e9051f32936a3a185af926c7ec394cbd61962
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On some architectures (namely x86-64), glibc may provide a libmvec
library since glibc 2.22, which programs built with gcc OpenMP support
might get linked to.

In order for these programs to work on the target, we need to copy
this library to the target filesystem.

This commit takes care of this for the external toolchain
situation. Note that libraries listed in TOOLCHAIN_EXTERNAL_LIBS are
silently ignored if they don't exist. Therefore, we don't need to have
any condition on the architecture or glibc version.

For more details on libmvec, see
https://sourceware.org/glibc/wiki/libmvec.

Fixes bug #9111.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index d3608d0..f7c6a19 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -79,7 +79,7 @@ endif # ! no threads
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC),y)
-TOOLCHAIN_EXTERNAL_LIBS += libnss_files.so.* libnss_dns.so.*
+TOOLCHAIN_EXTERNAL_LIBS += libnss_files.so.* libnss_dns.so.* libmvec.so.*
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
