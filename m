From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 May 2016 15:46:55 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-05-13
In-Reply-To: <20160514063024.2C7B91025E9@stock.ovh.net>
References: <20160514063024.2C7B91025E9@stock.ovh.net>
Message-ID: <20160514154655.57ae0bad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

J?r?me, Gustavo, Bernd, Fabio, Gwenhael, Romain, Vicente, Yann, Matt,
Martin, Baruch, Samuel, Waldemar, Peter, please see below, there's some
good stuff for you :-) Thanks!

On Sat, 14 May 2016 08:30:24 +0200 (CEST), Thomas Petazzoni wrote:

>      powerpc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/1b8ace1a083b419c1ab913fda0d36a1d2d910f13/
>       xtensa | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/5bb304c91367f1570903c8c527b387c65e572e56/
>      powerpc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/5f6cacf3125518d8c071397582569c659461690a/

This was due to an issue building on big endian systems, I'm about to
send a patch that fixes it.

>       x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/f003885b58376b130f4cd6cba38ba3dd911ee9f7/

Even though this is a shared library capable build, it wants to link a
shared library against libstdc++.a.

J?r?me, since you added the apitrace package, could you have a look?

>      powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/a2bb339864bdfd2ddfd2ec487d9c3cb3181ce9ca/

Gustavo, this is the same issue as the one we add with the old
CodeSourcery toolchain, but this time with a Crosstool-NG toolchain
that uses gcc 4.7. What is so special with blktrace that it causes such
issues?

>          arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/dab91372b7bfde57796a7e3de7e823dc44adfb76/

cairo-gl.h:130:21: fatal error: EGL/egl.h: No such file or directory
 #include <EGL/egl.h>

Gustavo, Bernd ?

> microblazeel |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/602f1b40d1c369bb7eef24216264e0e41837518e/
>          arm |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/bf6e4d55b3ff069c8efd72721a65af2c30e5b6f4/

There's a dependency error on iptables. Gustavo, could you have a look?

>          arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/445a401da2f63a6c43d7c166516287db6cc977ab/

Caused by using PIE, which requires Scrt1.o, which isn't available in
our uClibc toolchains. Since we don't really need PIE support, I've
sent a patch that disables it.

>       x86_64 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/c02f69b5f246b95299d3998a55783de0c33b52ee/

The -Wl,-rpath,/usr/lib is wrong. Fabio, you are the last person who
bumped the expect version. Could you have a look?

>     mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/a860f2ecf47c1797d51547ebb0b1d6de9a3a8785/
>     mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/b1a7be266d02e23aa7df815d225b3c82f534af82/
>     mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/830b12f9820dcd0a3d607d7f2f7fdff68614a416/
>     mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/e1dbf44ab00e4cb54d0db69c2c53f894cf37bca5/
>     mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/7b04af4aff0210f9c4e0ca75b88eb01d09f813bd/

Bernd, Vicente, ffmpeg doesn't find freetype2 on mips64el. Could you
have a look?

> microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/a645ec0fc4dd02454d03151078df75c4900327fd/

gcc problem :/

>       mipsel | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/a4af3758a8d8414e28e0ad17d7ff69fc79f38e42/
>         sh4a | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/d0e9e1ee5d180534c62001ba9c3d68b4038a63dd/

Should be fixed by http://patchwork.ozlabs.org/patch/610921/.

>          arm | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/96a280a8115cd01d64670e4caf2471d3ee4581d9/
>          arm | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/43babb56cf9860ac60e51452d2f9362fc4a331e2/
>       x86_64 | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/cd064a8bcb297ba47168bde44cefeb2db9721cc6/

musl build issue, due to the usage of <error.h>. I'm tempted to simply
mark the package as not available on musl.

>       x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/9a63f1dd6ba58f69e4810a5304112dbafab15cbc/

internal compiler error: Segmentation fault

Gwenhael, could you narrow down this issue, and see which compiler
versions are affected?

>        nios2 |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/02bc45c115cbcda11f379ad3aecd1153ca25908a/

Romain?

>     mips64el | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/f1016da210323786ca9615c882e4a41f04c2894f/

Smells like a parallel build issue. Vicente, you add this package,
could you have a look?

>       x86_64 |        host-erlang-rebar-2.6.1 | TIM | http://autobuild.buildroot.net/results/923fbd5a8ef27c250844e466fb5b33e5e3840321/

Ignored.

>         i686 |             host-python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/e5b005a3ac9d7313b71eaf492d03d6b61b87e683/

/usr/bin/ld: BFD (GNU Binutils for Ubuntu) 2.24 internal error, aborting at ../../bfd/merge.c line 873 in _bfd_merged_section_offset

Yann, this is happening on your machine. Can you have a look, and see
if it's reproducible, or if it's a bug due a HW issue?

>       x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/c6a6eec34cffb2c7876595b36fb8a01f475583f9/

Musl build issue. Matt, you originally added the igmpproxy package,
could you take care of this issue?

>       x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/0232ff61000fe8936bd768ae49dd75e1bad36094/

Musl build issue. Gustavo, you are the person doing most of the changes
on ipsec-tools. Could you have a look?

>          arm | iputils-3a86a2542c6fe29413c... | NOK | http://autobuild.buildroot.net/results/55a7db5c0cbc34bbf6a2cbc52713d8822deec5b2/

