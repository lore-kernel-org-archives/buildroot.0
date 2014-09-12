From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Sep 2014 10:11:05 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140912063012.AF99B100DEE@stock.ovh.net>
References: <20140912063012.AF99B100DEE@stock.ovh.net>
Message-ID: <20140912101105.1e932cb8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Samuel, Anton, Nathaniel, Vicente, Peter, Bernd, please see below.

On Fri, 12 Sep 2014 08:30:12 +0200 (CEST), Thomas Petazzoni wrote:

>     x86_64 |     bandwidthd-v2.0.1-auto-r08 | NOK | http://autobuild.buildroot.net/results/ed2d4261aef005cd7a567bd01dd8e7c8a96aa2be/

Yet another bandwidthd issue in detecting libpng. Weird.

checking for png_read_info in -lpng... no
configure: error: Bandwidthd requires but cannot libpng
make: *** [/home/test/autobuild/instance-2/output/build/bandwidthd-v2.0.1-auto-r08/.stamp_configured] Error 1
make: Leaving directory `/home/test/autobuild/instance-2/buildroot'

>       bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/d887796b7bd54dc167a266cb2dd9ac13722bc51c/

Weird C++ related problem.

>        arm |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/5f33b561e46c8ec263e7cf25d91d9a73a85dfed8/

Static linking issue: -static -shared are used at the same time.

>        arm |                    erlang-17.1 | NOK | http://autobuild.buildroot.net/results/631ec8b719fb8878141a4ad87c1fe84b1297a96b/
>        arm |                    erlang-17.1 | NOK | http://autobuild.buildroot.net/results/1f313aee75328c27e260c55dbf7caa5d3d6a07d3/
>        arm |                    erlang-17.1 | NOK | http://autobuild.buildroot.net/results/2f213d8cf6f828a68a2f36bb95564b8db043e7a2/

Should be fixed by http://patchwork.ozlabs.org/patch/388399/.

>        arm |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/5d66eb9e0976963adf30edd32db6db26b92a8e66/
>       i486 |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/3b14a241da1b4756b082d1aeff79c6bc80f9f04c/
>        arm |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/d379b236b5b7e2476d0ee1537e72e9ca14ecbb8a/
>       i486 |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/7b018d7f44f37b566259465f563e528b7be5b9cb/

The infamous intmax_t issue.

>        arm |           host-gcc-final-4.8.3 | NOK | http://autobuild.buildroot.net/results/cc62c9ba0e4e03bb2695b66d8d6284bad699802f/

Really weird problem:

/usr/include/sys/types.h:100: error: two or more data types in declaration specifiers
/usr/include/sys/types.h:110: error: two or more data types in declaration specifiers

>   mips64el |                host-ruby-2.1.2 | TIM | http://autobuild.buildroot.net/results/104c289e79921221b7f625f01cea44998350fed4/

Ignore.

>        arm |                 libinput-0.3.0 | NOK | http://autobuild.buildroot.net/results/9a9572a421db1a5733f96dc47d9b889da0de7dc7/

/home/peko/autobuild/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/armv7-ctng-linux-gnueabihf/4.8.3/../../../../armv7-ctng-linux-gnueabihf/bin/ld: attempted static link of dynamic object `/home/peko/autobuild/instance-2/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libudev.so'
collect2: error: ld returned 1 exit status

Strange, because the build is not BR2_PREFER_STATIC_LIB=y.

>        arc |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/405da9a945511329929b18740b983c51b8dcc43e/

Stupid warning beind treated as an error:

task.c: In function 'read_groups':
task.c:110:5: error: format '%zd' expects argument of type 'signed size_t', but argument 4 has type 'ssize_t' [-Werror=format=]
     evt, new_sz, ret);
     ^
cc1: all warnings being treated as errors

Anton, since the problem is seen on ARC, maybe you could have a look,
fix the warning, and try to see if -Werror can be removed?

>       bfin |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/27e0b6d00cd0f75d1be7294f4798d5fd422f5f32/
>       bfin |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/cb52ed3d34dca6c68669bfcd9b28c6e1a5aca019/

Static linking issue. Samuel, this package is using CMake, could you
have a look?

>       bfin | libshairplay-139d5ef5556451... | NOK | http://autobuild.buildroot.net/results/561817d8b3156b537f4bf76eb539658144a6efb4/
>       bfin | libshairplay-139d5ef5556451... | NOK | http://autobuild.buildroot.net/results/5e7bb6c3c1bde627fc8129b734f3f9222c2331e9/
>       bfin | libshairplay-139d5ef5556451... | NOK | http://autobuild.buildroot.net/results/b27466d56518e47d75cc437a962ae3c3a9a2aa3e/
>       bfin | libshairplay-139d5ef5556451... | NOK | http://autobuild.buildroot.net/results/78340ee174029d7a24b5078751b5b53a3547e10e/

dnssd.c:64:21: error: dns_sd.h: No such file or directory

> microblazeel |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/f66b449228825765146a6098529d7705695a217e/
>   mips64el |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/0b3fb2ee9916aa265df5b6e4f04f6dfa25d1fc84/
>   mips64el |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/b7e490b7d024bdd9ae0ee09fa209aa4dd40b3fd1/
>       i686 |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/df9dfd5ef36f64390bf0f6a6de6ef16f5c01e778/
>       i686 |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/d0fc233bb97c2ea18344746a5b7c63c8de65330a/
>    aarch64 |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/146944da7c5fee565c801c02886eed2bdd48e2d9/

Patch sent at http://patchwork.ozlabs.org/patch/388400/.

