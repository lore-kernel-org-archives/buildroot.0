From: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
Date: Thu, 5 Jan 2017 12:11:33 -0600
Subject: [Buildroot] [PATCH v13 2/8] refpolicy: new package
In-Reply-To: <20161212232121.01e9059e@free-electrons.com>
References: <1477423570-15694-1-git-send-email-bryce.ferguson@rockwellcollins.com>
 <1477423570-15694-2-git-send-email-bryce.ferguson@rockwellcollins.com>
 <20161212232121.01e9059e@free-electrons.com>
Message-ID: <CAKGmAFqOcWscn5bmiL=WvMct2vv38EhepqnWFqy1XesDuK180w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Dec 12, 2016 at 4:21 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:
>
> Hello,
>
> On Tue, 25 Oct 2016 14:26:04 -0500, Bryce Ferguson wrote:
> > From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> >
> > The patch is for adding selinux reference policy (refpolicy).
> > It is a complete SELinux policy that can be used as the system policy
> > for a variety of systems and used as the basis for creating other
policies.
> >
> > Changes were made to this patch in between versions 12 and 13 for which
> > the change history can be found here: https://patchwork.ozlabs.org/p
atch/649175/
> >
> > Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> > Reviewed-by: Samuel Martin <s.martin49@gmail.com>
> > Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
> > Signed-off-by: David Graziano <david.graziano@rockwellcollins.com>
> > Signed-off-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
>
> This patch/commit is too complicated / too long. Please try to split it
> into smaller chunks by only introducing the very mandatory
> functionality first, and progressively add more capabilities.
>
> It also has a number of issues. See below for the details.

I have split this commit in three which should replace this one.  In these
commits, I have also addressed your comments.

>
> > diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
> > new file mode 100644
> > index 0000000..5a46829
> > --- /dev/null
> > +++ b/package/refpolicy/Config.in
> > @@ -0,0 +1,146 @@
> > +config BR2_PACKAGE_REFPOLICY
> > +     bool "refpolicy"
> > +     select BR2_PACKAGE_POLICYCOREUTILS
> > +     select BR2_PACKAGE_BUSYBOX_SELINUX if BR2_PACKAGE_BUSYBOX
> > +     depends on BR2_TOOLCHAIN_HAS_THREADS # policycoreutils
> > +     depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL #
policycoreutils
>
> This does not properly account for the dependencies of policycoreutils
> and SELinux support in Busybox, which are:
>
>         depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS # libsemanage
>         depends on BR2_TOOLCHAIN_HAS_THREADS # libsemanage
>         depends on !BR2_STATIC_LIBS #libsemanage
>         depends on !BR2_arc # libsemanage
>         depends on BR2_TOOLCHAIN_USES_GLIBC # libsemanage
>

Fixed in new set of commits.

> > +comment "refpolicy needs a toolchain w/ threads, glibc or musl"
> > +     depends on !BR2_TOOLCHAIN_HAS_THREADS \
> > +             || !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
>
> So this comment needs fixing. It should be:
>
> comment "refpolicy needs a glibc toolchain w/ thread, dynamic library"
>         depends on !BR2_arc
>         depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
>         depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
>                 !BR2_TOOLCHAIN_USES_GLIBC
>

Fixed in new set of commits.

> > +if BR2_PACKAGE_REFPOLICY
> > +
> > +choice
> > +prompt "SELinux policy type"
> > +default BR2_PACKAGE_REFPOLICY_TYPE_STANDARD
> > +
> > +config BR2_PACKAGE_REFPOLICY_TYPE_STANDARD
> > +bool "Standard"
> > +help
> > +Standard SELinux policy
>
> What is a "Standard SELinux policy" ?
>

The "Standard SELinux policy" is type enforcement only.  I have specified
that in the new set of commits.

> > +
> > +config BR2_PACKAGE_REFPOLICY_TYPE_MCS
> > +bool "MCS"
> > +help
> > +SELinux policy with multi-catagory support
>
> Typo: category
>

Fixed typos in new set of commits.

> > +
> > +config BR2_PACKAGE_REFPOLICY_TYPE_MLS
> > +bool "MLS"
> > +help
> > +SELinux policy with multi-catagory and multi-level support
>
> Typo: category
>
> > +endchoice
>
> The indentation of the choice is all wrong. It should be like this:
>
> choice
>         prompt "SELinux policy type
>         default BR2_PACKAGE_REFPOLICY_TYPE_STANDARD
>
> config BR2_PACKAGE_REFPOLICY_TYPE_STANDARD
>         bool "Standard"
>         help
>           ....
>
> config ...
>         bool ...
>         help
>           ....
>
> endchoice

Fixed indentation in new set of commits.

