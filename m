From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 26 Apr 2019 18:44:18 +0200
Subject: [Buildroot] [PATCH v2,1/4] package/bind: enable static build
In-Reply-To: <20190425233450.6d84ca90@windsurf>
References: <20190425174916.31432-1-fontaine.fabrice@gmail.com>
 <20190425233450.6d84ca90@windsurf>
Message-ID: <CAPi7W81jdZcdTTaVppziYFT8275c0KVHY7Nr8xhUsVLw0+WWZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le jeu. 25 avr. 2019 ? 23:35, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello Fabrice,
>
> On Thu, 25 Apr 2019 19:49:13 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Static build has been disabled in 2014 with commit
> > 6045904752b06a8b8e52ba8fc2e49a8548964e8d however bind can be built
> > statically thanks to --without-dlopen so enable it back
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> > Changes v1 -> v2 (after review of Thomas Petazzoni):
> >  - Enable/disable libtool depending on BR2_STATIC_LIBS value
>
> Thanks for this new iteration, but unfortunately, it still doesn't
> build (with the same defconfig), but due to another error:
>
> libtool: install: (cd /home/thomas/projets/buildroot/output/build/dhcp-4.4.1/common; /bin/sh "/home/thomas/projets/buildroot/output/build/dhcp-4.4.1/libtool"  --tag CC --mode=relink /home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -DISC_CHECK_NONE=1 -I../includes -I/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -o libdhcp.la -rpath /usr/lib alloc.lo bpf.lo comapi.lo conflex.lo ctrace.lo dhcp4o6.lo discover.lo dispatch.lo dlpi.lo dns.lo
> ethernet.lo execute.lo fddi.lo icmp.lo inet.lo lpf.lo memory.lo nit.lo ns_name.lo options.lo packet.lo parse.lo print.lo raw.lo resolv.lo socket.lo tables.lo tr.lo tree.lo upf.lo -L/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/bin/../../usr/lib -lbind9 -ldns -lisccfg -lisc -ldl -lpthread -inst-prefix-dir /home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot)
> libtool: relink: /home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc -shared  -fPIC -DPIC  .libs/alloc.o .libs/bpf.o .libs/comapi.o .libs/conflex.o .libs/ctrace.o .libs/dhcp4o6.o .libs/discover.o .libs/dispatch.o .libs/dlpi.o .libs/dns.o .libs/ethernet.o .libs/execute.o .libs/fddi.o .libs/icmp.o .libs/inet.o .libs/lpf.o .libs/memory.o .libs/nit.o .libs/ns_name.o .libs/options.o .libs/packet.o .libs/parse.o .libs/print.o .libs/raw.o .libs/resolv.o .libs/socket.o .libs/tables.o .libs/tr.o .libs/tree.o .libs/upf.o
>   -Wl,-rpath -Wl,/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -L/home/thomas/projets/buildroot/output/build/bind-9.11.5-P4/lib/isccfg/.libs -L/home/thomas/projets/buildroot/output/build/bind-9.11.5-P4/lib/dns/.libs -L/home/thomas/projets/buildroot/output/build/bind-9.11.5-P4/lib/isc/.libs -L/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/bin/../../usr/lib -L/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -L/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lbind9 -L/usr/lib -lisccfg -ldns -lisc -ldl -lpthread  -Os   -Wl,-soname -Wl,libdhcp.so.0 -o .libs/libdhcp.so.0.0.0
> arm-linux-gcc: ERROR: unsafe header/library path used in cross-compilation: '-L/usr/lib'
> libtool:   error: error: relink 'libdhcp.la' with the above command before installing it
>
> The -L/usr/lib doesn't exist on the libtool command line, so it gets
> invented by libtool. I think part of the problem is that this error
> happens during the staging installation case.
>
> There is also this warning at configure time:
>
> configure: WARNING: legacy configure is used but libtool is enabled. Trying to recover...
>
> I have uploaded the full build log of the DHCP package at:
>
>   http://code.bulix.org/7xi08h-677888?raw
I tested this same defconfig file and it builds fine however if I add
AUTORECONF = YES, the build fails.
The issue was raised by "bind9-config --libs" so I'll move this call
under the BR2_STATIC_LIBS condition, it'll fix the build as libtool
won't be used in static mode.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
