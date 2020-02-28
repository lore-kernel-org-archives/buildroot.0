From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 28 Feb 2020 19:06:00 +0100
Subject: [Buildroot] Analysis of build results
In-Reply-To: <926B4573-B3E8-4912-8D3F-338764DDEF7E@benettiengineering.com>
References: <20200227234905.44125454@windsurf.home>
 <926B4573-B3E8-4912-8D3F-338764DDEF7E@benettiengineering.com>
Message-ID: <e106a463-1731-256f-d138-7a928e289bc4@benettiengineering.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Hello,

On 2/28/20 12:18 AM, Giulio Benetti wrote:
> Hello,
> 
> Inviato da iPhone
> 
>> Il giorno 27 feb 2020, alle ore 23:49, Thomas Petazzoni <thomas.petazzoni@bootlin.com> ha scritto:
>>
>> ?Hello,
>>
>> Here is an analysis of yesterday's build failures. Please have a look
>> and help!
>>
>>> On Thu, 27 Feb 2020 09:31:33 -0000
>>> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>>>
>>>     arch     |             reason             | OK? |                                       url                                       | orph?
>>> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>>> microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/c4bc6cc208e94ffb84caaea03c4898a3001c7f9a | ORPH
>>
>> Would be fixed by http://patchwork.ozlabs.org/patch/1242647/, but I'm
>> personally not entirely sure about this patch.
>>
>>>     arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/f4821f44ceb2811e9ab160dd2cb886243215df52 |
>>>     arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/f3ac50c32c7e4fd3a5e9e3dd4170b0799a26270b |
>>
>> undefined reference to `std::__atomic_futex_unsigned_base::_M_futex_notify_all(unsigned int*)'
>>
>> According to http://autobuild.buildroot.net/?reason=bitcoin%, this only
>> happens on the ARC architecture.
>>
>> ARC maintainers, any idea ?
>>
>>>   mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/4569cbbe97ab9057e5e3909a03540544d588a479 |
>>>    sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/71fdd490873809acd89d7b3e3ea27e88c5b62c24 |
>>>    xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/caa1041217f8b2bc835dd6a06c13d59f70f72caa |
>>>     arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/a05dee0491871bdd7d0a8f53d96e7971f7c71d1a |
>>>     arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/a8edb5621ecc2d250f572240b0607762735b0ffb |
>>>    sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/1c6d8e80974547c48f6a4c9d2ff43b9ba268a2aa |
>>>     arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/7d8ccf9cc8559db9aed19bf32e6cb342141bd360 |
>>
>> Fixed by https://git.buildroot.org/buildroot/commit/?id=7bed3ee409661107b6ce2a05c48adcc7f79258fa.
>>
>>>    xtensa    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/7885705f1b1c0f31cf21b464150f5509929c1906 |
>>
>> Toolchain issue:
>>
>> BFD (GNU Binutils) 2.31.1 internal error, aborting at elf32-xtensa.c:3283 in elf_xtensa_finish_dynamic_sections
>>
>> Max, any idea ?
>>
>>>     m68k     |        dvdauthor-0.7.2         | NOK | http://autobuild.buildroot.net/results/9c7f4f22386d4ffd211ed62da323f9861f1b1716 |
>>
>> elf2flt issue, Romain has posted a series to avoid it.
>>
>>>     arm      |        fail2ban-0.11.1         | NOK | http://autobuild.buildroot.net/results/4b16c925a0aa0aba073324e2c3a4297c456b55bd |
>>
>> I would assume fixed by
>> https://git.buildroot.org/buildroot/commit/?id=bdc9364ffae64623158830698a4f84fb2a179910.
>>
>>>   riscv64    |         gerbera-1.3.4          | NOK | http://autobuild.buildroot.net/results/b499442a920dd3969e2beb2099504d33641b4980 |
>>
>> /home/buildroot/autobuild/instance-3/output-1/per-package/gerbera/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-gnu/8.3.0/../../../../riscv64-buildroot-linux-gnu/bin/ld: cannot find /lib64/libc.so.6
>> /home/buildroot/autobuild/instance-3/output-1/per-package/gerbera/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-gnu/8.3.0/../../../../riscv64-buildroot-linux-gnu/bin/ld: cannot find /usr/lib/libc_nonshared.a
>> /home/buildroot/autobuild/instance-3/output-1/per-package/gerbera/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-gnu/8.3.0/../../../../riscv64-buildroot-linux-gnu/bin/ld: cannot find /lib/ld-linux-riscv64-lp64d.so.1
>>
>> This is a per-package directory build issue I believe.
>>
>>>    xtensa    |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/42cbc33ded6cf04f5cb2edb105f2e561d06886ff |
>>
>> /home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/xtensa-buildroot-linux-uclibc/8.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: gstplugin.c:(.text+0xb58): undefined reference to `g_module_open'
>> /home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/xtensa-buildroot-linux-uclibc/8.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: gstplugin.c:(.text+0xb5c): undefined reference to `g_module_error'
>>
>> static linking issue. Any brave meson/gstreamer person in the house ?
>> Adam ? :-)
>>
>>>   mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/fa13a054995d6060d2dc15c36007e41a50ed7fc4 |
>>
>> Some funky toolchain issue:
>>
>> /data/buildroot/buildroot-test/instance-0/output/build/host-go-1.13.8/pkg/tool/linux_amd64/link: running /data/buildroot/buildroot-test/instance-0/output/host/bin/mips64el-linux-gcc failed: exit status 1
>> collect2: fatal error: ld terminated with signal 11 [Segmentation fault], core dumped
>> compilation terminated.
>> /data/buildroot/buildroot-test/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/5.5.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: /tmp/go-link-130627779/go.o: relocation R_MIPS_26 against `a local symbol' can not be used when making a shared object; recompile with -fPIC
>> /data/buildroot/buildroot-test/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/5.5.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: BFD (GNU Binutils) 2.31.1 assertion fail elfxx-mips.c:6550
>>
>>>   mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/4f853af32b5c09e63896e2125b5d018d279c0951 |
>>
>> Yann's machine still exhibiting this weird issue.
>>
>>>   aarch64    |      host-nodejs-12.16.0       | NOK | http://autobuild.buildroot.net/results/a83acd958d177a47ea2b1ca94b8a163da3e4a2c5 |
>>>     arm      |      host-nodejs-12.16.0       | NOK | http://autobuild.buildroot.net/results/c7934318c29b9dce9062d93158906409c5229a6d |
>>
>> Would be fixed by http://patchwork.ozlabs.org/patch/1239736/, but I
>> don't like the fact that package A refers to package B build directory.
>>
>>>     arc      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/46c5cf068cf9ea50e53491870d9dbf3f134c8c22 |
>>
>> /home/test/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arc-buildroot-linux-uclibc/9.2.1/../../../../arc-buildroot-linux-uclibc/bin/ld: ../src/.libs/libgdiplus.so: undefined reference to `GifQuantizeBuffer'
>>
>> This is *not* a static linking issue.
>>
>>>     m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/686b92af36ec691dd06078c18df21f59209bea06 |
>>
>> elf2flt mess.
>>
>>>   sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/94d021c513569cf4062619127ec2262d30b3201f |
>>
>> error: [m[Kinvalid 'asm': invalid operand output code
>>
>> J?r?me, you are listed as the lxc package developer, could you have a
>> look ?
>>
>>
>>>     arm      |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/6387b0a99e1a0922811919623d9a10b0943988df |
>>
>> {standard input}: Assembler messages:
>> {standard input}:334: Error: selected processor does not support `vldm r4,{q0,q1,q2,q3}' in ARM mode
>> {standard input}:335: Error: selected processor does not support `vst1.8 d0,[r3],r2' in ARM mode
>> {standard input}:336: Error: selected processor does not support `vst1.8 d1,[r3],r2' in ARM mode
>> {standard input}:337: Error: selected processor does not support `vst1.8 d2,[r3],r2' in ARM mode
>>
>> Bad stuff happens when building the vc4 driver. It probably needs some
>> minimal ARM architecture variant.
>>
>>>   powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/ddb1c83ede34c125296563227f6b8f4b76729480 |
>>
>> /home/giuliobenetti/autobuild/run/instance-0/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibc/8.3.0/crtbeginS.o: in function `__do_global_dtors_aux':
>> crtstuff.c:(.text+0x13c): relocation truncated to fit: R_PPC_PLTREL24 against symbol `__cxa_finalize' defined in .text section in /home/giuliobenetti/autobuild/run/instance-0/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/lib/libc.so.1
>> collect2: error: ld returned 1 exit status
>>
>>>     m68k     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/1a0caff18be6d55395c40f4d9f04076b03122757 |
>>
>> elf2flt mess.
>>
>>>     arm      | minicom-52b626b15a883b03006... | NOK | http://autobuild.buildroot.net/results/d3edbab1f2cd0f7b790e2559dc8d489497ae02f3 |
>>
>> Fixed by https://git.buildroot.org/buildroot/commit/?id=acbae76d6977b1f2d3847ea379c7dd8f1761f565.
>>
>>>    x86_64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/80a0d9dc59567c28b891c50c63280cea3aad613f |
>>
>> src/mongo/util/heap_profiler.cpp:484:33: error: 'abi' has not been declared
>>
>>>     arm      |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/5765e33f444a22701b055015ed41436d3526e9eb |
>>
>> /home/test/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/7.3.1/../../../../arm-linux-gnueabihf/bin/ld.gold: error: /home/test/autobuild/run/instance-1/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libyaml-cpp.a(null.cpp.o): requires unsupported dynamic reloc R_ARM_MOVW_ABS_NC; recompile with -fPIC
>>
>>> aarch64_be  |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/3938ecd3a0aae2e87d3876e7bf0d8244dcffb457 |
>>
>> /home/test/autobuild/run/instance-2/output-1/build/opencv3-3.4.9/modules/dnn/misc/caffe/opencv-caffe.pb.h:17:2: error: #error This file was generated by an older version of protoc which is
>> #error This file was generated by an older version of protoc which is
>>
>> Sigh.
>>
>>> microblazeel |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/e5cfb968bc867d14f4ef4dd8da63b51360bc6808 | ORPH
>>
>> Static linking issue.
>>
>>>     or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/25a594a74795bbccf5a218a6cd3b6804beac6e4d |
>>>     or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/f0086358fd7bca5f2e77855c926641329e2e6ac8 |
>>>     or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/079fd66a15dba75ed1ba70aec8708f35fb7e93fe |
>>>     or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/f800a5f24cb4b23231165ad60c03bf177bad4a9f |
>>
>> /home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/5.4.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: BFD (GNU Binutils) 2.31.1 assertion fail elf32-or1k.c:1752
>> /home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/5.4.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: BFD (GNU Binutils) 2.31.1 assertion fail elf32-or1k.c:1752
>>
>> Giulio, I think you like toolchain issues! :-)
> 
> Everyone has its particular tastes... :-)
> I take care about this and...

This is fixed by these:
https://patchwork.ozlabs.org/project/buildroot/list/?series=161548

>>> microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/b92c1c09de74886c9039b3b76f35275f4e7a7b6c |
>>
>> Another funky toolchain issue:
>>
>> /home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/x264/host/bin/../lib/gcc/microblazeel-buildroot-linux-uclibc/8.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: FDE encoding in /home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/x264/host/bin/../lib/gcc/microblazeel-buildroot-linux-uclibc/8.3.0/libgcc.a(_divdi3.o)(.eh_frame) prevents .eh_frame_hdr table being created

I can't reproduce this, any suggestions to make it trigger?

Thank you
Best regards
-- 
Giulio Benetti
Benetti Engineering sas