> > +config BR2_PACKAGE_REFPOLICY_NAME
> > +     string "Custom policy Name"
> > +     default "Buildroot"
>
> Is it really useful to be able to customize this? I guess it can be
> dropped in a first iteration.
>

Dropped in new set of commits.

> > +config BR2_PACKAGE_REFPOLICY_CUSTOM_GIT
> > +     bool "Custom Git repository"
> > +     select BR2_PACKAGE_REFPOLICY_CONTRIB
>
> This package no longer exists, and you're actually fetching it from the
> refpolicy Git repo through the submodule if I understand correctly.

Yes refpolicy uses the git submodule.  This has been removed in the new set
of commits.

> Same for this functionality: separate patch. I'm also not sure to
> understand why we would want this exactly. What does this repository
> typically contains? Can you show the layout of what it contains, so we
> can understand what it's like?

The custom git repository stuff was an artifact of an outdated method we
were using.  I have removed it in the new set of commits.

> > diff --git a/package/refpolicy/booleans.conf
b/package/refpolicy/booleans.conf
> > new file mode 100644
> > index 0000000..31c70b9
> > --- /dev/null
> > +++ b/package/refpolicy/booleans.conf
>
> How was this file generated?

Refpolicy generates modules.conf and booleans.conf as part of the build.
The files here are taken from the build and paired down to a minimal amount
of functionality to cut down on build times.  Each of them I have added as
a separate commit to keep the patch sizes down.

> > diff --git a/package/refpolicy/modules.conf b/package/refpolicy/
modules.conf
> > new file mode 100644
> > index 0000000..2304dc4
> > --- /dev/null
> > +++ b/package/refpolicy/modules.conf
>
> How was this file generated? Do we need to keep it inside Buildroot?

See comment above.

> > +
> > +# Passing the HOST_CONFIGURE_OPTS to the target build because all of
the
> > +# build utilities are expected to be on system. This fools the make
files
> > +# into using the host built utilities to compile the SELinux policy for
> > +# the target.
> > +#
> > +# Note, the TEST_TOOLCHAIN option will also set the
> > +# LD_LIBRARY_PATH at run time.
> > +REFPOLICY_MAKE_OPTS = $(HOST_CONFIGURE_OPTS) \
> > +     TEST_TOOLCHAIN="$(HOST_DIR)"
>
> That's really weird, and makes me wonder if we shouldn't have a
> host-refpolicy package to build whatever host tool is needed, and a
> refpolicy target package to actually build/install the policy on the
> target.
>

We tracked this problem down and it ended up being one support tool that
wasn't building correctly.  The reason it previously worked was because
refpolicy doesn't build C application or binaries.  It uses python to build
bytecode binary files for the policy.  A fix has been added for this in the
new set of patches.

> > +
> > +     $(REFPOLICY_MAKE_ENV) $(REFPOLICY_MAKE) -C $(@D) conf \
> > +             $(REFPOLICY_MAKE_OPTS) DESTDIR=$(STAGING_DIR)
> > +     if [ -f $(@D)/modules.conf.bk ]; then \
> > +             echo "[Preserved modules.conf]" ; \
> > +             mv $(@D)/modules.conf.bk $(@D)/policy/modules.conf ; \
> > +     fi
>
> Not clear at all why we need this modules.conf.bk dance. Since it's
> only for "an external repo", can we get rid of this for now, or at
> least have it as part of a subsequent patch.

This was another artifact from an internal build process and has been
removed in the new set of patches.

> > +
> > +define REFPOLICY_INSTALL_INIT_SYSV
> > +     $(INSTALL) -m 0755 -D package/refpolicy/S00selinux \
> > +             $(TARGET_DIR)/etc/init.d/S00selinux
> > +endef
> > +
> > +ifeq ($(BR2_PACKAGE_REFPOLICY_MODULAR),y)
> > +$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/selinux/$(BR
2_PACKAGE_REFPOLICY_NAME)/policy
> > +$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/selinux/$(BR
2_PACKAGE_REFPOLICY_NAME)/modules/active/modules
> > +$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/selinux/$(BR
2_PACKAGE_REFPOLICY_NAME)/contexts/files
> > +touch $(TARGET_DIR)/etc/selinux/$(BR2_PACKAGE_REFPOLICY_NAME)/cont
exts/files/file_contexts.local
>
> This definitely cannot work at all, it's not part of any command.
> Building a modular policy should only be added in a follow-up patch, to
> keep the initial patch simpler.
>

I have removed the modular policy option in the new set of patches.

> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com


Thank you so much for the feedback!

-- 


Bryce Ferguson
Software Engineer
Airborne Information Solutions \ Secure Platforms

400 Collins Rd NE Cedar Rapids, Iowa 52498

Bryce.Ferguson at rockwellcollins.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170105/62137b3a/attachment.html>
