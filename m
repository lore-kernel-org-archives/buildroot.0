From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Sep 2020 21:47:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/supertux: needs -fPIC
In-Reply-To: <20200913164937.2684977-1-fontaine.fabrice@gmail.com>
References: <20200913164937.2684977-1-fontaine.fabrice@gmail.com>
Message-ID: <20200913214753.5466d505@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 13 Sep 2020 18:49:37 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add -fPIC to CFLAGS (and CXXFLAGS for consistency) to avoid the
> following build failure:
> 
> /home/peko/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/8.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: CMakeFiles/sq_static.dir/sq.c.o: relocation R_X86_64_32 against `.rodata.str1.8' can not be used when making a PIE object; recompile with -fPIC
> /home/peko/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/8.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: final link failed: nonrepresentable section on output
> collect2: error: ld returned 1 exit status
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/46e8f5e622ce450a89bc6d70f4bfd38182557901
>  - http://autobuild.buildroot.org/results/a43720492d817e4555d728546da9114e3ccba952

I am not totally sure that "blindly" appending -fPIC here is the right
solution. This is a RELRO_FULL configuration, so it selects
BR2_PIC_PIE, and therefore the toolchain wrapper passes -fPIE when
building everything.

My guess is that instead the issue is that it is building a static
executable here, as can be guessed from:

""
Scanning dependencies of target sq_static
[...]
collect2: error: ld returned 1 exit status
make[6]: *** [sq/CMakeFiles/sq_static.dir/build.make:86: sq/sq_static] Error 1
""

Could you investigate this a bit more? My feeling is that supertux is
building static libraries/executable, while we have
-DBUILD_SHARED_LIBS=ON.

Could you have a look ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
