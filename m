From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 18 Jun 2014 14:31:15 +0200
Subject: [Buildroot] [PATCHv2] argus: bump to vanilla version 3.6.0.1
In-Reply-To: <1403027700-14160-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 17 Jun 2014 14:55:00 -0300")
References: <1403027700-14160-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87fvj22ycs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > All of the new toolchain requirements (ipv6, threads, rpc) aren't
 > actually new - this package failed to build for ages, it just wasn't
 > picked up by the autobuilders because the main Makefile just doesn't
 > care about bailing out properly.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

It looks like there's some dbus support that isn't taken into
consideration. Care to take a look:

/bin/bash ../libtool --tag=CC   --mode=link /home/peko/source/buildroot/output/host/usr/bin/arm-linux-gcc -I../libopts -I.. -Itcpedit   -DTCPREPLAY -DTCPREPLAY_EDIT -DHAVE_CACHEFILE_SUPPORT -D_U_="__attribute__((unused))"   -pipe -Os  -Wall -O3 -std=gnu99  -Wno-variadic-macros -Wfatal-errors -Wno-format-contains-nul -I/home/peko/source/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include   -o tcpreplay-edit tcpreplay_edit-tcpreplay_edit_opts.o tcpreplay_edit-send_packets.o tcpreplay_edit-signal_handler.o tcpreplay_edit-tcpreplay.o tcpreplay_edit-sleep.o tcpreplay_edit-tcpreplay_api.o tcpreplay_edit-replay.o ./tcpedit/libtcpedit.a ./common/libcommon.a  /home/peko/source/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libpcap.a  ../libopts/libopts.la -lrt -lnsl 
libtool: link: /home/peko/source/buildroot/output/host/usr/bin/arm-linux-gcc -I../libopts -I.. -DTCPPREP "-D_U_=__attribute__((unused))" -pipe -Os -Wall -O3 -std=gnu99 -Wno-variadic-macros -Wfatal-errors -Wno-format-contains-nul -I/home/peko/source/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -o tcpprep tcpprep-tcpprep_opts.o tcpprep-tcpprep.o tcpprep-tree.o tcpprep-tcpprep_api.o  ./common/libcommon.a /home/peko/source/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libpcap.a ../libopts/.libs/libopts.a -lrt -lnsl
/home/peko/source/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libpcap.a(nametoaddr.o): In function `pcap_nametoaddr':
nametoaddr.c:(.text+0x58): warning: gethostbyname is obsolescent, use getnameinfo() instead.
/home/peko/source/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libpcap.a(pcap-dbus.o): In function `dbus_write':
pcap-dbus.c:(.text+0x58): undefined reference to `dbus_message_demarshal'
pcap-dbus.c:(.text+0x80): undefined reference to `dbus_error_free'
pcap-dbus.c:(.text+0x98): undefined reference to `dbus_connection_send'
pcap-dbus.c:(.text+0xa0): undefined reference to `dbus_connection_flush'
pcap-dbus.c:(.text+0xa8): undefined reference to `dbus_message_unref'
/home/peko/source/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libpcap.a(pcap-dbus.o): In function `dbus_read':
pcap-dbus.c:(.text+0xe0): undefined reference to `dbus_connection_read_write'
pcap-dbus.c:(.text+0x110): undefined reference to `dbus_connection_pop_message'
pcap-dbus.c:(.text+0x134): undefined reference to `dbus_message_is_signal'
pcap-dbus.c:(.text+0x160): undefined reference to `dbus_message_marshal'
pcap-dbus.c:(.text+0x1d8): undefined reference to `dbus_free'
/home/peko/source/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libpcap.a(pcap-dbus.o): In function `dbus_activate':
pcap-dbus.c:(.text+0x24c): undefined reference to `dbus_bus_get'
pcap-dbus.c:(.text+0x28c): undefined reference to `dbus_bus_get'
pcap-dbus.c:(.text+0x2b8): undefined reference to `dbus_error_free'
pcap-dbus.c:(.text+0x2ec): undefined reference to `dbus_connection_open'
pcap-dbus.c:(.text+0x31c): undefined reference to `dbus_bus_register'
pcap-dbus.c:(.text+0x3ec): undefined reference to `dbus_connection_unref'
pcap-dbus.c:(.text+0x410): undefined reference to `dbus_connection_set_max_received_size'
pcap-dbus.c:(.text+0x430): undefined reference to `dbus_bus_add_match'
pcap-dbus.c:(.text+0x438): undefined reference to `dbus_error_is_set'
pcap-dbus.c:(.text+0x448): undefined reference to `dbus_error_free'
pcap-dbus.c:(.text+0x458): undefined reference to `dbus_bus_add_match'
pcap-dbus.c:(.text+0x460): undefined reference to `dbus_error_is_set'
pcap-dbus.c:(.text+0x488): undefined reference to `dbus_error_free'
pcap-dbus.c:(.text+0x494): undefined reference to `dbus_connection_unref'
collect2: error: ld returned 1 exit status
Makefile:547: recipe for target 'tcpreplay' failed

-- 
Bye, Peter Korsgaard
