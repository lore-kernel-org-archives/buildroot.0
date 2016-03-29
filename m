From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 16:09:10 +0200
Subject: [Buildroot] [PATCH] package/libxslt: fix static build
In-Reply-To: <1459259543.5308.10.camel@embedded.rocks>
References: <1459199363-28640-1-git-send-email-joerg.krause@embedded.rocks>
 <20160329030113.55474130@free-electrons.com>
 <20160329145214.6a434016@free-electrons.com>
 <1459259543.5308.10.camel@embedded.rocks>
Message-ID: <20160329160910.267a0dc8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Mar 2016 15:52:23 +0200, J?rg Krause wrote:
> > Baruch, J?rg, could you have a closer look at this problem, and see
> > which solution, between the one from J?rg and the one from Baruch is
> > actually correct ?
> 
> The problem is that xml2-config does not work for cross-compilation:
> 
> $ ./output/host/usr/bfin-buildroot-uclinux-clibc/sysroot/usr//bin/xml2-
> config --libs
> -lxml2 -lm

Why do you say it doesn't work for cross-compilation? This result is
perfectly good for cross-compilation.

> I am not quite sure why it works either. I guess it has something todo
> with how libtool works, as libtool sets the correct dependency_libs in
> libxslt.la if '--with-libxml-libs-prefix' is used:
> 
> # Libraries that this one depends upon.
> dependency_libs=' -L/home/joerg/git/buildroot/output/host/usr/bfin-
> buildroot-uclinux-uclibc/sysroot/usr/lib
> /home/joerg/git/buildroot/output/host/usr/bfin-buildroot-uclinux-
> uclibc/sysroot/usr/lib/libxml2.la
> /home/joerg/git/buildroot/output/host/usr/bfin-buildroot-uclinux-
> uclibc/sysroot/usr/lib/liblzma.la -lm'
> 
> .. whereas, whithout '--with-libxml-libs-prefix:
> 
> # Libraries that this one depends upon.
> dependency_libs=' -lxml2 -lm'

Weird. I guess libtool is parsing this -L<path> option and does some
magic with it. It is completely stupid, because since we have --sysroot
$(STAGING_DIR), then automatically $(STAGING_DIR)/usr/lib is in the
search path for libraries, without the need to add a -L<path> option.
Except for the silly libtool.

> > Ideally, xml2-config should have a --static option, or even better,
> > drop xml2-config entirely and use pkg-config :-)
> 
> Patching libxlst to use pkg-config is what OE and yocto are doing [1]
> as libxml2 does have a correct .pc file.

And why isn't that upstream? The development of libxslt seems to be
active upstream: https://git.gnome.org/browse/libxslt/log/. Well,
except for the fact that they haven't done a release in the last three
years.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
