From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 9 Sep 2009 19:35:35 +0200
Subject: [Buildroot] [PATCH 4/5] Remove BR2_TOPDIR_PREFIX and
 BR2_TOPDIR_SUFFIX
In-Reply-To: <2f7f4e844f89b99bde1ab32524d43ee7a82825a5.1252361088.git.thomas.petazzoni@free-electrons.com>
References: <cover.1252361088.git.thomas.petazzoni@free-electrons.com>
	<2f7f4e844f89b99bde1ab32524d43ee7a82825a5.1252361088.git.thomas.petazzoni@free-electrons.com>
Message-ID: <20090909173535.GA17081@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 08, 2009 at 12:09:52AM +0200, Thomas Petazzoni wrote:
>The same effect can be done using out-of-tree build with O=
>
>Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>---
> Config.in           |   18 ------------------
> Makefile            |   11 +----------
> package/Makefile.in |    6 +++---
> 3 files changed, 4 insertions(+), 31 deletions(-)
>


>diff --git a/package/Makefile.in b/package/Makefile.in
>index 0ae5bdb..093108d 100644
>--- a/package/Makefile.in
>+++ b/package/Makefile.in
>@@ -112,7 +112,7 @@ COND_ARCH_FPU_SUFFIX:=
> endif
> 
> ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
>-TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(ARCH)$(COND_ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
>+TOOL_BUILD_DIR=$(BASE_DIR)/toolchain_build_$(ARCH)$(COND_ARCH_FPU_SUFFIX)

three remarks:
1) COND_ARCH_FPU_SUFFIX is _completely_ useless, to say the least.
2) TOPDIR_PREFIX and TOPDIR_SUFFIX don't hurt and are convenient for some corner-cases. I'd keep them.
3) I'd much prefer if we could rather settle on
TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)$(ARCH)$(ARCH_FPU_SUFFIX)$(ARCH_MMU_SUFFIX)$(TOPDIR_SUFFIX)_toolchain
BUILD_DIR     =$(BASE_DIR)/$(TOPDIR_PREFIX)$(ARCH)$(ARCH_FPU_SUFFIX)$(ARCH_MMU_SUFFIX)$(TOPDIR_SUFFIX)_build

so you can conveniently rm -rf powerpc_nofpu_* (for example)
