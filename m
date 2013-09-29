From: Michael Rommel <rommel@layer-7.net>
Date: Sun, 29 Sep 2013 17:54:57 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-09-28
In-Reply-To: <B0C253A3-8F58-48ED-BC96-984A7A9CC940@layer-7.net>
References: <20130929063005.E848752C1A0@lolut.humanoidz.org>
 <E69A5ED7-8837-4975-B209-CB92E817949A@layer-7.net>
 <20130929135818.GA3285@free.fr>
 <B0C253A3-8F58-48ED-BC96-984A7A9CC940@layer-7.net>
Message-ID: <C0E57354-0014-486F-B9A0-6E61AFDCB069@layer-7.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


-- 
Michael Rommel, Erlangen, Germany

On Sep 29, 2013, at 16:02 , Michael Rommel <rommel@layer-7.net> wrote:

> Hi Yann,
> 
> On Sep 29, 2013, at 15:58 , Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> 
>> 
>>   depends on !BR2_PREFER_STATIC_LIB
>> 
> 
> Great info - thanks!
> 
>> /home/test/test/1/output/host/usr/bin/arm-none-linux-gnueabi-gcc
>>   [-- SNIP -D flags --]
>>   -D_LINUX -D HAS_IFHEAD -D AICCU_TYPE="\"linux\""  --static -lgnutls
>>   -lpthread -lresolv -o aiccu main.o ../common/tun.o ../common/aiccu.o
>>   ../common/hash_md5.o ../common/hash_sha1.o ../common/common.o
>>   ../common/heartbeat.o ../common/tic.o ../common/ayiya.o
>>   ../common/aiccu_test.o ../common/resolver.o ../common/aiccu_linux.o
>> 
>> From ld's man page:
>>   The linker will search an archive only once, at the location where
>>   it is specified on the command line. If the archive defines a symbol
>>   which was undefined in some object which appeared before the archive
>>   on the command line, the linker will include the appropriate file(s)
>>   from the archive. However, an undefined symbol in an object appearing
>>   later on the command line will not cause the linker to search the
>>   archive again.
>> 
>> Although all the interesting -l flags are present, they are before any
>> of the .o files, so the libs won;t be searched for unresolved symbols.
>> 
>> To confirm this, just have a look at how gcc calls the linker, by adding
>>   -v -Wl,--verbose
>> 
>> to the commandline above, and run it manually.
>> 
>> If I'm correct (which is still to be proven! ;-) ), we'll just have to
>> devise how to fix aiccu?
> 
> I'll try that and look into reordering the object files and see if this makes a change!

Partial success, I would say :-)

This works:

rommel at pelican:/var/nfs/software/initrds/uclibc/buildroot-autobuild-arm/build/aiccu-20070115/unix-console$ /var/nfs/software/initrds/uclibc/buildroot-autobuild-arm/host/usr/bin/arm-none-linux-gnueabi-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os -g2 -W -Wall -Wshadow -Wpointer-arith -Wcast-align -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wredundant-decls -Wnested-externs -Winline -Wbad-function-cast -fshort-enums -fstrict-aliasing -fno-common -Wpadded -pedantic -D_REENTRANT -D_GNU_SOURCE -D AICCU_CONSOLE -D AICCU_GNUTLS -D_LINUX -D HAS_IFHEAD -D AICCU_TYPE="\"linux\"" -o aiccu main.o ../common/tun.o ../common/aiccu.o ../common/hash_md5.o ../common/hash_sha1.o ../common/common.o ../common/heartbeat.o ../common/tic.o ../common/ayiya.o ../common/aiccu_test.o ../common/resolver.o ../common/aiccu_linux.o --static -lresolv -lpthread -lgnutls -lhogweed -lnettle -lgmp -lz

with the last four taken from the libnettle recommendation on their web site.

So now all that needs to be done is to get it somehow in aiccu's Makefile, since the additional dependencies that come from gnutls and nettle are not reflected at all in it.

Thanks for the hints!!

  Michael.


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130929/e83381eb/attachment.html>
