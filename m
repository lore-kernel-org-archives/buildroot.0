From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Aug 2015 12:41:10 +0200
Subject: [Buildroot] [PATCH v2] pkg-kernel-module: Die when kernel
	module are disabled
In-Reply-To: <20150818094747.GC3799@free.fr> (Yann E. MORIN's message of "Tue, 
 18 Aug 2015 11:47:47 +0200")
References: <1439795444-32337-1-git-send-email-nrubinstein@aldebaran.com>
 <20150817163030.15ea69aa@free-electrons.com>
 <87h9nx887c.fsf@dell.be.48ers.dk> <20150818094747.GC3799@free.fr>
Message-ID: <878u9898vt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

>> Couldn't we instead just force modules support on in the kernel if the
 >> pkg-kernel-module infrastructure is used?

 > And how do you suggest we test whether the kernel-module infra is used?

 >     1) it *is* used already: we do have packages that do call
 >         $(eval $(kernel-module)) , but I guess that's not what
 >         you meant. ;-)

 >     2) so you probably meant: if we actually need to build a kernel
 >        module.

 > But that's not so easy:

 >   - we need to know whether to enable moduls when parsing linux/linux.mk

 >   - external packages may call kernel-module

 >   - external packages are parsed after linux.mk

 > So, too late...

If we can come up with a solution that only works for internal packages
then that is imho still better than what we have today. We can still
leave the check in the pkg-kernel-module infrastructure to atleast warn
BR2_EXTERNAL users.

 > We can't enable kernel modules just from the .mk, we can only check for
 > them.

 > Unless we add an hidden kconfig knob BR2)LINUX_NEEDS_MODULES that
 > packages may select if they want to build modules. Of a visible knob
 > (user-selectable) that packages can depend on if they need to build
 > kernel modules...

Or the pkg-kernel-module infrastructure can just set a variable that
gets checked by LINUX_KCONFIG_FIXUP_CMDS, E.G. something like:

diff --git a/package/pkg-kernel-module.mk b/package/pkg-kernel-module.mk
index 6fb7704..436a721 100644
--- a/package/pkg-kernel-module.mk
+++ b/package/pkg-kernel-module.mk
@@ -91,6 +91,10 @@ define $(2)_KERNEL_MODULES_INSTALL
 endef
 $(2)_POST_INSTALL_TARGET_HOOKS += $(2)_KERNEL_MODULES_INSTALL
 
+ifeq ($(BR2_PACKAGE_$(2)),y)
+LINUX_NEEDS_MODULES = YES
+endif
+
 endef
 
 ################################################################################


And then:

diff --git a/linux/linux.mk b/linux/linux.mk
index d91dbb2..eb7ce7e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -219,6 +219,8 @@ define LINUX_KCONFIG_FIXUP_CMDS
                $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_MARK,$(@D)/.config))
        $(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
                $(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB,$(@D)/.config))
+       $(if $(LINUX_NEEDS_MODULES),
+               $(call KCONFIG_ENABLE_OPT,CONFIG_MODULES,$(@D)/.config))
 endef
 
 ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)

 > Needless to say, for 2015.08, No?'s patch is good to go in, while the
 > alternatives are not; they can however be done post-2015.08.

Agreed, this is not a new regression.

-- 
Venlig hilsen,
Peter Korsgaard 
