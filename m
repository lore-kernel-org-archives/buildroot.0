From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Sat, 22 Aug 2009 18:53:34 -0400
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <20090822105505.27ace9b6@surf>
References: <BD79186B4FD85F4B8E60E381CAEE190901BEA43C@mi8nycmail19.Mi8.com><20090819214237.534c433f@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA476@mi8nycmail19.Mi8.com><20090819233037.1d8e5a5d@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA4AD@mi8nycmail19.Mi8.com><20090820143514.7c5e56a2@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA58B@mi8nycmail19.Mi8.com><BD79186B4FD85F4B8E60E381CAEE190901BEA5DB@mi8nycmail19.Mi8.com><BD79186B4FD85F4B8E60E381CAEE190901BEA675@mi8nycmail19.Mi8.com><20090821114447.188fc839@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA738@mi8nycmail19.Mi8.com><20090822011906.2dd045fc@surf><BD79186B4FD85F4B8E60E381CAEE19091E7909@mi8nycmail19.Mi8.com>
	<20090822105505.27ace9b6@surf>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901BEA86D@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday, August 22, 2009 1:55 AM, Thomas Petazzoni wrote:
>> I'll pull those patches tomorrow and see how they compare to what I've
>> got so far.
>
> If you've already pulled something, please discard. I've rebased this
> branch with new fixes (see below).

Got a late start so I haven't pulled anything.

>> I saw that also.  The -print-sysroot does give you the location of the
>> correct libraries that need to be copied to the target but not all the
>> stuff that's needed for the build.  Those files are available at the
>> patch returned by the --with-sysroot config option.  But, the
>> libraries are not correct for the multilib.  It appears that if you
>> don't pass the --sysroot $(STAGING_DIR)/ option the -march= option
>> will correctly setup the library and file locations.  But with the
>> --sysroot ... option it doesn't.  it appears to be assuming that
>> "you" have correctly setup all the paths.
>> 
>> Getting the correct files into the $(TARGET_DIR) doesn't seem to be a
>> problem.  The issue is with $(STAGING_DIR).  Maybe it would be better
>> not to copy the files and just let the compiler work it out based on
>> the -march= option?
>
> Unfortunately, this is the approach we tried at the beginning of
> external toolchain support, but that didn't work for various reasons
> that I can't remember.

OK. Scratch that idea..

> I've updated the fix on external toolchain support, with two
> improvements:
>
> 1. We now don't pass -march= when doing CROSS-gcc -print-sysroot. The
>    effect with the Codesourcery toolchain is that it returns the
>    default, main sysroot, that includes everything necessary regardless
>    of the selected architecture (armv4t, thumb2, etc.).
>
> 2. If -print-sysroot doesn't return anything, we fallback to the old
>    way.
>
> With this fix I'm able to build a simple system with ncurses and sed
> (just some random packages), both with the Codesoucery toolchain and a
> Crosstool-NG toolchain.
>
> Would you mind testing this new fix, and see if it works for you ?

No link?  Where can I get the fix to test?

Thanks,
Hartley
