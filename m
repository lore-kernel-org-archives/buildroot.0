From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Mar 2013 10:08:42 +0100
Subject: [Buildroot] Package overriding
In-Reply-To: <CAE21AQraBRp3_94Td_Gw+D9NML+-X0e+2U=cwR979ww99_aJ=w@mail.gmail.com>
References: <CAE21AQraBRp3_94Td_Gw+D9NML+-X0e+2U=cwR979ww99_aJ=w@mail.gmail.com>
Message-ID: <20130318100842.17dc0b01@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Charles Manning,

On Mon, 18 Mar 2013 15:33:27 +1300, Charles Manning wrote:

> It seems to me that the package override feature is misnamed and has
> some shortcomings.
> 
> First off, the name is, IMHO, poor. Package Override is applied before
> tha packages are parsed. It does not override them. Instead it is
> really overriding configurations before the packages are read. Perhaps
> it should really be called CONFIG_OVERRIDE?
> 
> There is also a deficiency in that Package Override cannot override
> anything set up in the packages.

Yes. The idea is that the "package override file" use special variables
when it needs to override something from a package recipe. For now, the
only special variable available is <pkg>_OVERRIDE_SRCDIR. It actually
does more than just overriding the source directory: it also changes
the behavior of the package infrastructure: instead of
download/extract/patch, it switches to just use the provided source
directory.

> For example, I recently needed to add two more configuration lines to
> building bluez_utils.
> 
> Instead of:
> 
> BLUEZ_UTILS_CONF_OPT = --enable-test --enable-tools
> I wanted
> BLUEZ_UTILS_CONF_OPT = --enable-test --enable-tools --enable-bccmd --enable-dund

Yes, the current override mechanism doesn't support this.

> A logical way I can see to do this would be to have a mechanism
> similar to Package Override but that is applied after the packages are
> parsed.
> 
> --- Makefile	(revision 20385)
> +++ Makefile	(working copy)

Using Subversion ? :-)

> @@ -319,11 +319,20 @@
>  -include $(PACKAGE_OVERRIDE_FILE)
>  endif
> 
>  include package/*/*.mk
>  include hj/package/*/*.mk
>  include boot/common.mk
>  include linux/linux.mk
> 
> +POST_PACKAGE_OVERRIDE_FILE=$(call qstrip,$(BR2_POST_PACKAGE_OVERRIDE_FILE))
> +ifneq ($(POST_PACKAGE_OVERRIDE_FILE),)
> +-include $(POST_PACKAGE_OVERRIDE_FILE)
> +endif
> +
> +
> 
> Then have POST_PACKAGE_OVERRIDE_FILE point to a file which has
> 
> # Add bluez_utils options we need
> BLUEZ_UTILS_CONF_OPT +=  --enable-bccmd --enable-dund
> 
> Does that sound useful?

Does this actually work?

The potential problem I see is that the package variables
(<pkg>_BLABLA) are defined in the package .mk file and then used when
the generic-package, autotools-package or cmake-package macros are
expanded. I'm a bit lost as to whether those <pkg>_BLABLA variables are
actually used when the package macros are expanded, or when the
functions defined by the package macros are executed. This would have
to be verified, or confirmed by someone who is more capable than me in
understanding how many dollar signs are needed to make this work :)

Also, will this work to override the source directory? We definitely
don't want to have two different mechanisms to override stuff.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
