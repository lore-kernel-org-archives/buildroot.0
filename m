From: Markus Mayer <mmayer@broadcom.com>
Date: Sat, 13 Jun 2020 10:35:40 -0700
Subject: [Buildroot] ebtables and musl
In-Reply-To: <20200613144325.6c88eb8d@gmx.net>
References: <CAGt4E5tuHRkxko=NPY+-YsWwnhk1McnJMU_LmdcShHFuRjTkMA@mail.gmail.com>
 <20200613132317.4edb7676@gmx.net> <20200613144325.6c88eb8d@gmx.net>
Message-ID: <CAGt4E5s_t30GHmTFiSA3MZQo0Vj-fkqvGPPc9kNdoa6w6-B7DA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 13 Jun 2020 at 05:43, Peter Seiderer <ps.report@gmx.net> wrote:

> On Fri, 12 Jun 2020 13:10:28 -0700, Markus Mayer <mmayer@broadcom.com> wrote:
> >
> > > Hi all,
> > >
> > > I see this patch in Buildroot:
> > > http://lists.busybox.net/pipermail/buildroot/2017-February/184225.html
> > >
> > > However, I am still running into the issue it is supposed to fix.
> > >
> > > This is with musl-1.2.0, the latest and greatest. I'm no longer stuck
> > > with the ancient libmusl that caused issues with procps. It doesn't
> > > seem to help with ebtables, though.
> > >
> > > /mnt/disk1/Development/br-musl/output/arm64/host/bin/aarch64-linux-gcc
> > > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os
> > >   -fPIC -O3 -DPROGVERSION=\"2.0.10-4\" -DPROGNAME=\"ebtables\"
> > > -DPROGDATE=\"December\ 2011\" -D_PATH_ETHERTYPES=\"/etc/ethertypes\"
> > > -DEBTD_ARGC_MAX=50 -DEBTD_CMDLINE_MAXLN=2048
> > > -DLOCKFILE=\"/var/lib/ebtables/lock\" -DLOCKDIR=\"/var/lib/ebtables/\"
> > > -c -o extensions/ebt_802_3.o extensions/ebt_802_3.c -Iinclude/
> > > In file included from include/linux/netfilter_bridge.h:8:0,
> > >                  from include/linux/netfilter_bridge/ebtables.h:17,
> > >                  from include/ebtables_u.h:28,
> > >                  from useful_functions.c:25:
> > > include/linux/if_ether.h:119:8: error: redefinition of 'struct ethhdr'
> > >  struct ethhdr {
> > >         ^~~~~~
> > > In file included from
> > > ../../host/aarch64-buildroot-linux-musl/sysroot/usr/include/netinet/ether.h:8:0,
> > >                  from include/ebtables_u.h:27,
> > >                  from useful_functions.c:25:
> > > ../../host/aarch64-buildroot-linux-musl/sysroot/usr/include/netinet/if_ether.h:113:8:
> > > note: originally defined here
> > >  struct ethhdr {
> > >         ^~~~~~
> > > Makefile:78: recipe for target 'useful_functions.o' failed
> > > make[2]: *** [useful_functions.o] Error 1
> > > make[2]: *** Waiting for unfinished jobs....
> > >
> > > I am not quite sure what to make of it yet.
> > >
> > > Is it cause by the fact that include/linux/if_ether.h defines
> > >
> > > #ifndef _LINUX_IF_ETHER_H
> > > #define _LINUX_IF_ETHER_H
> > >
> > > but include/netinet/if_ether.h defines
> > >
> > > #ifndef _NETINET_IF_ETHER_H
> > > #define _NETINET_IF_ETHER_H
> > >
> > > and they both end up being included?
> > >
> > > $ find . -name if_ether.h -ls
> > >   6025818      4 -rw-r--r--   1 mmayer   mmayer       1506 May 26
> > > 16:30 ./build/linux-custom/include/linux/if_ether.h
> > >   6028683      8 -rw-r--r--   1 mmayer   mmayer       7461 May 26
> > > 16:30 ./build/linux-custom/include/uapi/linux/if_ether.h
> > >   6047054      8 -rw-r--r--   1 mmayer   mmayer       5751 Dec 15
> > > 2011 ./build/ebtables-2.0.10-4/include/linux/if_ether.h
> > >   5934557      8 -rw-r--r--   1 mmayer   mmayer       7016 Jun 10
> > > 16:52 ./host/aarch64-buildroot-linux-musl/sysroot/usr/include/linux/if_ether.h
> > >   5935035      4 -rw-r--r--   1 mmayer   mmayer       3625 Jun 10
> > > 16:52 ./host/aarch64-buildroot-linux-musl/sysroot/usr/include/netinet/if_ether.h
> > >
> > > Also, there's five different copies of if_ether.h floating around.
> >
> > Care to provide a config/defconfig file for the failure (and provide the
> > used buildroot version)?
>
> Or did your use an external toolchain?

Yes. It's an external toolchain. Buildroot is 2020.05.

> The patch states ([1]):
>
>         Upstream status: not upstreamable; depends on Buildroot local musl patch

Thanks for the pointer. I didn't realize there were toolchain patches
to musl in BR. I'll take a look at them.

> Regards,
> Peter
>
> [1] https://git.buildroot.net/buildroot/tree/package/ebtables/0002-Fix-musl-compatibility.patch#n11
>
> >
> > >
> > > While we are on the topic of ebtables, why is buildroot still using
> > > v2.0.10-4 from 2014 when there is 2.0.11 from 2019 (as per
> > > http://ftp.netfilter.org/pub/ebtables/)? Is it just a matter of
> > > submitting a patch to update it or is there an underlying reason to
> > > keep the old version around?
> >
> > Probably not, care to send an ebtables update patch?

Sure. I'll send a patch.

Regards,
-Markus
