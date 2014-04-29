From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 29 Apr 2014 12:11:39 +0200
Subject: [Buildroot] libwebsockets : missing header
Message-ID: <385326490C3E4FFE925925E70428D1E5@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all
 
building libwebsockets is broken :
 
snip..........
-g -rdynamic -fPIC -Werror -c -DINSTALL_DATADIR=\"/usr/share\" -DLWS_OPENSSL_CLIENT_CERTS=\"/etc/pki/tls/certs/\"
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -D_DEBUG -DLWS_LIBRARY_VERSION=\"1.2\"
-DLWS_BUILD_HASH=\"dd06dc8\" -MT libwebsockets_la-output.lo -MD -MP -MF .deps/libwebsockets_la-output.Tpo -c output.c  -fPIC -DPIC
-o .libs/libwebsockets_la-output.o
libtool: compile:  /home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc
-DHAVE_CONFIG_H -I. -I.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -std=gnu99 -pedantic -O0 -g
-rdynamic -fPIC -Werror -c -DINSTALL_DATADIR=\"/usr/share\" -DLWS_OPENSSL_CLIENT_CERTS=\"/etc/pki/tls/certs/\" -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -D_DEBUG -DLWS_LIBRARY_VERSION=\"1.2\" -DLWS_BUILD_HASH=\"dd06dc8\" -MT
libwebsockets_la-libwebsockets.lo -MD -MP -MF .deps/libwebsockets_la-libwebsockets.Tpo -c libwebsockets.c  -fPIC -DPIC -o
.libs/libwebsockets_la-libwebsockets.o
libtool: compile:  /home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc
-DHAVE_CONFIG_H -I. -I.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -std=gnu99 -pedantic -O0 -g
-rdynamic -fPIC -Werror -c -DINSTALL_DATADIR=\"/usr/share\" -DLWS_OPENSSL_CLIENT_CERTS=\"/etc/pki/tls/certs/\" -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -D_DEBUG -DLWS_LIBRARY_VERSION=\"1.2\" -DLWS_BUILD_HASH=\"dd06dc8\" -MT
libwebsockets_la-base64-decode.lo -MD -MP -MF .deps/libwebsockets_la-base64-decode.Tpo -c base64-decode.c  -fPIC -DPIC -o
.libs/libwebsockets_la-base64-decode.o
libwebsockets.c:32:21: fatal error: ifaddrs.h: No such file or directory
 #include <ifaddrs.h>
                     ^
Maybe this has been reported before. 
I found that this header file is not present in the staging include directory but is located
in the uclibc-0.9.33.2/include build directory.
 
Resolving the header file causes a bunch of other build errors:
 
snip..............
 
In file included from libwebsockets.c:32:0:
/home/brcpy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/ifaddrs.h: In function 'libc_hidden_proto':
/home/brcpy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/ifaddrs.h:71:13: error: storage class specified
for parameter 'freeifaddrs'
 extern void freeifaddrs (struct ifaddrs *__ifa)  __THROW;
             ^
/home/brcpy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/ifaddrs.h:72:1: error: expected declaration
specifiers before 'libc_hidden_proto'
 libc_hidden_proto(freeifaddrs)
 ^
In file included from /home/brcpy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/syslog.h:1:0,
                 from libwebsockets.c:34:
/home/brcpy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/sys/syslog.h:187:13: error: storage class
specified for parameter 'openlog'
 extern void openlog (__const char *__ident, int __option, int __facility);
snip...........
libwebsockets.c:69:2: error: (near initialization for 'log_level_names') [-Werror]
libwebsockets.c:70:2: error: excess elements in scalar initializer [-Werror]
  "EXTENSION",
  ^
libwebsockets.c:70:2: error: (near initialization for 'log_level_names') [-Werror]
libwebsockets.c:71:2: error: excess elements in scalar initializer [-Werror]
  "CLIENT",
  ^
libwebsockets.c:71:2: error: (near initialization for 'log_level_names') [-Werror]
libwebsockets.c:72:2: error: excess elements in scalar initializer [-Werror]
  "LATENCY",
  ^
libwebsockets.c:72:2: error: (near initialization for 'log_level_names') [-Werror]
libwebsockets.c:76:13: error: storage class specified for parameter 'lws_client_socket_service'
  extern int lws_client_socket_service(
             ^
libwebsockets.c:81:13: error: storage class specified for parameter 'lws_server_socket_service'
  extern int lws_server_socket_service(
             ^
libwebsockets.c:96:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
 {
 ^
libwebsockets.c:103:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
 {
 ^
libwebsockets.c:138:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
 {
 ^
libwebsockets.c:182:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token

 
 

Sagaert Johan


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140429/d0c0b83f/attachment.html>
