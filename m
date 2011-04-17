From: Ettore Campion <ecampion@gmail.com>
Date: Sun, 17 Apr 2011 09:58:09 +0200
Subject: [Buildroot] Problems using buildroot with crosstoll-ng
In-Reply-To: <BANLkTi=RwWz5sJ8sfZ-r4goTboT7A5JQ-w@mail.gmail.com>
References: <BANLkTik6g3rhC1_WfRLkBodNVsOUhjKaJA@mail.gmail.com>
	<BANLkTi=RwWz5sJ8sfZ-r4goTboT7A5JQ-w@mail.gmail.com>
Message-ID: <BANLkTinrXtbKdddjGpJAGNNBehVSz4epQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Charles,

thank you for your answer.
I probably did not explained me correctly.
This
>> CTNG_TUPLE='mipsel-unknown-linux-gnu'
>> CTNG_SYSROOT='/home/tora/Projects/buildroot-2011.02/output/host/usr/mipsel-unknown-linux-gnu/sys-root'
>> Copy external toolchain libraries to target...
is the output I get from buildroot after building crosstoll-ng is build.

The toolchain is actually correctly build, in
[BUILDROOT_DIR]/output/host/bin/
I have all the cross tools (mipsel-unknown-linux-gnu-gcc,
mipsel-unknown-linux-gnu-as, etc)

On Sat, Apr 16, 2011 at 12:55 AM, Charles Krinke
<charles.krinke@gmail.com> wrote:
> At a glance, it looks like there shous be a "gcc" or some other toolchain
> tool at the end of "mipsel-unknown-linux-gnu".
>
> On Apr 15, 2011 1:14 PM, "Ettore Campion" <ecampion@gmail.com> wrote:
>> Hi list,
>>
>> I'm trying to use buildroot with crosstool-ng to create a glibc based
>> cross-toolchain and root filesystem image for a mipsel target.
>> I'm using the default settings everywhere besides the kernel-headers:
>> I'm using here a custom linux tarball based on linux 2.6.22.
>> The toolchain seems to be correctly generated but there are some
>> problems in the copy of the generated libraries files to the target
>> directory.
>>
>> The fist problem I faced was the following:
>> CTNG_TUPLE='mipsel-unknown-linux-gnu'
>>
>> CTNG_SYSROOT='/home/tora/Projects/buildroot-2011.02/output/host/usr/mipsel-unknown-linux-gnu/sys-root'
>> Copy external toolchain libraries to target...
>> /bin/sh: line 6: cd:
>>
>> /home/tora/Projects/buildroot-2011.02/output/host/usr/mipsel-unknown-linux-gnu/sys-root:
>> No such file or directory
>> /bin/sh: line 6: cd:
>>
>> /home/tora/Projects/buildroot-2011.02/output/host/usr/mipsel-unknown-linux-gnu/sys-root:
>> No such file or directory
>> /bin/sh: line 6: cd:
>>
>> /home/tora/Projects/buildroot-2011.02/output/host/usr/mipsel-unknown-linux-gnu/sys-root:
>> No such file or directory
>> ....
>> This kind of error does not stop buildroot that continues anyway till
>> the creation of the root filesystem.. with en empty target/lib.
>> This seemed to me to be related to a wrong path in
>> toolchain/toolchain-crosstool-ng/crosstool-ng.mk line 63.
>> In crosstool-ng menuconfig I specified the sysroot dir like default as
>> "sysroot", not "sys-root".
>> I simply modified correspondently the crosstool-ng.mk file and
>> everything seemed to work beside the fact that flashing the generated
>> rootfs.jjfs2 led me to a "kernel panic - not syncing: no init found"
>> message from the kernel.
>> Taking again a look to crosstool-ng.mk and target/lib I noticed that
>> was missing ld.so.1, manually adding the lib to target/lib I got rid
>> of the missing init message but in the serial console I do not see
>> either any daemons starting nor the login prompt (I got all these
>> things with a rootfs created selecting a buildroot-uclibc toolchain);
>> the last messages I read from the serial console are:
>>
>> VFS: Mounted root (jffs2 filesystem).
>> Freeing unused kernel memory: 472k freed
>>
>> Here target/lib
>> total 3288
>> drwxr-xr-x 2 tora tora 4096 2011-04-14 22:47 .
>> drwxr-xr-x 16 tora tora 4096 2011-04-14 22:19 ..
>> -rwxr-xr-x 1 tora tora 164040 2011-04-14 22:28 ld-2.9.so
>> lrwxrwxrwx 1 tora tora 9 2011-04-14 22:47 ld.so.1 -> ld-2.9.so
>> -rwxr-xr-x 1 tora tora 1562336 2011-04-14 22:20 libc-2.9.so
>> -rwxr-xr-x 1 tora tora 43664 2011-04-14 22:20 libcrypt-2.9.so
>> lrwxrwxrwx 1 tora tora 15 2011-04-14 22:18 libcrypt.so.1 ->
>> libcrypt-2.9.so
>> lrwxrwxrwx 1 tora tora 11 2011-04-14 22:18 libc.so.6 -> libc-2.9.so
>> -rwxr-xr-x 1 tora tora 14648 2011-04-14 22:20 libdl-2.9.so
>> lrwxrwxrwx 1 tora tora 12 2011-04-14 22:18 libdl.so.2 -> libdl-2.9.so
>> -rwxr-xr-x 1 tora tora 224488 2011-04-14 22:20 libgcc_s.so.1
>> -rwxr-xr-x 1 tora tora 905392 2011-04-14 22:20 libm-2.9.so
>> lrwxrwxrwx 1 tora tora 11 2011-04-14 22:18 libm.so.6 -> libm-2.9.so
>> -rwxr-xr-x 1 tora tora 98052 2011-04-14 22:20 libnsl-2.9.so
>> lrwxrwxrwx 1 tora tora 13 2011-04-14 22:18 libnsl.so.1 -> libnsl-2.9.so
>> -rwxr-xr-x 1 tora tora 22456 2011-04-14 22:20 libnss_dns-2.9.so
>> lrwxrwxrwx 1 tora tora 17 2011-04-14 22:18 libnss_dns.so.2 ->
>> libnss_dns-2.9.so
>> -rwxr-xr-x 1 tora tora 53748 2011-04-14 22:20 libnss_files-2.9.so
>> lrwxrwxrwx 1 tora tora 19 2011-04-14 22:18 libnss_files.so.2 ->
>> libnss_files-2.9.so
>> -rwxr-xr-x 1 tora tora 105032 2011-04-14 22:20 libpthread-2.9.so
>> lrwxrwxrwx 1 tora tora 17 2011-04-14 22:18 libpthread.so.0 ->
>> libpthread-2.9.so
>> -rwxr-xr-x 1 tora tora 87824 2011-04-14 22:20 libresolv-2.9.so
>> lrwxrwxrwx 1 tora tora 16 2011-04-14 22:18 libresolv.so.2 ->
>> libresolv-2.9.so
>> -rwxr-xr-x 1 tora tora 37176 2011-04-14 22:20 librt-2.9.so
>> lrwxrwxrwx 1 tora tora 12 2011-04-14 22:18 librt.so.1 -> librt-2.9.so
>> -rwxr-xr-x 1 tora tora 9980 2011-04-14 22:20 libutil-2.9.so
>> lrwxrwxrwx 1 tora tora 14 2011-04-14 22:18 libutil.so.1 -> libutil-2.9.so
>>
>>
>> What is going wrong? Is still missing something? Did I do something
>> conceptually wrong?
>> I do not know how to debug further. Any help would be appreciated.
>>
>> Thank you in advance,
>> Ettore
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
