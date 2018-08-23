From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 23 Aug 2018 21:49:10 +0200
Subject: [Buildroot] Analysis of defconfig build failures
In-Reply-To: <20180816220655.37fbff34@windsurf>
References: <20180812170138.0b51be07@windsurf>
 <87600bbg68.fsf@dell.be.48ers.dk>
 <20180815213421.08e0a3b6@windsurf> <87ftzf9v7u.fsf@dell.be.48ers.dk>
 <20180816001829.3f7a1436@windsurf>
 <CAAXf6LVNs8470+VwKJCM68cHdp+ZgD-JxEpCbUpMXte4JYm68Q@mail.gmail.com>
 <20180816220655.37fbff34@windsurf>
Message-ID: <CAAXf6LX52KbkJ3AHfvG4ZMZvRHtpcqUHfo98JeTjFnuWWfMWNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
El jue., 16 ago. 2018 a las 22:06, Thomas Petazzoni
(<thomas.petazzoni@bootlin.com>) escribi?:
>
> Hello,
>
> On Thu, 16 Aug 2018 21:52:25 +0200, Thomas De Schampheleire wrote:
>
> > > I don't think it's related to building with new compilers. It's just
> > > some U-Boot versions that are broken if libfdt headers are already
> > > available in the include path.
> >
> > I can try to have a look somewhere next week.
>
> OK, thanks.
>
> > From the previous solution, I have a feeling that we can only go so
> > far in trying to solve the issue from Buildroot. We did already one
> > thing, and it seems insufficient for some u-boot versions.
> > There is a risk that what we do to fix these new failures, may break
> > some of those that work today.
> > We could implement some kind of detection to see how we need to solve
> > the issue depending on the u-boot at hand, but it could be cumbersome.
>
> Indeed.
>
> > An alternative solution is to document the known solution to this
> > problem (the patches). We can apply these patches to the defconfigs
> > inside buildroot, and let users with custom u-boots apply the patches
> > themselves (i.e. make them aware from release notes or documentation
> > but don't solve it automatically).
>
> That would be an option yes, but not the nicest one. But still better
> than having all the defconfigs failing like they are today :/
>


I did an analysis of the first defconfig () and came to following
patch that fixes the problem:

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index bddafe234d..4d34c55827 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -197,6 +197,9 @@ UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_LOCAL_PATCHES
 define UBOOT_FIXUP_LIBFDT_INCLUDE
     if [ -d $(@D)/scripts/dtc/libfdt ]; then \
         $(SED)
's%-I$$(srctree)/lib/libfdt%-I$$(srctree)/scripts/dtc/libfdt%'
$(@D)/tools/Makefile; \
+    elif [ -f $(@D)/include/libfdt_env.h ]; then \
+        $(SED) '\%#define _LIBFDT_ENV_H%a\
+        #define LIBFDT_ENV_H' $(@D)/include/libfdt_env.h; \
     fi
 endef
 UBOOT_POST_PATCH_HOOKS += UBOOT_FIXUP_LIBFDT_INCLUDE

The issue is that different versions of libfdt_env.h have different
include guards. In uboot 2017.07 the include guard starts with
underscore (_LIBFDT_ENV_H) but in output/host/include it does not.
The problem is thus solved by defining both symbols in the 'good'
libfdt_env.h, preventing any further inclusion of another
libfdt_env.h.

I tried solving the problem differently in the u-boot sources, i.e.
replacing -idirafter with -isystem, removing an -idirafterinclude,
adding an -Iinclude, etc. but it all came down to other problems
caused by horror in the u-boot source tree.

Due to the 'elif', newer u-boots that have scripts/dtc/libfdt should
not regress.
I still need to do checking of other defconfigs to see if they all are
solved by this patch.

/Thomas
