From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 15 Dec 2019 09:40:22 -0800
Subject: [Buildroot] [PATCH 2/2] package/libsemanage: allow the user to
 specify a kernel version
In-Reply-To: <20191215131019.2a593276@windsurf.home>
References: <20191215011517.1977342-1-aduskett@gmail.com>
 <20191215011517.1977342-3-aduskett@gmail.com>
 <20191215131019.2a593276@windsurf.home>
Message-ID: <CAFSsvmr5W0sngKkgRnJM4bsbSWdo4Ro85ufRG9Fnev6Ewo-PPQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello;

On Sun, Dec 15, 2019 at 4:10 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Sat, 14 Dec 2019 17:15:17 -0800
> aduskett at gmail.com wrote:
>
>
> > diff --git a/package/libsemanage/Config.in b/package/libsemanage/Config.in
> > index 814bf293d7..6c3e269579 100644
> > --- a/package/libsemanage/Config.in
> > +++ b/package/libsemanage/Config.in
> > @@ -44,7 +44,12 @@ config BR2_PACKAGE_LIBSEMANAGE_POLICY_MAX_VERSION
> >
> >  endif # BR2_PACKAGE_LIBSEMANAGE_POLICY_MANUAL_VERSION
> >
> > -endif # BR2_PACKAGE_LIBSEMANAGE
> > +config BR2_PACKAGE_LIBSEMANAGE_KERNEL_VERSION
> > +     string "Kernel version being built"
> > +     help
> > +       The version of the kernel being built. This version must be in
> > +       the standard X.X format (IE: 4.0 or 5.2.1)
> > +endif
>
> I don't understand how this option articulates with the options added
> in PATCH 1/2.
>
> In my opinion, this PATCH 2/2 should in fact make the
> BR2_PACKAGE_LIBSEMANAGE_POLICY_MAX_VERSION option added in PATCH 1/2
> invisible when BR2_LINUX_KERNEL=y, by adding a:
>
>         depends on !BR2_LINUX_KERNEL
>
> and then libsemanage.mk has two possibilities:
>
>  (1) BR2_LINUX_KERNEL=y, in which case you add "linux" to
>      LIBSEMANAGE_DEPENDENCIES and use LINUX_VERSION_PROBED to know the
>      kernel version
>
That is not possible. I tried for a few hours and was not able to use
LINUX_VERSION_PROBED,
or else I would have.

>  (2) BR2_LINUX_KERNEL is not set, in which case
>      BR2_PACKAGE_LIBSEMANAGE_POLICY_MAX_VERSION defines the maximum
>      policy version, as is done in PATCH 1/2.
>
> Yes it means that when the user is building his kernel manually,
> outside of Buildroot, he is on his own to provide the appropriate
> maximum SELinux policy version supported. But that's perfectly OK, just
> like he is on his own to make sure that his kernel has the right
> configuration options to have systemd work, for example.
>
I want this to be possible, I want to use LINUX_VERSION_PROBED, but I
was not able to
do so.

