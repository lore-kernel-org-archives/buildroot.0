From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Aug 2009 01:19:06 +0200
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901BEA738@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE190901BEA43C@mi8nycmail19.Mi8.com>
	<20090819214237.534c433f@surf>
	<BD79186B4FD85F4B8E60E381CAEE190901BEA476@mi8nycmail19.Mi8.com>
	<20090819233037.1d8e5a5d@surf>
	<BD79186B4FD85F4B8E60E381CAEE190901BEA4AD@mi8nycmail19.Mi8.com>
	<20090820143514.7c5e56a2@surf>
	<BD79186B4FD85F4B8E60E381CAEE190901BEA58B@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901BEA5DB@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901BEA675@mi8nycmail19.Mi8.com>
	<20090821114447.188fc839@surf>
	<BD79186B4FD85F4B8E60E381CAEE190901BEA738@mi8nycmail19.Mi8.com>
Message-ID: <20090822011906.2dd045fc@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 21 Aug 2009 12:37:50 -0400,
"H Hartley Sweeten" <hartleys@visionengravers.com> a ?crit :

> Does the -print-sysroot work and return the correct path on your
> non-multilib external toolchain?

No, because this option has been added in gcc 4.4.x it seems. It might
be present in your Codesourcery toolchain even if it uses 4.3.x because
the patch might have been backported by Codesourcery.

Therefore, we'll have to come up with a smarter solution. We can try
-print-sysroot and if this option does not exist, fallback to the old
method. But that would not solve the case of people using a toolchain
with multilib but not supporting -print-sysroot. Maybe
-print-search-dirs is more widely available ?

> I'm still trying to get it to work but I'm a bit lost.  There are
> still a bunch of things about makefiles and all the shell stuff in
> them that I just don't get ;-).
> 
> The main problem I am having is modifying ext-tool.mk correctly.
> 
> If you have the time I would appreciate any help.  I can test anything
> that you might suggest.

If we come up with a strategy, I can happily implement it quickly in
ext-tool.mk. I've already downloaded and installed the same
Codesourcery toolchain as yours, in order to do some testing. But I'll
be quite busy the coming days, so I'm not sure how much time I'll be
able to spend on this right now.

In order to help you progressing, I've hacked two things (not ready for
the official version, but good for testing) :

 * A fix that makes sure that -march=armv4t is inside TARGET_CFLAGS,
   even in the external toolchain case

   http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=multilib-toolchain-fix&id=65ee9b3945a665f1279fa940b30818f4924acd31

 * A patch that uses -print-sysroot instead of $(CROSS)-gcc -v to
   detect the sysroot location

   http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=multilib-toolchain-fix&id=ee62af9871801f1d7892d21219c844ca86e034b8

The Buildroot pass on checking the external toolchain and copying the
sysroot directory succeeds. But later on, while configuring the first
package, I get :

configure:1719: /usr/local/xtools/arm-2009q1/bin/arm-none-linux-gnueabi-gcc -Os -pipe -Os  -mtune=arm920t -march=armv4t -mabi=aapcs-linux -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 --sysroot /home/thomas/local/buildroot-codesourcery/build_arm/staging_dir/    conftest.c  >&5
/usr/local/xtools/arm-2009q1/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/../../../../arm-none-linux-gnueabi/bin/ld: crt1.o: No such file: No such file or directory
collect2: ld returned 1 exit status

And this is probably because in the multilib case, the value returned
by -print-sysroot doesn't contain all the sysroot. For example, in my
case, /usr/local/xtools/arm-2009q1/bin/../arm-none-linux-gnueabi/libc/armv4t
(the sysroot returned by -print-sysroot with -march=armv4t) does not
contain the headers of the C library. They are
in /usr/local/xtools/arm-2009q1/arm-none-linux-gnueabi/libc/usr/include,
which is the sysroot of the !armv4t case.

So obviously, our method of simply copying one sysroot directory is not
sufficient.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
