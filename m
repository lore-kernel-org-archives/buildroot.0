From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Mon, 24 Aug 2009 12:19:22 -0400
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <20090823081702.445b1b5a@surf>
References: <BD79186B4FD85F4B8E60E381CAEE190901BEA43C@mi8nycmail19.Mi8.com><20090819214237.534c433f@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA476@mi8nycmail19.Mi8.com><20090819233037.1d8e5a5d@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA4AD@mi8nycmail19.Mi8.com><20090820143514.7c5e56a2@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA58B@mi8nycmail19.Mi8.com><BD79186B4FD85F4B8E60E381CAEE190901BEA5DB@mi8nycmail19.Mi8.com><BD79186B4FD85F4B8E60E381CAEE190901BEA675@mi8nycmail19.Mi8.com><20090821114447.188fc839@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA738@mi8nycmail19.Mi8.com><20090822011906.2dd045fc@surf><BD79186B4FD85F4B8E60E381CAEE19091E7909@mi8nycmail19.Mi8.com><20090822105505.27ace9b6@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA86D@mi8nycmail19.Mi8.com>
	<20090823081702.445b1b5a@surf>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901C550CB@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday, August 22, 2009 11:17 PM, Thomas Petazzoni wrote:
>>> Would you mind testing this new fix, and see if it works for you ?
>> 
>> No link?  Where can I get the fix to test?
>
> Same place as the other fixes, in my multilib-toolchain-fix branch, at
> http://git.buildroot.net/~tpetazzoni/git/buildroot/log/?h=multilib-toolchain-fix

Sorry, I should have figured that out ;-)

> The two commits are :
>  http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=multilib-toolchain-fix&id=65ee9b3945a665f1279fa940b30818f4924acd31
>  http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=multilib-toolchain-fix&id=2907415d82b7d306ca3f1f1ead0bbb0c7f1505c3

Initially it looked like this might work.

But during the final linking of gettext (I think that's what was happening) I get:

/home/bigguiness/CodeSourcery/Sourcery_G++_Lite/bin/arm-none-linux-gnueabi-gcc  -Os  -mtune=arm920t -march=armv4t -mabi=aapcs-linux -msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 --sysroot /home/bigguiness/buildroot/build_arm/staging_dir/ -shared  .libs/allocsa.o .libs/backupfile.o .libs/addext.o .libs/basename.o .libs/c-ctype.o .libs/c-strcasecmp.o .libs/c-strncasecmp.o .libs/c-strcasestr.o .libs/c-strstr.o .libs/classpath.o .libs/clean-temp.o .libs/closeout.o .libs/copy-file.o .libs/csharpcomp.o .libs/csharpexec.o .libs/error-progname.o .libs/execute.o .libs/exitfail.o .libs/fatal-signal.o .libs/findprog.o .libs/fstrcmp.o .libs/full-write.o .libs/fwriteerror.o .libs/gcd.o .libs/hash.o .libs/javacomp.o .libs/javaexec.o .libs/javaversion.o .libs/linebreak.o .libs/gl_linkedhash_list.o .libs/gl_list.o .libs/localcharset.o .libs/lock.o .libs/mbswidth.o .libs/concatpath.o .libs/pipe.o .libs/progname.o .libs/progreloc.o .libs/propername.o .libs/quote.o .libs/quotearg.o .libs/sh-quote.o .libs/striconv.o .libs/strnlen1.o .libs/tls.o .libs/tmpdir.o .libs/wait-process.o .libs/xmalloc.o .libs/xstrdup.o .libs/xallocsa.o .libs/xerror.o .libs/xreadlink.o .libs/xsetenv.o .libs/xstriconv.o .libs/xvasprintf.o .libs/xasprintf.o .libs/argmatch.o .libs/fnmatch.o .libs/mbchar.o .libs/safe-read.o .libs/safe-write.o .libs/strstr.o  -L/home/bigguiness/buildroot/build_arm/staging_dir/usr/lib -L/usr/lib -lintl -lc  -mtune=arm920t -march=armv4t -mabi=aapcs-linux -msoft-float -Wl,-soname -Wl,libgettextlib-0.16.1.so -o .libs/libgettextlib-0.16.1.so/home/bigguiness/CodeSourcery/Sourcery_G++_Lite/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/../../../../arm-none-linux-gnueabi/bin/ld: warning: library search path "/usr/lib" is unsafe for cross-compilation
/home/bigguiness/CodeSourcery/Sourcery_G++_Lite/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/../../../../arm-none-linux-gnueabi/bin/ld: skipping incompatible /lib/libc.so.6 when searching for /lib/libc.so.6
/home/bigguiness/CodeSourcery/Sourcery_G++_Lite/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/../../../../arm-none-linux-gnueabi/bin/ld: cannot find /lib/libc.so.6
collect2: ld returned 1 exit status
libtool: install: error: relink `libgettextlib.la' with the above command before installing it
make[5]: *** [install-libLTLIBRARIES] Error 1
make[5]: Leaving directory `/home/bigguiness/buildroot/build_arm/gettext-0.16.1/gettext-tools/gnulib-lib'
make[4]: *** [install-am] Error 2
make[4]: Leaving directory `/home/bigguiness/buildroot/build_arm/gettext-0.16.1/gettext-tools/gnulib-lib'
make[3]: *** [install] Error 2
make[3]: Leaving directory `/home/bigguiness/buildroot/build_arm/gettext-0.16.1/gettext-tools/gnulib-lib'
make[2]: *** [install-recursive] Error 1
make[2]: Leaving directory `/home/bigguiness/buildroot/build_arm/gettext-0.16.1/gettext-tools'
make[1]: *** [install-recursive] Error 1
make[1]: Leaving directory `/home/bigguiness/buildroot/build_arm/gettext-0.16.1'
make: *** [/home/bigguiness/buildroot/build_arm/staging_dir/usr/bin/gettext] Error 2

I'll try to prune down my rootfs to see if I can at least get the system to boot.

Regards,
Hartley
