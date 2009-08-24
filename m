From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Mon, 24 Aug 2009 12:53:09 -0400
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <20090823081702.445b1b5a@surf>
References: <BD79186B4FD85F4B8E60E381CAEE190901BEA43C@mi8nycmail19.Mi8.com><20090819214237.534c433f@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA476@mi8nycmail19.Mi8.com><20090819233037.1d8e5a5d@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA4AD@mi8nycmail19.Mi8.com><20090820143514.7c5e56a2@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA58B@mi8nycmail19.Mi8.com><BD79186B4FD85F4B8E60E381CAEE190901BEA5DB@mi8nycmail19.Mi8.com><BD79186B4FD85F4B8E60E381CAEE190901BEA675@mi8nycmail19.Mi8.com><20090821114447.188fc839@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA738@mi8nycmail19.Mi8.com><20090822011906.2dd045fc@surf><BD79186B4FD85F4B8E60E381CAEE19091E7909@mi8nycmail19.Mi8.com><20090822105505.27ace9b6@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA86D@mi8nycmail19.Mi8.com>
	<20090823081702.445b1b5a@surf>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901C550E7@mi8nycmail19.Mi8.com>
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
>
> The two commits are :
>  http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=multilib-toolchain-fix&id=65ee9b3945a665f1279fa940b30818f4924acd31
>  http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=multilib-toolchain-fix&id=2907415d82b7d306ca3f1f1ead0bbb0c7f1505c3

Thomas,

I stripped my packages down to the following:

BR2_PACKAGE_BUSYBOX=y
BR2_BUSYBOX_VERSION_1_13_X=y
BR2_BUSYBOX_VERSION="1.13.4"
BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
BR2_PACKAGE_BUSYBOX_CONFIG="local/ep9307/busybox-1.13.4.config"
BR2_HOST_FAKEROOT=y
BR2_PACKAGE_LZO=y
BR2_PACKAGE_ZLIB=y

Everything seems to build fine but the system still crashes when
trying to run /sbin/init.  I have CONFIG_DEBUG_USER=y in my kernel
and passed "user_debug=31" in my kernel command line.  With that
I get:

rtc-isl1208 0-006f: setting system clock to 2009-08-24 09:30:58 UTC (1251106258)
RAMDISK: gzip image found at block 0
VFS: Mounted root (ext2 filesystem) on device 1:0.
Freeing init memory: 120K
run_init_process: /sbin/init
init (1): undefined instruction: pc=400160cc
Code: 02800004 0afffff9 e2621000 e0022001 (e16f2f12)
Kernel panic - not syncing: Attempted to kill init!
[<c002ca90>] (unwind_backtrace+0x0/0xdc) from [<c02943dc>] (panic+0x48/0x120)
[<c02943dc>] (panic+0x48/0x120) from [<c0048430>] (do_exit+0x64/0x608)
[<c0048430>] (do_exit+0x64/0x608) from [<c0048a84>] (do_group_exit+0xb0/0xe4)
[<c0048a84>] (do_group_exit+0xb0/0xe4) from [<c0052cc4>] (get_signal_to_deliver+0x384/0x3dc)
[<c0052cc4>] (get_signal_to_deliver+0x384/0x3dc) from [<c00295f8>] (do_signal+0x50/0x528)
[<c00295f8>] (do_signal+0x50/0x528) from [<c0026eac>] (work_pending+0x1c/0x20)

I'm not sure what the undefined instruction is but my guess is it's
an armv5t instruction which is the default library configuration for
the CodeSourcery toolchain.  Something is still not right.

It appears the libraries that get copied to rootfs are stripped so I
can't verify what they actually are.

An ideas?

Regards,
Hartley
