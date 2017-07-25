From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 25 Jul 2017 22:02:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/joe: bump version to 4.4
References: <20170724182544.31732-1-bernd.kuhls@t-online.de>
 <87pocozjr2.fsf@dell.be.48ers.dk>
Message-ID: <1nkk4ex84b.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Am Tue, 25 Jul 2017 16:14:25 +0200 schrieb Peter Korsgaard:

>>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls-
zqRNUXuvxA0b1SvskN2V4Q@public.gmane.org> writes:
> 
>  > Tested with test-pkg using this defconfig
> 
>  > BR2_PACKAGE_JOE=y
>  > BR2_PACKAGE_JOE_FULL=y
> 
> Really?

yes.

>>>> joe 4.4 Installing to target
> /usr/bin/install -m 0755 -D /home/peko/source/buildroot/output-joe/
build/joe-4.4/joe /home/peko/source/buildroot/output-joe/target/usr/bin/
joe
> /usr/bin/install: omitting directory '/home/peko/source/buildroot/
output-joe/build/joe-4.4/joe'
> package/pkg-generic.mk:308: recipe for target '/home/peko/source/
buildroot/output-joe/build/joe-4.4/.stamp_target_installed' failed
> make[1]: *** [/home/peko/source/buildroot/output-joe/build/
joe-4.4/.stamp_target_installed] Error 1
> Makefile:16: recipe for target '_all' failed
> make: *** [_all] Error 2

Did you test with the same defconfig?

I just re-tested "make joe" using this defconfig

BR2_x86_64=y
BR2_x86_core2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/
tarballs/br-x86-64-core2-full-2017.05-1078-g95b1dae.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_JOE=y

and it installs

$ LC_ALL=C ls -la output/target/usr/bin/
total 612
drwxr-xr-x 2 bernd bernd   4096 Jul 25 21:53 .
drwxr-xr-x 6 bernd bernd   4096 Jul 25 21:53 ..
lrwxrwxrwx 1 bernd bernd      3 Jul 25 21:53 jmacs -> joe
-rwxr-xr-x 1 bernd bernd 615704 Jul 25 21:53 joe
lrwxrwxrwx 1 bernd bernd      3 Jul 25 21:53 jpico -> joe
lrwxrwxrwx 1 bernd bernd      3 Jul 25 21:53 jstar -> joe
lrwxrwxrwx 1 bernd bernd      3 Jul 25 21:53 rjoe -> joe

without errors.

Ah, now I see the difference, BR2_PACKAGE_JOE_FULL has "default y" and 
was part of my defconfig. When deactivating BR2_PACKAGE_JOE_FULL I can 
reproduce the error, sent v2.

> I'm not quite sure why we use a custom install step instead of just make
> install. This is what joe installs:

"make install" installs everything while custom JOE_INSTALL_TARGET_CMDS 
only installs the binary when BR2_PACKAGE_JOE_FULL is disabled.

Regards, Bernd
