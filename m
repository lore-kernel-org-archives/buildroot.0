From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Wed, 19 May 2010 15:46:54 +0200
Subject: [Buildroot] [PATCH] atngw100_defconfig: update to fix build
	failure
In-Reply-To: <20100519130328.697596b4@surf>
References: <1274057382-27365-1-git-send-email-bjorn.forsman@gmail.com>
	<20100519130328.697596b4@surf>
Message-ID: <AANLkTinn1jKrtUYwPuC4S1kSAB4TMDoJaxMz4xvH9wSy@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19 May 2010 13:03, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Mon, 17 May 2010 02:49:42 +0200
> Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:
>
>> ? * The AVR32 toolchain fails to build with the new uClibc version
>> ? ? 0.9.31.x. Use the older uClibc 0.9.30.x branch instead.
>
> Is this going to be fixed upstream ?
>
>> ? * Disable linux-fusion as it fails to build
>> ? ? (why was this selected anyway, when DirectFB was not selected?).
>> ? * U-Boot 2010.03 is broken for AVR32. The build fails with:
>> ? ? ? zlib.c:31:27: error: asm/unaligned.h: No such file or directory
>> ? ? Select the older U-Boot 2009.08 version that builds instead.
>
> Same thing here ?

I don't know if upstream will fix it. On the U-Boot issue, all I know is
that there was a similar problem with mips in december [2].

>> ? * Disable rsync as it fails to build.
>> ? * host-mtd fails when BR2_JLEVEL=3 and not for BR_JLEVEL=1. Use 1.
>
> In that case, changing BR2_JLEVEL is a big hammer because it disables
> parallel build for *all* packages and not just for host-mtd. Changing
> $(MAKE) to $(MAKE1) in packages/mtd/mtd.mk would have the same effect,
> but only for mtd.
>
> Which problem are you seeing exactly.

I didn't know about $(MAKE1). Tanks for the tip.
The host-mtd error:

----
$ make distclean && make atngw100_defconfig
$ make
[snip]
gcc -Wl,-rpath -Wl,/home/bjornfor/raid/raid_stuff/forks/buildroot/output/host/usr/lib
-I/home/bjornfor/raid/raid_stuff/forks/buildroot/output/host/include
-I/home/bjornfor/raid/raid_stuff/forks/buildroot/output/host/usr/include
-Wall -Wextra -Wwrite-strings -Wno-sign-compare
-L/home/bjornfor/raid/raid_stuff/forks/buildroot/output/host/lib
-L/home/bjornfor/raid/raid_stuff/forks/buildroot/output/host/usr/lib
-g -o /home/bjornfor/raid/raid_stuff/forks/buildroot/output/build/host-mtd-1.3.1/flash_erase
/home/bjornfor/raid/raid_stuff/forks/buildroot/output/build/host-mtd-1.3.1/flash_erase.o
d=old-utils_all; \
	t=`echo $d | sed s:.*_::` d=`echo $d | sed s:_.*::`; \
	/usr/bin/make BUILDDIR=/home/bjornfor/raid/raid_stuff/forks/buildroot/output/build/host-mtd-1.3.1/ubi-utils/$d
-C $d $t
/usr/bin/ld: cannot find -lubi
collect2: ld returned 1 exit status
make[2]: *** [/home/bjornfor/raid/raid_stuff/forks/buildroot/output/build/host-mtd-1.3.1/mkfs.ubifs/mkfs.ubifs]
Error 1
rm /home/bjornfor/raid/raid_stuff/forks/buildroot/output/build/host-mtd-1.3.1/mkfs.ubifs/mkfs.ubifs.o
make[2]: Leaving directory
`/media/raid/bjornfor/raid_stuff/forks/buildroot/output/build/host-mtd-1.3.1/mkfs.ubifs'
make[1]: *** [subdirs_mkfs.ubifs_all] Error 2
make[1]: *** Waiting for unfinished jobs....

[snip]

make[3]: Leaving directory
`/media/raid/bjornfor/raid_stuff/forks/buildroot/output/build/host-mtd-1.3.1/ubi-utils/old-utils'
ar crv /home/bjornfor/raid/raid_stuff/forks/buildroot/output/build/host-mtd-1.3.1/ubi-utils/libubi.a
/home/bjornfor/raid/raid_stuff/forks/buildroot/output/build/host-mtd-1.3.1/ubi-utils/libubi.o
ar crv /home/bjornfor/raid/raid_stuff/forks/buildroot/output/build/host-mtd-1.3.1/ubi-utils/libiniparser.a
/home/bjornfor/raid/raid_stuff/forks/buildroot/output/build/host-mtd-1.3.1/ubi-utils/libiniparser.o
/home/bjornfor/raid/raid_stuff/forks/buildroot/output/build/host-mtd-1.3.1/ubi-utils/dictionary.o
a - /home/bjornfor/raid/raid_stuff/forks/buildroot/output/build/host-mtd-1.3.1/ubi-utils/libubi.o
ranlib /home/bjornfor/raid/raid_stuff/forks/buildroot/output/build/host-mtd-1.3.1/ubi-utils/libubi.a

[snip]
----

What happens here is that libubi is not found and the build fails. But while
waiting for the rest of the jobs to finish, libubi *is* built. On the next
'make', host-mtd builds because now libubi is there. Is it a missing
make prerequisite somewhere?

>> Build tested with 'make distclean && make atngw100_defconfig && make'
>> on an Ubuntu 10.04 x86_64 host.
>
> I don't have the hardware to test and some of the things above could be
> improved, but it's definitely better to have something that builds and
> runs but isn't perfect than something that doesn't build at all.

Agree, this is a 'quick fix'. But I hate it when default configurations does
not build :-)

> So:
>
> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks.

Best regards,
Bj?rn Forsman

[1] http://www.atmel.com/dyn/products/product_card.asp?part_id=3903
[2] http://www.mail-archive.com/u-boot at lists.denx.de/msg26676.html
