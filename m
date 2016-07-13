From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Jul 2016 20:21:35 +0200
Subject: [Buildroot] help please
In-Reply-To: <CAAfO8NykMv=DCdn=rV6tCFOfRvZQf84V82ZrKgtJW-422F9nfQ@mail.gmail.com>
References: <CAAfO8NyXP5-PFMoC3bN7v8NRD+jzcvgtBfgZZXKijGquARhU8Q@mail.gmail.com>
 <20160712204436.GE3680@free.fr>
 <CAAfO8NykMv=DCdn=rV6tCFOfRvZQf84V82ZrKgtJW-422F9nfQ@mail.gmail.com>
Message-ID: <20160713182135.GA3687@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mike, All,

On 2016-07-12 17:05 -0400, Mike King spake thusly:
> I have attached the build log.  I am now having compile errors.
> Before it was using the host kernel headers.  I "fixed" that by adding
> _CONF_OPTS line.

OK, so I've had a quick look at your build log, and it looks like
linux-gpib is quite a mess and will be difficult to package properly.

So, first, let's look at the configure log:

    Checking Linux kernel directory... ok
    checking Linux kernel compile flags... FATAL: /home/vagrant/buildroot-2016.05/output/build/linux-gpib-4.0.3/util/linux_flags/fake.o has no symtab?
    make[3]: *** [__modpost] Error 1
    make[2]: *** [modules] Error 2
    configure: WARNING: Failed to get compile flags from Linux kernel directory.
    ok
    checking for arm-buildroot-linux-uclibcgnueabihf-gcc... /home/vagrant/buildroot-2016.05/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc

This sounds like it is incorrectly looking for Linux directory for the
build system and/or kernel-land headers. Besides, it did not already
checked for the cross-compiler, as we can see that it does so *after*,
so it is probably using the host compiler at that point (and this will
be confirmed later during the build, see below...).

That one will be very difficult to fix, especially since their
configure.ac is very badly written:

   90 dnl get compile flags for modules from linux kernel source tree
   91 AC_MSG_CHECKING([Linux kernel compile flags])
   92 FLAGDIR=$(pwd)/util/linux_flags
   93 env LDFLAGS="" CFLAGS="" make --quiet -C ${LINUX_SRCDIR} V=1 SUBDIRS=${FLAGDIR} LINUXDIR=${LINUX_SRCDIR} modules > /dev/null
   94 if [[ $? != 0 ]]; then
   95     AC_MSG_WARN([Failed to get compile flags from Linux kernel directory.])
   96 fi
   97 AC_MSG_RESULT([ok])

Since it is not using standard and not passing the compiler, we can't
override it will configure flags or any ac_cv_* variable. :-(

That will be tough to fix. Unless this is not really needed in fact, and
we can in fact pass the expected values in the environment or some such
afterwards. And it seems we could do that, as the intermediate file
generated in this command (util/linux_flags/flags) is only used later to
actually build the driver. So we don;t need it at configure time, and
the check can very well fail, we don;t care (but it is nonetheless
completely borked).

And then, it means we can also probably use our kernel-module infra as
well to build the kernel module instead of letting their weirdly borked
buildsystem do it.

Then not much of interest, until it starts trying to build the kernel
module. And there, everything goes down hill pretty quick (lines slightly
reformatted by me):

    /usr/bin/make -C /home/vagrant/buildroot-2016.05/output/build/linux-26f3b72a9c049be10e6af196252283e1f6ab9d1f/ V=1 modules\
        CC="gcc -I/home/vagrant/buildroot-2016.05/output/build/linux-gpib-4.0.3 
                -I/home/vagrant/buildroot-2016.05/output/build/linux-gpib-4.0.3/drivers/gpib/include
                -I/home/vagrant/buildroot-2016.05/output/build/linux-gpib-4.0.3/include" \
        CONFIG_GPIB_ISA="no" \
        SUBDIRS="/home/vagrant/buildroot-2016.05/output/build/linux-gpib-4.0.3/drivers/gpib"

Bing, it uses the host compiler! That's just so utterly broken... :-/

And then (again, reformatted and elided by me):

    gcc -I/home/vagrant/buildroot-2016.05/output/build/linux-gpib-4.0.3
        -I/home/vagrant/buildroot-2016.05/output/build/linux-gpib-4.0.3/drivers/gpib/include
        -I/home/vagrant/buildroot-2016.05/output/build/linux-gpib-4.0.3/include
        -Wp,-MD,/home/vagrant/buildroot-2016.05/output/build/linux-gpib-4.0.3/drivers/gpib/ni_usb/.ni_usb_gpib.o.d
        [--SNIP--]
        -DMODULE  -D"KBUILD_STR(s)=#s"
        -D"KBUILD_BASENAME=KBUILD_STR(ni_usb_gpib)"
        -D"KBUILD_MODNAME=KBUILD_STR(ni_usb_gpib)" -c -o
        /home/vagrant/buildroot-2016.05/output/build/linux-gpib-4.0.3/drivers/gpib/ni_usb/.tmp_ni_usb_gpib.o
        /home/vagrant/buildroot-2016.05/output/build/linux-gpib-4.0.3/drivers/gpib/ni_usb/ni_usb_gpib.c

So, really, it *is* using the host compiler, and there is no way, with
their infrastructure, to tell them to use another one. Definitely broken
beyond repair...

So, all we have to do is:
  - convince it not to try to build the kernel module,
  - build it ourselves with our kernel-module infra.

I'll try to have a deeper look latter... Dinner now. :-)

If you hang around on IRC tonight UTC+2, we can talk about it, too.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
