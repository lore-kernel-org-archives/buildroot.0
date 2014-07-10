From: IoriBranford . <ioribranford@gmail.com>
Date: Thu, 10 Jul 2014 02:38:44 -0400
Subject: [Buildroot] [rpi-userland] Trying to dlopen libGLESv2,
 can't resolve libEGL function symbols
Message-ID: <CABqEe+mvMi6aLkCbc1_0XZMN-RX7c9MNMYQOoPU5yc7KY6_iAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying out embedded Linux dev by making a Raspberry Pi system dedicated
to running SDL2 (http://libsdl.org/) applications.
Buildroot is checked out at 2014.05, except package/rpi-userland is checked
out at HEAD for the latest fix.

So far, I've created a rough SDL2 package (attached) and built a
functioning system (my config changes also attached) with a test app
("witchfire") added via an overlay.
But the test app fails very early in running. Looking through SDL2 source,
it is when it tries to dlopen libGLESv2 with RTLD_NOW|RTLD_LOCAL.

It cannot resolve symbols of certain libEGL functions used within
libGLESv2.
# witchfire
...
witchfire: symbol 'rpc_begin': can't resolve symbol
witchfire: symbol 'rpc_send_ctrl_end': can't resolve symbol
witchfire: symbol 'khrn_platform_free': can't resolve symbol
witchfire: symbol 'khrn_platform_malloc': can't resolve symbol
witchfire: symbol 'platform_memcpy': can't resolve symbol
witchfire: symbol 'rpc_recv': can't resolve symbol
witchfire: symbol 'rpc_send_ctrl_begin': can't resolve symbol
witchfire: symbol 'rpc_end': can't resolve symbol
witchfire: symbol 'rpc_send_ctrl_write': can't resolve symbol
CRITICAL: Could not initialize OpenGL / GLES library

(They are in libEGL according to
$(RPI_USERLAND_TRUNK)/interface/khronos/CMakeLists.txt)

I believe readelf -s on the target libEGL shows that they are there:
$ output/host/usr/bin/arm-raspberry-linux-uclibcgnueabihf-readelf -s
output/target/usr/lib/libEGL.so | grep rpc
     9: 00012378    20 FUNC    GLOBAL DEFAULT    8 rpc_begin
    28: 000129b4    52 FUNC    GLOBAL DEFAULT    8 rpc_send_bulk
    62: 00012b5c     4 FUNC    GLOBAL DEFAULT    8 rpc_use
    76: 0001220c    40 FUNC    GLOBAL DEFAULT    8 khclient_rpc_init
    94: 00012310   104 FUNC    GLOBAL DEFAULT    8 rpc_send_ctrl_end
   128: 0001357c     4 FUNC    GLOBAL DEFAULT    8 platform_term_rpc
   198: 00013578     4 FUNC    GLOBAL DEFAULT    8 platform_init_rpc
   214: 00012268    32 FUNC    GLOBAL DEFAULT    8 rpc_send_ctrl_longest
   235: 0001256c   924 FUNC    GLOBAL DEFAULT    8 rpc_recv
   290: 00012aec   108 FUNC    GLOBAL DEFAULT    8 rpc_high_priority_begin
   316: 000129e8   152 FUNC    GLOBAL DEFAULT    8 rpc_send_ctrl_begin
   324: 00012b60     4 FUNC    GLOBAL DEFAULT    8 rpc_release
   343: 00012a80   108 FUNC    GLOBAL DEFAULT    8 rpc_high_priority_end
   353: 00012908   172 FUNC    GLOBAL DEFAULT    8 rpc_send_bulk_gather
   367: 00012b64   412 FUNC    GLOBAL DEFAULT    8 rpc_call8_makecurrent
   400: 00012b58     4 FUNC    GLOBAL DEFAULT    8 rpc_flush
   429: 0001238c    20 FUNC    GLOBAL DEFAULT    8 rpc_end
   455: 00012288   136 FUNC    GLOBAL DEFAULT    8 rpc_send_ctrl_write
   466: 00012234    52 FUNC    GLOBAL DEFAULT    8 rpc_term

readelf -d on the target libGLESv2 shows it is aware of the dependency:
$ output/host/usr/bin/arm-raspberry-linux-uclibcgnueabihf-readelf -d
output/target/usr/lib/libGLESv2.so

Dynamic section at offset 0x14208 contains 33 entries:
  Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libEGL.so]
 0x00000001 (NEEDED)                     Shared library: [libkhrn_client.so]
 0x00000001 (NEEDED)                     Shared library: [libvcos.so]
 0x00000001 (NEEDED)                     Shared library: [libbcm_host.so]
 0x00000001 (NEEDED)                     Shared library: [libvchostif.so]
 0x00000001 (NEEDED)                     Shared library: [libpthread.so.0]
 0x00000001 (NEEDED)                     Shared library: [libdl.so.0]
 0x00000001 (NEEDED)                     Shared library: [librt.so.0]
 0x00000001 (NEEDED)                     Shared library: [libvchiq_arm.so]
 0x00000001 (NEEDED)                     Shared library:
[libvcfiled_check.so]
 0x00000001 (NEEDED)                     Shared library: [libm.so.0]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]
...

My expertise runs thin here, so, I don't see where else the issue could be.
Hopefully someone can help?
Thanks.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140710/8d492571/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: defconfig
Type: application/octet-stream
Size: 972 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140710/8d492571/attachment.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: package-sdl2.tar
Type: application/x-tar
Size: 8192 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140710/8d492571/attachment.tar>
