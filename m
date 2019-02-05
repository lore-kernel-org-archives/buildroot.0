From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue,  5 Feb 2019 22:15:44 +0100
Subject: [Buildroot] [PATCH] toolchain-external: restrict copying of dynamic
 loader to ld*.so.*
Message-ID: <20190205211544.26547-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Commit 32bec8ee2fb00c6750fa842bbb0eb79b0c081fa2
("toolchain-external: copy ld*.so* for all C libraries") changed (among
other things) the glob pattern to catch the dynamic loader from
    ld*.so.*
to
    ld*.so*

thus now matching files like 'ld-2.20.so' in addition to files like
'ld.so.1'.

However, there is no apparent reason why that change was made. It is not
explicitly mentioned in the commit message as to why that would be needed,
nor is clear based on the rest of the changes in that commit.

The consequence of the change is that more files than needed end up in the
target root filesystem, adding extra unnecessary size to it.

Therefore, revert the glob pattern back to what it was.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


Seems this patch slipped through the cracks for a while.
See earlier discussion at: http://patchwork.ozlabs.org/patch/882583/
but it seems I never submitted the patch I said I was going to.
The code has been running successfully for almost a year in our different
defconfigs/toolchains.


diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index db3570d96f..e55cca539c 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -112,7 +112,7 @@ endif
 # Definitions of the list of libraries that should be copied to the target.
 #
 
-TOOLCHAIN_EXTERNAL_LIBS += ld*.so* libgcc_s.so.* libatomic.so.*
+TOOLCHAIN_EXTERNAL_LIBS += ld*.so.* libgcc_s.so.* libatomic.so.*
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
 TOOLCHAIN_EXTERNAL_LIBS += libc.so.* libcrypt.so.* libdl.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
-- 
2.19.2
