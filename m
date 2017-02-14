From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Feb 2017 14:27:25 +0100
Subject: [Buildroot] Analysis of build results for 2017-02-13
In-Reply-To: <20170214072856.3AE8320B8C@mail.free-electrons.com>
References: <20170214072856.3AE8320B8C@mail.free-electrons.com>
Message-ID: <20170214142725.1b9e98ae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

J?rg, Peter, Romain, Bernd, Gustavo, Carsten, Philippe, Yann, Fran?ois,
Dagg, Baruch and ARC/Synopsys developers, there are some questions for
you below.

Thanks!

On Tue, 14 Feb 2017 08:28:56 +0100 (CET), Thomas Petazzoni wrote:

>      powerpc |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/cfeb2f542598e5d450b332fb51a6d79bae24158c

Not sure:

  Could NOT find PolarSSL (missing: POLARSSL_INCLUDE_DIRS
  HAVE_POLARSSL_SSL_H)

J?rg, could you have a look?

>          arm |                cbootimage-v1.7 | NOK | http://autobuild.buildroot.net/results/61bdfb7e0ff9628190d9eb86e40c4c90e768b8e2
>          arm |                cbootimage-v1.7 | NOK | http://autobuild.buildroot.net/results/b78c03b85aef845ff57d499b40f52b476f8a760c

Musl compatibility issue.

>         i586 |                     cups-2.2.2 | NOK | http://autobuild.buildroot.net/results/486dea944d6ecba5c4e6e8ac664261c1909f4b4c

The musl/i586/SSP issue.

>      powerpc |                  ddrescue-1.22 | NOK | http://autobuild.buildroot.net/results/4ac0754f1cc5ea934d6437e89d1f4906fb3fd0a8

Missing <stdio.h> include in block.h I believe. Peter (Seiderer), could
you send a patch to fix this?

>       x86_64 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/8585f08138a684724ce6293a0fa9e0d005bfa372

tracepoint-ipa.o: In function `get_timestamp':
tracepoint.c:(.text+0x14a): undefined reference to `rpl_gettimeofday'

Romain, you looked into this problem and reported the issue to upstream
gdb: https://sourceware.org/bugzilla/show_bug.cgi?id=19798. You said
you worked around it, but it's still there. Could you have a look?

>         m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/2738e5fd446467b105f6dcca391500e3734e5a9b

Missing magic gcc option, Waldemar will provide a fix.

>         m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/7417f177a850eed85ead40adf3694a4c7cf0b870

Same.

>         i586 |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/95bbcebc8768d1be026a83d9437a9b206b94df20

