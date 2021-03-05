From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 5 Mar 2021 08:56:32 +0100
Subject: [Buildroot] Analysis of build results for 2021-03-03
In-Reply-To: <20210304224926.45aa4056@windsurf.home>
References: <20210304081519.C821B4B530@smtp4.osuosl.org>
 <20210304224926.45aa4056@windsurf.home>
Message-ID: <6cb4a8d7-bee8-5712-2cac-1259d01e288e@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

On 3/4/21 10:49 PM, Thomas Petazzoni wrote:
> Hello,
> 
> Giulio, Heiko, Thomas DS there are specific questions for you below!
> 
> On Thu, 04 Mar 2021 08:15:14 -0000
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> 
>>     nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/24c0a6ca3b272711a1e6ceaa033925182d0d49c4
> 
> Some wonderful compiler issue.
> 
> utf8.c: In function 'ast_utf8_copy_string':
> utf8.c:157:1: internal compiler error: Segmentation fault
> 
> Giulio, does this look like a known NIOS2 issue ?

Yes, I've filed it time ago here:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93847

Then maintainer wanted me to provide all pre-preprocessed files and all 
build flags. There the issue was showing using Codesourcery only, but 
here we have a Buildroot toolchain, so better chance to dig.

Anyway I can add patches to add the _BUG_ and use the -O0 workaround. 
What about that?

> 
>>     nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/71f26fd81db8e9b19b3f18f3f3cefd9c768f094f |
> 
> /tmp/ccDtjRfo.s: Assembler messages:
> /tmp/ccDtjRfo.s:210798: Error: branch offset out of range
> 
> Another wonderful nios2 toolchain issue. Giulio, what do you think ?

This is new to me, I've checked on Gcc Bugzilla and it doesn't seem to 
be there. So I can file it up and look for a workaround, maybe the usual 
-O0.

> 
>>      arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/4829278085da2409bb2902161f9984708411166a | ORPH
>>      arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/3b145a99a1f7498ee7fcd445f3cc319f548e9a81 | ORPH
>>      arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/c1cb2dd0b9e7547f3858e62281da3bd45b9a5b17 | ORPH
> 
> verify.h:132:30: error: negative width in bit-field 'verify_error_if_negative_size__'
>    132 |       (struct { unsigned int verify_error_if_negative_size__: (R) ? 1 : -1; }))
> 
> This happens on RISC-V 32-bit, and on ARC, but only with internal
> toolchains. The assertion that breaks is:
> 
>    116 | verify (LONG_MIN <= TYPE_MINIMUM (time_t) && TYPE_MAXIMUM (time_t) <= LONG_MAX);
> 
> So to me, it smells like another instance of "this is a 32-bit
> architecture, but time_t is 64-bit, and this breaks some userspace code
> that makes bogus assumptions on the size of time_t".
> 
> This feels similar to the libopenssl situation for which Yann has just
> sent a patch. Should we have a BR2_ARCH_IS_32_BUT_TIME_T_IS_64 boolean ?
> 
>>     sparc     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/fba538d2ae4a1c53440ed73ced4023be27d7e9c2 |
> 
> I assume this is fixed by https://git.buildroot.org/buildroot/commit/?id=e5594f7239547672c08058b77f8098d2c080bebc
> 
>>    riscv64    |      fuse-overlayfs-1.4.0      | NOK | http://autobuild.buildroot.net/results/cfef18f3adf51edaedbbd193efbff19aebdfe508 |
> 
> This is a bug in uClibc: it implements renameat() only if the
> SYS_renameat system call exists. If only the SYS_renameat2 system call
> exists, the renameat() function is not implemented. Musl does this
> correctly:
> 
> int renameat(int oldfd, const char *old, int newfd, const char *new)
> {
> #ifdef SYS_renameat
>          return syscall(SYS_renameat, oldfd, old, newfd, new);
> #else
>          return syscall(SYS_renameat2, oldfd, old, newfd, new, 0);
> #endif
> }
> 
> uclibc needs to be patched here.
> 
>>    mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/b1c5989a3a09b39e504c21201e3e07c0afc2a1ea | ORPH
> 
> /home/buildroot/autobuild/instance-2/output-1/host/bin/../mips64el-buildroot-linux-gnu/sysroot/usr/include/glib-2.0/glib/gatomic.h:97:5: sorry, unimplemented: unexpected AST of kind static_assert
> 
> This messages comes from deep down gcc, when compiling the gatomic.h
> macros. It happens on all MIPS architecture variants.
> 
>>    aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/739d625673f9b2ce2d915ecdc21910c62618d145 |
>> microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b1779a7d46f6ee9c06864c3ca252f1cdad47cf08 |
>>      i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a5fe402e3f4e538eb4584f345b029ef12ad43348 |
>>      arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/abd3f886335f146ff6f16370484106bd8a205bda |
> 
> What do we do with this? The only way to solve that is to have the
> Cargo vendoring support, which we won't have for 2021.02. Should we
> drop this package ?
> 
>>      arc      |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/1c2885d75219aabadbb66ab66fe0dc4b4346ff1e | ORPH
>>      i586     |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/3a76afdbd8b564579bfb08a4d75b438dbd73ac2e | ORPH
> 
> Would be fixed by https://patchwork.ozlabs.org/project/buildroot/patch/20210304200430.1749334-1-fontaine.fabrice at gmail.com/
> 
>>   powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/06cce5030766fcc789f0ba4a76d2cbaa091300d0 |
> 
> /home/giuliobenetti/autobuild/run/instance-1/output-1/host/bin/powerpc64-linux-ld: powerpc/spapr_hcall.elf: error: PHDR segment not covered by LOAD segment
> 
> kvm-unit-tests has always been a bit complicated as it builds some kind
> of bare-metal code. I would simply suggest that we drop powerpc64 from
> the list of supported CPU architectures for this package.
> 
>>     nios2     |         libgeos-3.9.0          | NOK | http://autobuild.buildroot.net/results/a05fdf1958f93a206c5c66c7f636b6650683626d | ORPH
> 
> Some more nios2 toolchain issue.

