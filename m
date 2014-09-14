From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Sep 2014 12:19:04 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140914063013.2E5D2100F07@stock.ovh.net>
References: <20140914063013.2E5D2100F07@stock.ovh.net>
Message-ID: <20140914121904.0c2ebcbd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Peter, Danomi, Fran?ois, Frank, Bernd, see below. Others are also
welcome to help!

On Sun, 14 Sep 2014 08:30:13 +0200 (CEST), Thomas Petazzoni wrote:

>      powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/1da77cd666772a55110395fe257d73f55b6fd95d/

The usual vfork() problem. Peter, can you apply
http://patchwork.ozlabs.org/patch/384916/ ? It has been sent two weeks
ago, and I tested it one week ago. It will not fix immediately builds
based on external toolchains (I'll have to rebuild the Buildroot
external toolchains first), but it's going to be a first step.

>       x86_64 |              bluez5_utils-5.21 | NOK | http://autobuild.buildroot.net/results/448373dd6028829cb71175cf6dba5573d23e035a/

/home/test/autobuild/instance-1/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libdbus-1.a(libdbus_1_la-sd-daemon.o): In function `sd_listen_fds':
/home/test/autobuild/instance-1/output/build/dbus-1.8.6/dbus/sd-daemon.c:64: multiple definition of `sd_listen_fds'

In a static library configuration.

>      powerpc |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/b3b409ab78f2f9a9eb0e0b54847d7964c3bb36ad/
>          arm |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/b560b4c53fabd88ebca1f78d0ffedbcb0ef1c5db/

The usual intmax_t problem.

>         bfin |                  gnuplot-4.6.2 | NOK | http://autobuild.buildroot.net/results/5ded5a7f80544f131f82027958a541a3733db7c5/

Could be fixed by http://patchwork.ozlabs.org/patch/375696/. Someone
needs to test the patch.

> microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/e860a8b90397f3c34b899eafb58df167a117d741/

Ignore.

>       x86_64 |        gst1-plugins-good-1.4.1 | NOK | http://autobuild.buildroot.net/results/9f0aacfbd0c459ede47826ea2e42924a0ff63fdf/

gstv4l2allocator.c: In function 'gst_v4l2_allocator_alloc_dmabuf':
gstv4l2allocator.c:868:22: error: 'O_CLOEXEC' undeclared (first use in this function)
       expbuf.flags = O_CLOEXEC | O_RDWR;
                      ^
Weird, because it's an external toolchain built with Buildroot 2014.08,
with uClibc, and 3.16 kernel headers... Needs investigation.

>         bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/a49c369b4b251580c8f64ad019aba3258c95656b/

Trying to build some shared stuff in a static only case.

>         bfin |              libqrencode-3.4.2 | NOK | http://autobuild.buildroot.net/results/1ca0719dd1fe0bbc528ec99b5bc2b42e985bfdca/

Forgets to link with pthread.

>       x86_64 |                  libraw-0.13.4 | NOK | http://autobuild.buildroot.net/results/3d65cf351d3dd89b5ef5b339d5b8f474c96e2c19/

Don't know:

/home/test/autobuild/instance-3/output/host/usr/bin/x86_64-ctng_locales-linux-gnu-ranlib: 'libraw.a': No such file

>         bfin |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/5d49bd0b0d592567deda94b38d487d868e995196/

Forgets to link with zlib. Might be related to
http://patchwork.ozlabs.org/patch/364983/, but not sure.

>       x86_64 |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/465597702c314ca04e910b00b6b94419997cec72/
>     mips64el |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/d63e3d835af9546826a019ee395b584c3a5c3ec9/
>     mips64el |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/2954206a3bf1401583fc069500988fc0837e619b/
>     mips64el |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/740b14ce3a75cb89d296b9cb7fefa2956de9c924/
>         i686 |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/3c0f2d7665417771b1bb461d13630250832c1073/
>     mips64el |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/1f7fb838b039f4e85e14346bbe5ddc8bef26edf1/
>      aarch64 |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/2e09642ec05bbfc68d9c39454cac45b3a4fb520c/
>     mips64el |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/d19635a8be054d1cb14f575c045b47020d44b582/

Should be fixed by
http://git.buildroot.net/buildroot/commit/?id=4c443f0247bde405e57e8b7db078a56a7cf9130a.

>        nios2 |               libsvgtiny-12121 | NOK | http://autobuild.buildroot.net/results/37161481eeea74bb67d40755a98ea9f38c6ea44a/

glibc 2.20 issue, _BSD_SOURCE and _SVID_SOURCE are deprecated. Easy to
fix.

>         bfin |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/fbe6c722b92fe4ddf7ac36a8fe1be3a3891c11fd/

Weird thread related issue:

/home/peko/autobuild/instance-0/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/include/pthread.h: In static member function ???static omni_thread* omni_thread::self()???:
/home/peko/autobuild/instance-0/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/include/pthread.h:575: error: too many arguments to function ???void* 

