From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Tue, 14 Jul 2015 09:59:09 -0500
Subject: [Buildroot] [PATCH v8 02/16] refpolicy: new package
In-Reply-To: <CAHXCMM+2PC771ruOvGcmPcv4GXGNRrRy4XZE3V--WR=g9oJGEQ@mail.gmail.com>
References: <1436570882-56442-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1436570882-56442-3-git-send-email-clayton.shotwell@rockwellcollins.com>
 <CAHXCMM+2PC771ruOvGcmPcv4GXGNRrRy4XZE3V--WR=g9oJGEQ@mail.gmail.com>
Message-ID: <CANn-YGReofOC8QGLKAKK6tJL3ev5j1_0tbTw22RPer9n2qMqfA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel,

On Tue, Jul 14, 2015 at 9:50 AM, Samuel Martin <s.martin49@gmail.com> wrote:
> Clayton, all,
>
> On Sat, Jul 11, 2015 at 1:27 AM, Clayton Shotwell
> <clayton.shotwell@rockwellcollins.com> wrote:
>> From: Clayton Shotwell <clshotwe@rockwellcollins.com>
>>
>> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
>> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
>
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>
> But still some nits ;-)
>
> [...]
>> diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
>> new file mode 100644
>> index 0000000..b6af100
>> --- /dev/null
>> +++ b/package/refpolicy/Config.in
>> @@ -0,0 +1,99 @@
>> +config BR2_PACKAGE_REFPOLICY
>> +       bool "refpolicy"
>> +       select BR2_PACKAGE_POLICYCOREUTILS
>> +       select BR2_PACKAGE_BUSYBOX_SELINUX if BR2_PACKAGE_BUSYBOX
>> +       depends on BR2_TOOLCHAIN_HAS_THREADS # policycoreutils
>> +       depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # policycoreutils
>> +       help
>> +         The SELinux Reference Policy project (refpolicy) is a
>> +         complete SELinux policy that can be used as the system
>> +         policy for a variety of systems and used as the basis
>> +         for creating other policies. Reference Policy was originally
>> +         based on the NSA example policy, but aims to accomplish
>> +         many additional goals.
>> +
>> +         The current refpolicy does not fully support Buildroot
>> +         and needs modifications to work with the default system
>> +         file layout.  These changes should be added as patches to
> nit: s/layout.  These/layout. These/

Fixed.

>> +         the refpolicy that modify a single SELinux policy.
>> +
>> +comment "refpolicy needs a toolchain w/ threads, glibc or musl"
>> +       depends on !BR2_TOOLCHAIN_HAS_THREADS \
>> +               || !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
>> +
>
> [...]
>
>> diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
>> new file mode 100644
>> index 0000000..dbc662d
>> --- /dev/null
>> +++ b/package/refpolicy/refpolicy.mk
>> @@ -0,0 +1,120 @@
>> +################################################################################
>> +#
>> +# refpolicy
>> +#
>> +################################################################################
>> +
>> +ifeq ($(BR2_PACKAGE_REFPOLICY_CUSTOM_GIT),y)
>> +REFPOLICY_SITE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL))
>> +REFPOLICY_VERSION = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_VERSION))
>> +REFPOLICY_SITE_METHOD = git
>> +REFPOLICY_DEPENDENCIES += refpolicy-contrib
>> +else
>> +REFPOLICY_VERSION = 2.20130424
>> +REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
>> +REFPOLICY_SITE = http://oss.tresys.com/files/refpolicy/
>> +endif
>> +REFPOLICY_LICENSE = GPLv2
>> +REFPOLICY_LICENSE_FILES = COPYING
>> +
>> +# Cannot use multiple threads to build the reference policy
>> +REFPOLICY_MAKE = $(TARGET_MAKE_ENV) $(MAKE1)
>> +
>> +REFPOLICY_DEPENDENCIES += host-m4 host-checkpolicy host-policycoreutils \
>> +       host-setools host-gawk host-python policycoreutils
>> +
>> +REFPOLICY_INSTALL_STAGING = YES
>> +
>> +REFPOLICY_POLICY_NAME = br_policy
>> +
>> +# To apply board specific customizations, create a refpolicy folder in
>> +# BR2_GLOBAL_PATCH_DIR.  These patches will be applied after the patches
>> +# in package/refpolicy
>> +
>> +# Passing the HOST_CONFIGURE_OPTS to the target build because all of the
>> +# build utilities are expected to be on system. This fools the make files
>> +# into using the host built utilities to compile the SELinux policy for
>> +# the target.
>> +#
>> +# Note, the TEST_TOOLCHAIN option will also set the
>> +# LD_LIBRARY_PATH at run time.
>> +REFPOLICY_MAKE_OPTS = $(HOST_CONFIGURE_OPTS) \
>> +       TEST_TOOLCHAIN="$(HOST_DIR)"
>> +
>> +# Build requires python2 to run
>> +REFPOLICY_MAKE_ENV = \
>> +       PYTHON="$(HOST_DIR)/usr/bin/python2" \
>> +       AWK="$(HOST_DIR)/usr/bin/gawk" \
>> +       M4="$(HOST_DIR)/usr/bin/m4"
>> +
>> +
>> +ifeq ($(BR2_PACKAGE_REFPOLICY_MODULAR),y)
>> +       REFPOLICY_MONOLITHIC = n
>> +else
>> +       REFPOLICY_MONOLITHIC = y
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_REFPOLICY_CUSTOM_GIT),y)
>> +define REFPOLICY_GIT_SUBMODULE_SETUP
>> +       rsync -ar $(RSYNC_VCS_EXCLUSIONS) $(REFPOLICY_CONTRIB_DIR)/* $(@D)/policy/modules/contrib/
> nit: wrap at ~70-80 characters

Fixed.

Thanks,
Clayton

Clayton Shotwell
Senior Software Engineer, Rockwell Collins
clayton.shotwell at rockwellcollins.com
