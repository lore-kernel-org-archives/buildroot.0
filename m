From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 19:29:27 +0100
Subject: [Buildroot] [PATCH] dnsmasq: fix static linking
In-Reply-To: <1393946074-32602-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1393946074-32602-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20140304192927.4c1cd475@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Tue, 4 Mar 2014 15:14:34 +0000, Vicente Olivert Riera wrote:
> Append -pthread to LIBS to fix a static linking error like this one:
> 
> /home/test/test/2/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libdbus-1.a(libdbus_1_la-dbus-sysdeps-pthread.o):
> In function `_dbus_platform_cmutex_new':
> dbus-sysdeps-pthread.c:(.text+0x30): undefined reference to
> `pthread_mutex_init'
> 
> Fixes:
>    http://autobuild.buildroot.net/results/161/161446dde7e8e774773eb2b34fd555f5ac22dd02/
> 
> Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Thanks, but I don't think it's the best fix for the problem.

>  ifeq ($(BR2_PACKAGE_DBUS),y)
>  	DNSMASQ_DEPENDENCIES += host-pkgconf dbus
> +	DNSMASQ_LIBS += $(if $(BR2_PREFER_STATIC_LIB),-pthread)
>  endif

dnsmasq properly uses pkg-config to find which library to link against,
and the dbus-1.pc properly lists -lrt and -lpthread in Libs.private
(i.e libraries needed in the link when linking statically).

The problem is just that the dnsmasq Makefile does not call pkg-config
with the --static option when being built statically. Compare the
output of:

$ ./output/host/usr/bin/pkg-config --libs dbus-1
-L/home/thomas/projets/buildroot/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib -ldbus-1

against the output of:

$ ./output/host/usr/bin/pkg-config --static --libs dbus-1
-L/home/thomas/projets/buildroot/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib -ldbus-1 -lpthread -lrt

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
