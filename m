From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 07 Mar 2014 01:44:15 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140303134805.2eb084c4@skate>
References: <20140303090219.65a08cc7@skate>	<495852511.10469178.1393846305700.JavaMail.root@openwide.fr>
 <20140303134805.2eb084c4@skate>
Message-ID: <5319165F.2080401@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 03/03/2014 13:48, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
>
> On Mon, 3 Mar 2014 12:31:45 +0100 (CET), Romain Naour wrote:
>
>> |
>> | > microblaze |                     gpm-1.20.7 | NOK |
>> | > http://autobuild.buildroot.net/results/e99afadca6de92aad8563006fc7219aa32d77a88/
>> |
>> | Strange:
>> |
>> | /home/test/test/2/output/host/usr/bin/microblaze-buildroot-linux-gnu-gcc
>> | libgpm.so.2 \
>> | 	 -L/home/test/test/2/output/build/gpm-1.20.7/src  -o
>> | 	 lib/libgpm.so.2.1.0 lib/liblow.lo lib/libhigh.lo lib/libxtra.lo
>> | 	 lib/report-lib.lo tools.lo  -lc
>> | microblaze-buildroot-linux-gnu-gcc: error: libgpm.so.2: No such file
>> | or directory
>> |
>> | Spenser ?
>>
>> It's because __ELF__ is not defined in microblaze toolchain :
>> checking whether system is ELF... no
>>
>> If elf format is not enabled then gpm is build statically.
>> You may have noticed that qpm static build is disabled in gpm.mk because it's broken.
>>
>> I can try to fix gpm's static build.
> Hum, but that's weird because Microblaze definitely uses the ELF binary
> format, supports shared library and has a MMU (at least for the
> Microblaze CPU variants that we support).
>
> So it should be working in shared library mode, I believe.
>
> Thomas

It seems that __ELF__ has been removed from gcc
http://gcc.gnu.org/gcc-4.9/changes.html
"Support for a number of older systems and recently unmaintained or 
untested target ports of GCC has been declared obsolete in GCC 4.9"

(version 4.9.0)
./microblaze-buildroot-linux-gnu-cpp -dM /dev/null | grep __ELF__

(version 4.7.2)
(code sourcery toolchain x86)
./i686-pc-linux-gnu-cpp -dM /dev/null | grep __ELF__
#define __ELF__ 1

(version 4.8.2)
(buildroot internal toolchain x86)
./i686-buildroot-linux-gnu-cpp -dM /dev/null | grep __ELF__
#define __ELF__ 1

I'll send a patch to remove this test since buildroot does not have 
support for non ELF system.

Best regards,
Romain