> > +function get_max_kernel_policy_version(){
> > +  LIBSEMANAGE_LINUX_VERSION="${1}"
> > +  # Only the major and minor versions are needed. Sub minor version bumps do not
> > +  # receive SELinux policy version bump updates.
> > +  LIBSEMANAGE_LINUX_VERSION_MAJOR=$(echo ${LIBSEMANAGE_LINUX_VERSION} | cut -d"." -f1)
> > +  LIBSEMANAGE_LINUX_VERSION_MINOR=$(echo ${LIBSEMANAGE_LINUX_VERSION} | cut -d"." -f2)
>
> You don't necessarily have to follow the naming convention of Buildroot
> makefile variables in this shell script. Actually, it makes it a bit
> difficult to read, perhaps just:
>
>         major=$(echo ${1} | cut -d. -f1)
>         minor=$(echo ${1} | cut -d. -f2)
>
sounds fine to me!

> > +  # Default maximum policy version
> > +  MAX_POLICY_VERSION="31"
> > +  # <= 2.6.x
> > +  if [ ${LIBSEMANAGE_LINUX_VERSION_MAJOR} -eq 2 ]; then
> > +    MAX_POLICY_VERSION="25"
> > +  fi
> > +
> > +  # > 2.6 <= 3.5
>
> Less or equal to 3.5
>
> > +  if [ ${LIBSEMANAGE_LINUX_VERSION_MAJOR} -eq 3 -a ${LIBSEMANAGE_LINUX_VERSION_MINOR} -le 4 ]; then
>
> ... but less or equal to 3.4
>
> > +    MAX_POLICY_VERSION="26"
> > +  fi
> > +
> > +  # > 3.5 <= 3.14
>
> Less than or equal to 3.14
>
> > +  if [ ${LIBSEMANAGE_LINUX_VERSION_MAJOR} -eq 3 -a ${LIBSEMANAGE_LINUX_VERSION_MINOR} -lt 14 ]; then
>
> .. but strictly less than 3.14
>
> > +    MAX_POLICY_VERSION="28"
> > +  fi
> > +
> > +  # > 3.14
>
> Strictly greater than 3.14...
>
> > +  if [ ${LIBSEMANAGE_LINUX_VERSION_MAJOR} -eq 3 -a ${LIBSEMANAGE_LINUX_VERSION_MINOR} -ge 14 ]; then
>
> ... but greater or equal to 3.14
>
> > +    MAX_POLICY_VERSION="29"
> > +  fi
> > +
> > +  # > 4.0 < 4.3
> > +  if [ ${LIBSEMANAGE_LINUX_VERSION_MAJOR} -eq 4 -a ${LIBSEMANAGE_LINUX_VERSION_MINOR} -lt 3 ]; then
> > +    MAX_POLICY_VERSION="29"
> > +  fi
> > +
> > +  # > 4.3
>
> Strictly greater than 4.3
>
> > +  if [ ${LIBSEMANAGE_LINUX_VERSION_MAJOR} -eq 4 -a ${LIBSEMANAGE_LINUX_VERSION_MINOR} -ge 3 ]; then
>
> .. but greater or equal
>
> > +    MAX_POLICY_VERSION="30"
> > +  fi
> > +
> > +  # > 4.13
> > +  if [ ${LIBSEMANAGE_LINUX_VERSION_MAJOR} -eq 4 -a ${LIBSEMANAGE_LINUX_VERSION_MINOR} -ge 13 ]; then
> > +    MAX_POLICY_VERSION="31"
> > +  fi
> > +
> > +  # > 5.0 <= 5.5
>
> I don't see the point of having a max defined to 5.5, just for now
> assume that all versions > 5.0 will support policy version 31.
>
> Also, you don't handle the case of 5.0, your condition says that policy
> version 31 is supported > 5.0, so only starting from 5.1, but still
> your condition below will match 5.0.
>
> > +  if [ ${LIBSEMANAGE_LINUX_VERSION_MAJOR} -eq 5 -a ${LIBSEMANAGE_LINUX_VERSION_MINOR} -lt 5 ]; then
> > +    MAX_POLICY_VERSION="31"
> > +  fi
>
> This can be rewritten like this:
>
> case 1 in
> $((major == 2)))
>         echo 25;;
> $((major == 3 && $minor <= 4)))
>         echo 26;;
> $((major == 3 && $minor <= 14)))
>         echo 28;;
> $((major == 3 && $minor > 14)))
>         echo 29;;
> $((major == 4 && $minor <= 3)))
>         echo 29;;
> $((major == 4 && $minor <= 13)))
>         echo 30;;
> $((major == 4 && $minor > 13)))
>         echo 31;
> $((major >= 5)))
>         echo 31;;
> esac
>
> a bit more compact isn't it? Of course, you'll have to set the shebang
> to /bin/bash.
If you are ok with it, that works for me.

