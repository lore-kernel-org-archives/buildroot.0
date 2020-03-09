From: absolutely_free at libero.it <absolutely_free@libero.it>
Date: Mon, 9 Mar 2020 13:27:09 +0100 (CET)
Subject: [Buildroot] Cross compiling iperf 2 for mips
Message-ID: <1276833545.526853.1583756829124@mail1.libero.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am trying to cross compile iperf (version 2) for MIPS big endian (uclibc).

I used buildroot-2019.05.1, set correct TARGET MIPS (big endian) and C library uClibc-ng.

I successfully compiled iperf3 with this command:

$ ./configure --enable-static --disable-shared --target=mips-buildroot-linux-gnu --host=mips-buildroot-linux-gnu CC=/home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc --with-openssl=no --disable-profiling --prefix=/opt/iperf3

$ make


With iperf2, anyawy, I get this error:


g++ -Wall -O2 -O2 -DHAVE_CONFIG_H -o iperf Client.o Extractor.o isochronous.o Launch.o List.o Listener.o Locale.o PerfSocket.o ReportCSV.o ReportDefault.o Reporter.o Server.o Settings.o SocketAddr.o gnu_getopt.o gnu_getopt_long.o histogram.o main.o service.o sockets.o stdio.o tcp_window_size.o pdfs.o checksums.o ../compat/libcompat.a -lrt
/usr/bin/ld: Extractor.o: Relocations in generic ELF (EM: 8)
/usr/bin/ld: Extractor.o: Relocations in generic ELF (EM: 8)
Extractor.o: error adding symbols: File in wrong format
collect2: error: ld returned 1 exit status
make[2]: *** [iperf] Error 1
make[2]: Leaving directory `/home/user/src/iperf-2.0.13/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/user/src/iperf-2.0.13'
make: *** [all] Error 2


my guess (I am pretty neophite :) is that make is using "system" ld, not the one from toolchain.

Anyway, I tried to manually export LD variable to /home/user/buildroot-2019.05.1/output/host/bin/mips-buildroot-linux-uclibc-ld but I got exactly same error.


Any suggestion? Thank you!



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200309/04775d6e/attachment.html>
-------------- next part --------------
[user at server iperf-2.0.13]$ ./configure --target=mips-buildroot-linux-gnu --host=mips-buildroot-linux-gnu CC=/home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc  --prefix=/opt/iperf3
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for mips-buildroot-linux-gnu-strip... no
checking for strip... strip
checking for a thread-safe mkdir -p... /usr/bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking whether make supports nested variables... yes
checking whether to enable maintainer-specific portions of Makefiles... no
checking for style of include used by make... GNU
checking for mips-buildroot-linux-gnu-gcc... /home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc
checking whether the C compiler works... no
configure: error: in `/home/user/src/iperf-2.0.13':
configure: error: C compiler cannot create executables
See `config.log' for more details
[user at server iperf-2.0.13]$ ./configure --target=mips-buildroot-linux-gnu --host=mips-buildroot-linux-gnu CC=/home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc  --prefix=/opt/iperf3    
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for mips-buildroot-linux-gnu-strip... no
checking for strip... strip
checking for a thread-safe mkdir -p... /usr/bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking whether make supports nested variables... yes
checking whether to enable maintainer-specific portions of Makefiles... no
checking for style of include used by make... GNU
checking for mips-buildroot-linux-gnu-gcc... /home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... yes
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether /home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc accepts -g... yes
checking for /home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc option to accept ISO C89... none needed
checking whether /home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc understands -c and -o together... yes
checking dependency style of /home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc... gcc3
checking whether TPACKET_V2 is declared... yes
checking for mips-buildroot-linux-gnu-g++... no
checking for mips-buildroot-linux-gnu-c++... no
checking for mips-buildroot-linux-gnu-gpp... no
checking for mips-buildroot-linux-gnu-aCC... no
checking for mips-buildroot-linux-gnu-CC... no
checking for mips-buildroot-linux-gnu-cxx... no
checking for mips-buildroot-linux-gnu-cc++... no
checking for mips-buildroot-linux-gnu-cl.exe... no
checking for mips-buildroot-linux-gnu-FCC... no
checking for mips-buildroot-linux-gnu-KCC... no
checking for mips-buildroot-linux-gnu-RCC... no
checking for mips-buildroot-linux-gnu-xlC_r... no
checking for mips-buildroot-linux-gnu-xlC... no
checking for g++... g++
configure: WARNING: using cross tools not prefixed with host triplet
checking whether we are using the GNU C++ compiler... yes
checking whether g++ accepts -g... yes
checking dependency style of g++... gcc3
checking for mips-buildroot-linux-gnu-gcc... (cached) /home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc
checking whether we are using the GNU C compiler... (cached) yes
checking whether /home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc accepts -g... (cached) yes
checking for /home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc option to accept ISO C89... (cached) none needed
checking whether /home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc understands -c and -o together... (cached) yes
checking dependency style of /home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc... (cached) gcc3
checking for library containing strerror... none required
checking whether make sets $(MAKE)... (cached) yes
checking for mips-buildroot-linux-gnu-ranlib... no
checking for ranlib... ranlib
checking build system type... x86_64-unknown-linux-uclibc
checking host system type... mips-buildroot-linux-gnu
checking for clock_gettime in -lrt... yes
checking for the pthreads library -lpthreads... no
checking whether pthreads work without any flags... yes
checking for joinable pthread attribute... PTHREAD_CREATE_JOINABLE
checking if more special flags are required for pthreads... no
checking for cc_r... /home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc
checking for library containing gethostbyname... none required
checking for library containing socket... none required
checking how to run the C preprocessor... /home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc -E
checking for grep that handles long lines and -e... /usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking arpa/inet.h usability... yes
checking arpa/inet.h presence... yes
checking for arpa/inet.h... yes
checking libintl.h usability... yes
checking libintl.h presence... yes
checking for libintl.h... yes
checking net/ethernet.h usability... yes
checking net/ethernet.h presence... yes
checking for net/ethernet.h... yes
checking net/if.h usability... yes
checking net/if.h presence... yes
checking for net/if.h... yes
checking linux/ip.h usability... yes
checking linux/ip.h presence... yes
checking for linux/ip.h... yes
checking linux/udp.h usability... yes
checking linux/udp.h presence... yes
checking for linux/udp.h... yes
checking linux/if_packet.h usability... yes
checking linux/if_packet.h presence... yes
checking for linux/if_packet.h... yes
checking linux/filter.h usability... yes
checking linux/filter.h presence... yes
checking for linux/filter.h... yes
checking netdb.h usability... yes
checking netdb.h presence... yes
checking for netdb.h... yes
checking netinet/in.h usability... yes
checking netinet/in.h presence... yes
checking for netinet/in.h... yes
checking for stdlib.h... (cached) yes
checking for string.h... (cached) yes
checking for strings.h... (cached) yes
checking sys/socket.h usability... yes
checking sys/socket.h presence... yes
checking for sys/socket.h... yes
checking sys/time.h usability... yes
checking sys/time.h presence... yes
checking for sys/time.h... yes
checking syslog.h usability... yes
checking syslog.h presence... yes
checking for syslog.h... yes
checking for unistd.h... (cached) yes
checking signal.h usability... yes
checking signal.h presence... yes
checking for signal.h... yes
checking ifaddrs.h usability... yes
checking ifaddrs.h presence... yes
checking for ifaddrs.h... yes
checking for an ANSI C-conforming const... yes
checking for size_t... yes
checking for ssize_t... yes
checking whether time.h and sys/time.h may both be included... yes
checking whether struct tm is in sys/time.h or time.h... time.h
checking for int64_t... yes
checking 3rd argument of accept... socklen_t
checking for working memcmp... no
checking sys/select.h usability... yes
checking sys/select.h presence... yes
checking for sys/select.h... yes
checking for sys/socket.h... (cached) yes
checking types of arguments for select... int,fd_set *,struct timeval *
checking return type of signal handlers... void
checking for strftime... yes
checking for vprintf... yes
checking for _doprnt... no
checking for atexit... yes
checking for memset... yes
checking for pthread_cancel... yes
checking for select... yes
checking for strchr... yes
checking for strerror... yes
checking for strtol... yes
checking for strtoll... yes
checking for usleep... yes
checking for clock_gettime... yes
checking for sched_setscheduler... yes
checking for mlockall... yes
checking for setitimer... yes
checking for nanosleep... yes
checking for clock_nanosleep... yes
checking for snprintf... yes
checking for inet_pton... yes
checking for inet_ntop... yes
checking for gettimeofday... yes
checking whether ENOBUFS is declared... yes
checking whether EWOULDBLOCK is declared... yes
checking whether CPU_SET is declared... yes
checking whether SIGALRM is declared... yes
checking whether AF_INET6 is declared... yes
checking whether SO_TIMESTAMP is declared... yes
checking whether SO_SNDTIMEO is declared... yes
checking whether SO_MAX_PACING_RATE is declared... yes
checking whether IPV6_TCLASS is declared... yes
checking whether MCAST_JOIN_GROUP is declared... yes
checking whether MCAST_JOIN_SOURCE_GROUP is declared... yes
checking whether IPV6_ADD_MEMBERSHIP is declared... yes
checking whether IPV6_MULTICAST_HOPS is declared... yes
checking whether IP_ADD_MEMBERSHIP is declared... yes
checking whether IP_ADD_SOURCE_MEMBERSHIP is declared... yes
checking for struct sockaddr_storage... yes
checking for struct sockaddr_in6... yes
checking for struct group_source_req... yes
checking for struct ip_mreq... yes
checking for struct ipv6_mreq... yes
checking for struct ip_mreq_source... yes
checking for struct sockaddr_in6.sin6_len... no
checking for struct ip_mreq_source.imr_multiaddr.s_addr... yes
checking for struct tcp_info.tcpi_total_retrans... yes
checking size of bool... 0
checking if true is defined... yes
checking whether byte ordering is bigendian... yes
checking for multicast support... yes
checking for multicast ssm support... yes
checking for IPv6 headers and structures... yes
checking for IPv6 multicast support... yes
checking whether make is GNU make... yes
checking that generated files are newer than configure... done
configure: creating ./config.status
config.status: creating Makefile
config.status: creating compat/Makefile
config.status: creating doc/Makefile
config.status: creating include/Makefile
config.status: creating src/Makefile
config.status: creating man/Makefile
config.status: creating config.h
config.status: config.h is unchanged
config.status: executing depfiles commands
-------------- next part --------------
[user at server iperf-2.0.13]$ make
make  all-recursive
make[1]: Entering directory `/home/user/src/iperf-2.0.13'
Making all in compat
make[2]: Entering directory `/home/user/src/iperf-2.0.13/compat'
/home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT Thread.o -MD -MP -MF .deps/Thread.Tpo -c -o Thread.o Thread.c
mv -f .deps/Thread.Tpo .deps/Thread.Po
/home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT error.o -MD -MP -MF .deps/error.Tpo -c -o error.o error.c
mv -f .deps/error.Tpo .deps/error.Po
/home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT delay.o -MD -MP -MF .deps/delay.Tpo -c -o delay.o delay.c
mv -f .deps/delay.Tpo .deps/delay.Po
/home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT gettimeofday.o -MD -MP -MF .deps/gettimeofday.Tpo -c -o gettimeofday.o gettimeofday.c
mv -f .deps/gettimeofday.Tpo .deps/gettimeofday.Po
/home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT inet_ntop.o -MD -MP -MF .deps/inet_ntop.Tpo -c -o inet_ntop.o inet_ntop.c
mv -f .deps/inet_ntop.Tpo .deps/inet_ntop.Po
/home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT inet_pton.o -MD -MP -MF .deps/inet_pton.Tpo -c -o inet_pton.o inet_pton.c
mv -f .deps/inet_pton.Tpo .deps/inet_pton.Po
/home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT signal.o -MD -MP -MF .deps/signal.Tpo -c -o signal.o signal.c
mv -f .deps/signal.Tpo .deps/signal.Po
/home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT snprintf.o -MD -MP -MF .deps/snprintf.Tpo -c -o snprintf.o snprintf.c
mv -f .deps/snprintf.Tpo .deps/snprintf.Po
/home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT string.o -MD -MP -MF .deps/string.Tpo -c -o string.o string.c
mv -f .deps/string.Tpo .deps/string.Po
rm -f libcompat.a
ar cru libcompat.a Thread.o error.o delay.o gettimeofday.o inet_ntop.o inet_pton.o signal.o snprintf.o string.o 
ranlib libcompat.a
make[2]: Leaving directory `/home/user/src/iperf-2.0.13/compat'
Making all in doc
make[2]: Entering directory `/home/user/src/iperf-2.0.13/doc'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/home/user/src/iperf-2.0.13/doc'
Making all in include
make[2]: Entering directory `/home/user/src/iperf-2.0.13/include'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/home/user/src/iperf-2.0.13/include'
Making all in src
make[2]: Entering directory `/home/user/src/iperf-2.0.13/src'
g++ -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT Client.o -MD -MP -MF .deps/Client.Tpo -c -o Client.o Client.cpp
mv -f .deps/Client.Tpo .deps/Client.Po
/home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT Extractor.o -MD -MP -MF .deps/Extractor.Tpo -c -o Extractor.o Extractor.c
mv -f .deps/Extractor.Tpo .deps/Extractor.Po
g++ -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT isochronous.o -MD -MP -MF .deps/isochronous.Tpo -c -o isochronous.o isochronous.cpp
mv -f .deps/isochronous.Tpo .deps/isochronous.Po
g++ -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT Launch.o -MD -MP -MF .deps/Launch.Tpo -c -o Launch.o Launch.cpp
mv -f .deps/Launch.Tpo .deps/Launch.Po
g++ -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT List.o -MD -MP -MF .deps/List.Tpo -c -o List.o List.cpp
mv -f .deps/List.Tpo .deps/List.Po
g++ -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT Listener.o -MD -MP -MF .deps/Listener.Tpo -c -o Listener.o Listener.cpp
mv -f .deps/Listener.Tpo .deps/Listener.Po
/home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT Locale.o -MD -MP -MF .deps/Locale.Tpo -c -o Locale.o Locale.c
mv -f .deps/Locale.Tpo .deps/Locale.Po
g++ -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT PerfSocket.o -MD -MP -MF .deps/PerfSocket.Tpo -c -o PerfSocket.o PerfSocket.cpp
mv -f .deps/PerfSocket.Tpo .deps/PerfSocket.Po
/home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT ReportCSV.o -MD -MP -MF .deps/ReportCSV.Tpo -c -o ReportCSV.o ReportCSV.c
mv -f .deps/ReportCSV.Tpo .deps/ReportCSV.Po
/home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT ReportDefault.o -MD -MP -MF .deps/ReportDefault.Tpo -c -o ReportDefault.o ReportDefault.c
mv -f .deps/ReportDefault.Tpo .deps/ReportDefault.Po
/home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT Reporter.o -MD -MP -MF .deps/Reporter.Tpo -c -o Reporter.o Reporter.c
mv -f .deps/Reporter.Tpo .deps/Reporter.Po
g++ -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT Server.o -MD -MP -MF .deps/Server.Tpo -c -o Server.o Server.cpp
mv -f .deps/Server.Tpo .deps/Server.Po
g++ -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT Settings.o -MD -MP -MF .deps/Settings.Tpo -c -o Settings.o Settings.cpp
mv -f .deps/Settings.Tpo .deps/Settings.Po
/home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT SocketAddr.o -MD -MP -MF .deps/SocketAddr.Tpo -c -o SocketAddr.o SocketAddr.c
mv -f .deps/SocketAddr.Tpo .deps/SocketAddr.Po
/home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT gnu_getopt.o -MD -MP -MF .deps/gnu_getopt.Tpo -c -o gnu_getopt.o gnu_getopt.c
mv -f .deps/gnu_getopt.Tpo .deps/gnu_getopt.Po
/home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT gnu_getopt_long.o -MD -MP -MF .deps/gnu_getopt_long.Tpo -c -o gnu_getopt_long.o gnu_getopt_long.c
mv -f .deps/gnu_getopt_long.Tpo .deps/gnu_getopt_long.Po
/home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT histogram.o -MD -MP -MF .deps/histogram.Tpo -c -o histogram.o histogram.c
mv -f .deps/histogram.Tpo .deps/histogram.Po
g++ -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT main.o -MD -MP -MF .deps/main.Tpo -c -o main.o main.cpp
mv -f .deps/main.Tpo .deps/main.Po
/home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT service.o -MD -MP -MF .deps/service.Tpo -c -o service.o service.c
mv -f .deps/service.Tpo .deps/service.Po
/home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT sockets.o -MD -MP -MF .deps/sockets.Tpo -c -o sockets.o sockets.c
mv -f .deps/sockets.Tpo .deps/sockets.Po
/home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT stdio.o -MD -MP -MF .deps/stdio.Tpo -c -o stdio.o stdio.c
mv -f .deps/stdio.Tpo .deps/stdio.Po
/home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT tcp_window_size.o -MD -MP -MF .deps/tcp_window_size.Tpo -c -o tcp_window_size.o tcp_window_size.c
mv -f .deps/tcp_window_size.Tpo .deps/tcp_window_size.Po
/home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT pdfs.o -MD -MP -MF .deps/pdfs.Tpo -c -o pdfs.o pdfs.c
mv -f .deps/pdfs.Tpo .deps/pdfs.Po
/home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc -DHAVE_CONFIG_H -I. -I..  -I../include -I../include  -Wall -O2  -MT checksums.o -MD -MP -MF .deps/checksums.Tpo -c -o checksums.o checksums.c
mv -f .deps/checksums.Tpo .deps/checksums.Po
g++ -Wall -O2  -O2    -DHAVE_CONFIG_H  -o iperf Client.o Extractor.o isochronous.o Launch.o List.o Listener.o Locale.o PerfSocket.o ReportCSV.o ReportDefault.o Reporter.o Server.o Settings.o SocketAddr.o gnu_getopt.o gnu_getopt_long.o histogram.o main.o service.o sockets.o stdio.o tcp_window_size.o pdfs.o checksums.o ../compat/libcompat.a -lrt 
/usr/bin/ld: Extractor.o: Relocations in generic ELF (EM: 8)
/usr/bin/ld: Extractor.o: Relocations in generic ELF (EM: 8)
Extractor.o: error adding symbols: File in wrong format
collect2: error: ld returned 1 exit status
make[2]: *** [iperf] Error 1
make[2]: Leaving directory `/home/user/src/iperf-2.0.13/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/user/src/iperf-2.0.13'
make: *** [all] Error 2
