From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 30 Jun 2014 17:54:27 +0100
Subject: [Buildroot] [PATCH] dbus: use -pthread instead of -lpthread
In-Reply-To: <20140630164911.GI4425@tarshish>
References: <1404145692-47530-1-git-send-email-Vincent.Riera@imgtec.com>
 <20140630164911.GI4425@tarshish>
Message-ID: <53B19643.1010904@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/30/2014 05:49 PM, Baruch Siach wrote:
> Hi Vicente,
>
> On Mon, Jun 30, 2014 at 05:28:12PM +0100, Vicente Olivert Riera wrote:
>> This fixes a problem in other packages when they link against dbus. For
>> instance, with the dnsmasq package:
>>
>> /buildroot/output/host/usr/bin/mipsel-ctng-linux-uclibc-gcc --static
>> -lidn  -o dnsmasq cache.o rfc1035.o util.o option.o forward.o network.o
>> dnsmasq.o dhcp.o lease.o rfc2131.o netlink.o dbus.o bpf.o helper.o
>> tftp.o log.o conntrack.o dhcp6.o rfc3315.o dhcp-common.o outpacket.o
>> radv.o slaac.o auth.o ipset.o domain.o dnssec.o blockdata.o
>> -L/buildroot/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib
>> -ldbus-1 -lpthread
>> -L/buildroot/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib
>> -lidn -liconv
>> -L/buildroot/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib
>> -llua -lm     -Wl,-Bstatic -lhogweed
>> -L/buildroot/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib
>> -lnettle -lgmp   -Wl,-Bdynamic -Wl,-Bstatic -lgmp -Wl,-Bdynamic
>> /buildroot/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libpthread.a(init.os):
>> In function `__pthread_initialize_minimal_internal':
>> init.c:(.text+0x26c): undefined reference to `__libc_setup_tls'
>> collect2: error: ld returned 1 exit status
>> make[2]: *** [dnsmasq] Error 1
>> make[2]: Leaving directory
>> `/buildroot/output/build/dnsmasq-2.71/src'
>>
>> Fixes:
>>    http://autobuild.buildroot.net/results/7cd/7cdab3b6f74dbfde965300a51e58a377ba30602b/
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> ---
>>   package/dbus/dbus.mk |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
>> index fc446b1..0c8fcf3 100644
>> --- a/package/dbus/dbus.mk
>> +++ b/package/dbus/dbus.mk
>> @@ -35,7 +35,7 @@ define DBUS_USERS
>>   endef
>>
>>   ifeq ($(BR2_PREFER_STATIC_LIB),y)
>> -DBUS_CONF_OPT += LIBS='-lpthread'
>> +DBUS_CONF_OPT += LIBS='-pthread'
>
> Can you explain how this change solves the build failure?

Yes. When dnsmasq tries to link against dbus it checks the dbus 
pkgconfig file to obtain the LIBS that it need to pass to the linker. In 
the dbus .pc file you have "-ldbus-1 -lpthread" because you used 
-lpthread when building dbus. If you use -pthread when you build dbus, 
then you will have -pthread in the dbus .pc file as well.


> baruch
>
>>   endif
>>
>>   ifeq ($(BR2_microblaze),y)
>



-- 
Vincent
