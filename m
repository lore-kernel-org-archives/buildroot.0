From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 27 Dec 2017 04:05:48 +0100
Subject: [Buildroot] systemd: build failure against pam on arm
In-Reply-To: <87shbxq99x.fsf@paral.in>
References: <CA+h8R2o8=LmmcudEaiJSCenX7t4QmHB3SPwm-UowrGQEu2bMPw@mail.gmail.com>
 <29DD8155-F769-488E-8A9E-39D8B6D18B54@openadk.org>
 <87608xykge.fsf@paral.in>
 <1397D1DC-9330-40CF-89AB-8CB27EEFF333@openadk.org>
 <873741w59p.fsf@paral.in>
 <20171224120957.GY27558@waldemar-brodkorb.de>
 <87po73d1xz.fsf@paral.in>
 <20171225151337.GC27558@waldemar-brodkorb.de>
 <87mv25cg5t.fsf@paral.in> <87shbxq99x.fsf@paral.in>
Message-ID: <20171227030548.GE27558@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christian,
Christian Stewart wrote,

> Hi Waldemar, All,
> 
> Christian Stewart <christian@paral.in> writes:
> > Hi Waldemar,
> >
> > Waldemar Brodkorb <wbx@openadk.org> writes:
> >>> There are no extra pam files in my Buildroot tree - before building I
> >>> ensure this with a "git clean -xfd" and I've searched the tree as well.
> >>
> >> But that is strange then.
> >> find . -name libpam_misc.so\*
> >> ./output/build/linux-pam-1.3.0/libpam_misc/.libs/libpam_misc.so.0
> >> ./output/build/linux-pam-1.3.0/libpam_misc/.libs/libpam_misc.so
> >> ./output/build/linux-pam-1.3.0/libpam_misc/.libs/libpam_misc.so.0.82.1
> >
> > ... please note that I am building out of tree. There are no
> > limpam_misc* inside the "buildroot tree" which includes the main source
> > tree. When the compilation fails, inside my "output tree":
> 
> I can confirm now that even in-tree builds result in the same thing:

..

I believe it is an issue how gcc is calling the linker.
In my case I see following:
libsystemd-shared.la -lpam -lpam_misc
-L/home/wbx/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
-lkmod

So the linker does not get -L before -lpam -lpam_misc pointing to
the sysroot. 

If you start gcc with verbose linker output you see:
./output/host/bin/arm-buildroot-linux-gnueabihf-gcc -Wl,-verbose

The included linker script has:
SEARCH_DIR("=/home/wbx/buildroot/output/host/arm-buildroot-linux-gnueabihf/lib");
SEARCH_DIR("=/usr/local/lib"); SEARCH_DIR("=/lib");
SEARCH_DIR("=/usr/lib");

In my case on Debian libpam.so is not in the search dirs, but in
ls /lib/x86_64-linux-gnu/libpam.so.0*
/lib/x86_64-linux-gnu/libpam.so.0
/lib/x86_64-linux-gnu/libpam.so.0.83.1
wbx at helium:~/buildroot$ lsb_release -a
No LSB modules are available.
Distributor ID: Debian
Description:    Debian GNU/Linux 8.9 (jessie)
Release:        8.9
Codename:       jessie

In you case the linker finds libpam.so in /lib and try to use it.

To verify my analyzation you can add -L<sysrootpathofyourbr> into:
systemd/Makefile
PAM_LIBS =
-L/home/paralin/buildroot/pi3/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
-lpam -lpam_misc

Like in KMOD_LIBS. Then just continue the build with make V=1 and
see if it succeeds.

As systemd is switching completely to meson buildsystem a
upstreamable patch is not possible.

best regards
 Waldemar
