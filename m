From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 13:30:11 +0200
Subject: [Buildroot] [git commit] dbus: use -pthread instead of -lpthread
Message-ID: <20140701113221.124029D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=717236da0f88d78858ff4dcf225fbd3db58f01e6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes a problem in other packages when they link against dbus. For
instance, with the dnsmasq package:

/buildroot/output/host/usr/bin/mipsel-ctng-linux-uclibc-gcc --static
-lidn  -o dnsmasq cache.o rfc1035.o util.o option.o forward.o network.o
dnsmasq.o dhcp.o lease.o rfc2131.o netlink.o dbus.o bpf.o helper.o
tftp.o log.o conntrack.o dhcp6.o rfc3315.o dhcp-common.o outpacket.o
radv.o slaac.o auth.o ipset.o domain.o dnssec.o blockdata.o
-L/buildroot/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib
-ldbus-1 -lpthread
-L/buildroot/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib
-lidn -liconv
-L/buildroot/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib
-llua -lm     -Wl,-Bstatic -lhogweed
-L/buildroot/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib
-lnettle -lgmp   -Wl,-Bdynamic -Wl,-Bstatic -lgmp -Wl,-Bdynamic
/buildroot/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libpthread.a(init.os):
In function `__pthread_initialize_minimal_internal':
init.c:(.text+0x26c): undefined reference to `__libc_setup_tls'
collect2: error: ld returned 1 exit status
make[2]: *** [dnsmasq] Error 1
make[2]: Leaving directory
`/buildroot/output/build/dnsmasq-2.71/src'

When dnsmasq tries to link against dbus it checks the dbus pkgconfig
file to obtain the LIBS that it need to pass to the linker. In the dbus
.pc file you have "-ldbus-1 -lpthread" because -lpthread was used when
building dbus. If you use -pthread when you build dbus, then you will
have -pthread in the dbus .pc file as well.

-lpthread means that we want to link with a library called pthread.
-pthread is a compiler option which will do whatever is needed to be
done to compile with the pthreads standards so that it works.

Fixes:
  http://autobuild.buildroot.net/results/7cd/7cdab3b6f74dbfde965300a51e58a377ba30602b/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus/dbus.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index fc446b1..0c8fcf3 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -35,7 +35,7 @@ define DBUS_USERS
 endef
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-DBUS_CONF_OPT += LIBS='-lpthread'
+DBUS_CONF_OPT += LIBS='-pthread'
 endif
 
 ifeq ($(BR2_microblaze),y)
