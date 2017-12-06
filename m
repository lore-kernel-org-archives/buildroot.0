From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Dec 2017 23:38:50 +0100
Subject: [Buildroot] [PATCH v3] package/i2c-tools: bump to version 4.0
In-Reply-To: <1512569963-7256-1-git-send-email-angelo@amarulasolutions.com>
References: <1512569963-7256-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20171206233850.2a0dae63@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  6 Dec 2017 15:19:23 +0100, Angelo Compagnucci wrote:
> This patch bumps i2c-tools to version 4.0 and adds a couple of
> new commands named i2ctransfer and eeprog.
> It adds also an upstream commit not included in the release
> that fixing a static compilation issue.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

I have a minor nit below, but most importantly, there is a parallel
build issue with this update. I built i2c-tools about 10 times, and it
failed 3 times, with errors like this:

/home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc -shared  -Wl,--version-script=lib/libi2c.map -Wl,-soname,libi2c.so.0 -o lib/libi2c.so.0.1.0 lib/smbus.o -lc
/home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc  -o tools/i2cdetect tools/i2cdetect.o tools/i2cbusses.o -Llib -li2c
lib/libi2c.so: file not recognized: File truncated
collect2: error: ld returned 1 exit status
make[2]: *** [tools/Module.mk:28: tools/i2cdetect] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [package/pkg-generic.mk:250: /home/thomas/projets/buildroot/output/build/i2c-tools-4.0/.stamp_built] Error 2
make: *** [Makefile:79: _all] Error 2

/home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc  -o tools/i2cdetect tools/i2cdetect.o tools/i2cbusses.o -Llib -li2c
/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.4/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -li2c
collect2: error: ld returned 1 exit status
make[2]: *** [tools/Module.mk:28: tools/i2cdetect] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [package/pkg-generic.mk:250: /home/thomas/projets/buildroot/output/build/i2c-tools-4.0/.stamp_built] Error 2
make: *** [Makefile:79: _all] Error 2

So it seems like the dependency chain in the i2c-tools Makefile is not correct.


> +Subject: [PATCH 1/2] Makefile: Add flag to disable dynamic library

Subject should be [PATCH] instead of [PATCH 1/2]. Note that I had fixed
this locally, because it's a very minor nit. But I refrained from
applying due to the parallel build problem.

Could you have a look at the parallel build problem ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
