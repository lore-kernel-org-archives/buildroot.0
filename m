From: Stephan Hoffmann <sho@relinux.de>
Date: Mon, 04 Feb 2013 16:58:50 +0100
Subject: [Buildroot] [PATCH] lttng-tools: Fix compilation
In-Reply-To: <CAHXCMM+d_eEx6u6bm8LvgkVzB0568VPM-p2xZttJJFmxh+CmGg@mail.gmail.com>
References: <1359983522-20044-1-git-send-email-sho@relinux.de>
 <CAHXCMM+d_eEx6u6bm8LvgkVzB0568VPM-p2xZttJJFmxh+CmGg@mail.gmail.com>
Message-ID: <510FDABA.8090101@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Samuel,


Am 04.02.2013 15:49, schrieb Samuel Martin:
> Hi Stephan,
>
> 2013/2/4 Stephan Hoffmann <sho@relinux.de>:
>> Compiling lttng-tools fails when lttng-libust is enabled bacause of a missing
> s/bacause/because/
>
>> -lurcu-bp in the linker command line, at least for linaro 2012.12 toolchain.
> hum... weird!
>
> lttng-tools handles that in its configure file, checking for
> ustctl_set_filter availability in liblttng-ust-ctl; see:
> http://git.lttng.org/?p=lttng-tools.git;a=blob;f=configure.ac;h=91e76f06a98700d2a9deb36c29a650176e62c4ab;hb=HEAD#l137
>
> Are you sure lttng-libust was correctly built before?
> Could you give more details about the linking error?
the error message I always got is:
> make[4]: Betrete Verzeichnis
> '/opt/scratch/buildroot/output/build/lttng-tools-2.1.1/tests/tools/streaming'
>   CCLD   gen-ust-events
> /opt/scratch/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld:
> tp.o: undefined reference to symbol 'rcu_dereference_sym'
> /opt/scratch/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld:
> note: 'rcu_dereference_sym' is defined in DSO
> /opt/scratch/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/liburcu-bp.so.1
> so try adding it to the linker command line
> /opt/scratch/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/liburcu-bp.so.1:
> could not read symbols: Invalid operation
> collect2: error: ld returned 1 exit status
> make[4]: *** [gen-ust-events] Fehler 1
> make[4]: Verlasse Verzeichnis
> '/opt/scratch/buildroot/output/build/lttng-tools-2.1.1/tests/tools/streaming'
But even worse: now I cannot reproduce it. Maybe you're right and there
was something wrong with libust. I cannot verify that I really called
"make clean" while hunting for this. So for now let's assume that I
forgot it.

Btw: Originally, I wanted to use the internal toolchain, but the default
one (4.6) cannot compile libust (see autobuild logs). After switching to
gcc 4.7 it compiles, but "lttng list -k" does not find any events.

Kind regards

Stephan
>
> It may also be something to report upstream, lttng guys are quite responsive.
>
>> Signed-off-by: Stephan Hoffmann <sho@relinux.de>
>> ---
>>  package/lttng-tools/lttng-tools.mk |    2 ++
>>  1 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
>> index 5be3abb..288e351 100644
>> --- a/package/lttng-tools/lttng-tools.mk
>> +++ b/package/lttng-tools/lttng-tools.mk
>> @@ -21,6 +21,8 @@ LTTNG_AUTORECONF = YES
>>  ifeq ($(BR2_PACKAGE_LTTNG_LIBUST),y)
>>  LTTNG_TOOLS_CONF_OPT += --enable-lttng-ust
>>  LTTNG_TOOLS_DEPENDENCIES += lttng-libust
>> +# Build fails without this, at least with Linuaro 2012.12 toolchain
>> +LTTNG_TOOLS_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lurcu-bp"
>>  else
>>  LTTNG_TOOLS_CONF_OPT += --disable-lttng-ust
>>  endif
>> --
>> 1.7.0.4
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> Regards,
>


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