/usr/lib32/libstdc++.so.6: undefined reference to `__towlower_l at GLIBC_2.1'
/usr/lib32/libstdc++.so.6: undefined reference to `wmemchr at GLIBC_2.0'
/usr/lib32/libstdc++.so.6: undefined reference to `fputs at GLIBC_2.0'

It's incorrectly picking some host libraries, which is wrong. Bernd,
you did the bump of libcec, could you fix this?

>          arm |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/3912eaa022865ce81535fbb72a206577e32b506f
>          arm |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/1e09ab626e3ecdd0467842b81200d96073af66e6
>          arm |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/e2408c887dde0ad9f7120d2ab3e267da84c16484
>          arm |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/7f2cdfbc125292de2427d16f9ae0b5ad971a24c2

error: conflicting types for 'khronos_ssize_t'

Gustavo, could you have a look ?

>         sh4a |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/908aef6c82d56060933713df217b6b2ba21a01b0

error: 'SIZE_MAX' was not declared in this scope

Missing header include I believe.

>    powerpc64 |                   libsvg-0.1.4 | NOK | http://autobuild.buildroot.net/results/f2d5b2459080bf9c67906b8b240150303bb61461

/usr/lib64/libexpat.so: error adding symbols: File in wrong format
collect2: error: ld returned 1 exit status

It's picking some host library, which is wrong. Carsten, you're listed
in the DEVELOPERS file for libsvg, could you have a look?

>         i586 |                  libv4l-1.12.2 | NOK | http://autobuild.buildroot.net/results/b8b96c7bbf2147dacac62485cbfdbcfd758271a5

ir-ctl.o: In function `parse_opt':
ir-ctl.c:(.text+0xb06): undefined reference to `strndupa'
ir-ctl.o: In function `lirc_record':
ir-ctl.c:(.text+0xe01): undefined reference to `TEMP_FAILURE_RETRY'
ir-ctl.o: In function `main':
ir-ctl.c:(.text.startup+0x9a): undefined reference to `TEMP_FAILURE_RETRY'
ir-ctl.c:(.text.startup+0xd7): undefined reference to `TEMP_FAILURE_RETRY'
ir-ctl.c:(.text.startup+0x64a): undefined reference to `TEMP_FAILURE_RETRY'

Musl related, perhaps?

>         i686 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/ee1abc83bbe1e2fc2e9097e1f79fbd04f411e431

CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
  CMake 2.8.11 or higher is required.  You are running version 2.8.2

Why is this thing trying to use CMake when it is an autotools-package ?

Philippe, could you have a look ?

>          arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/72e9a6f39bb8e4da421926d5a73911760777e93b

Musl issue. Philippe, same thing :-)

>          arm |              lttng-tools-2.9.3 | NOK | http://autobuild.buildroot.net/results/11d5a5bcef8e05822136ac302371115f4fe3c4ee

prog.c:24:7: warning: implicit declaration of function 'dlmopen' [-Wimplicit-function-declaration]
  h1 = dlmopen(LM_ID_BASE, "libfoo.so", RTLD_LAZY);

dlmopen() is not provided by uclibc it seems.

>          arm |             mesa3d-demos-8.3.0 | NOK | http://autobuild.buildroot.net/results/6f197c643972e92f0b27b3afac7da7b4b1115f7e

BR2_PACKAGE_PROVIDES_LIBGL="mesa3d"
BR2_PACKAGE_PROVIDES_LIBEGL="rpi-userland"
BR2_PACKAGE_PROVIDES_LIBGLES="rpi-userland"

This seems like a quite messy configuration: we have mesa3d as the
OpenGL provider, and rpi-userland as the OpenGLES/EGL provider. Yann,
what do you think about this?

>       xtensa |                     mpd-0.20.4 | NOK | http://autobuild.buildroot.net/results/b3058c729e6b389aa0100d3918c0db3fd1a5dfc3

Static linking issue.

>          arc |                     mpd-0.20.4 | NOK | http://autobuild.buildroot.net/results/3a6b236969982094ec43e2a25e51b2e396574c0f

Weird linking issue, forgets to link with pthread?

Gustavo, J?rg, could one of you look at these issues?

>       xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/b52d69c54e07edeeee86a525fac4cf00c47c2e45
>          arm |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/15af420dc866af4bf639f2ef003aacfe9ead7447
>       xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/5be7eb7606d99c7df1afdd8fa011be5de7daa7f0

Fixed by https://git.buildroot.org/buildroot/commit/?id=3a89cfc46489e0bedf27796134698878d0de9281

>          arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/5625f8f1d62ba87d6bd94ab8978f72992b766086
>          arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/ae54693a59b2d8dd8d83d224b93f1b4223e0af40
>          arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/d69e14b25564ff58844f5b3970fa5e7621f0f0bc
>          arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/584fc74d2e7fe790529051eee95c9475ed1033ac

Fixed by https://git.buildroot.org/buildroot/commit/?id=5c4d3560b94c9cb8f1594c9200a632b89ddf7aa0

>       mipsel |       python-flask-login-0.3.2 | NOK | http://autobuild.buildroot.net/results/2e0574cbdaa202807b206b4e0988c3ed361d4a21

Download issue, ignore.

>       x86_64 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/17dea7dcb390b3cb9319a0e3ef55562b3c8d6e2d

/tmp/ccDTRA9B.s: Assembler messages:
/tmp/ccDTRA9B.s:112: Error: instruction `vmovd' isn't supported in 16-bit mode.
/tmp/ccDTRA9B.s:113: Error: instruction `vpinsrd' isn't supported in 16-bit mode.

>          arm |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/42172dfa49d7006426ef7c39ea916174456537b2
>          arm |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/f5be91e90e26b0bc65259ef4262b9cface1d584e

/home/test/autobuild/run/instance-3/output/build/qemu-2.7.0/user-exec.c: In function 'cpu_alpha_signal_handler':
/home/test/autobuild/run/instance-3/output/build/qemu-2.7.0/user-exec.c:410:25: error: 'mcontext_t {aka struct sigcontext}' has no member named 'gregs'

Fran?ois, you're taking care of the qemu package, can you have a look?

>        nios2 |                  qt5base-5.6.2 | NOK | http://autobuild.buildroot.net/results/020da67e98c897e6179b0e62f38a753099637de9
>    powerpc64 |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/782f9fec5c0e4abe0e58040d26ad6cc54f5324a0
>        nios2 |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/5ebc47dcccffdf03097f72f829344a997874de61
>      powerpc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/6a98ac82436b6b9733a9539ed433fd9c59442229
>       xtensa |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/ba5fb88f684b35b7d0bd738b98dd14f37b8b812c
>      powerpc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/58e40dc27305282f8e0c3f91575098e40865a3d8

I suppose all of this are related to the freetype issue. Peter Seiderer
has submitted some patches to address this.

>          arm |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/e5b926b680c8a1f94148cb1523e3de8380b6aed9

error: 'khronos_intptr_t' has a previous declaration as 'typedef int khronos_intptr_t'

BR2_PACKAGE_PROVIDES_LIBEGL="odroid-mali"
BR2_PACKAGE_PROVIDES_LIBGLES="odroid-mali"

issue with this specific OpenGL provider?

Dagg, you're the one who contributed odroid-mali. Could you have a look?

>         sh4a |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/da6b762c2497ee050ca6decb3db42c913c95c032
>        nios2 |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/80d83c650c668ee1e87c288bd7a0ce63eab95631
>       mipsel |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/a613830ffab74f144238ee88a1e5067d387e643f

Should be fixed by https://git.buildroot.org/buildroot/commit/?id=896455cff7ff46dd069c74be39c39aa85cb4e129.

>          arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/5da778c67e263736cb2c42a6910ed54983f5c018

Static linking issue. Who wants to look at this? Nobody is listed in
the DEVELOPERS file for slang.

>          arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/598882bb0d110eedf4ee85ce93987d91947c675e
>          arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/427aff122138b016f1733b618f7f07b957282610
>       mipsel |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/666b15fb903369ef7b58d123308037bd44547142
>          arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/36bd529abc930c2ff236bcbee3ad1aba0c39e604

The ncurses issue. A patch has been posted, but we don't completely
understand what's going on. Needs investigation. Who is interested?

>          arm |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/d9ab699ba314f87a12b4982811ebfa1c3186a408

CConfig.cpp: In member function 'CConfigReadContext::operator void*() const':
CConfig.cpp:1851:9: error: cannot convert 'std::istream {aka std::basic_istream<char>}' to 'void*' in return

Modern gcc issue ?

>      powerpc |                tcpreplay-4.1.2 | TIM | http://autobuild.buildroot.net/results/3883530f1c8c6ec03a4c880fb32acb21464c4323
>       x86_64 |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/b3c31e803ff552a196ce5717372c09d6f64c91bf

error: redefinition of 'struct ethhdr'

I believe this has been fixed by the rebuild of the toolchains I
deployed yesterday, which has the improvements done by Baruch. Baruch,
could you confirm?

>          arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/b7405a67745b68dcde907c1d8259851d68984694

ARC toolchain issue. Developers from Synopsys, do you know when/if this
is going to be fixed?

> microblazeel |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/59b176eb0fa5660a6b2a81a880a2f8559e529c4b

import_id3.c:166:17: error: unknown type name 'wchar_t'
                 wchar_t *wide_string = malloc ((nchars + 1) * sizeof (wchar_t));

Need wchar support it seems. J?rg, you recently bumped this package,
could you have a look?

>          arm |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/2c77cb25099f67f87af470528bb05732ad5ac299
>       x86_64 |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/b62ac6fd5ce36453935c309e112262467cf0e3bf
>          arm |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/439bf0b0d446b8da64eece7805c8b1e43b90f764
>        sparc |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/330a4b81d008b3f2f82fcc8712f3109fe72f007d
>          arm |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/4cc37a3f2ca8e79ca6d487da51e032411e466d70
>          arm |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/8e52ea6d0353fe8ab4196b9f959740ab7cfacb87
>        nios2 |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/ac99fadd3cd6590567836a0cf25a2ff5ac3ea4ab

Fixed by https://git.buildroot.org/buildroot/commit/?id=c36f0d65ad63589f1b21833ef53d429c018b6f8a.

>         m68k |                 xfsprogs-4.8.0 | NOK | http://autobuild.buildroot.net/results/d48e61785d25d33106b7dab1b5cb200cf27d4044

FATAL ERROR: could not find a valid BLKID header.
Install the Block device ID development package.

Not sure.

>          arm |                 xfsprogs-4.8.0 | NOK | http://autobuild.buildroot.net/results/202f0e7898b049b46c29646a57c8d9718cb3eae7
>          arm |                 xfsprogs-4.8.0 | NOK | http://autobuild.buildroot.net/results/57975f401f39b673eeec304b4738cfb41a19ece7

Fixed by https://git.buildroot.org/buildroot/commit/?id=c557a22438647890e27c77bbf76f3a9f16d6d103

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
