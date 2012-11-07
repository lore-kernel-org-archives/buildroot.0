From: Dan Pattison <dan.pattison@ethertek.ca>
Date: Wed, 07 Nov 2012 12:35:58 -0800
Subject: [Buildroot] new perl build issue
In-Reply-To: <CABtOAfz849=H1gW+CNPL0AgtqQ3xpFZhdcCvycJ=hiEByTjxrQ@mail.gmail.com>
References: <CABtOAfw6A4jH1h1W1Bbm7kKsmz_hJLymP8JRBo5A6a4o09wS8g@mail.gmail.com>
 <CAB0FRstkx1+Eg0WTv4eVJ+KPFX9RY2C8X4SaL0EDoBK0P642SQ@mail.gmail.com>
 <20121105075317.75f9f85c@skate>
 <CABtOAfyXrgHyg2ggDJvYXExhU4RMabsOVRXfAkE0p9+bnGVrZg@mail.gmail.com>
 <CABtOAfy84BF1p_KZ2m3sqr-o72xuj_TL1eZfQj-BsH5Z+kmnWA@mail.gmail.com>
 <CAB0FRssio4MnFavizgHUnLa-_tJAZAUNcb4hxKb=RjQKoXnfQg@mail.gmail.com>
 <CABtOAfzB6QG++n-pDmpUAp94d6g_6FZO9oCqfXRmej_jdJ-gQQ@mail.gmail.com>
 <CABtOAfz849=H1gW+CNPL0AgtqQ3xpFZhdcCvycJ=hiEByTjxrQ@mail.gmail.com>
Message-ID: <509AC62E.6010503@ethertek.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/7/2012 1:53 AM, Alexander Khryukin wrote:
>
>
> 2012/11/7 Alexander Khryukin <alexander@mezon.ru 
> <mailto:alexander@mezon.ru>>
>
>
>
>     2012/11/5 Fran?ois Perrad <francois.perrad@gadz.org
>     <mailto:francois.perrad@gadz.org>>
>
>         2012/11/5 Alexander Khryukin <alexander@mezon.ru
>         <mailto:alexander@mezon.ru>>:
>         >
>         >
>         > 2012/11/5 Alexander Khryukin <alexander@mezon.ru
>         <mailto:alexander@mezon.ru>>
>         >>
>         >>
>         >>
>         >> 2012/11/5 Thomas Petazzoni
>         <thomas.petazzoni@free-electrons.com
>         <mailto:thomas.petazzoni@free-electrons.com>>
>         >>>
>         >>>
>         >>> On Sun, 4 Nov 2012 20:41:45 +0100, Fran?ois Perrad wrote:
>         >>>
>         >>> > this afternoon, Thomas has posted 3 patches for qemu (see
>         >>> > http://patchwork.ozlabs.org/patch/197055/).
>         >>> > Alexander, try to rebuild host-qemu with them.
>         >>>
>         >>> Unfortunately, none of those patches have a chance to fix
>         Alexander's
>         >>> problem. My patches only fix missing dependencies.
>         >>>
>         >>> Also, could you have a look at
>         http://autobuild.buildroot.org/ for perl
>         >>> build failures? It seems like Qemu doesn't start properly
>         on some
>         >>> platforms, for some reason.
>         >>>
>         >>> Thomas
>         >>> --
>         >>> Thomas Petazzoni, Free Electrons
>         >>> Kernel, drivers, real-time and embedded Linux
>         >>> development, consulting, training and support.
>         >>> http://free-electrons.com
>         >>
>         >>
>         >>
>         >> I applied your patch but looks it not helps me.
>         >>
>         >> http://pastie.org/5188031
>         >
>         >
>         >
>         > Also if i compile it by my default system gcc it's ok
>         >
>         >
>         > [fdkit at kvm-host UU]$ gcc try.c
>         > [fdkit at kvm-host UU]$ ls ./a.out
>         > ./a.out*
>         > [fdkit at kvm-host UU]$ ./a.out
>         > Ok
>         >
>
>         Alexander,
>
>         the 'qemu-arm' built by Buildroot doesn't work properly.
>         could you try this workaround ?
>         1) install a 'qemu-arm' with your distro package manager,
>              $ apt-get install qemu-kvm-extras # or equivalent
>         2) apply this patch :
>         --- a/package/perl/perl.mk <http://perl.mk>
>         +++ b/package/perl/perl.mk <http://perl.mk>
>         @@ -22,7 +22,7 @@ endif
>
>          PERL_CONF_OPT = -des \
>                         -Dusecrosscompile \
>         -               -Dtargetrun=$(QEMU_USER) \
>         +               -Dtargetrun=qemu-arm \
>                         -Dqemulib=$(STAGING_DIR) \
>                         -Dar="$(TARGET_AR)" \
>                         -Dcc="$(TARGET_CC)" \
>
>         Fran?ois
>
>
>
>     I migrated my build system to fresh linux installation with 3.5.1
>     kernel
>      Linux localhost.localdomain 3.5.1-nrj-desktop-1mib #1 SMP PREEMPT
>     Tue Aug 14 11:57:05 UTC 2012 x86_64 x86_64 x86_64 GNU/Linux
>
>     Applied your patch, and problem still here.
>
>     http://pastie.org/5336882
>
>
>
>
> Bump!
> I don't know how to solve it.
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Hello,

Like Bernd mentioned below. Using perlcross makes a successful build of 
perl. I tried this in buildroot for target arm (AT91SAM9G20) with 
success. Was able to run Hello World program and perl -V with no 
problem. The perlcross patch only works for perl-5.16.0 right now. I was 
thinking on adjusting it for perl-5.16.2.

My .configure line is pasted below. I use old version of buildroot so 
you will need to edit the paths. I followed the instructions here:

http://perlcross.berlios.de/


./configure --target=arm-linux-uclibc \
--target-tools-prefix=/home/ethertek/rms200/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi- 
\
     --prefix=/usr \
     --sysroot=/home/ethertek/rms200/buildroot/build_arm/staging_dir/

<Hi,

<maybe this can be of help:http://perlcross.berlios.de/

<Kind regards, Bernd

Dan Pattison
Ethertek Circuits



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121107/0a901636/attachment-0001.html>
