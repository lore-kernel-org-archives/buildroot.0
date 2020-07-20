From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Jul 2020 23:21:19 +0200
Subject: [Buildroot] [PATCH 4/8] boot/arm-trusted-firmware: add EDK2 as
 BL33 option
In-Reply-To: <20200720225941.796ff11c@windsurf.home>
References: <20200719180727.28202-1-hi@senzilla.io>
 <20200719180727.28202-5-hi@senzilla.io>
 <20200720225941.796ff11c@windsurf.home>
Message-ID: <20200720212119.GE2296@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Dick, All,

On 2020-07-20 22:59 +0200, Thomas Petazzoni spake thusly:
> +Yann Morin, on variable reference between packages.

TL;DR: don't use them but with great care!

(I know, that does not help. ;-] So, read on...)

> On Sun, 19 Jul 2020 18:10:03 +0000
> Dick Olsson <hi@senzilla.io> wrote:
[--SNIP--]
> > diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> > index a3553e36cf..58b48df5d8 100644
> > --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> > +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> > @@ -79,6 +79,13 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += AARCH32_SP=optee
> >  endif
> >  endif # BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE
> >  
> > +ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33),y)
> > +ARM_TRUSTED_FIRMWARE_DEPENDENCIES += edk2
> > +# Since the flash device names vary between platforms, we use the variable
> > +# provided by the EDK2 package this.
> > +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/$(EDK2_FD_NAME).fd
> 
> So there is this reference to a variable of another package, which I'm
> never sure if it works correctly. Yann, what is the rule again ? :-)

If a variable is expanded at the time of '$(eval $(foo-package))', then
you can't share variables bewtween packages.

That is the case for _VERSION for example, as that serves to create a
make-dependency in the form;

    build-dir/foo-$(FOO_VERSION): some-dependencies

If however, avariable is expanded in the configure, build, install,
etc... rules, then this is OK.

For example, cross-using a variable in a _CMDS or _HOOKS is OK.

Finally, if you can *ensure* the ordering, by defining the variable
before the fiels that uses it are included, then that is also OK.

This is the case for exampe for the qt5 packages, or for barebox, where
the include order *has been written* to ensure that.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