>       mips | libwebsockets-v1.23-chrome3... | NOK | http://autobuild.buildroot.net/results/34935667d4318863a6166153d78d8f3195763eda/
>    powerpc | libwebsockets-v1.23-chrome3... | NOK | http://autobuild.buildroot.net/results/cdc36e0bcff3299b6707375d2882508f50fbe886/

Weird, the tarball was not complete. It's really a tarball, it can
uncompress the beginning, but then it fails. How can this happen with
the super-safe new download infrastructure? Yann? I've kept the bad
tarball around in case an analysis needs to be done.

>   mips64el |                php-geoip-1.1.0 | NOK | http://autobuild.buildroot.net/results/e0cc0e0b10c721bcaf442203f47d5f7083084c31/

This one is a XHTML document, which says:

  <div class="errors">ERROR:<ul><li>DB Error: connect failed</li>

Seems like the upstream download site is a bit crappy.

>        arm |                 php-yaml-1.1.1 | NOK | http://autobuild.buildroot.net/results/a2d9e701494bdb5b1f3cf0e44b872c3665ac1186/

Yet another download issue. Nathaniel, can you have a look at what the file contains?

>        arm |                     ruby-2.1.2 | NOK | http://autobuild.buildroot.net/results/c483e65783d41907042d06b8fabedf15ef415cbc/

loadpath.c:30:2: error: #error RUBY_EXEC_PREFIX must be defined
 #error RUBY_EXEC_PREFIX must be defined

Probably a fallout of the ruby bump I did no long ago. I'll try to have
a look.

>       mips |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/04de887fd501e1a1b9f811dacdf17596256097e6/
>     mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/91c0413e755c365332bc15d1d69ab3d6160ae78c/

Vicente, I think you looked into one of the two issues. Can you look at
the other one, and send the corresponding patches?

>     x86_64 |                      tcl-8.6.2 | NOK | http://autobuild.buildroot.net/results/340c62da3e456bd6a5280e7f79d759ab30d5efec/

error: 'SQLITE_RECURSIVE' undeclared (first use in this function)

Incompatibility between tcl and sqlite ?

>       bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/dd2345008cf7e14c68f16dfd6bfc34d865b97fa3/

bfin-linux-uclibc-g++: /home/chroot/media/code/buildroot/autobuilder/instance-1/output/host/usr/bfin-buildroot-linux-uclibc/sysroot/opt/uClinux/bfin-linux-uclibc/lib/gcc/bfin-linux-uclibc/4.3.5/libstdc++.so: No such file or directory

>   mips64el |                  tn5250-0.17.4 | NOK | http://autobuild.buildroot.net/results/25276f4224795c2c81c3df0447d0ff5ddb60c283/

checking for CRYPTO_num_locks in -lcrypto... no
configure: error: ** Unable to find OpenSSL libraries!
make: *** [/home/peko/autobuild/instance-0/output/build/tn5250-0.17.4/.stamp_configured] Error 1
make: Leaving directory `/home/peko/autobuild/instance-0/buildroot'

Would be fixed once http://patchwork.ozlabs.org/patch/387696/ is
committed.

>       i686 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/5f430a8e210240d27d19abc626f6be6743a8b6b4/

esfilter.c:1145:1: fatal error: error writing to -: Broken pipe
compilation terminated.
make[1]: *** [obj/esfilter.o] Error 1

Don't know. Peter?

>        arm |                      vlc-2.1.5 | NOK | http://autobuild.buildroot.net/results/7102921b0a8d3a09bf7b3f5f18e56dab6ef36402/

-L/usr/lib used, bad!

/home/peko/autobuild/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.7.3/../../../../arm-none-linux-gnueabi/bin/ld: warning: library search path "/usr/lib" is unsafe for cross-compilation
/usr/lib/librt.so: file not recognized: File format not recognized
collect2: error: ld returned 1 exit status

Bernd, maybe?

>        arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/b81759d9645bf653c4fb4b79ad39377a7e377083/

The new webkit issue... We should work on merging Hadrien's bump of
webkit, but it is causing another issue with make 3.82 :-(

> microblazeel |                 xapp_xfs-1.1.4 | NOK | http://autobuild.buildroot.net/results/c36eeeb7a410b00a5d0cf79e783f3237b9720d77/

In file included from ./include/misc.h:72:0,
                 from os/xfstrans.c:33:
./include/os.h:103:13: warning: redundant redeclaration of 'ErrorF' [-Wredundant-decls]
 extern void ErrorF(const char * f, ...) _X_ATTRIBUTE_PRINTF(1, 2);
             ^
In file included from /home/test/autobuild/instance-0/output/host/usr/microblazeel-buildroot-linux-gnu/sysroot/usr/include/X11/Xtrans/transport.c:55:0,
                 from os/xfstrans.c:29:
/home/test/autobuild/instance-0/output/host/usr/microblazeel-buildroot-linux-gnu/sysroot/usr/include/X11/Xtrans/Xtransint.h:424:1: note: previous definition of 'ErrorF' was here
 ErrorF(const char *f, ...)
 ^
os/xfstrans.c: In function '_FontTransGetInetdListenInfo':
os/xfstrans.c:38:18: warning: initialization discards 'const' qualifier from pointer target type
     char *port = "0";
                  ^
Bernd, maybe?

>    powerpc |     xserver_xorg-server-1.16.0 | TIM | http://autobuild.buildroot.net/results/01fb76df24ded1e32ea3e524b39e43b12ab6a1f3/

Ignore.

>       bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/5204f6c2f965f945403ae88203ea7c9cd5a5cef3/
>       bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/aca005531eb70f171888fe9cda9690a6f1ec1f21/

Atomic instructions issue.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
