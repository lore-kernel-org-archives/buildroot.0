From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 18 Jul 2013 02:21:44 -0500
Subject: [Buildroot] [RFC 2/3] sunxi-mali: new package
In-Reply-To: <20130716210801.04f8e299@skate>
References: <1373778632-16531-1-git-send-email-spenser@gillilanding.com>
 <1373778632-16531-3-git-send-email-spenser@gillilanding.com>
 <20130716105514.3a6bd85c@skate>
 <CAEBucnCaQXD1Q__3bgx__3BPkNxGybGi5fQZecJ8nUo5zLVAgg@mail.gmail.com>
 <20130716210801.04f8e299@skate>
Message-ID: <CAEBucnAAdKuub3sHu4emRcCj8Kw=O1nE4DDEEFZd2fK4XRCYjg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

> Ok. As discussed on IRC, one option would be to extend the download
> infrastructure to be able to pass the --recursive option to Git. Not
> sure it's worth the effort for one package though. Maybe what you did
> with sunxi-mali + sunxi-mali-prop is the simplest option for now. As I
> noted, it should however be documented.

Because git-archive does not easily support creating tarballs of git
submodule based projects, I've decided to keep the current structure.

>>
>> >> +config BR2_PACKAGE_SUNXI_MALI_PROP
>> >> +     bool
>> >
>> > Maybe you need to select this from sunxi-mali/Config.in ?
>>
>> Will fix.
>
> Maybe you can put a small comment above this hidden option, like:
>
> # This option is hidden because this package is merely used as a way of
> # downloading a git submodule needed by sunxi-mali. The real package to
> # enable is therefore sunxi-mali.
>
> or something along those lines (as a native speaker, I trust you to
> find a better english wording than my proposal!).

Will fix.

>> > Just curious: there is no kernel modules?
>>
>> Well, yes and no.  There is the possibility to build the external
>> module.  However, it is included by default in the sunxi-linux kernel.
>>  See https://github.com/linux-sunxi/mali-400-kernel-drivers for the
>> external module.
>
> Ok. Since those advanced graphics features are anyway only usable with
> the sunxi specific kernel at the moment, it doesn't make much sense to
> package the external kernel modules.
>
> However, a short comment in the Config.in help text about the need for
> those special drivers would be useful.

Will fix.

>> > Does this requires a specific Mali X11 driver? Is it something you
>> > intend to package in this first version of sunxi-mali, or something you
>> > intend to do later (in which case you could remove this choice for now).
>>
>> There is an x11 driver here
>> https://github.com/linux-sunxi/xf86-video-mali . However, I was
>> planning to add this in a later patch series. So, I'll just delete it
>> for now.
>
> Yes, sounds good.
>
>> >> +choice
>> >> +     prompt "Version"
>> >> +     default BR2_PACKAGE_SUNXI_MALI_R3P1
>> >> +     help
>> >> +       Select the version of the Sunxi Mali binaries to install.
>> >> +
>> >> +config BR2_PACKAGE_SUNXI_MALI_R2P4
>> >> +     bool "r2p4"
>> >> +
>> >> +config BR2_PACKAGE_SUNXI_MALI_R3P0
>> >> +     bool "r3p0"
>> >> +
>> >> +config BR2_PACKAGE_SUNXI_MALI_R3P1
>> >> +     depends on BR2_PACKAGE_SUNXI_MALI_HARDFP
>> >> +     bool "r3p1"
>> >
>> > I wouldn't know how to chose between the three possibilities here, some
>> > more help would be nice. Also, maybe add a comment for the r3p1 being
>> > not available on !EABIhf systems.
>>
>> I'm having trouble finding a description of what cores use which
>> version of the libs.  The best method is to install and use the
>> maliver application to determine the appropriate version.  I'll add
>> info about this to the help text.  Also, I will add the !EABIHF
>> comment.
>
> Have you tried asking on the sunxi IRC channel? I'm not on the channel
> but I know my colleague Maxime Ripard is there, and it seems to be a
> fairly active channel.

I asked tonight and received the response: the sunxi-kernel repo uses
the r3p0 version of the Mali libraries and that the version number
corresponds to the version of the kernel module.  Therefore, I have
set the default to r3p0 and have updated the information in the
Config.in.

>
>> >> +endef
>> >> +
>> >> +SUNXI_MALI_MAKE_ENV = \
>> >> +     CC=$(TARGET_CC) \
>> >> +     CFLAGS="$(TARGET_CFLAGS)" \
>> >
>> > These are generally passed as arguments of make rather than in the
>> > environment. It doesn't work in your case?
>>
>> No it doesn't.  The makefiles use the CFLAGS variable to add various
>> options and setting them as arguments overrides all of this.  When
>> placed in the environment, the CFLAGS variable is able to be appended.
>
> Ok. Maybe a short comment above then.

Will do.

>
>> > Otherwise looks good. Seems like the sunxi-mali stuff is a little bit
>> > less horrible than the ti-gfx thing :-)
>>
>> A lot less horrible.
>
> Great :)
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

Just as further discussion, I went down the path of transforming the
CONFIGURE step into a post extract hook. However, I'm concerned that
this may cause a race condition if the post-extract-hook occurs before
sunxi-mali-prop is extracted. Perhaps, this needs to be a post
configure hook so that the dependency is satisfied.

Thanks,
Spenser

--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
