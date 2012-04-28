From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 28 Apr 2012 21:09:23 +0200
Subject: [Buildroot] Buildroot fails to build when selecting build
	packages
In-Reply-To: <201204281801.42601.arnout@mind.be>
References: <CAG6aBkV4xjdsXcvq-AssYQ1nOw0XiBiEjTZvi2rowStdfSCJNg@mail.gmail.com>
 <CAG6aBkVRsBJtcBSf_ZQ84Bf7SffptL7-h9RrJqc8TYLPbef-_A@mail.gmail.com>
 <201204281801.42601.arnout@mind.be>
Message-ID: <201204282109.24698.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 28 April 2012 18:01:42 Arnout Vandecappelle wrote:
> > The new error is ( from the top error cause ):
> > 
> > target/arm-unknown-linux-uclibcgnueabi/libstdc++-v3/include/cfenv:41:0, 
> >    from /usr/local/panda-stuff/buildroot-src/buildroot/output/toolchain/gcc-4.6.3/libstdc++-v3/include/precompiled/stdc++.h:54:
> >    /usr/local/panda-stuff/buildroot-src/buildroot/output/build/gcc-4.6.3-target/arm-unknown-linux-uclibcgnueabi/libstdc++-v3/include/fenv.h:36:24:
> > fatal error: fenv.h: No such file or directory
> > compilation terminated.
> [snip]
> 
>  I can indeed reproduce this error.  However, after a second (clean) run
> it did come through.  I suspect that this is a ccache problem.

 Sorry, I spoke too soon...

 I hadn't noticed that you're building gcc for the target.

 It seems that there is something wrong with the configure of gcc.  It 
incorrectly thinks that fenv.h is available when compiling for the target.

build/gcc-4.6.3-target/arm-unknown-linux-uclibcgnueabi/libstdc++-v3/include/arm-unknown-linux-uclibcgnueabi/bits/c++config.h:551:#define _GLIBCXX_HAVE_FENV_H 1

 For the cross-compiler, it correctly identifies fenv.h being absent:
toolchain/gcc-4.6.3-final/arm-unknown-linux-uclibcgnueabi/libstdc++-v3/include/arm-unknown-linux-uclibcgnueabi/bits/c++config.h:551:/* #undef _GLIBCXX_HAVE_FENV_H */

 I guess this is the same problem as reported in 
https://bugs.busybox.net/show_bug.cgi?id=4484

 The problem is that gcc installs fenv.h as part of libstdc++, even if no
native fenv.h is available.  Therefore, the target libstdc++'s configure
thinks that fenv.h is available.

 The following patch (to buildroot) seems to solve it:

------
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index a2975dc..1600b68 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -593,6 +593,7 @@ $(GCC_BUILD_DIR4)/.configured: $(GCC_BUILD_DIR4)/.prepared
 
 $(GCC_BUILD_DIR4)/.compiled: $(GCC_BUILD_DIR4)/.configured
 	PATH=$(TARGET_PATH) \
+	ac_cv_header_fenv_h=no \
 	$(MAKE) -C $(GCC_BUILD_DIR4) all
 	touch $@
 
------

 But of course, it would be much better to find a patch that fixes
the configure of libstdc++ and upstream it.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
