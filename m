From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 9 Jun 2016 22:03:14 +0200
Subject: [Buildroot] [PATCH] RFC: adding customizable linux logo
In-Reply-To: <20160602220521.GB3714@free.fr>
References: <1454454342-27717-1-git-send-email-angelo.compagnucci@gmail.com>
 <20160601220300.5f38a5a2@free-electrons.com> <20160602220521.GB3714@free.fr>
Message-ID: <CA+TH9V=vZLn=0ubRy7YZrXnakN_=wG2X0PfTqHEGss87ocxLFw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Thomas, All,

2016-06-03 0:05 GMT+02:00 Yann E. MORIN <yann.morin.1998@free.fr>:
> Angelo, Thomas, All,
>
> On 2016-06-01 22:03 +0200, Thomas Petazzoni spake thusly:
>> Hello Angelo,
>>
>> It's been a while since you sent this patch. I don't know if this
>> feature is important enough to be integrated, but I'll do some review
>> anyway.
>>
>> On Wed,  3 Feb 2016 00:05:42 +0100, Angelo Compagnucci wrote:
>>
>> > diff --git a/linux/Config.ext.in b/linux/Config.ext.in
>> > index 755c23b..b752c9c 100644
>> > --- a/linux/Config.ext.in
>> > +++ b/linux/Config.ext.in
>> > @@ -1,5 +1,13 @@
>> >  menu "Linux Kernel Extensions"
>> >
>> > +# Custom logo
>> > +config BR2_LINUX_KERNEL_EXT_CUSTOMLOGO
>> > +   select BR2_PACKAGE_CUSTOMLOGO
>>
>> I think this customlogo package is not needed.
>
> Agreed. Just make the logo path an option directly here:
>
>     config BR2_LINUX_KERNEL_EXT_CUSTOMLOGO
>         bool "Custom logo"
>
>     config BR2_LINUX_KERNEL_EXT_CUSTOMLOGO_DIR
>         bool "directory with logo file(s)"
>         help
>           Directory with all the logo files to copy. Logo files must be
>           named:
>             logo_linux_mono.pbm         for the B&W version
>             logo_linux_vga16.ppm        for the 16-color version
>             logo_linux_clut224.ppm      for the 224-color version
>
> And then, in the .mk file (see below)...
>
>> > +   bool "Custom logo"
>> > +   help
>> > +     change linux boot logo with your own graphics.
>> > +     Can be used as an early bootsplash.
>>
>> This help text needs to be improved a bit.
>>
>> > +
>> >  # Xenomai
>> >  config BR2_LINUX_KERNEL_EXT_XENOMAI
>> >     bool "Adeos/Xenomai Real-time patch"
>> > diff --git a/linux/linux-ext-customlogo.mk b/linux/linux-ext-customlogo.mk
>> > new file mode 100644
>> > index 0000000..68c613a
>> > --- /dev/null
>> > +++ b/linux/linux-ext-customlogo.mk
>> > @@ -0,0 +1,11 @@
>> > +################################################################################
>> > +#
>> > +# Custom logo
>> > +#
>> > +################################################################################
>> > +
>> > +LINUX_EXTENSIONS += customlogo
>> > +
>> > +define CUSTOMLOGO_PREPARE_KERNEL
>>
>> You can do the conversion from the original image format to .ppm here
>> directly, and therefore avoid the need for the customlogo package.
>
> Or better yet, expect the user to provide pre-rendered images to start
> with (see at the end)...
>
>> > +   cp $(CUSTOMLOGO_DIR)/logo_linux_clut224.ppm $(LINUX_DIR)/drivers/video/logo/logo_linux_clut224.ppm
>
> ... and in the .mk file, just copy all logo files:
>
>     cp $(BR2_LINUX_KERNEL_EXT_CUSTOMLOGO_DIR)/logo_linux_*.p{p,b}m \
>        $(LINUX_DIR)/drivers/video/logo/
>
>> > +endef
>> > diff --git a/package/Config.in b/package/Config.in
>> > index 7ced9d4..1552f32 100644
>> > --- a/package/Config.in
>> > +++ b/package/Config.in
>> > @@ -214,6 +214,7 @@ comment "Sounds"
>> >
>> >  comment "Themes"
>> >     source "package/gtk2-engines/Config.in"
>> > +   source "package/customlogo/Config.in"
>> >
>> >  endmenu
>> >
>> > diff --git a/package/customlogo/Config.in b/package/customlogo/Config.in
>> > new file mode 100644
>> > index 0000000..f8502da
>> > --- /dev/null
>> > +++ b/package/customlogo/Config.in
>> > @@ -0,0 +1,16 @@
>> > +config BR2_PACKAGE_CUSTOMLOGO
>> > +   bool "Custom logo"
>> > +   help
>> > +     Change linux boot logo with your own graphics.
>> > +     Can be used as an early bootsplash.
>> > +
>> > +     *REQUIRES* a pre installed imagemagick on the host system.
>>
>> I don't think this is acceptable. You probably should add a
>> host-imagemagick package, and make the linux package depend on it when
>> a custom logo is selected.
>
> I don't think that adding host-imagemagick just for this is sane. Let
> the user provide a ppm image.
>
>> In addition, when a custom logo is selected, you probably want to tweak
>> the Linux kernel configuration to make sure it has the relevant options.
>
> Tweak or check? Or do we care?

A little recap:

a) I should rework the custom logo package and logic, no problem here.
b) Relaying on user pre-installed imagemagick it's not allowed by
buildroot policies but I don't want to build the complete
host-imagemagick only for converting a ppm.
c) IMHO, the complex part here is to convert correctly an image to a
kernel suitable ppm (not so trivial): let a user preparing his own ppm
it's not advisable and prone to errors.

So if b) and c) are not acceptable for buildroot policies, please
discard this patch.

Sincerely, Angelo

>
> Regards,
> Yann E. MORIN.
>
>> Thanks!
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