This is very similar to one of Microblaze gcc bugs. So I could be able 
to workaround it with the same -O0.

> Should we get rid of nios2 support entirely ?

Here it seems we get to the same point of Microblaze, if there is no 
hurry I can provide patches to save Nios the same way I've done for 
Microblaze.

>>     mipsel    |       libopenh264-2.1.1        | NOK | http://autobuild.buildroot.net/results/26837f7c80a84e5ad31d5b15161848ebecc59917 |
> 
> This is happening since we have added the use of the Bootlin mips32
> toolchain early February:
> http://autobuild.buildroot.net/?reason=libopenh264-2.1.1
> 
> Needs investigation to see if this is a toolchain issue, or a package
> issue that wasn't noticed until now.
> 
>>    riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/e7bf5db7745c56c4533c225260ff6c3fcd2000f5 |
>>    riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/5b4834023eca039be59b969e3037bb23feeed6ac |
> 
> Being worked on by Yann.
> 
>>    riscv64    |        libostree-2020.8        | NOK | http://autobuild.buildroot.net/results/d42bce7ef9cf0f807b9ba7021af4a11f84e307d2 |
> 
> Ah another instance of renameat() missing from uClibc.
> 
>>   powerpc64   |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/49efc0e93ad8fe30e5f32fed8a1efc1d2afd830e |
> 
> -- Installing missing sysrepo modules...
> [ERR]: Retrieving GID "8000" grp entry failed (No such GID).
> sysrepoctl error: Failed to connect (Item not found)
> [ERR]: Retrieving GID "8000" grp entry failed (No such GID).
> sysrepoctl error: Failed to connect (Item not found)
> CMake Error at cmake_install.cmake:77 (message):
>     scripts/setup.sh failed: 1
> 
> Ah this seems like netopeer2's build system is looking at the host too
> much ?
> 
> Heiko ?
> 
>>     x86_64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/d530db0f37e1e0462e3af1e1787e15f94ff21884 | ORPH
> 
> /home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/9.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: ../libopenblas_nehalem-r0.3.9.a(sbdsvdx.o): relocation R_X86_64_32 against `.rodata.str1.1' can not be used when making a shared object; recompile with -fPIC
> 
> Thomas DS, you are now our expert in openblas. Could you have a look ?
> 
>>    aarch64    |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/c6a3cdd4a07f8918b164e0e1e85c92d8b14ec228 |
> 
> make[1]: Entering directory `/home/buildroot/autobuild/run/instance-2/output-1/build/rt-tests-1.10'
> Makefile:41: *** commands commence before first target.  Stop.
> 
> During the installation step. This shouldn't be too difficult to
> reproduce and track down?
> 
>>     xtensa    |          strace-5.10           | NOK | http://autobuild.buildroot.net/results/6c679877e1a3f50d5e0bc4db3237e0c699bd7243 |
> 
> ./linux/xtensa/arch_regs.c:10:32: error: invalid use of undefined type 'struct user_pt_regs'
> 
> Some more pt_regs fun on a funky architecture. Oh dear.
> 
>>     sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/7cbace3ce72bbcce8ef36f71cba8071bfda9fc26 |
>>    sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/b9a671c46fa41875c1fd6a16790b314c16ef989b |
> 
> This would be worked around by disabling the package on sparc/sparc64,
> which has been proposed a long time ago already:
> https://patchwork.ozlabs.org/project/buildroot/patch/20201025163457.30460-1-sergio.prado at e-labworks.com/
> 
>>      arm      | toolchain-external-linaro-a... | NOK | http://autobuild.buildroot.net/results/d9b9a4b7c3660bd730a19ab09e44f24bc29e3f40 | ORPH
>>      arm      | toolchain-external-linaro-a... | NOK | http://autobuild.buildroot.net/results/13f9a551f5ac911e7daa2a382b0683d81486cffa | ORPH
> 
> toolchain is gone ?

Here it's Micronova firewall that blocks it, I've just written to my IT.

> 
>>    powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/159d2c07060c235080711d1d0da0b2eae995d4bf |
> 
> This is a top-level parallel build issue... but since we don't have the
> full log, we don't have the error.
> 
> Should we perhaps keep the full log, compressed, for builds done in
> parallel ?

I see it's on my Autobuilder, what can I do to provide suck full log? Do 
you mean the entire Buildroot log? If yes I can try to reproduce it and 
save it on a file and post it in some way.

>>      or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ed105d321c0bde99c293ab7328d57c3764db6f27 |
>>      or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ce351e0e97c2cacc17d4718d39941548c7558559 |
> 
> /home/giuliobenetti/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: BFD (GNU Binutils) 2.33.1 assertion fail elf32-or1k.c:2329
> collect2: error: ld returned 1 exit status
> 
> Giulio, is this a known or1k issue ?

Yes, for this I've sent a patchset time ago:
https://patchwork.ozlabs.org/project/buildroot/list/?series=161548

So basically zeromq should be disabled like protobuf. But need to check it.

You've also answered me here:
https://patchwork.ozlabs.org/project/buildroot/patch/20200228175814.128730-1-giulio.benetti at benettiengineering.com/

Here it seems the same situation as Nios and Microblaze.

For this I can provide patches too if not in hurry.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
