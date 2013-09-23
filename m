From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Mon, 23 Sep 2013 16:52:32 -0500
Subject: [Buildroot] [PATCH v2 11/17] refpolicy: new package
In-Reply-To: <20130918071804.2548927a@skate>
References: <1378936777-28308-1-git-send-email-clshotwe@rockwellcollins.com>	<1378936777-28308-12-git-send-email-clshotwe@rockwellcollins.com>
 <20130918071804.2548927a@skate>
Message-ID: <OF0AE894A4.B1D82316-ON86257BEF.005CA11D-86257BEF.00782938@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 09/18/2013 
12:18:04 AM:

> We already have the BR2_GLOBAL_PATCH_DIR mechanism to 
> allow people to
> provide custom patches for all packages. See
> http://buildroot.org/downloads/manual/
> manual.html#_global_patch_directory.
> So there shouldn't be a need to add a refpolicy specific 
> mechanism for
> this.

I will go ahead and remove this option from the config.

> Do we really need to provide a distribution choice here? Isn't
> 'Buildroot' considered a distribution? I must admit that 
> as a Buildroot
> user, I would be somewhat confused by a choice that allows
> me to select
> between debian, suse, gentoo, redhat, etc. This Buildroot 
> is "sort" of
> a distribution, shouldn't we just make one choice that 
> happens to work
> for Buildroot ?

The different distributions add a few changes that are specific to the 
distribution. I looked through the distributions and none of them really 
fit with the way buildroot works so I am going to remove this option from 
the config.

> For a non-english speaker, the wording of "Note, this is 
> suggested for
> embedded systems" might suggest that what is recommended 
> is to build a
> modular policy.
> 
> Also, what about inverting the logic of this option? I.e:
> 
> config BR2_PACKAGE_REFPOLICY_MODULAR
>    bool "Build a modular SELinux policy"
>    help
>      Select Y to build a modular SELinux policy. By default,
>      SELinux builds a monolithic policy, which is the best
>      solution for embedded systems for space/performance reasons
>      (FIXME), but building a modular policy might be useful in
>      (FIXME).
> 

That would clean things up quite a bit.  I'll switch the logic and change 
the comment.

> > +config BR2_PACKAGE_REFPOLICY_NAME
> > +   string "Name for the SELinux policy"
> > +   default "refpolicy"
> 
> Is this something that is actually useful to change?
> 

Not really.  I'll remove it.

> > diff --git a/package/refpolicy/config b/package/refpolicy/config
> > new file mode 100755
> > index 0000000..c482b3f
> > --- /dev/null
> > +++ b/package/refpolicy/config
> > @@ -0,0 +1,10 @@
> > +# This file controls the state of SELinux on the system.
> > +# SELINUX= can take one of these three values:
> > +#     enforcing - SELinux security policy is enforced.
> > +#     permissive - SELinux prints warnings instead of enforcing.
> > +#     disabled - No SELinux policy is loaded.
> > +SELINUX=permissive
> > +# SELINUXTYPE= can take one of these two values:
> > +#     targeted - Targeted processes are protected,
> > +#     mls - Multi Level Security protection.
> > +SELINUXTYPE=refpolicy
> 
> So the default value for SELINUXTYPE is not one of the two accepted
> values? Seems odd.

I corrected the comment to accurately represent what is doing.

> 
> > diff --git a/package/refpolicy/refpolicy-0001-
> gentoo_hardened_fixes.patch b/package/refpolicy/
> refpolicy-0001-gentoo_hardened_fixes.patch
> 
> Do we have a chance of getting this patch merged upstream? We don't
> like to carry feature patches in Buildroot, so if a feature doesn't
> exist upstream, or is so broken upstream and never going 
> to be fixed,
> then we prefer to not support it at all.
> 
> If fixing this upstream is an on-going effort, then no 
> problem to carry
> the patch in Buildroot.

There has been work on the upstream in relation to these fixes. I have 
pulled down the latest upstream software and it builds without any 
problems. This patch will be able to be removed when the next version is 
released. There are many changes that need to be made for things to work 
with buildroot that I have not made yet. I don't have the resources to 
customize the refpolicy to work completely, as is, with buildroot. 
Currently, a lot of the paths listed in the policy do not match the way 
buildroot works. This is especially true with the init scripts. Would it 
be best to make a bunch of modifications to the refpolicy to make it work 
for buildroot? I'm not sure the best way to proceed with this.

> > +REFPOLICY_DEPENDENCIES = host-m4 host-checkpolicy host-
> policycoreutils \
> > +   host-setools host-python-pyxml policycoreutils
> 
> Do we really need all those dependencies? I've tried to 
> draw a diagram
> of all the host and target dependencies between all these SELinux
> packages, but I must admit I get a bit lost. If you could give some
> general comments on why the various target/host variants of each
> package are needed, that'd be really great.

