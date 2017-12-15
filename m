From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Fri, 15 Dec 2017 10:02:27 +0100
Subject: [Buildroot] [PATCH v5] package/i2c-tools: bump to version 4.0
In-Reply-To: <20171215092151.4a43e74c@windsurf.png.is.keysight.com>
References: <1513257825-9289-1-git-send-email-angelo@amarulasolutions.com>
 <20171215092151.4a43e74c@windsurf.png.is.keysight.com>
Message-ID: <CA+_SqVYuSiM3_ZixwaMaowY1yaa525+Fj_Hpqup_Qk58ZpMMkQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On Fri, Dec 15, 2017 at 9:21 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Thu, 14 Dec 2017 14:23:45 +0100, Angelo Compagnucci wrote:
>> This patch bumps i2c-tools to version 4.0 and adds a couple of
>> new commands named i2ctransfer and eeprog.
>> It adds also several upstream commits not included in the release
>> that fix static compilation issues and parallel build issues.
>>
>> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
>
> It still doesn't work here:
>
> /home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -Iinclude -c eeprog/eeprog.c -o eeprog/eeprog.o
> /home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -Iinclude -c eeprog/24cXX.c -o eeprog/24cXX.o
> /home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc -shared  -Wl,--version-script=lib/libi2c.map -Wl,-soname,libi2c.so.0 -o lib/libi2c.so.0.1.0 lib/smbus.o -lc
> /home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc  -o tools/i2cdetect tools/i2cdetect.o tools/i2cbusses.o lib/libi2c.so -Llib -li2c
> /home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc  -o tools/i2cset tools/i2cset.o tools/i2cbusses.o tools/util.o lib/libi2c.so -Llib -li2c
> /home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc  -o tools/i2cget tools/i2cget.o tools/i2cbusses.o tools/util.o lib/libi2c.so -Llib -li2c
> lib/libi2c.so: file not recognized: File truncated
> collect2: error: ld returned 1 exit status
> make[2]: *** [tools/Module.mk:28: tools/i2cdetect] Error 1
> make[2]: *** Waiting for unfinished jobs....
> lib/libi2c.so: file not recognized: File truncated
> collect2: error: ld returned 1 exit status
> make[2]: *** [tools/Module.mk:34: tools/i2cset] Error 1
> make[1]: *** [package/pkg-generic.mk:250: /home/thomas/projets/buildroot/output/build/i2c-tools-4.0/.stamp_built] Error 2
> make: *** [Makefile:79: _all] Error 2
> ^Cmake: *** [Makefile:79: _all] Interrupt
>
> After 5 or 6 rebuilds of the i2c-tools package this happened.
>
> Without your patch,

You mean before bumping to version 4?

> building the i2c-tools package survives this loop
> that builds it 100 times:
>
> for i in $(seq 1 100) ; do echo "=== $i ===" ; rm -rf output/build/i2c-tools* ; make i2c-tools || break ; done
>
> With your patch applied, I've never been able to reach more than 5 or 6
> iterations of the loop.
>
> Could you rework this, and test 100 iterations of building the i2c-tools package ?

I built it now 3 times with my 8core machine with various -j settings,
unfortunately I cannot reproduce:

=== 100 ===
umask 0022 && make -C /home/angelo/DEV/BUILDROOT/buildroot
O=/home/angelo/DEV/BUILDROOT/br_qemu_arm/. i2c-tools

ls build/i2c-tools-4.0/
CHANGES  COPYING.LGPL  eeprom    include  Makefile  README  tools
COPYING  eeprog        eepromer  lib      py-smbus  stub    version.h

Could you give me more details?

Thanks!


>
> Of course, you need to have multiple cores on your machine to reproduce
> the issue, otherwise the package is built with make -j1, and you
> probably don't see the problem;
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
