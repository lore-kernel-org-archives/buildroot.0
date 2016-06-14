From: Erico Nunes <nunes.erico@gmail.com>
Date: Tue, 14 Jun 2016 16:58:36 -0300
Subject: [Buildroot] [PATCH v2 1/2] efivar: new package
In-Reply-To: <20160613092527.708dab22@free-electrons.com>
References: <1461201836-6558-1-git-send-email-nunes.erico@gmail.com>
 <20160613092527.708dab22@free-electrons.com>
Message-ID: <CAK4VdL1mm3oNwOvY=k+8R145WBD3R427cDMCRKD5PT_wjWJ=JA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, Thomas.

On Sun, Jun 12, 2016 at 11:03 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>> diff --git a/package/efivar/0002-Make.rules-fix-build-with-make-3.81.patch b/package/efivar/0002-Make.rules-fix-build-with-make-3.81.patch
>> new file mode 100644
>> index 0000000..e4e5a2c
>> --- /dev/null
>> +++ b/package/efivar/0002-Make.rules-fix-build-with-make-3.81.patch
>> @@ -0,0 +1,45 @@
>> +From 00376f4dec71d4abb591ba07bc8164ba29e5955e Mon Sep 17 00:00:00 2001
>> +From: Erico Nunes <nunes.erico@gmail.com>
>> +Date: Tue, 22 Mar 2016 21:43:44 -0300
>> +Subject: [PATCH] Make.rules: fix build with make <= 3.81
>> +
>> +Building with host make 3.81 resulted in an issue where src/efivar.pc
>> +was never generated.
>> +Even by running 'make efivar.pc' inside the src directory, make always
>> +returned that there was nothing to do.
>> +This was not observed when using make 3.82 or 4.x.
>> +It is apparently caused by the assignment operators in the multi-line
>> +defines in Make.rules, which do not seem to be supported by make 3.81.
>> +By omitting the assignment operators, the rule works with both versions
>> +of make.
>> +
>> +Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
>
> Please make sure to send this patch upstream.

The patch had been submitted to efivar upstream since this package was
submitted to Buildroot, but had not been applied yet at the time. It
has been applied to upstream efivar since then, however we still don't
have a 0.24 release which includes it. There's a pending github Issue
to tag a 0.24 release and when it happens, we will be able to drop the
two patches included here.

> This package breaks the build on hosts where the host gcc is old:
>
> /usr/bin/gcc -O2 -I/home/peko/autobuild/instance-2/output/host/usr/include -std=c99 -I/home/peko/autobuild/instance-2/output/build/efivar-0.23/src/include/efivar/  -specs=/home/peko/autobuild/instance-2/output/build/efivar-0.23/gcc.specs  -L.  -L/home/peko/autobuild/instance-2/output/host/lib -L/home/peko/autobuild/instance-2/output/host/usr/lib -Wl,-rpath,/home/peko/autobuild/instance-2/output/host/usr/lib    -I/home/peko/autobuild/instance-2/output/host/usr/include -DEFIVAR_BUILD_ENVIRONMENT -o makeguids makeguids.c guid.c -ldl
> cc1: error: unrecognized command line option "-std=gnu11"
> cc1: error: unrecognized command line option "-Wmaybe-uninitialized"
> cc1: error: unrecognized command line option "-flto"
> cc1: error: unrecognized command line option "-std=gnu11"
> cc1: error: unrecognized command line option "-Wmaybe-uninitialized"
> cc1: error: unrecognized command line option "-flto"
>
> This happens when you build the makeguids tool for the host: you're
> passing cflags that are not supported by old versions of gcc.
>
> Could you have a look at fixing this? Most likely, you don't need all
> those cflags just to build makeguids.

The parameters are added internally by efivar.
I'm not sure there is an easy way to solve this though, at a first
look it seems that the listed parameters are used both by host and
target builds. So maybe one cleaner way to solve this would be to
restrict the host gcc version as is done for some packages (kodi,
nodejs).
I'll have a closer look though to confirm whether the arguments are
really needed anyway and submit a patch.

Erico
