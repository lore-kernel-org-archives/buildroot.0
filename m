From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Feb 2017 22:33:53 +0100
Subject: [Buildroot] Analysis of build results for 2017-02-25
In-Reply-To: <20170226072845.0954E20755@mail.free-electrons.com>
References: <20170226072845.0954E20755@mail.free-electrons.com>
Message-ID: <20170226223353.39284983@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Sam, Cyril, Frank, Gustavo, Waldemar, Vicente, see below.

On Sun, 26 Feb 2017 08:28:45 +0100 (CET), Thomas Petazzoni wrote:

>          sh4 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/ec88aa8118179e30e24603cc45292047dca19216

Compiler error, happening with a Buildroot toolchain. I guess we should
simply add an exception for this package on sh4 ?

>         or1k |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/a0bb5535fd197b9dd1607a5f0bca477c9575c99f

Fixed by
https://git.buildroot.org/buildroot/commit/?id=f12a146f817c8ef07a7d41a31a5336b5ef6a96e8.

>  powerpc64le |                domoticz-3.5877 | NOK | http://autobuild.buildroot.net/results/8789303587f693d5104506a7db361e1322091fd1

unresolvable R_PPC64_ADDR64 against `rand@@GLIBC_2.17'

Sam, could you have a look ?

>       x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/4612d35704070256cf11455e4f4cf23272bf107d

x86/hyperv_clock.c: Assembler messages:
x86/hyperv_clock.c:21: Error: no instruction mnemonic suffix given and no register operands; can't size instruction

This has been happening for a very long time (4+ months) :

  http://autobuild.buildroot.net/?reason=kvm-unit-tests-5731572b2ac23eb410732110b93425b5bb7f27dd

Cyril, could you have a look soon? If not, we'll just mark this package
as not available on x86-64.

>         i686 |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/3f3593bab7734dd274faf5b5690895e9424cbb89

The CMake issue I guess.

> microblazeel |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/b27f37190ebc7cd1121d0b040dbc8acbef66d749

Interesting. This is a static linking case, where the toolchain has
built-in RPC support and the configuration has libtirpc enabled. Hence,
we have symbol being redefined between libc and libtirpc.

What should we do about this? Prevent libtirpc from being selected when
the toolchain has RPC support and we're static linking?

>        sparc |                      nmap-7.40 | NOK | http://autobuild.buildroot.net/results/8e476939f1daaa20c316dbd0508fa343034f2397

Fixed by https://git.buildroot.org/buildroot/commit/?id=be8177fcea62a3ea1a3c3e870b0da3b600f092ce.

>  powerpc64le |                  openocd-0.9.0 | NOK | http://autobuild.buildroot.net/results/3cbe65a46e75b8e67846d593884c96df97dec7a4

Would be fixed by https://patchwork.ozlabs.org/patch/724932/, but a
better patch was suggested, but never submitted.

>  powerpc64le |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/767f0be3894c45c1e6d18bc4528d0da7b50e3757

Fixed by https://git.buildroot.org/buildroot/commit/?id=7e4c99b95012881aacbc686e952b26e38422b389.

>       x86_64 |                pulseview-0.3.0 | NOK | http://autobuild.buildroot.net/results/a8a8bd2097a20f611bfb8c9679a4f69ace05f533

Crazy C++ stuff:

/home/buildroot/autobuild/run/instance-3/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/include/boost/math/bindings/detail/big_lanczos.hpp:44:25: error: unable to find numeric literal operator 'operator""Q'
          static_cast<T>(BOOST_MATH_BIG_CONSTANT(T, 120, 160394318862140953773928.8736211601848891)),
                         ^
/home/buildroot/autobuild/run/instance-3/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/include/boost/math/bindings/detail/big_lanczos.hpp:44:25: note: use -std=gnu++11 or -fext-numeric-literals to enable more built-in suffixes

Anyone ?

>          arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/f0f6cdc8c38c024772615d5e677b0f4ad63ef7ec

Gah, musl related issue. I already tried to investigate this one, but
could never understand what's going. I'm going to send a patch
disabling this package on musl.

>       x86_64 |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/3dc981444ba3376df04878866f951e3e4bb31323
>          arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/74b77125a5d1bb7340cb6901836430b1ad8acb29

Static linking issues. Frank, rabbitmq is your package, could you have a look ?

>         mips |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/5856446247100e0e4cdbba7f633ac823ccf18a13

  CPPAS    src/mips/o32.lo
src/mips/o32.S: Assembler messages:
src/mips/o32.S:94: Error: opcode not supported on this processor: mips32r2 (mips32r2) `l.d $f12,0*4($sp)'
src/mips/o32.S:101: Error: opcode not supported on this processor: mips32r2 (mips32r2) `l.s $f12,0*4($sp)'

Vicente: this again smells like assembly code using the FPU, while we
are building in soft-float mode. Is this correct? If so, can you send a
patch?

>          arc |                   samba4-4.5.5 | NOK | http://autobuild.buildroot.net/results/605e36d65bd01310913701af0f9ed1e11fb49385

error: 'struct dqblk' has no member named 'dqb_curspace'; did you mean 'dqb_curblocks'?
error: 'struct dqblk' has no member named 'dqb_valid'
error: 'QIF_LIMITS' undeclared (first use in this function)

Weird. Is it a libc issue? Kernel headers issue?

Gustavo, any clue?

>         m68k |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/99aa6a0ce6dd55911b612ae61180cfbaece64580
>     mips64el |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/c58961fb9c67dbc387d9cb785d78641bfaa5333b

Should be fixed by:

  https://git.buildroot.org/buildroot/commit/?id=0c5946acc24a36f9dff079edd054d948c69434f6

>          arc |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/05bbc22dd6cd5564462226e612ab1e95778fe935

Should be fixed by:

  https://git.buildroot.org/buildroot/commit/?id=021f95a2a43b9d3e765856ab9eb5e8d5af5a3dcd

> microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/a318f0838a6a602046e719103ac81965c0084d52

internal compiler error: in merge_overlapping_regs, at regrename.c:304

Waldemar, a suggestion for this one ?

>          arc |                 xfsprogs-4.8.0 | NOK | http://autobuild.buildroot.net/results/50314716a9f72e8bb238e52e9dc342c68f7e0b8b

Fixed by https://git.buildroot.org/buildroot/commit/?id=779ec7f36dfb85c43c093ec5a19116399bcd3252

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
