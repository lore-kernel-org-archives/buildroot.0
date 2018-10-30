From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Oct 2018 21:23:31 +0100
Subject: [Buildroot] [PATCH 1/3] fs: apply permissions late
In-Reply-To: <CANQCQpa3y_Qs7H9aB1Y7fpW9G=V2Dr2yqM9WihrQBuqUbPoEhA@mail.gmail.com>
References: <cover.1540626349.git.yann.morin.1998@free.fr>
 <4f9a31b0fb8f87ded9c788cb92d727b6763859ac.1540626349.git.yann.morin.1998@free.fr>
 <CANQCQpa3y_Qs7H9aB1Y7fpW9G=V2Dr2yqM9WihrQBuqUbPoEhA@mail.gmail.com>
Message-ID: <20181030202331.GI28575@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt, All,

On 2018-10-27 08:14 -0500, Matthew Weber spake thusly:
> On Sat, Oct 27, 2018 at 2:46 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >
> > The combination of fakeroot, tar, and capabilities is broken, because
> > fakeroot currently badly handles capabilities, which are currently
> > simply ignored.
> >
> > As described in #11216, asking tar to explicitly store and restore
> > capabilities ends up with a failling build, when tar actually tries to
> failling -> failing
> 
> > restore the capabilities. Adding support for capabilities to fakeroot
> > (by adding host-libcap as dependency) does not fix the problem.
> >
> > Capabilities are stored in the extended attribute security.capabilty.
> Capabilities are stored in the extended attribute security capability.

Thanks for the fixes! :-)

Yet, the extended attribute is really named "security.capabilty" (i.e.
with a dot in-between the two words): https://linux.die.net/man/7/capabilities

    Since kernel 2.6.24, the kernel supports associating capability sets
    [...] stored in an extended attribute (see setxattr(2)) named
    security.capability.o

Regards,
Yann E. MORIN.

> > It turns out that tar does have special handling when extracting and
> > restoring that extended attribute, and that fails miserably when running
> > under fakeroot...
> >
> > We fix that by offloading the permissions handling down to individual
> > filesystems.
> >
> > This needs a split of the makedevs call, with the current and first one
> > now only responsible for creating the pseudo devices, while the new,
> > second call does only set the permissions.
> >
> > Fixes: #11216
> >
> > This changes the order of steps, and post-fakeroot scripts are now
> > called before the permissions are set. This could mean breaking existing
> > setups, but more probably, this woudl sovle some, where files created in
> setups, but more probably, this would solve some, where files created in
> 
> > post-fakeroot scripts can now see their permissions appropriately set.
> >
> > This also slightly breaks the idea behind the intermediate image, which
> > was supposed to gather all actions common to all filesystems, so that
> > they are not repeated. Still, most actions are still created only once,
> > and moving just this is purely a practical and pragmatic workaround.
> >
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
> 
> Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> 
> > ---
> >  fs/common.mk | 17 +++++++++++------
> >  1 file changed, 11 insertions(+), 6 deletions(-)
> >
> > diff --git a/fs/common.mk b/fs/common.mk
> > index 453da6010a..569e5d60c5 100644
> > --- a/fs/common.mk
> > +++ b/fs/common.mk
> > @@ -29,8 +29,8 @@
> >
> >  FS_DIR = $(BUILD_DIR)/buildroot-fs
> >  FULL_DEVICE_TABLE = $(FS_DIR)/device_table.txt
> > -ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE) \
> > -       $(BR2_ROOTFS_STATIC_DEVICE_TABLE))
> > +ROOTFS_PERMISSION_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE))
> > +ROOTFS_STATIC_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_STATIC_DEVICE_TABLE))
> >  USERS_TABLE = $(FS_DIR)/users_table.txt
> >  ROOTFS_USERS_TABLES = $(call qstrip,$(BR2_ROOTFS_USERS_TABLES))
> >
> > @@ -81,14 +81,13 @@ ifneq ($(ROOTFS_USERS_TABLES),)
> >         cat $(ROOTFS_USERS_TABLES) >> $(USERS_TABLE)
> >  endif
> >         PATH=$(BR_PATH) $(TOPDIR)/support/scripts/mkusers $(USERS_TABLE) $(TARGET_DIR) >> $(FAKEROOT_SCRIPT)
> > -ifneq ($(ROOTFS_DEVICE_TABLES),)
> > -       cat $(ROOTFS_DEVICE_TABLES) > $(FULL_DEVICE_TABLE)
> > +ifneq ($(ROOTFS_STATIC_DEVICE_TABLES),)
> > +       cat $(ROOTFS_STATIC_DEVICE_TABLES) > $(FULL_DEVICE_TABLE)
> >  ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
> >         $(call PRINTF,$(PACKAGES_DEVICES_TABLE)) >> $(FULL_DEVICE_TABLE)
> >  endif
> > -endif
> > -       $(call PRINTF,$(PACKAGES_PERMISSIONS_TABLE)) >> $(FULL_DEVICE_TABLE)
> >         echo "$(HOST_DIR)/bin/makedevs -d $(FULL_DEVICE_TABLE) $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
> > +endif
> >         $(foreach s,$(call qstrip,$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT)),\
> >                 echo "echo '$(TERM_BOLD)>>>   Executing fakeroot script $(s)$(TERM_RESET)'" >> $(FAKEROOT_SCRIPT); \
> >                 echo $(EXTRA_ENV) $(s) $(TARGET_DIR) $(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $(FAKEROOT_SCRIPT)$(sep))
> > @@ -108,6 +107,7 @@ define inner-rootfs
> >
> >  ROOTFS_$(2)_DIR = $$(FS_DIR)/$(1)
> >  ROOTFS_$(2)_TARGET_DIR = $$(ROOTFS_$(2)_DIR)/target
> > +ROOTFS_$(2)_PERMISSION_TABLE = $$(ROOTFS_$(2)_DIR)/permissions.txt
> >
> >  ROOTFS_$(2)_DEPENDENCIES += rootfs-common
> >
> > @@ -149,6 +149,11 @@ $$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
> >         echo '#!/bin/sh' > $$(FAKEROOT_SCRIPT)
> >         echo "set -e" >> $$(FAKEROOT_SCRIPT)
> >         $$(call PRINTF,$$(ROOTFS_COMMON_UNTAR_CMD)) >> $$(FAKEROOT_SCRIPT)
> > +ifneq ($$(ROOTFS_PERMISSION_TABLES),)
> > +       cat $$(ROOTFS_PERMISSION_TABLES) > $$(ROOTFS_$(2)_PERMISSION_TABLE)
> > +endif
> > +       $$(call PRINTF,$$(PACKAGES_PERMISSIONS_TABLE)) >> $$(ROOTFS_$(2)_PERMISSION_TABLE)
> 
> If a package duplicates an entry and is below a user provided rootfs
> permissions table similar item, I assume makedev uses the last entry
> as the one to set?  If so, should the two lines above be flipped so
> the "user provided" can always fixup/override the package default?
> 
> Matt

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
