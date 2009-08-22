From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Fri, 21 Aug 2009 23:08:29 -0400
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
References: <BD79186B4FD85F4B8E60E381CAEE190901BEA43C@mi8nycmail19.Mi8.com><20090819214237.534c433f@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA476@mi8nycmail19.Mi8.com><20090819233037.1d8e5a5d@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA4AD@mi8nycmail19.Mi8.com><20090820143514.7c5e56a2@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA58B@mi8nycmail19.Mi8.com><BD79186B4FD85F4B8E60E381CAEE190901BEA5DB@mi8nycmail19.Mi8.com><BD79186B4FD85F4B8E60E381CAEE190901BEA675@mi8nycmail19.Mi8.com><20090821114447.188fc839@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA738@mi8nycmail19.Mi8.com>
	<20090822011906.2dd045fc@surf>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19091E7909@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri 8/21/2009 7:19 PM, Thomas Petazzoni wrote:

This reply might be a bit messed up.  I'm replying thru a web-mail
interface.

>> Does the -print-sysroot work and return the correct path on your
>> non-multilib external toolchain?
>
> No, because this option has been added in gcc 4.4.x it seems. It might
> be present in your Codesourcery toolchain even if it uses 4.3.x because
> the patch might have been backported by Codesourcery.

Dang.  That would have mad it easier...

> Therefore, we'll have to come up with a smarter solution. We can try
> -print-sysroot and if this option does not exist, fallback to the old
> method. But that would not solve the case of people using a toolchain
> with multilib but not supporting -print-sysroot. Maybe
> -print-search-dirs is more widely available ?

As least with the CodeSourcery toolchain that probably will not work.
-print-search-dirs outputs all the available directories.  I'm not
at work right now to verify but I think it outputs them in this order:

1) all the directories used by the -march=??? option
2) all the default directories (no -march=??? option)

>> I'm still trying to get it to work but I'm a bit lost.  There are
>> still a bunch of things about makefiles and all the shell stuff in
>> them that I just don't get ;-).
>> 
>> The main problem I am having is modifying ext-tool.mk correctly.
>> 
>> If you have the time I would appreciate any help.  I can test anything
>> that you might suggest.
>
> If we come up with a strategy, I can happily implement it quickly in
> ext-tool.mk. I've already downloaded and installed the same
> Codesourcery toolchain as yours, in order to do some testing. But I'll
> be quite busy the coming days, so I'm not sure how much time I'll be
> able to spend on this right now.
> 
> In order to help you progressing, I've hacked two things (not ready for
> the official version, but good for testing) :
> 
>  * A fix that makes sure that -march=armv4t is inside TARGET_CFLAGS,
>    even in the external toolchain case
> 
>    http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=multilib-toolchain-fix&id=65ee9b3945a665f1279fa940b30818f4924acd31
> 
>  * A patch that uses -print-sysroot instead of $(CROSS)-gcc -v to
>    detect the sysroot location
> 
>    http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=multilib-toolchain-fix&id=ee62af9871801f1d7892d21219c844ca86e034b8

I'll pull those patches tomorrow and see how they compare to what I've
got so far.
 
> The Buildroot pass on checking the external toolchain and copying the
> sysroot directory succeeds. But later on, while configuring the first
> package, I get :
> 
> configure:1719: /usr/local/xtools/arm-2009q1/bin/arm-none-linux-gnueabi-gcc -Os -pipe -Os  -mtune=arm920t -march=armv4t -mabi=aapcs-linux -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 --sysroot /home/thomas/local/buildroot-codesourcery/build_arm/staging_dir/    conftest.c  >&5
> /usr/local/xtools/arm-2009q1/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/../../../../arm-none-linux-gnueabi/bin/ld: crt1.o: No such file: No such file or directory
> collect2: ld returned 1 exit status
> 
> And this is probably because in the multilib case, the value returned
> by -print-sysroot doesn't contain all the sysroot. For example, in my
> case, /usr/local/xtools/arm-2009q1/bin/../arm-none-linux-gnueabi/libc/armv4t
> (the sysroot returned by -print-sysroot with -march=armv4t) does not
> contain the headers of the C library. They are
> in /usr/local/xtools/arm-2009q1/arm-none-linux-gnueabi/libc/usr/include,
> which is the sysroot of the !armv4t case.
> 
> So obviously, our method of simply copying one sysroot directory is not
> sufficient.

I saw that also.  The -print-sysroot does give you the location of the
correct libraries that need to be copied to the target but not all the
stuff that's needed for the build.  Those files are available at the
patch returned by the --with-sysroot config option.  But, the libraries
are not correct for the multilib.  It appears that if you don't pass the
--sysroot $(STAGING_DIR)/ option the -march= option will correctly setup
the library and file locations.  But with the --sysroot ... option it
doesn't.  it appears to be assuming that "you" have correctly setup all
the paths.

Getting the correct files into the $(TARGET_DIR) doesn't seem to be a
problem.  The issue is with $(STAGING_DIR).  Maybe it would be better not
to copy the files and just let the compiler work it out based on the
-march= option?

I'll be back in the office tomorrow to look this over again.  If you have
anything else I'll try it.

Regards,
Hartley
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090821/d2dcfb66/attachment-0001.htm>
