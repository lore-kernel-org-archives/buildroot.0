From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Mar 2018 12:29:03 +0100
Subject: [Buildroot] [PATCH 1/1] Revert "uboot: fix build when
 libfdt-devel is installed system-wide"
In-Reply-To: <20180312105905.10918-1-chemobejk@gmail.com> (Stefan Becker's
 message of "Mon, 12 Mar 2018 12:59:05 +0200")
References: <20180312105905.10918-1-chemobejk@gmail.com>
Message-ID: <8760615y80.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stefan" == Stefan Becker <chemobejk@gmail.com> writes:

 > From: Stefan Becker <sbecker@neolitics.com>
 > This reverts commit bf733342324b414a1142b57781504111f81c97ea.

 > There is no scripts/dtc directory in our u-boot source tree, hence
 > modifying the uboot makefile to search scripts/dtc/libfdt instead of
 > lib/libfdt leads to build errors.

just reverting it would bring back the issue this commit tries to
solve. Perhaps we should just extend the logic to only do the sed
invocation if scripts/dtc/libfdt exists?

E.G. something like:

define UBOOT_FIXUP_LIBFDT_INCLUDE
       if [ -d $(@D)/scripts/dtc/libfdt ]; then \
          $(SED) 's%-I$$(srctree)/lib/libfdt%-I$$(srctree)/scripts/dtc/libfdt%' $(@D)/tools/Makefile; \
       fi
endef

 > Signed-off-by: Stefan Becker <chemobejk@gmail.com>
 > ---
 >  boot/uboot/uboot.mk | 8 --------
 >  1 file changed, 8 deletions(-)

 > diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
 > index 58dd906a27..5da339850d 100644
 > --- a/boot/uboot/uboot.mk
 > +++ b/boot/uboot/uboot.mk
 > @@ -188,14 +188,6 @@ define UBOOT_APPLY_LOCAL_PATCHES
 >  endef
 >  UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_LOCAL_PATCHES
 
 > -# This is equivalent to upstream commit
 > -# http://git.denx.de/?p=u-boot.git;a=commitdiff;h=e0d20dc1521e74b82dbd69be53a048847798a90a. It
 > -# fixes a build failure when libfdt-devel is installed system-wide.
 > -define UBOOT_FIXUP_LIBFDT_INCLUDE
 > -	$(SED) 's%-I$$(srctree)/lib/libfdt%-I$$(srctree)/scripts/dtc/libfdt%' $(@D)/tools/Makefile
 > -endef
 > -UBOOT_POST_PATCH_HOOKS += UBOOT_FIXUP_LIBFDT_INCLUDE
 > -
 >  ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY),y)
 >  define UBOOT_CONFIGURE_CMDS
 >  	$(TARGET_CONFIGURE_OPTS) 	\
 > -- 
 > 2.14.3


-- 
Bye, Peter Korsgaard