Some static linking issue. Martin, you already did some work on
iputils, can you have a look?

>       xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/f8e71aae05e06de55346e78e1f23dd91da89c93c/

It wrong assumes that execinfo.h is available:

../dbus/sigsegv.c:30:22: fatal error: execinfo.h: No such file or directory
 #include <execinfo.h>

This generally can be easily workaround by making the corresponding
code conditional.

Could someone have a look?

>          sh4 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/3687ca340d56798b0504444f0c9a11213b896029/

Same problem.

>         i686 |                 libinput-1.2.4 | NOK | http://autobuild.buildroot.net/results/3eb32c19f90a5fd8d45a0c36676e015e8278a469/

  CCLD     event-debug
../src/.libs/libinput.so: undefined reference to `static_assert'

Baruch, you recently looked at libinput, could you investigate this
build failure?

>         mips | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/768f7b6f8bc0dbae203f2713af083e6a52631706/
>         mips | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/7b4974cbda74c44952db0721b4d3367bc451adf8/

error: non-floating-point argument in call to function '__builtin_isnan'

Vicente ?

>       mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/b5c205e6a0628ae559dc06183ca72fae78fa79aa/

Grr, still the SSP problem :-/

>        sparc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/c77e763817657b251213a7ce1e52513b3233e9cd/
>          arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/88c34347cb4d0f33221415f00426be3dc4223d3b/
>      powerpc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/cc4b52b5a222cad30c369be493d918916df3ec70/
>     mips64el |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/011c74cce1ca77fe4c7880226f43ef6e5bc6aadc/
>          arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/663da681c22a3c913de174b6b80341e2f8e6ca33/
>        sparc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/74787def01b321f7b9c6736c6871f8558d23b1ab/

Gustavo, you added mpv recently, could you look into those issues?

>       x86_64 |                      mtr-v0.86 | NOK | http://autobuild.buildroot.net/results/debeb3ded02c3de63182c3433ff02062192d3fd1/

checking whether provided __res_state_ext definition can be compiled... no
configure: error: Need definition for struct __res_state_ext but unable to define it.

Musl build issue. Gustavo, you originally added the mtr package, so
this one is also for you :-)

>        nios2 |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/fd0cc1cb09d07be94770d984efb28eea7c6f25b7/

Romain?

>          arc |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/57007a8d22d20b2fc5cd64154f5ec674b0842afa/

Samuel, this one is for you. It tries to link against libdl in a
BR2_STATIC_LIBS=y configuration. Not good.

>       x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/8ba8585622a143ef88b6f48146160feaaae2eca3/

Musl build issue. Vicente, you are the last one who bumped openpgm.
Could you have a look?

>          arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/79b5a9b1c7acbaf2bb17340edf3bd96328c709b6/

Some completely crazy C++ error. Vicente, you're also the last person
who bumped pinentry, could you have a look?

>         bfin |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/b4e469a72a746c05ace172798771cfcd081ea473/

process.c: In function 'rb_spawn_process':
process.c:3928: warning: passing argument 2 of 'rb_ary_new_from_values' from incompatible pointer type
process.c:3930: error: 'status' undeclared (first use in this function)
process.c:3930: error: (Each undeclared identifier is reported only once
process.c:3930: error: for each function it appears in.)

Gustavo? This seems like a recent regression, I remember being able to
build ruby on bfin some time ago.

>       xtensa | sconeserver-c4b8e14f6e9e06c... | NOK | http://autobuild.buildroot.net/results/60ca2e9d7019dd7969774e4326d07f1bfd27ff75/

Uses dlfcn.h, so should not be available for static builds.

>         bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/31447787e70cd351ce01b7a49ba029758d0c68e5/

Static linking or weird bfin prefix issue. If it's Blackfin related, I
would suggest to make this package unavailable on Blackfin.

>      sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/b527ccdbdfeaba6789528e68df93d9c7216e758a/
>      sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/d658f82c66d93515276dcb6cec8d3690459fbf05/

internal compiler error: in emit_library_call_value_1, at calls.c:3779

Waldemar ?

>     mips64el |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/293b9ff94c5e28802f3112eb764b62226aee8bea/
>     mips64el |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/b940f2faa567229dd9fd30041430ed3eea96e297/

Vicente, Gustavo, I am not sure to whom of you this falls. It doesn't
seem to be architecture related, but only happened on mips64el. Could
you have a look?

>          arm |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/c9efed5515383c1bee4184857bc21d7aced72b9e/
>          arc |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/73dad21de2d5667b8105f42f202fa4727e270912/

checking for dlopen in -ldl... no
configure: error: OpenSSL depends on libdl.

The OpenSSL support needs libdl.

>          arm |  toolchain-external-legal-info | NOK | http://autobuild.buildroot.net/results/19b282d784b7498f379847b5e37483f7a3bd3a63/
>          arm |  toolchain-external-legal-info | NOK | http://autobuild.buildroot.net/results/9d53e35e4908c4f594ad2870c00b09e9113f0e3e/

Temporary download issues. Peter, could you download the relevant files and put them on sources.b.o ?

>          arc |                        unknown | NOK | http://autobuild.buildroot.net/results/ae3cbba85934100f7f4dc7361de544f87d84d433/
>          arm |                        unknown | NOK | http://autobuild.buildroot.net/results/21e45cee04fd983c85c6702595ee3f7ed8470931/

Some dependency problem.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
