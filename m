From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 24 Sep 2020 13:42:40 -0500
Subject: [Buildroot] [PATCH 1/2] package/uboot-tools: migrate
 BR2_TARGET_UBOOT_ENVIMAGE from U-Boot pkg
In-Reply-To: <7fa37438-5aa6-05e0-917a-62037fc7a3c4@mind.be>
References: <20200923191105.34415-1-matthew.weber@rockwellcollins.com>
 <20200923191105.34415-2-matthew.weber@rockwellcollins.com>
 <7fa37438-5aa6-05e0-917a-62037fc7a3c4@mind.be>
Message-ID: <CANQCQpawfP7+eGW==M_Bkaurysv=FVpr+Ey+x1AnNzDNotGVVw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,


On Wed, Sep 23, 2020 at 4:01 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>  Hi Matt,
>
>  Some comments about legacy handling, but also something approximating a NACK at
> the end...
>
> On 23/09/2020 21:11, Matt Weber wrote:
> > Migrating the support for this feature to uboot-tools to gain the
> > ability to build env files when BR2_TARGET_UBOOT isn't selected.
> >
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> > ---
> >  Config.in.legacy                   |  7 ++++
> >  boot/uboot/Config.in               | 43 ------------------------
> >  boot/uboot/uboot.mk                | 25 --------------
> >  package/uboot-tools/Config.in.host | 54 ++++++++++++++++++++++++++++--
> >  package/uboot-tools/uboot-tools.mk | 33 ++++++++++++++++++
> >  5 files changed, 92 insertions(+), 70 deletions(-)
> >
> > diff --git a/Config.in.legacy b/Config.in.legacy
> > index ae583b912f..6359ca148c 100644
> > --- a/Config.in.legacy
> > +++ b/Config.in.legacy
> > @@ -146,6 +146,13 @@ endif
> >
> >  comment "Legacy options removed in 2020.11"
> >
> > +config BR2_TARGET_UBOOT_ENVIMAGE
> > +     bool "u-boot env generation was moved"
> > +     select BR2_LEGACY
> > +     select BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE
>
>  This won't work, you need to select host-uboot-tools explicitly:
>
>         select BR2_PACKAGE_HOST_UBOOT_TOOLS
>         select BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE
>
> (same for the other patch).
>
>  Also, we need legacy handling for all of the suboptions as well, since you
> changed their name. See the section about handling strings at the beginning of
> Config.in.legacy.
>

Ah good catch, I'll fix that up.

> [snip]
> > diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
> > index a06c25998f..c26f5d332c 100644
> > --- a/package/uboot-tools/uboot-tools.mk
> > +++ b/package/uboot-tools/uboot-tools.mk
> > @@ -110,10 +110,43 @@ define HOST_UBOOT_TOOLS_BUILD_CMDS
> >       $(BR2_MAKE1) -C $(@D) $(HOST_UBOOT_TOOLS_MAKE_OPTS) tools-only
> >  endef
> >
> > +ifeq ($(BR2_TARGET_UBOOT),y)
> > +define UBOOT_TOOLS_GENERATE_ENV_DEFAULTS
>
>  (nitpick) since this is used in HOST_UBOOT_TOOLS_INSTALL_CMDS, it should be
> called HOST_UBOOT_TOOLS_GENERATE_ENV_DEFAULTS. Same for all the other variables
> introduced here.

Sure

>
> > +     CROSS_COMPILE="$(TARGET_CROSS)" \
> > +             $(UBOOT_SRCDIR)/scripts/get_default_envs.sh \
> > +             $(UBOOT_SRCDIR) \
> > +             >$(@D)/boot-env-defaults.txt
> > +endef
> > +UBOOT_TOOLS_DEPENDENCIES += uboot
>
>  This raised my eyebrows. For one thing, until the second patch is applied, this
> will create a circular dependency. But in general, we don't like it if one
> package peeks into the source tree of another package. So I wonder if this is
> the best approach.
>
>  To be honest, in general I'm struggling a bit with our uboot-tools package.
> Ideally, if you build U-Boot, you'd like to use the same version for uboot-tools
> as well. So I'm thinking, maybe we should make uboot-tools a virtual package
> that can be implemented by uboot itself, or by a new uboot-tools-standalone
> package if uboot is not selected.
>
>  Well, that's maybe a bit too complicated, and the perfect is the enemy of the
> good, and your use case makes a lot of sense, so let's merge this after all :-)

:-)   I did find that this dependency needed to be
HOST_UBOOT_TOOLS_DEPENDENCIES, I had missed that in my v1

>
>
> > +endif
> > +
> > +ifneq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE),)
> > +UBOOT_TOOLS_GENERATE_ENV_FILE = $(call qstrip,$(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE))
> > +define UBOOT_TOOLS_GENERATE_ENV_IMAGE
> > +     $(if $(UBOOT_TOOLS_GENERATE_ENV_FILE), \
> > +             cat $(UBOOT_TOOLS_GENERATE_ENV_FILE), \
> > +             cat $(@D)/boot-env-defaults.txt) \
> > +             >$(@D)/buildroot-env.txt
>
>  Since we now always have a file, the cat becomes redundant. Instead, we can
> just use the appropriate file directly instead of buildroot-env.txt.

Sure


> > +
> > +ifeq ($(BR_BUILDING),y)
> > +ifeq ($(call qstrip,$(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE)),)
> > +$(error Please provide U-Boot environment size (BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE setting))
>
>  We also need to check here that UBOOT_TOOLS_GENERATE_ENV_FILE is non-empty
> unless BR2_TARGET_UBOOT is selected.
>

Sure

>  Also, these new options will break the random config generation, because the
> string options don't get set. So we either need to provide default values for
> those strings (nasty IMO - you can't give a default that is sensible to the user
> for either of them) or we have to update genrandconfig to handle the situation
> (preferably by giving them a value, so this feature gets tested in the
> autobuilders).
>

I will look to add a conditional in genrandconfig to update to point
at an empty file.  Or a file with a single command / value.  (testing
now)

Thanks for the review
Matt