>         i486 |         perl-xml-libxml-2.0116 | NOK | http://autobuild.buildroot.net/results/c3d48c3b3d6c1e616d8e20a2f65d8ba33abe61da/

make[1]: *** No rule to make target '/home/chroot/media/code/buildroot/autobuilder/instance-1/output/host/usr/i486-buildroot-linux-uclibc/sysroot/usr/lib/perl5/5.18.2/i486-linux/CORE/vutil.h', needed by 'Av_CharPtrPtr.o'.  Stop.
make[1]: Leaving directory '/home/chroot/media/code/buildroot/autobuilder/instance-1/output/build/perl-xml-libxml-2.0116'

Fran?ois, yet another thing that would require host-perl ?

>         i686 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/389617c7c36dfe92b85d3a3db12a706ae092c73d/

Project ERROR: Package gstreamer-app-0.10 not found
make[2]: *** [WebCore/Makefile.WebKit] Error 2
make[2]: *** Waiting for unfinished jobs....

Danomi, since you sent some qt patches recently, could you have a look?
Thanks!

>         i686 |                      qwt-6.1.0 | NOK | http://autobuild.buildroot.net/results/54df19105c151ba4ffe30ec7b76592c5ad03f182/

compiling qwt_plot_glcanvas.cpp
In file included from qwt_plot_glcanvas.cpp:10:0:
qwt_plot_glcanvas.h:15:17: fatal error: qgl.h: No such file or directory
compilation terminated.

Frank, you updated qwt recently. Could you have a look at this issue?

>       mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/aa644a9ec6a702033499fd194ccd340e4aa194a4/
>         mips |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/32c3860edaf14e0dc149856bc6b997369e166833/
>       mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/e8f4965b27c9dcc58d6ec77cdc48b83c218c5bec/

strace is now disabled on mips/uClibc:
http://git.buildroot.net/buildroot/commit/?id=c97562af4b0e873dfe41baa5ae0156d3b626f46b

>         bfin | ti-utils-06dbdb2727354b5f3a... | NOK | http://autobuild.buildroot.net/results/b1c6e25f2f90b329eee57fdd7cdc66d7f551cf9a/

Missing link against -lpthread.

>      aarch64 |                  tn5250-0.17.4 | NOK | http://autobuild.buildroot.net/results/5d1b59b73a476a9267805f6844cccbffcbb199ac/
> microblazeel |                  tn5250-0.17.4 | NOK | http://autobuild.buildroot.net/results/4831e82f91187afd7d78f4824df189ef062987ac/
>          arm |                  tn5250-0.17.4 | NOK | http://autobuild.buildroot.net/results/85a8e8b771f1d118fd4a25163ab44558a4de5ed0/

Presumably fixed by
http://git.buildroot.net/buildroot/commit/?id=1c102abb56a5396c9822bb630b6d1a31f0751548.

>       x86_64 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/e7cc022ca102a837207f9f0453fb265d2ac00b88/

Weird:

esfilter.c:1145:1: fatal error: error writing to -: Broken pipe.

Any idea?

>      powerpc |               uemacs-4.0.15-lt | TIM | http://autobuild.buildroot.net/results/d301c796eb11936a7bab374c221806c6d83e2198/

Ignore.

>          arm |                      vlc-2.1.5 | NOK | http://autobuild.buildroot.net/results/2d2bbd633dc09e7471e8b48be39b74fb1bf6336f/

main_interface.moc.cpp:14:2: error: #error "This file was generated using the moc from 4.6.3. It"
 #error "This file was generated using the moc from 4.6.3. It"
  ^
main_interface.moc.cpp:15:2: error: #error "cannot be used with the include files from this version of Qt."
 #error "cannot be used with the include files from this version of Qt."

Qt/VLC issue. Bernd?

>         bfin |                  wayland-1.5.0 | NOK | http://autobuild.buildroot.net/results/ff5b1895325204e060cb500f9ac40dd373df2c64/

  CC       src/libwayland_server_la-wayland-shm.lo
src/wayland-server.c:36:19: error: dlfcn.h: No such file or directory

>         i686 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/a2bcf55a304d1129a7cd58f4725511f96abe1968/

This error is weird. It never happened in the past, and it started
appearing recently. Not sure what is causing this...

  GEN      stamp-webkitenumtypes.h
cp: cannot create regular file `DerivedSources/webkit/webkitenumtypes.cpp': No such file or directory

>         sh4a |                   xerces-3.1.1 | TIM | http://autobuild.buildroot.net/results/a34cd26d34acd185fcae01a0e6ea4a8a217dd5a3/

Ignore.

>         bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/fb851ecb9794c0ffe15138664cda0ef276fea548/
>         bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/779ff42d63d7d192771575e11902b43a0b63274c/

Atomic intrinsics needed.

>         bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/de0da33dad120f5fd02601d3da68ddbcddd552fb/

Completely weird C++ errors.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
