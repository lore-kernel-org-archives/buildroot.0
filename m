From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 9 Nov 2019 23:29:37 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2019-11-06
In-Reply-To: <6d4b57b9-90c8-c2ba-9703-0a456b2dec9f@gmail.com>
References: <5dc3c4b8.1c69fb81.ff4f2.2a4cSMTPIN_ADDED_MISSING@mx.google.com>
 <6d4b57b9-90c8-c2ba-9703-0a456b2dec9f@gmail.com>
Message-ID: <20191109232937.3aeb6063@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Romain,

On Sat, 9 Nov 2019 11:40:54 +0100, Romain Naour <romain.naour@gmail.com> wrote:

> Hi Yann, All,
> 
> Le 07/11/2019 ? 08:16, Thomas Petazzoni a ?crit?:
> > Hello,
> > 
> > Recent build failures and runtime-tests failures
> > ================================================
> > 
> > This is the list of Buildroot build failures that occurred on
> > 2019-11-06, and for which you are a registered architecture developer,
> > package developer or defconfig developer. This list also include
> > runtime tests failures. Please help us improving the quality of
> > Buildroot by investigating those build failures and sending patches to
> > fix them. Thanks!
> > 
> > Results for the 'master' branch
> > -------------------------------
> > 
> > Build failures related to your packages:
> > 
> >     arch     |             reason             |                                       url                                      
> > -------------+--------------------------------+---------------------------------------------------------------------------------
> >   mips64el   |        host-llvm-9.0.0         | http://autobuild.buildroot.net/results/d3aa03ca7085727d0794228178c7744859900137  
> 
> This is weird since mips is not (yet) supported by Buildroot's llvm package (see
> BR2_PACKAGE_LLVM_ARCH_SUPPORTS).
> 
> host-llvm dependency seems trigged by another package at Makefile level without
> being llvm/clang at Kconfig level.
> 
> Yann, the issue seems related to qt5tools for Qt 5.12 [1].
> Since it now depends on libclang, BR2_PACKAGE_QT5TOOLS_QDOC_TOOL must depends on
> BR2_PACKAGE_LLVM_ARCH_SUPPORTS (at least).
> 
> [1]
> https://git.buildroot.net/buildroot/commit/?id=57c1d3be4ecadd6802414a0943185c4ab6d82937
> 
> >     arm      |         mesa3d-19.2.2          | http://autobuild.buildroot.net/results/891acd135b9d92067da83aee4c987e872137d07c  
> 
> gallium nouveau issue on ARM with uClibc and c++14:
> 
> FAILED: src/gallium/drivers/nouveau/f590698@@nouveau at sta/codegen_nv50_ir_ra.cpp.o
> 
> error: 'isinf' was not declared in this scope

And can be fixed with (use c++ std:isinf instead of the plain c version):

--- build/mesa3d-19.2.3/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp.orig2019-11-09 23:24:11.214532855 +0100
+++ build/mesa3d-19.2.3/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp	2019-11-09 23:24:51.087263202 +0100
@@ -24,6 +24,7 @@
 #include "codegen/nv50_ir_target.h"
 
 #include <algorithm>
+#include <cmath>
 #include <stack>
 #include <limits>
 #if __cplusplus >= 201103L
@@ -1347,7 +1348,7 @@
                bestMaxReg = it->maxReg;
             }
          }
-         if (isinf(bestScore)) {
+         if (std::isinf(bestScore)) {
             ERROR("no viable spill candidates left\n");
             return false;
          }

Regards,
Peter

> 
> Best regards,
> Romain
> 
> > 
> > 
> >   
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
