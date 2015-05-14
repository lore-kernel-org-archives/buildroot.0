From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 May 2015 23:13:09 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150514063016.DE5B7100C9A@stock.ovh.net>
References: <20150514063016.DE5B7100C9A@stock.ovh.net>
Message-ID: <20150514231309.4e8158df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 May 2015 08:30:16 +0200 (CEST), Thomas Petazzoni wrote:

>       xtensa |              alsa-utils-1.0.29 | NOK | http://autobuild.buildroot.net/results/5347b57d23b44e1b011a499875ce638ed654418a/

Static linking issue:

undefined reference to `_snd_module_rawmidi_virt'

>          arm |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/31be76d4cbc1193458d3a4cdd4a0ccc1087d313e/

Fixed by http://patchwork.ozlabs.org/patch/472141/.

>      powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/9faeba9f811bb3507861003d78eec245f8a93db9/
>        nios2 |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/46f9d84e6db10ce7cbe48653f6da4450aceceb4c/
>      powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/7852f40e6bae93f953a588bbd6902c2b1cee8a42/
>      powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/13b43105caf4d3952de70030b51f8d96cf6604ee/
>        nios2 |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/e119b1ef55c546e0d0598b85c46ceefa5c43d5a6/

The nios2 problems are due to a toolchain issue. We should simply
disable boost with this toolchain.

The PowerPC problems are due to a uClibc bug. I've done some tests, and
boost-1.57.0 builds fine on PowerPC/glibc, ARM/uClibc, but fails on
PowerPC/uClibc. It's the boost-log module that causes the problem.

>          arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/ec8ad71c51939a4548b413d447c48a29d53cb988/
>          arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/ca45297aa0ffbc9062ed92dc7ac070b0b33001de/
>          arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/4346e4417809f1b80b63b115137f27598b7e450d/

Already fixed by
http://git.buildroot.net/buildroot/commit/?id=0c12f72775b332fe7e3f7589ec4d08534b8ec64e.

>      powerpc |                host-mono-4.0.0 | NOK | http://autobuild.buildroot.net/results/c72d96a9747ffd3456e86728dc08fdce39fc7273/
>      powerpc |                host-mono-4.0.0 | NOK | http://autobuild.buildroot.net/results/d855645e625e7909e38205855a9a4c66a98720e8/

Parallel installation issue, still unsolved.

>          arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/4ac625f4e888ba859a5867671664dc8d041ec9b9/
>          arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/61450e889c3912e38e52759812fbb6ce03270788/

Builds with -shared -static when static linking. Bad.

>         bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/5f7b69a324b72dfb522a9299804c113414db348c/

libacl.a: No such file or directory

I don't know.

>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/d136f763ca3389cdc6a404db7a4fc0cd18329955/

Compiler bug:

/tmp/ccAiYLAw.s: Assembler messages:
/tmp/ccAiYLAw.s:951: Error: bad expression


>          arm |               libefreet-1.7.10 | NOK | http://autobuild.buildroot.net/results/4de0d4ebb92bda9904d9085b744705f109e99126/

uClibc static linking bug, yet another one...

>      powerpc |                libgtk3-3.14.11 | NOK | http://autobuild.buildroot.net/results/045f75e42815e3bb1f06aa121e7917e4617e186b/

gdkwindow-wayland.c:50:34: error: redefinition of typedef
'GdkWaylandWindow' ../../gdk/wayland/gdkwaylandwindow.h:32:34: note:
previous declaration of 'GdkWaylandWindow' was here
gdkwindow-wayland.c:51:39: error: redefinition of typedef
'GdkWaylandWindowClass' ../../gdk/wayland/gdkwaylandwindow.h:36:39:
note: previous declaration of 'GdkWaylandWindowClass' was here

Wayland backend issue?

>       x86_64 |                 libupnpp-0.8.6 | NOK | http://autobuild.buildroot.net/results/f383bf4d7572a7dd59d382cd06a9baeb37e9161c/

checking for curl_easy_init in -lcurl... no
configure: error: libcurl not found

Smells like a static linking issue.

>          arm |                   mongoose-5.6 | NOK | http://autobuild.buildroot.net/results/372515ba0a09a23237ae34024658f21c2625d6e7/

mongoose.c:1326:19: fatal error: dlfcn.h: No such file or directory

Needs shared library support.

>        nios2 |                mosquitto-1.4.1 | NOK | http://autobuild.buildroot.net/results/b853369452115b0c6f32c6c960af2dbdf71a74af/

Infamous "undefined reference to symbol '_gp'" issue.

>         bfin |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/5173b841460cac17639958afe2abcef803f9eb81/

Lots and lots of weird errors.

>         i686 | neardal-33b54a55032b047fd88... | NOK | http://autobuild.buildroot.net/results/586fa95149aa37df7ef430e3a47a3418e6f7ed97/

checking for library containing rl_initialize... no
configure: error: editline or readline is required

Smells like a static linking issue.

>       mipsel |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/f9ed96d22e91cdba9ad92c4d4ea52e422bf1f1c9/

/home/buildroot/build/instance-0/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(c_zlib.o): In function `zlib_stateful_expand_block':
c_zlib.c:(.text+0x78): undefined reference to `inflate'

Static linking issue. Do we really want to support static linking of
postgresql?

>      powerpc |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/d2bf71cdd0fe9b0049ba2889de89ccc36cfdc58a/

We need to apply http://patchwork.ozlabs.org/patch/468134/.

>          arm |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/f403a76ac0abbf8488373c0dffb4487f5d98c55d/

g++: error: unrecognized command line option '-fuse-ld=gold'

>       xtensa |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/d15a31eedb92bb22f0f22188913d15c93ac8d776/
>      powerpc |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/d14f8451f0488ca79ff4f131c68af83a974b3853/
>       xtensa |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/e70c54b55988a1bed0eb0bad7d0050ebf860a3a3/

Fixed by http://git.buildroot.net/buildroot/commit/?id=3d3f70b567718ae308b5704ddd7d107c4849309e.

>       mipsel |              sofia-sip-1.12.11 | NOK | http://autobuild.buildroot.net/results/d748025d17e131921d114d8baa20bab2722b26b8/

uClibc static linking bug.

>       xtensa |            uboot-tools-2015.04 | NOK | http://autobuild.buildroot.net/results/208e93e36d20df0137625c47edc44181a8ac24fa/
>       x86_64 |            uboot-tools-2015.04 | NOK | http://autobuild.buildroot.net/results/9b7cedbf3eec5125385e73fbfd4988c382986be6/

Fixed by http://git.buildroot.net/buildroot/commit/?id=95f9a5c3df8e4226b99438efccf0bf21eecb573d.

>       x86_64 |                   vsftpd-3.0.2 | NOK | http://autobuild.buildroot.net/results/3bf7d288f77418b933d5f479c14fa3dab0e5b1ae/
>       mipsel |                   vsftpd-3.0.2 | NOK | http://autobuild.buildroot.net/results/90cea7c4fdb3e5af923eedf96d79594d6d02e563/
>          arm |                   vsftpd-3.0.2 | NOK | http://autobuild.buildroot.net/results/4be4623329f30d403b29ac77b9ce4379e530d341/
>     mips64el |                   vsftpd-3.0.2 | NOK | http://autobuild.buildroot.net/results/440e208a475577580be7042d52e10dda47d837ba/
>          arm |                   vsftpd-3.0.2 | NOK | http://autobuild.buildroot.net/results/a37fe465561a073a193ebcf8458f24738b64b296/
>          arm |                   vsftpd-3.0.2 | NOK | http://autobuild.buildroot.net/results/221c987a9657caefad54bcc2fe9d2d71189c94c5/
>         i686 |                   vsftpd-3.0.2 | NOK | http://autobuild.buildroot.net/results/3662e59003080ef1e5105d35fe8215768c2a899e/

Fixed by http://git.buildroot.net/buildroot/commit/?id=205f07755661b64da21509469b46006ea0badcf9.

>         bfin |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/2d6ff7466a0626566082e98188a3e1224d1e1ad0/

/home/peko/autobuild/instance-1/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libexslt.a(crypto.o): In function `_exsltCryptoGcryptInit':
crypto.c:(.text+0x112): undefined reference to `_gcry_check_version'
/home/peko/autobuild/instance-1/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libexslt.a(crypto.o): In function `_exsltCryptoRc4DecryptFunction':
crypto.c:(.text+0x316): undefined reference to `_gcry_cipher_open'

Static linking issue.

>          sh4 |                    zmqpp-3.2.0 | NOK | http://autobuild.buildroot.net/results/2c48cd13fc453ba399e57a3703375f4eecd65685/

src/client/main.cpp: In function 'int main(int, const char**)':
src/client/main.cpp:30:10: error: 'EXIT_FAILURE' was not declared in this scope

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
