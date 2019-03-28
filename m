From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 29 Mar 2019 00:00:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/openldap: don't patch libtool
In-Reply-To: <CAPi7W83jjGhMgEy7_c4pnHynxeC4Ym5vtCpCUhS_JkJ4YtDXnQ@mail.gmail.com>
References: <20190328172937.11268-1-fontaine.fabrice@gmail.com>
 <20190328185416.01eb56c6@windsurf>
 <CAPi7W83jjGhMgEy7_c4pnHynxeC4Ym5vtCpCUhS_JkJ4YtDXnQ@mail.gmail.com>
Message-ID: <CAPi7W81VVd+YaHfjtZohWvPD6Kyqw=u8g6ZbxTu6AbRkxKKx6Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le jeu. 28 mars 2019 ? 21:31, Fabrice Fontaine
<fontaine.fabrice@gmail.com> a ?crit :
>
> Hello Thomas,
>
> Le jeu. 28 mars 2019 ? 18:54, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> a ?crit :
> >
> > Hello Fabrice,
> >
> > On Thu, 28 Mar 2019 18:29:37 +0100
> > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> >
> > > openldap uses its own libtool, static build with atomic fails with our
> > > patches since February 6th 2019 on:
> > >
> > > /bin/sh ../../libtool --mode=link /home/buildroot/autobuild/run/instance-0/output/host/bin/or1k-linux-gcc -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os   -static  -static   -o idtest idtest.o liblber.la ../../libraries/liblutil/liblutil.a -L/home/buildroot/autobuild/run/instance-0/output/host/bin/../or1k-buildroot-linux-uclibc/sysroot/usr/lib -lssl -L/home/buildroot/autobuild/run/instance-0/output/host/bin/../or1k-buildroot-linux-uclibc/sysroot/usr/lib -lz -pthread -latomic -lcrypto -lz -pthread -latomic
> > >
> > > /home/buildroot/autobuild/run/instance-0/output/host/bin/or1k-linux-gcc -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -static -static -o etest etest.o -pthread -pthread ./.libs/liblber.a -L/home/buildroot/autobuild/run/instance-0/output/host/bin/../or1k-buildroot-linux-uclibc/sysroot/usr/lib ../../libraries/liblutil/liblutil.a -lssl -lcrypto -lz -pthread /home/buildroot/autobuild/run/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/5.4.0/../../../../or1k-buildroot-linux-uclibc/lib//libatomic.so
> > >
> > > To fix this error, set OPENLDAP_LIBTOOL_PATCH to NO
> >
> > Do you understand why openldap is specifically affected ? I'm a bit
> > worried about "randomly" disabling libtool patching.
> Nope, I don't understand why this issue is only affecting openldap and
> I don't understand why the failures started on February 6th. There was
> no updates on openldap so perhaps there is a specific issue with some
> of the toolchains or with our libtool patches?
> I'll take some time to investigate.
The issue is raised by this openldap specific patch (added in 2005) on
ltmain.sh:
https://github.com/openldap/openldap/commit/7b6a088a2590fdad10286d10050b769e48554e13.
This patch adds a use_static_libs that is not managed by
https://git.buildroot.net/buildroot/tree/support/libtool/buildroot-libtool-v1.5.patch.

So, the issue can be fixed if I patch ltmain.sh to revert those
changes. However, I suppose that this patch won't be upstreamable.
>
> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> Best Regards,
>
> Fabrice
Best Regards,

Fabrice
