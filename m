From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Mar 2018 23:46:39 +0100
Subject: [Buildroot] [PATCH 1/1] Revert "uboot: fix build when
 libfdt-devel is installed system-wide"
In-Reply-To: <CAOJ2eMe32YexFnqS6wnUyGn3eJ1UVwbin3=QnEN1bhzRC7HGBA@mail.gmail.com>
 (Stefan Becker's message of "Mon, 12 Mar 2018 14:37:00 +0200")
References: <20180312105905.10918-1-chemobejk@gmail.com>
 <8760615y80.fsf@dell.be.48ers.dk>
 <CAOJ2eMe32YexFnqS6wnUyGn3eJ1UVwbin3=QnEN1bhzRC7HGBA@mail.gmail.com>
Message-ID: <87ina0gbe8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stefan" == Stefan Becker <chemobejk@gmail.com> writes:

 > Agreed.
 > I made the suggested change and verified it in my build. Please see
 > attached patch.

Committed, thanks.

From our discussion on IRC I understood that these older u-boot versions
are also affected by the build error when libfdt-dev is installed on the
host, so it would be great if we could find a simple way to fix the
build if libfdt-dev is installed for these older versions as well.

But I agree, completely breaking the build for older u-boot versions is
obviously not good - So lets apply this workaround for now at least.

 > On Mon, Mar 12, 2018 at 1:29 PM, Peter Korsgaard <peter@korsgaard.com>
 > wrote:

 >> >>>>> "Stefan" == Stefan Becker <chemobejk@gmail.com> writes:
 >> 
 >> > From: Stefan Becker <sbecker@neolitics.com>
 >> > This reverts commit bf733342324b414a1142b57781504111f81c97ea.
 >> 
 >> > There is no scripts/dtc directory in our u-boot source tree, hence
 >> > modifying the uboot makefile to search scripts/dtc/libfdt instead of
 >> > lib/libfdt leads to build errors.
 >> 
 >> just reverting it would bring back the issue this commit tries to
 >> solve. Perhaps we should just extend the logic to only do the sed
 >> invocation if scripts/dtc/libfdt exists?
 >> 
 >> E.G. something like:
 >> 
 >> define UBOOT_FIXUP_LIBFDT_INCLUDE
 >> if [ -d $(@D)/scripts/dtc/libfdt ]; then \
 >> $(SED) 's%-I$$(srctree)/lib/libfdt%-I$$(srctree)/scripts/dtc/libfdt%'
 >> $(@D)/tools/Makefile; \
 >> fi
 >> endef
 >> 
 >> > Signed-off-by: Stefan Becker <chemobejk@gmail.com>
 >> > ---
 >> >  boot/uboot/uboot.mk | 8 --------
 >> >  1 file changed, 8 deletions(-)
 >> 
 >> > diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
 >> > index 58dd906a27..5da339850d 100644
 >> > --- a/boot/uboot/uboot.mk
 >> > +++ b/boot/uboot/uboot.mk
 >> > @@ -188,14 +188,6 @@ define UBOOT_APPLY_LOCAL_PATCHES
 >> >  endef
 >> >  UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_LOCAL_PATCHES
 >> 
 >> > -# This is equivalent to upstream commit
 >> > -# http://git.denx.de/?p=u-boot.git;a=commitdiff;h=
 >> e0d20dc1521e74b82dbd69be53a048847798a90a. It
 >> > -# fixes a build failure when libfdt-devel is installed system-wide.
 >> > -define UBOOT_FIXUP_LIBFDT_INCLUDE
 >> > -    $(SED) 's%-I$$(srctree)/lib/libfdt%-I$$(srctree)/scripts/dtc/libfdt%'
 >> $(@D)/tools/Makefile
 >> > -endef
 >> > -UBOOT_POST_PATCH_HOOKS += UBOOT_FIXUP_LIBFDT_INCLUDE
 >> > -
 >> >  ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY),y)
 >> >  define UBOOT_CONFIGURE_CMDS
 >> >      $(TARGET_CONFIGURE_OPTS)        \
 >> > --
 >> > 2.14.3
 >> 
 >> 
 >> --
 >> Bye, Peter Korsgaard
 >> 


-- 
Bye, Peter Korsgaard
