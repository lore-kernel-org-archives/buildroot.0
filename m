From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 2 Nov 2018 15:19:58 +0100
Subject: [Buildroot] [PATCH 1/1] fwts: Enable optional efi_runtime
 kernel module build
In-Reply-To: <CAK4VdL2=P8w_6aoVkHmvtx8N6JnCSosG_btJooDz+Db1K9rRAg@mail.gmail.com>
References: <1541162207-8770-1-git-send-email-sumit.garg@linaro.org>
 <CAK4VdL2=P8w_6aoVkHmvtx8N6JnCSosG_btJooDz+Db1K9rRAg@mail.gmail.com>
Message-ID: <20181102141958.GB28575@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Erico, Sumit, All,

On 2018-11-02 14:57 +0100, Erico Nunes spake thusly:
> On Fri, Nov 2, 2018 at 1:37 PM Sumit Garg <sumit.garg@linaro.org> wrote:
> > +config BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE
> > +       bool "efi_runtime_module"
> 
> For a slightly better looking menu, I'd suggest dropping the second
> underscore and making it "efi_runtime module".

ACK.

> > +       depends on BR2_PACKAGE_FWTS
> 
> Looking at most packages, I think a more clear way to show this option
> only then fwts is selected, is to wrap it inside a 'if
> BR2_PACKAGE_FWTS' instead of a 'depends on' for this case. Not sure if
> it changes anything in practice but it seems more appropriate than a
> 'depends on' to me.

It depends (pun intended). While I do prefer an if-block as you suggest,
some package do use 'depends on', especially when there is only one or
two sub-options. So, historically, both exist, but using an the if-block
makes it more consistent.

> > +       depends on BR2_LINUX_KERNEL
> > +       help
> > +         Firmware Test Suite (FWTS) also provides EFI runtime kernel
> > +         module required to run UEFI tests.
> 
> As it is, the option looks confusing in the menu as it doesn't look
> like a fwts suboption. It looks like this:
> [*] fwts
> [ ] efi_runtime_module
> 
> I don't fully understand the Kconfig inner workings, but if
> BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE is moved to right after
> BR2_PACKAGE_FWTS (before the comment) then it becomes automatically
> indented and to me much more easier to understand that it is a fwts
> suboption:
> [*] fwts
> [ ]   efi_runtime_module

Exactly: options are only indented when they are right below the option
they depend on. This is an idiosyncracy of kconfig.

And using 'depends on' or an if-block is basically just equivalent.

> > diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
> > index 15f0afc..840190e 100644
> > --- a/package/fwts/fwts.mk
> > +++ b/package/fwts/fwts.mk
> > @@ -14,3 +14,9 @@ FWTS_DEPENDENCIES = host-bison host-flex host-pkgconf json-c libglib2 libbsd \
> >         $(if $(BR2_PACKAGE_DTC),dtc)
> >
> >  $(eval $(autotools-package))
> > +
> > +ifdef BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE
> > +FWTS_DEPENDENCIES += linux
> 
> You don't need to add linux as an explicit dependency if you are using
> $(kernel-module).
> 
> > +FWTS_MODULE_SUBDIRS = efi_runtime
> > +$(eval $(kernel-module))
> > +endif
> 
> This doesn't work for me, it doesn't trigger linux as a dependency and
> fails to build from a clean build. The entire block including the
> $(eval $(kernel-module)) needs to happen before $(eval
> $(autotools-package)) so that it works as intended.

Exactly, see:
    https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_packages_building_kernel_modules

    Unlike other package infrastructures, [kernel-module] is not
    stand-alone, and requires any of the other *-package macros be
    called after it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
