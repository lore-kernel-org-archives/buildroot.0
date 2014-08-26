From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Aug 2014 09:29:29 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140826063010.01540101541@stock.ovh.net>
References: <20140826063010.01540101541@stock.ovh.net>
Message-ID: <20140826092929.6787535b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Bernd, J?rg, Gustavo, see below.

On Tue, 26 Aug 2014 08:30:09 +0200 (CEST), Thomas Petazzoni wrote:

>       i686 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/f83b65bfc6ea7c7406a02e92afda43e4c5db6e7c/
>     x86_64 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/64f418f54885e8b5093dc8949c2d1d1ff3c938ea/

Same uClibc static linking issue around vfork().

>     x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/29e4c52784de56b2e880ee95f0a0f8549bfb1920/

/home/test/autobuild/instance-1/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib64/libxcb-shm.so.0: undefined reference to `xcb_get_reply_fds'
/home/test/autobuild/instance-1/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib64/libxcb-render.so.0: undefined reference to `xcb_str_sizeof'
/home/test/autobuild/instance-1/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib64/libxcb-shm.so.0: undefined reference to `xcb_send_fd'

Anybody doing X stuff to look into this? Bernd maybe?

>        arc |                    geoip-1.6.0 | TIM | http://autobuild.buildroot.net/results/0ebc078fb66a381e3b851fef37c7b48a48fb8b47/

Timeout, don't bother.

>        arm |                libgcrypt-1.6.1 | NOK | http://autobuild.buildroot.net/results/184eb5f82bbe1d78113499898c1a9e88bb9f2181/

Memory allocation problem on the build server, ignore.

>       bfin |               libgeotiff-1.3.0 | NOK | http://autobuild.buildroot.net/results/108d618632cc1f941bcba12f76f01c357fc3ef62/

configure: error: You will need to substantially rewrite libxtiff to
build libgeotiff without libtiff
make: *** [/home/test/autobuild/instance-2/output/build/libgeotiff-1.3.0/.stamp_configured] Error 1
make: Leaving directory `/home/test/autobuild/instance-2/buildroot'

Don't know.

>     x86_64 | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/6d723940d1a24e728bfb93d849b792e360fd6815/
>        arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/5eae6743dcf33b13807a161f7800d9522726ec1c/
>   mips64el | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/fe2849700379f32eec6ccb48e552ef79fe837a17/
>    powerpc | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/ba358130d9bf2f371edc719f36d3ad5ef882a885/
>     x86_64 | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/dc1ff7ff666c38c5acd62c4b4c6ca58d967ed220/

Ignore those. Richard Braun is setting up a new build server, and there
were some minor issues when setting things up. Richard's server is now
disabled again, we'll see at re-enabling it at some point today.

>        arm |                    mpd-0.18.12 | NOK | http://autobuild.buildroot.net/results/4924194292a428a295ded2f7aa0b9a3f81ed1b4a/

checking for OPUS... no
configure: error: opus decoder plugin: libopus not found

J?rg, Gustavo?

>       bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/7a6c9d058367b12edea0df83e02b7bf50521ec9c/

Conflict between uClibc symbols and symbols defined by the program, it seems.

/home/test/autobuild/instance-1/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libc.a(strchrnul.o): In function `*___GI_strchrnul':
/usr/src/packages/BUILD/blackfin-toolchain-uclibc-full-2014R1/uClibc/libc/string/generic/strchrnul.c:33: multiple definition of `_strchrnul'
obj/mingw_fixes.o:src/mingw_fixes.c:(.text+0x0): first defined here

>        arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/a865e4f9a36e3aa6124cbff5a06a5651816f54ca/
>        arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/b7bcac001098355715b675958ba7dbecfb2dbd0d/

Always the same issue, caused by the old host-perl.

>   mips64el |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/a7109a97c1517feb31b6c68d0d10a8d830c62a08/

Failed to build these modules:
_posixsubprocess                                               

Not sure, I need to investigate.

>    powerpc |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/4510fe02ef3497803ed27bf339dca07b3b073c10/

src/thrift/async/TEvhttpServer.cpp: In constructor 'apache::thrift::async::TEvhttpServer::RequestContext::RequestContext(evhttp_request*)':
src/thrift/async/TEvhttpServer.cpp:102:59: error: 'EVBUFFER_DATA' was not declared in this scope
src/thrift/async/TEvhttpServer.cpp:102:117: error: 'EVBUFFER_LENGTH' was not declared in this scope
src/thrift/async/TEvhttpServer.cpp: In member function 'void apache::thrift::async::TEvhttpServer::complete(apache::thrift::async::TEvhttpServer::RequestContext*, bool)':
src/thrift/async/TEvhttpServer.cpp:142:39: error: 'evbuffer_new' was not declared in this scope
src/thrift/async/TEvhttpServer.cpp:150:41: error: 'evbuffer_add' was not declared in this scope
src/thrift/async/TEvhttpServer.cpp:159:22: error: 'evbuffer_free' was not declared in this scope
make[5]: *** [libthriftnb_la-TEvhttpServer.lo] Error 1

Gustavo, maybe?

>       sh4a |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/3a0c48f65c06f7f19e608d54307c0788a0130589/

Need to disable on SH4, as per yesterday discussion.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
