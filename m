From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 12 Jun 2020 10:35:14 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: dri: link statically
 libmegadriver_stub after libdricommon
In-Reply-To: <20200610225923.31db51cf@windsurf.home>
References: <20200609152007.2920080-1-romain.naour@gmail.com>
 <20200610225923.31db51cf@windsurf.home>
Message-ID: <3353fb59-2904-59dd-82ae-400c442dd9bd@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 10/06/2020 ? 22:59, Thomas Petazzoni a ?crit?:
> On Tue,  9 Jun 2020 17:20:07 +0200
> Romain Naour <romain.naour@gmail.com> wrote:
> 
>> Meson build system enable by default -Wl,--as-needed in the linker command line [1] and
>> due to this the megadriver_stub build can fail with some toolchain:
>>
>> /home/buildroot/autobuild/run/instance-1/output-1/host/bin/arm-none-linux-gnueabi-g++
>>   -o src/mesa/drivers/dri/libmesa_dri_drivers.so
>>   -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -shared -fPIC -Wl,--start-group
>>   -Wl,-soname,libmesa_dri_drivers.so -Wl,--whole-archive
>>   src/mesa/drivers/dri/radeon/libr100.a src/mesa/drivers/dri/nouveau/libnouveau_vieux.a
>>   -Wl,--no-whole-archive
>>   src/mesa/drivers/dri/common/libmegadriver_stub.a
>>   src/mesa/drivers/dri/common/libdricommon.a
>>   src/mapi/shared-glapi/libglapi.so.0.0.0
>>   src/mesa/libmesa_classic.a src/mesa/libmesa_common.a
>>   src/compiler/glsl/libglsl.a src/compiler/glsl/glcpp/libglcpp.a
>>   src/util/libmesa_util.a src/util/format/libmesa_format.a
>>   src/compiler/nir/libnir.a src/compiler/libcompiler.a
>>   src/util/libxmlconfig.a
>>   [...]
>> src/mesa/drivers/dri/common/libmegadriver_stub.a(megadriver_stub.c.o): In function `megadriver_stub_init':
>> megadriver_stub.c:(.text.startup+0x20): undefined reference to `dladdr'
>> megadriver_stub.c:(.text.startup+0xbc): undefined reference to `dlsym'
>> collect2: error: ld returned 1 exit status
>>
>> This is because the static librairies needs to be correcly sorted by dependency.
>> libmegadriver_stub include dri_util.h that internally include dri_interface.h needed for
>> dlsym and dladdr definition.
>>
>> [1] https://mesonbuild.com/Builtin-options.html
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/eec39a4fbfbfaa58980fab36f2fd902a16eecf0f/build-end.log
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> ---
>>  ...lly-libmegadriver_stub-after-libdric.patch | 58 +++++++++++++++++++
>>  1 file changed, 58 insertions(+)
>>  create mode 100644 package/mesa3d/0009-dri-link-statically-libmegadriver_stub-after-libdric.patch
>>
>> diff --git a/package/mesa3d/0009-dri-link-statically-libmegadriver_stub-after-libdric.patch b/package/mesa3d/0009-dri-link-statically-libmegadriver_stub-after-libdric.patch
>> new file mode 100644
>> index 0000000000..47909ed5e5
>> --- /dev/null
>> +++ b/package/mesa3d/0009-dri-link-statically-libmegadriver_stub-after-libdric.patch
>> @@ -0,0 +1,58 @@
>> +From b4f68629937eac22f122b9b069e4e5acbcc51a75 Mon Sep 17 00:00:00 2001
>> +From: Romain Naour <romain.naour@gmail.com>
>> +Date: Tue, 9 Jun 2020 16:49:32 +0200
>> +Subject: [PATCH] dri: link statically libmegadriver_stub after libdricommon
>> +
>> +Meson build system enable by default -Wl,--as-needed in the linker command line [1] and
>> +due to this the megadriver_stub build can fail with some toolchain:
>> +
>> +/home/buildroot/autobuild/run/instance-1/output-1/host/bin/arm-none-linux-gnueabi-g++
>> +  -o src/mesa/drivers/dri/libmesa_dri_drivers.so
>> +  -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -shared -fPIC -Wl,--start-group
>> +  -Wl,-soname,libmesa_dri_drivers.so -Wl,--whole-archive
>> +  src/mesa/drivers/dri/radeon/libr100.a src/mesa/drivers/dri/nouveau/libnouveau_vieux.a
>> +  -Wl,--no-whole-archive
>> +  src/mesa/drivers/dri/common/libmegadriver_stub.a
>> +  src/mesa/drivers/dri/common/libdricommon.a
>> +  src/mapi/shared-glapi/libglapi.so.0.0.0
>> +  src/mesa/libmesa_classic.a src/mesa/libmesa_common.a
>> +  src/compiler/glsl/libglsl.a src/compiler/glsl/glcpp/libglcpp.a
>> +  src/util/libmesa_util.a src/util/format/libmesa_format.a
>> +  src/compiler/nir/libnir.a src/compiler/libcompiler.a
>> +  src/util/libxmlconfig.a
>> +  [...]
>> +src/mesa/drivers/dri/common/libmegadriver_stub.a(megadriver_stub.c.o): In function `megadriver_stub_init':
>> +megadriver_stub.c:(.text.startup+0x20): undefined reference to `dladdr'
>> +megadriver_stub.c:(.text.startup+0xbc): undefined reference to `dlsym'
>> +collect2: error: ld returned 1 exit status
>> +
>> +This is because the static librairies needs to be correcly sorted by dependency.
>> +libmegadriver_stub include dri_util.h that internally include dri_interface.h needed for
>> +dlsym and dladdr definition.
> 
> Why do .h files matter here? This sort of linking issue really should
> have nothing to do with header files inclusion/ordering, but just about
> object file/library ordering at link time.

I noticed that linker flag --as-needed is important to trigger the issue, I
disabled it by using -Db_asneeded=false in MESA3D_CONF_OPTS. The .h was here to
try to "explain" why we have a dependency between static libraries when
--as-needed is used.

> 
> Could you clarify what is happening here? dladdr and dlsym are provided
> by the C library, so I'm not sure why the ordering between libdricommon
> and libmegadriver_stub can matter here.

I tried with more recent toolchain and there is no issue.

The toolchain used to reproduce the issue is the old ARM codesourcery 2014.05.

I discover an interesting commit and bug report in binutils about --as-needed
option before version 2.25.

https://sourceware.org/bugzilla/show_bug.cgi?id=17287

I can reproduce the issue issue with the codesourcery toolchain and Linaro
4.9-4.9-2014.11 but not with 5.2-2015.11-2 toolchain:

Linaro 4.9-4.9-2014.11: OK (binutils linaro_binutils-2_24-branch)
Linaro 5.2-2015.11-2: OK (binutils 2.25)

But for both Linaro toolchain mesa3d build correctly, I gess it's because Linaro
binutils 2.24 is patched with another patch related to --as-needed:

http://git.linaro.org/toolchain/binutils-gdb.git/commit/?id=72f758d066732d56d50851a97dd67a31f331e2b3

So either we reorder the libraries in the meson build system (like the patch
does) or we can disable --as-needed for this toolchain by using -Db_asneeded=false.

Best regards,
Romain


> 
> Thomas
> 