>
>
> > diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
> > index d260e449eb..57c58a5570 100644
> > --- a/package/libsemanage/libsemanage.mk
> > +++ b/package/libsemanage/libsemanage.mk
> > @@ -25,14 +25,56 @@ LIBSEMANAGE_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
> >  # This default value may be overwrriten by setting the policy-version = line in
> >  # /etc/semanage/semanage.conf.
> >  LIBSEMANAGE_MAX_POLICY_VERSION = 31
> > +
> > +# If a kernel version is specified, get the maximum supported policy version
> > +# of that kernel.
> > +LIBSEMANAGE_KERNEL_VERSION = $(call qstrip,$(BR2_PACKAGE_LIBSEMANAGE_KERNEL_VERSION))
> > +ifneq ($(LIBSEMANAGE_KERNEL_VERSION),)
> > +LIBSEMANAGE_MAX_KERNEL_POLICY_VERSION := \
> > +     $(shell package/libsemanage/get-kernel-max-policy-version.sh \
> > +     "get_max_kernel_policy_version" \
> > +     $(BR2_PACKAGE_LIBSEMANAGE_KERNEL_VERSION))
> > +LIBSEMANAGE_MAX_POLICY_VERSION = $(LIBSEMANAGE_MAX_KERNEL_POLICY_VERSION)
> > +endif
> > +
> >  ifeq ($(BR2_PACKAGE_LIBSEMANAGE_POLICY_MANUAL_VERSION),y)
> >  LIBSEMANAGE_MAX_POLICY_VERSION = $(BR2_PACKAGE_LIBSEMANAGE_POLICY_MAX_VERSION)
> > +
> > +# If a kernel version is specified, check if the policy version set by the user
> > +# is lower or greater than the maximum supported policy version in the kernel.
> > +# If the policy is lower, display a warning.
> > +# If the policy is greater, throw an error.
> > +ifneq ($(LIBSEMANAGE_KERNEL_VERSION),)
> > +LIBSEMANAGE_MANUAL_POLICY_VERSION_CHECK := \
> > +     $(shell package/libsemanage/get-kernel-max-policy-version.sh \
> > +     "policy_version_check" \
> > +     $(LIBSEMANAGE_MAX_KERNEL_POLICY_VERSION) \
> > +     $(BR2_PACKAGE_LIBSEMANAGE_POLICY_MAX_VERSION))
>
> This is no longer needed: if BR2_LINUX_KERNEL=y, you know what the
> kernel version is, and the user should no longer enter a manual version.
Again, I couldn't find a way to use LINUX_VERSION_PROBED.

>
> > +ifeq ($(LIBSEMANAGE_MANUAL_POLICY_VERSION_CHECK),lt)
> > +$(warning \
> > +     The policy version set for libsemanage $(BR2_PACKAGE_LIBSEMANAGE_POLICY_MAX_VERSION) \
> > +     is lower than the maximum policy version supported by the kernel being built: \
> > +     $(LIBSEMANAGE_MAX_KERNEL_POLICY_VERSION). It is HIGHLY recommended that you set the \
> > +     policy version to $(LIBSEMANAGE_MAX_KERNEL_POLICY_VERSION)! \
> > +     )
> > +endif
> > +
> > +ifeq ($(LIBSEMANAGE_MANUAL_POLICY_VERSION_CHECK),gt)
> > +$(error \
> > +     The policy version set for libsemanage $(BR2_PACKAGE_LIBSEMANAGE_POLICY_MAX_VERSION) \
> > +     is higher than the maximum policy version supported by the kernel being built: \
> > +     $(LIBSEMANAGE_MAX_KERNEL_POLICY_VERSION). \
> > +     )
> >  endif
> > +endif # ifeq ($(LIBSEMANAGE_KERNEL_VERSION),y)
> > +endif # ($(BR2_PACKAGE_LIBSEMANAGE_POLICY_MANUAL_VERSION),y)
> >
> >  define LIBSEMANAGE_SET_SEMANAGE_MAX_POLICY
> >       $(SED) "/policy-version = /c\policy-version = $(LIBSEMANAGE_MAX_POLICY_VERSION)" \
> >               $(TARGET_DIR)/etc/selinux/semanage.conf
> >  endef
> > +
>
> Spurious new line added.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
