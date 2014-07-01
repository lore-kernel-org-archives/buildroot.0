From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Jul 2014 13:31:39 +0200
Subject: [Buildroot] [PATCH v2] dbus: use -pthread instead of -lpthread
In-Reply-To: <1404208356-2194-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Tue, 1 Jul 2014 10:52:36 +0100")
References: <1404208356-2194-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <877g3xiack.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > This fixes a problem in other packages when they link against dbus. For
 > instance, with the dnsmasq package:

 > /buildroot/output/host/usr/bin/mipsel-ctng-linux-uclibc-gcc --static
 > -lidn  -o dnsmasq cache.o rfc1035.o util.o option.o forward.o network.o
 > dnsmasq.o dhcp.o lease.o rfc2131.o netlink.o dbus.o bpf.o helper.o
 > tftp.o log.o conntrack.o dhcp6.o rfc3315.o dhcp-common.o outpacket.o
 > radv.o slaac.o auth.o ipset.o domain.o dnssec.o blockdata.o
 > -L/buildroot/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib
 > -ldbus-1 -lpthread
 > -L/buildroot/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib
 > -lidn -liconv
 > -L/buildroot/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib
 > -llua -lm     -Wl,-Bstatic -lhogweed
 > -L/buildroot/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib
 > -lnettle -lgmp   -Wl,-Bdynamic -Wl,-Bstatic -lgmp -Wl,-Bdynamic
 > /buildroot/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libpthread.a(init.os):
 > In function `__pthread_initialize_minimal_internal':
 > init.c:(.text+0x26c): undefined reference to `__libc_setup_tls'
 > collect2: error: ld returned 1 exit status
 > make[2]: *** [dnsmasq] Error 1
 > make[2]: Leaving directory
 > `/buildroot/output/build/dnsmasq-2.71/src'

 > When dnsmasq tries to link against dbus it checks the dbus pkgconfig
 > file to obtain the LIBS that it need to pass to the linker. In the dbus
 > .pc file you have "-ldbus-1 -lpthread" because -lpthread was used when
 > building dbus. If you use -pthread when you build dbus, then you will
 > have -pthread in the dbus .pc file as well.

 > -lpthread means that we want to link with a library called pthread.
 > -pthread is a compiler option which will do whatever is needed to be
 > done to compile with the pthreads standards so that it works.

 > Fixes:
 >   http://autobuild.buildroot.net/results/7cd/7cdab3b6f74dbfde965300a51e58a377ba30602b/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