I will create a diagram and submit it with the documentation that needs to 
be created.  Hopefully that will be done by the end of the week but I am 
pretty busy with several things right now. 

> > +define REFPOLICY_BUILD_SPECIFIC_PATCH_CMDS
> > +   @echo "Applying board specific patches"
> > +   $(ifneq $(BR2_PACKAGE_REFPOLICY_PATCH_FOLDER) "", \
> > +      toolchain/patch-kernel.sh $(@D) \
> > +      $(call qstrip,$
> (BR2_PACKAGE_REFPOLICY_PATCH_FOLDER)) refpolicy-\*.patch)
> > +endef
> > +
> > +REFPOLICY_POST_PATCH_HOOKS += REFPOLICY_BUILD_SPECIFIC_PATCH_CMDS
> 
> This part would become unneeded, as per the above suggestions.

I'll remove it.

> > +# Pointing to the host compiled SELinux applications 
> while using the target 
> > +# cross compiler.  Note, the TEST_TOOLCHAIN option will
> also set the 
> > +# LD_LIBRARY_PATH at run time.
> > +REFPOLICY_MAKE_CMDS = $(HOST_CONFIGURE_OPTS) \
> 
> I'm not really a big fan of passing $(HOST_CONFIGURE_OPTS) when
> building a target package. If all you need is that the PATH contains
> output/host/usr/bin so that the host SELinux applications are used,
> then just use $(TARGET_MAKE_ENV) :
> 
>    $(TARGET_MAKE_ENV) $(MAKE1) ...

I'll add that to the REFPOLICY_MAKE variable and change the 
HOST_CONFIGURE_OPTS to TARGET_CONFIGURE_OPTS.

> > +   TEST_TOOLCHAIN="$(HOST_DIR)" \
> > +   PYTHON="$(HOST_DIR)/usr/bin/python" \
> > +   M4="$(HOST_DIR)/usr/bin/m4"
> 
> Those two last lines should then be unneeded.

I'll remove them

> > +   sed -i "/TYPE/c\TYPE = $
> (BR2_PACKAGE_REFPOLICY_TYPE)" $(@D)/build.conf
> > +   sed -i "/NAME/c\NAME = $
> (BR2_PACKAGE_REFPOLICY_NAME)" $(@D)/build.conf
> > +   sed -i "/DISTRO/c\DISTRO = $
> (BR2_PACKAGE_REFPOLICY_DIST)" $(@D)/build.conf
> > +   sed -i "/MONOLITHIC/c\MONOLITHIC = $
> (BR2_PACKAGE_REFPOLICY_MONOLITHIC)" $(@D)/build.conf
> 
> Use $(SED) instead of sed -i

Agreed.

> > +define REFPOLICY_INSTALL_TARGET_CMDS
> > +   $(REFPOLICY_MAKE) -C $(@D) install $
> (REFPOLICY_MAKE_CMDS) DESTDIR=$(TARGET_DIR)
> > +   $(INSTALL) -m 0755 package/refpolicy/config $
> (TARGET_DIR)/etc/selinux/
> 
> Use -D and specify the destination path entirely.

I'll make that change.

> > +   $(INSTALL) -m 0755 package/refpolicy/S12selinux $
> (TARGET_DIR)/etc/init.d/
> 
> Should be using the INIT_SYSV mechanism (look at other 
> packages and/or
> documentation), use -D and specific the destination path entirely.

Agreed.

> > +   if [ ! -f $(TARGET_DIR)/etc/selinux/$
> (BR2_PACKAGE_REFPOLICY_NAME)/contexts/files/file_contexts.local ]; \
> > +   then \
> > +      touch $(TARGET_DIR)/etc/selinux/$
> (BR2_PACKAGE_REFPOLICY_NAME)/contexts/files/file_contexts.local; \
> > +   fi
> 
> Why not just touch it? If it exists, it will just update 
> its timestamp,
> so no big deal.

Good point.  I'll make that change.

> > +   # Currently, semodule is unabled to compile the 
> policy during the build so 
> > +   # the modules must be compiled into the policy 
> during the first boot.  This 
> > +   # is done by the S12selinux startup script.
> > +   #( export PATH=$(TARGET_PATH); \
> > +   #   $(HOST_DIR)/usr/sbin/semodule -v -n -p $
> (TARGET_DIR) -s $(BR2_PACKAGE_REFPOLICY_NAME) \
> > +   #      -b $(@D)/base.pp -i $(shell ls $(@D)/*.pp | 
> grep -v base); \
> > +   #)
> 
> So if this was done at build time, we could avoid having a bunch of
> tools on the target?

This is only for the modular policy.  The monolithic policy will be 
completely built on the host and saved to the target.  I could probably go 
through and pair down a bunch of dependencies based on that.  I'll look 
into that and make some changes.

Thanks,
Clayton

Clayton Shotwell
Software Engineer
clshotwe at rockwellcollins.com
www.rockwellcollins.com 


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130923/45ea7681/attachment-0001.html>
