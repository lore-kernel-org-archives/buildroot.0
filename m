From: Michael Rommel <rommel@layer-7.net>
Date: Sun, 29 Sep 2013 22:46:30 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-09-28
In-Reply-To: <C0E57354-0014-486F-B9A0-6E61AFDCB069@layer-7.net>
References: <20130929063005.E848752C1A0@lolut.humanoidz.org>
 <E69A5ED7-8837-4975-B209-CB92E817949A@layer-7.net>
 <20130929135818.GA3285@free.fr>
 <B0C253A3-8F58-48ED-BC96-984A7A9CC940@layer-7.net>
 <C0E57354-0014-486F-B9A0-6E61AFDCB069@layer-7.net>
Message-ID: <9A2A64D9-9952-4F0C-AE30-42F1A0D4F60E@layer-7.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

On Sep 29, 2013, at 17:54 , Michael Rommel <rommel@layer-7.net> wrote:
>>> Although all the interesting -l flags are present, they are before any
>>> of the .o files, so the libs won;t be searched for unresolved symbols.
>>> 
>>> To confirm this, just have a look at how gcc calls the linker, by adding
>>>   -v -Wl,--verbose
>>> 
>>> to the commandline above, and run it manually.
>>> 
>>> If I'm correct (which is still to be proven! ;-) ), we'll just have to
>>> devise how to fix aiccu?
>> 
>> I'll try that and look into reordering the object files and see if this makes a change!
> 
> rommel at pelican:/var/nfs/software/initrds/uclibc/buildroot-autobuild-arm/build/aiccu-20070115/unix-console$ /var/nfs/software/initrds/uclibc/buildroot-autobuild-arm/host/usr/bin/arm-none-linux-gnueabi-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os -g2 -W -Wall -Wshadow -Wpointer-arith -Wcast-align -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wredundant-decls -Wnested-externs -Winline -Wbad-function-cast -fshort-enums -fstrict-aliasing -fno-common -Wpadded -pedantic -D_REENTRANT -D_GNU_SOURCE -D AICCU_CONSOLE -D AICCU_GNUTLS -D_LINUX -D HAS_IFHEAD -D AICCU_TYPE="\"linux\"" -o aiccu main.o ../common/tun.o ../common/aiccu.o ../common/hash_md5.o ../common/hash_sha1.o ../common/common.o ../common/heartbeat.o ../common/tic.o ../common/ayiya.o ../common/aiccu_test.o ../common/resolver.o ../common/aiccu_linux.o --static -lresolv -lpthread -lgnutls -lhogweed -lnettle -lgmp -lz
> 
> with the last four taken from the libnettle recommendation on their web site.

I have created a makefile patch to provide a working compile/link line for --static.

However I am unsure, whether now I have to list the dependencies on all the libraries, that I now had to put into the FLAGS additionally also in the .mk file as dependencies?

The Config.in specifies a "select" on gnutls which in turn selects nettle etc. This all works for shared libs.

I'll send the first version to the list, and if you can recommend a better way, please let me know.

Thanks for your help,

  Michael.

-- 
Michael Rommel, Erlangen, Germany
