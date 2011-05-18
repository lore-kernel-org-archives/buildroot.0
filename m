From: Matias Garcia <mgarcia@rossvideo.com>
Date: Wed, 18 May 2011 17:17:05 -0400
Subject: [Buildroot] [PATCH] external toolchain: add arbitrary arguments
 to sysroot discovery and toolchain wrapper
In-Reply-To: <20110518180229.7e8a2501@surf>
References: <4DC46EC4.2060000@rossvideo.com> <20110508190400.43407143@surf>
	<1305033911.7239.3.camel@matias-lnx-host>
	<1305733040.7239.20.camel@matias-lnx-host>
	<20110518180229.7e8a2501@surf>
Message-ID: <1305753425.7239.26.camel@matias-lnx-host>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2011-05-18 at 18:02 +0200, Thomas Petazzoni wrote:

> Hello Matias,
> 
> Please keep the Buildroot list in the loop for Buildroot-related
> discussions.


Will do. I sent a reply to the list last time and no-one replied...


> On Wed, 18 May 2011 11:37:20 -0400
> Matias Garcia <mgarcia@rossvideo.com> wrote:
> 
> > I never received a reply to this e-mail. Do you think it's worth
> > re-submitting my patch? If I did, would it make it into the 2011.05
> > build? All I'm doing is updating Peter's wrapper with custom
> > optimizations.
> 
> I'm still not a big fan of adding a different config option than
> BR2_TARGET_OPTIMIZATION that would be specific to the external
> toolchain case. But I haven't dug into the issue enough to propose a
> solution.


Here's the patch simplified to use only BR2_TARGET_OPTIMIZATION. Again,
I don't know any fancy ways to post patches, so it's just the git diff.
I moved the optimizations to the end of the wrapper so that you can
supersede any of the build-in stuff if you want, at your peril.


> 
> Thomas


Matias
--
Patch to add BR2_TARGET_OPTIMIZATION to the external toolchain wrapper.

diff --git a/toolchain/toolchain-external/ext-tool.mk
b/toolchain/toolchain-external/ext-tool.mk
index 328f908..ad95d21 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -132,6 +132,10 @@ CC_TARGET_ABI_:=$(call qstrip,
$(BR2_GCC_TARGET_ABI))
 
 # march/mtune/floating point mode needs to be passed to the external
toolchain
 # to select the right multilib variant
+ifneq ($(BR2_TARGET_OPTIMIZATION),)
+TOOLCHAIN_EXTERNAL_CFLAGS += $(BR2_TARGET_OPTIMIZATION)
+TOOLCHAIN_EXTERNAL_WRAPPER_ARGS +=
-DBR_OPT='$(BR2_TARGET_OPTIMIZATION)'
+endif
 ifneq ($(CC_TARGET_TUNE_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mtune=$(CC_TARGET_TUNE_)
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_TUNE='"$(CC_TARGET_TUNE_)"'
diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c
b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index a485e74..dfa4fba 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -37,6 +37,9 @@ static char *args[MAXARGS] = {
 #ifdef BR_VFPFLOAT
 	"-mfpu=vfp",
 #endif /* BR_VFPFLOAT */
+#ifdef BR_OPT
+	BR_OPT,
+#endif /* BR_OPT */
 };
 
 static const char *get_basename(const char *name)b
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110518/4e177f44/attachment-0001.html>
