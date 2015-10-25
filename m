From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 23:01:48 +0100
Subject: [Buildroot] [git commit] toolchain/wrapper: fix potential bug in
	foreach loop
Message-ID: <20151025220337.EA7E280E63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=32e2636c51e409f108f24174257ea4867ec6d74d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In Makefile, the comma ',' is used to separate the arguments passed to
functions, so we should not be allowed to use straight commas in strings
we want to expand.

For the toolchain wrapper, we need to transform a list:
    -mfoo -mbar -mbuz

into something acceptable for a C array assignment:
    "-mfoo", "-mbar", "-mbuz",

So, we use a $(foreach ...) loop for that. However, we do have a
straight comma in there.

It does not cause any issue in practice, since $(foreach) is a make
builtin function that accepts three and only three parameters.

However, this is not sane.

Change the straight comma to the usual $(comma) expansion, like we would
do for a call to any other function.

At the same time, make the code a bit easier to read, by first creating
the transformed list, and then creating the define.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-wrapper.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index eba2b38..af39071 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -14,7 +14,9 @@ TOOLCHAIN_WRAPPER_ARGS += -DBR_SYSROOT='"$(STAGING_SUBDIR)"'
 
 # We create a list like '"-mfoo", "-mbar", "-mbarfoo"' so that each flag is a
 # separate argument when used in execv() by the toolchain wrapper.
-TOOLCHAIN_WRAPPER_ARGS += -DBR_ADDITIONAL_CFLAGS='$(foreach f,$(call qstrip,$(BR2_TARGET_OPTIMIZATION)),"$(f)",)'
+TOOLCHAIN_WRAPPER_OPTS = \
+	$(foreach f,$(call qstrip,$(BR2_TARGET_OPTIMIZATION)),"$(f)"$(comma))
+TOOLCHAIN_WRAPPER_ARGS += -DBR_ADDITIONAL_CFLAGS='$(TOOLCHAIN_WRAPPER_OPTS)'
 
 ifeq ($(BR2_CCACHE),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE
