From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 14 May 2019 08:14:41 +0200
Subject: [Buildroot] [PATCH 1/6] boot/optee-os: install trusted shared
 libraries
In-Reply-To: <20190513225957.679620c0@windsurf.home>
References: <20190513201602.2549-1-etienne.carriere@linaro.org>
 <20190513225957.679620c0@windsurf.home>
Message-ID: <CAN5uoS_D9K8Tuuemt--+oNNVgmRjRNmiWb0XHBS__wunXwk9Bg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Mon, 13 May 2019 at 23:00, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Etienne,
>
> Thanks for your series of patches on OP-TEE. A couple of comments below.
>
> On Mon, 13 May 2019 22:15:57 +0200
> Etienne Carriere <etienne.carriere@linaro.org> wrote:
>
> >  config BR2_TARGET_OPTEE_OS_SERVICES
> > -     bool "Build service TAs"
> > +     bool "Service trusted application and shared libraries"
>
> I am not too happy with the change of wording, because all other
> options are worded as "Build XYZ", and your change moves away from this
> consistency.
>
> Can we keep:
>
>         bool "Build service TAs and libs"
>
> for example ?

Ok, i'll fix.

>
> > diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
> > index 6da20a9f3e..811bbbc6ea 100644
> > --- a/boot/optee-os/optee-os.mk
> > +++ b/boot/optee-os/optee-os.mk
> > @@ -77,8 +77,12 @@ endif # BR2_TARGET_OPTEE_OS_CORE
> >  ifeq ($(BR2_TARGET_OPTEE_OS_SERVICES),y)
> >  define OPTEE_OS_INSTALL_IMAGES_SERVICES
> >       mkdir -p $(TARGET_DIR)/lib/optee_armtz
> > -     $(INSTALL) -D -m 444 -t $(TARGET_DIR)/lib/optee_armtz \
> > -             $(@D)/$(OPTEE_OS_BUILDDIR_OUT)/ta/*/*.ta
> > +     [ -z "$(wildcard $(@D)/$(OPTEE_OS_BUILDDIR_OUT)/ta/*/*.ta)" ] || \
> > +             $(INSTALL) -D -m 444 -t $(TARGET_DIR)/lib/optee_armtz \
> > +                     $(@D)/$(OPTEE_OS_BUILDDIR_OUT)/ta/*/*.ta
> > +     [ -z "$(wildcard $(OPTEE_OS_SDK)/lib/*.ta)" ] || \
> > +             $(INSTALL) -D -m 444 -t $(TARGET_DIR)/lib/optee_armtz \
> > +                     $(OPTEE_OS_SDK)/lib/*.ta
>
> I am not a big fan of the conditionals here.
>
> The first one should I guess not be needed, because it was already
> non-conditional, so I don't see why it should become conditional.

OP-TEE OS content may change and possibly no TA being built.
For example, maybe one day the package will not build TAs unless some
per in-tree TA configuration.
This change aims at making this build script to be more flexible.

>
> The second one is less clear. In which cases do we have .ta files in
> OPTEE_OS_SDK/lib ? I did a build for the Qemu vexpress platform and
> didn't get any lib/*.ta file.

.ta file in lib/ build directory are generated when configuration
enabled trusted shared libraries,
which a platform may enable or not. The package default config current
does not enable shared trusted libs.

>
> If we really need a test, we could do it in make:
>
>         $(if $(wildcard $(OPTEE_OS_SDK)/lib/*.ta),
>                 ...)

ok.

>
> Also, and it should be fixed by a separate patch:
> OPTEE_OS_INSTALL_IMAGES_SERVICES contrary to what its name says
> installs stuff to $(TARGET_DIR), but is called from
> OPTEE_OS_INSTALL_IMAGES_CMDS. It should be called from
> OPTEE_OS_INSTALL_TARGET_CMDS instead, and probably renamed to
> OPTEE_OS_INSTALL_SERVICES or something like that.

Fine. Thanks for the help.

Best regards,
etienne

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
