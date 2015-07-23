From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 23 Jul 2015 08:27:37 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150722094349.424e7a3e@free-electrons.com>
References: <20150722063018.99E6B101957@stock.ovh.net>
 <20150722094349.424e7a3e@free-electrons.com>
Message-ID: <CA+TH9V=AWp=R07B3E-baAgWS6puy3gvwMTGHMznScv4gbMd-9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

2015-07-22 9:43 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> Brendan, Alexey, Clayton, Gustavo, J?rg, Guillaume, Marcin, Waldemar,
> Nicolas, Bernd, Johan, R?mi, Paul, Max,Samuel, Vicente, Yegor, Yann,
> please have a look below. Some of the build failures need your
> help/attention. Thanks!
>
> On Wed, 22 Jul 2015 08:30:18 +0200 (CEST), Thomas Petazzoni wrote:
>
>>         success : 208
>>        failures : 146
>
> Quite huge number of failures, we probably need to do something about
> this. Let's have a look at this mess.
>
>>       x86_64 |                   acpid-2.0.22 | NOK | http://autobuild.buildroot.net/results/83f9b5216aab22d2f3de69328457590b40d27fd4/
>
> musl build issue, there was a proposed patch to fix this, but I wasn't
> really happy with it. See http://patchwork.ozlabs.org/patch/497874/.
>
>>          arc |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/b704016acfa38e7998739a2c70bcf6020c59bda8/
>
> Static linking issue with uClibc. Alexey is working on it.
>
>>          arc |              armadillo-5.100.2 | NOK | http://autobuild.buildroot.net/results/47f176ed06540b896a7d96ebea4cbf5bf92e42b7/
>
> .tbss issue, Alexey is working on it.
>
>>          arc |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/bc2dc2752caadfe85f02c9d708ba44a152f2127e/
>
> Same.
>
>>          arc |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/5360fdeb211a46dada1aac2bd242834fb615879f/
>>          arc |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/d74589bc1f582c7304c86b3435b613419ee9966d/
>
> Same.
>
>>      powerpc |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/3e85c2253f6bd4cfe6ac1dde947eb6d5afc78cfe/
>>      powerpc |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/d0f0f7e7462d68331d4a2f87b1df05cc9a6fecfd/
>>      powerpc |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/114de2422c56071141284fb2eb8044ffa48e77f4/
>>      powerpc |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/0862cf008e7e4b52c46c40257adeda954afee394/
>
> This is an audit problem: it is building stuff for the host, but using
> CFLAGS for the target. Clayton, can you have a look?
>
>>          arm |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/d963117fd6b5c59935035166b7cc32d53c008c2b/
>
> Probably needs to use argp-standalone with musl as well.
>
>>        sparc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/dd032aa7b387f3ba5b25bffcaf833ba0ea9ba199/
>
> sparc-linux-g++: error: unrecognized argument in option '-mcpu=c3'
>
> Gustavo, any idea?
>
>>      powerpc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/49f5c0521fc90fbd4673ad233ff679be007d2953/
>>      powerpc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/2ae4a83a22a1c172ec4778574b5c027d2c65540e/
>
> Wchar missing. J?rg, since you fixed the last wchar issue with boost,
> can you have a look?
>
>>        sparc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/1183ea468797b6b70a56b75066445b811704d211/
>
> Same SPARC error as above.
>
>>        sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/16b2aaad834bc19b3e35604e9bbcab7b6c060307/
>>        sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/98bbb53c0fa8bedf52e8f4507e4b00e631470c25/
>
> Atomic issue. Gustavo?
>
>>          arm |                     bwm-ng-0.6 | NOK | http://autobuild.buildroot.net/results/d8302a0e1f8a6cac9d91d7bff339cc901b31d46e/
>>          arm |                     bwm-ng-0.6 | NOK | http://autobuild.buildroot.net/results/3eb488068c167f3f1c009036c659b6ee6a9535ed/
>>          arm |                     bwm-ng-0.6 | NOK | http://autobuild.buildroot.net/results/e27ad662a2ca1f0482151d5136695105bd5b9e7d/
>>          arm |                     bwm-ng-0.6 | NOK | http://autobuild.buildroot.net/results/c78b6bc6c4a57046eeb87ab4d75ec7fb9c1a7f5e/
>
> Smells like a gcc 5.1 issue.
>
>>         i686 |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/2a07d48d638f20b9fb58923c37f7c44d4e4b72d5/
>>      powerpc |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/f66f128a05e80c5f4d072d019569b849615d94e6/
>>          arm |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/aa8988bb5f36491ce58681a52a11441353eb4dad/
>
> ERROR: unsafe header/library path used in cross-compilation: '/usr/lib/'
>
> Guillaume, since you are the original submitter or c-icap-modules, can
> you have a look?
>
>>          arm |             c-periphery-v1.0.3 | NOK | http://autobuild.buildroot.net/results/d659568db814cec9f21e591c49cfb64f73796748/
>
> src/spi.c:100:24: error: '_IOC_SIZEBITS' undeclared (first use in this function)
>
> musl issue
>
>>          arm |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/51dfa189ed674418c44acc601a200558bb58926f/
>>          arc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/b00dfcbeab9cbf68bda5069a28d7ed000fbceebb/
>
> checking for Boost's header version...
> configure: error: invalid value: boost_major_version=
> make: *** [/home/test/autobuild/instance-2/output/build/cc-tool-0.26/.stamp_configured] Error 1
>
> checking for the Boost program_options library... no
> configure: error: cannot find the flags to link with Boost program_options
> make: *** [/home/test/autobuild/instance-0/output/build/cc-tool-0.26/.stamp_configured] Error 1
>
> Marcin, you are the original submitter of the cc-tool package. Can you have a look?
>
>>         i686 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/182424bd2fea36af95eea31f7dd53f0399433616/
>
> Static linking issue:
>
> /ssd1/thomas/autobuild/instance-2/output/host/usr/i686-buildroot-linux-uclibc/sysroot/usr/lib/libpthread.a(lowlevellock.os): In function `__lll_lock_wait_private':
> (.text+0x0): multiple definition of `__lll_lock_wait_private'
>
> Waldemar, I don't remember, has this issue been fixed already in
> upstream uClibc-ng ?
>
>>          arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/58d3d2605337fe1ce49d333cb712941711276100/
>
> Weird C++ problem:
>
>   error: 'template<class T, class A> std::size_t cppcms_boost::hash_value' conflicts with a previous declaration
>
> Nicolas, you are the original submitter of cppcms, can you have a look?
>
>>       x86_64 |                     cramfs-1.1 | NOK | http://autobuild.buildroot.net/results/e89e2582a426e1838808e9469d043c969396dbf2/
>
> mkcramfs.c: In function 'main':
> mkcramfs.c:743:2: error: unknown type name 'loff_t'
>   loff_t fslen_ub = sizeof(struct cramfs_super);
>   ^
>
> Musl related issue.
>
>>          arm |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/4f543f140261d294fa641be0aa9174fd5334c17c/
>>          arm |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/25127b72321c3cdf778afda1f4e99fc622281705/
>
> Should be fixed by http://patchwork.ozlabs.org/patch/493343/.
>
>>          arm |              exfat-utils-1.1.1 | NOK | http://autobuild.buildroot.net/results/c60d0f9a93c90d41c3c86c78b0a07ddfed22c56d/
>
> libexfat/platform.h:60:2: error: #error Unknown platform
>  #error Unknown platform
>
> Don't know. It's a build with musl, maybe that's the problem?
>
>>     mips64el |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/69cb66c6c4ff832b66437ab80cd6de3f60485ea1/
>>       x86_64 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/06321f6baddfa0461285fd22511b64c8503d2ed0/
>>        nios2 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/b96d2aa7829acab2a186e4840d25b7e9e50769f5/
>>          arm |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/de29c661333c8c7a225b46aab999424beb59894a/
>>       xtensa |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/903704fa469dcea5f59a62bbf3c7f838dd2a749c/
>>     mips64el |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/74f59a99a00fba119f31c1687a0e78f430767d2a/
>
> SourceForge download problem, ignore.
>
>>      aarch64 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/9ad5bbc1c5b1d172e531f05dade9cc56f59bb352/
>>     mips64el |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/dad954767a4baa358c01613616bc4f599c03dac3/
>>         sh4a |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/8539102de9c70cf685f85c3d073858c3115c7eab/
>>          arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/a79ccae103414336adff2f20a240e5e63d4e1cec/
>>          arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/422dbe84d1c7021e7c8b8e61592fe69329a2769e/
>>          arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/53719b9197532ceafba6da0502523895d687e993/
>>       xtensa |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/7f266945274b0fbc39c9a97c0de4cc1e5fd00e61/
>>          arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/10cefc8c3725350ea1ba0d40391488cfeb839e5d/
>>      aarch64 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/3f983bb0eacc2453b123b06241ddfe2b8ab29f03/
>>       xtensa |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/428336d214fefb633ef187824181a5c7b0238971/
>>      powerpc |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/0e16204e8e91a7a0e3cfc55a1d7f7ab6e28efdb2/
>>          arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/bc99b0121562b2a5f4bcd9902820e6b976af54f1/
>>     mips64el |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/a96ca16911fc3f53fcfd9bfa1d90a5a3c45531c3/
>> microblazeel |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/3289b1b460664af5f10ce1c2b5d398b4514fe6d7/
>>       xtensa |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/ed7bdbf9b9eed593900df7b8fd0df66edcb08bdf/
>
> SourceForge download problem, ignore.
>
>>     mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/0de880719c243d49b05705aceae7ec0007d0193c/
>>     mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/62811726f4a1a993c84ea6787a150f6a35ad305a/
>>       mipsel |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/525659097f8517e14ced5878c8820459bd25ccf7/
>>         mips |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/da03fb5741fb2235aadb021ab919f08abb118b17/
>>     mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/09f669cb892d55256c38c6da5fd79dd8972e36dd/
>>     mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/5903d6dbd0e0b64b5ef879445f552229f3c2d263/
>>     mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/ba604b7543c654003dd04b40f0de768d2480c68f/
>>     mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/6460a7c4a19f71684f50ad66d7cd57561fe963db/
>>     mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/bdebcecc4de764afdb22f34f1a31490608a0492d/
>>     mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/dae417dc1d585b1386effd87c9a71f460633177c/
>>     mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/2e3594f6ce2ce722e7c4330656fddd8094d52a51/
>>     mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/9e164507ffb4282b7b3e79a2bd8e8a1fa4350679/
>>     mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/c7bc81ecd1fc125eb741b2e15c5a4db862c2a976/
>>       mipsel |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/bda2df7a0466ec2769e22d6913b9a4af51139088/
>>     mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/b9107d34fd8d5d15018f5f7316737cc047f70bb4/
>>     mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/da87b7fa8689a18798a229a988c4cd9268c7c54c/
>>     mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/12286b94d9f90297da46e6f2a9744d4e7279e500/
>>     mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/7c80764d1e1004022bd02953a47cc1b391b35ffd/
>
> Tries to use <msa.h> while the toolchain doesn't have it. Bernd, can
> you have a look?
>
>>          arm | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/ba8e353e23c693eb7e2f7a2263e320d882840425/
>
> checking for gawk... (cached) mawk
> checking for zmq_init in -lzmq... no
> configure: error: cannot link with -lzmq, install libzmq.
> make: *** [/home/test/autobuild/instance-0/output/build/filemq-482797b8aa30fcc9ea1377aabdf2b0769f9f698e/.stamp_configured] Error 1
> make: Leaving directory `/home/test/autobuild/instance-0/buildroot'
>
> Static linking issue.
>
>>       x86_64 |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/4b1dac8443511a27678729e067c1dec3966820b6/
>
> /home/peko/autobuild/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/4.9.3/../../../../x86_64-buildroot-linux-uclibc/bin/ld: /home/peko/autobuild/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/4.9.3/crtbeginT.o: relocation R_X86_64_32 against `__TMC_END__' can not be used when making a shared object; recompile with -fPIC
> /home/peko/autobuild/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/4.9.3/crtbeginT.o: error adding symbols: Bad value
> collect2: error: ld returned 1 exit status
>
> Zoltan, you are the original submitter of this package, can you have a
> look?
>
>>          arm |                harfbuzz-0.9.41 | NOK | http://autobuild.buildroot.net/results/d81fe547227ffcbd270f2a00beb572755ab668f6/
>
> Discussed in http://patchwork.ozlabs.org/patch/473622/.
>
>>          arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/d475f6d7960d8eb774d35d238c46bf1a7128c791/
>>          arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/d4ae8c5e824de02801337bd856fa62a308456ef3/
>>      powerpc |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/8617c4791b4c8b29423dc2fe0067c4751069a748/
>
> Johan, can you have a look at these issues? They are not spurious
> timeouts: the build of host-erlang-rebar is really blocked. I already
> analyzed this problem some time ago, and gave some details on the
> mailing list.
>
>>      powerpc |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/a07198b3f7f8029d80863a998814877ec9994c60/
>>      powerpc |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/a6d22f80938fa19933940a19664c2354e01a871f/
>>      aarch64 |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/cd15555cf90dddacdbf9599313e6e0a118049b38/
>
> Parallel build problem. We'll make host-heimdal build with $(MAKE1) in
> the mean time. Gustavo, can you submit a patch to this effect?
>
>>       x86_64 |             host-nodejs-0.12.7 | NOK | http://autobuild.buildroot.net/results/2ee123ec8773bbcc6ef7ecd3f0b8050547a3340e/
>
> Temporary download problem, ignore.
>
>>      powerpc |                 iproute2-4.1.1 | NOK | http://autobuild.buildroot.net/results/5c15e180973425a742629e9e8d0a56e1913d8c03/
>
> Smell very much like a too old kernel headers problem. Gustavo?
>
>>          arm |                kodi-14.2-Helix | NOK | http://autobuild.buildroot.net/results/1eefd8e23d8e1b4374c79201b4c631603372d431/
>
> checking for main in -lEGL... no
> configure: error: Could not find a required library. Please see the README for your platform.
>
> Bernd?
>
>>       x86_64 |                 libedje-1.7.10 | NOK | http://autobuild.buildroot.net/results/6b1e2132a34e0c263bb0f2ea31caf4ce697e9c9c/
>
> Another uClibc static linking problem. Waldemar?
>
>>      aarch64 |                  libepoxy-v1.2 | NOK | http://autobuild.buildroot.net/results/4b91baf853bd5d5aa416e9dc11fda2ce27723d12/
>>     mips64el |                  libepoxy-v1.2 | NOK | http://autobuild.buildroot.net/results/ef338817d476802b585d6272cf15c8a96d9614a6/
>
> ../include/epoxy/egl_generated.h:10:29: fatal error: EGL/eglplatform.h: No such file or directory
>  #include "EGL/eglplatform.h"
>
> Bernd? Maybe this is fixed by
> http://patchwork.ozlabs.org/patch/469121/, but my questions remained
> unanswered.
>
>>      powerpc |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/4d8c76b1fcd9e4267d202a6c62358fc641761228/
>
> Needs wchar support. R?mi, you are the original submitter for
> libfreeimage, can you send a patch to add the wchar dependency?
>
>>       x86_64 |                   libftdi-0.20 | NOK | http://autobuild.buildroot.net/results/4d0009cf6f5b294d2246286e1383f663a4215648/
>
> Build issue with musl. Anyone to look into this?
>
>>        sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/530bd5b0c9a46c9d4aea249bb308b116806c43a4/
>>        sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/20f10276ee40cac4dda38904f784e72f479a5264/
>>        sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/908f7cd2434bc4235683c8cce079b839b783764a/
>
> Atomic problem. Gustavo?
>
>>          arm |                     libiio-0.5 | NOK | http://autobuild.buildroot.net/results/5b0d02aa3bdb4cddb0d316c99fada2e7ba9f9c1d/
>
> libiio build problem. Paul, can you have a look?
>
>>          arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/f08644d1ff3e769a86c4f8a3b60e40abb5f0a64e/
>>          arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/4848ead8ccf4fb7b0ff582c0fac94ce9b00fd341/
>>          arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/196b28f2ecf12a03390c806b5f4e9f34577998b7/
>>          arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/71ee8b5b2dce1d9f096c3667cd59eaf4a3b9af2b/
>
> /tmp/ccY5Q1ef.s: Assembler messages:
> /tmp/ccY5Q1ef.s:475: Error: internal error: fixup not contained within frag
> Makefile:138: recipe for target 'setrans_client.lo' failed
>
> Alexey ?
>
>>      powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/f02e721e1812d03b5990884aa8f8ff09dd88272c/
>>      powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/bf17b998dcdb81f37776765ca200e0e5c344bada/
>>      powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/1b38f55602c7aff2afae6f2588e0a8f04b80b09d/
>>      powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/b7d703cf97345463af373217fb90e076bb3dbeb6/
>
> Compiler too old. Maybe exclude the toolchain for now?
>
>>          arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/9bdd9a8514a297a07bfef341b4545080e7798201/
>>          arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/55223f7c75e3ab21bb43af18594a5d28f02b7d30/
>>       x86_64 |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/7420ea57d0659ec308c0f102d496f02ed0e4d640/
>>          arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/aa6eecb7d86c63bf79c795a2d121f300ecb05baf/
>
> musl build issue. Should be fixed by
> http://patchwork.ozlabs.org/patch/497913/.
>
>>          arm |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/848f6223e1634921f36056c1d468a1d5faf5777b/
>
> Another musl related problem?
>
> pam_lastlog.c:248:32: error: '_PATH_LASTLOG' undeclared (first use in this function)
>       "file %s is locked/read", _PATH_LASTLOG);
>
>>          arm |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/96ce76ea8952958ac233d904a33413dc3ddff156/
>
> drv_admin.c:16:19: fatal error: dlfcn.h: No such file or directory
>  #include <dlfcn.h>
>
> Seems like we need dynamic library support.
>
>>          arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/4422287dfd556546eca59096391baf99084f98d4/
>>          arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/2e6bfa64b356e4e9170398bc360d989f647b25e6/
>
> GCC 5.x build issue.
>
>>          arm |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/25536df514477f3210caf4af27f2f107683f7fb2/
>
> checking for avformat_open_input in -lavformat... no
> configure: error: Could not find libavformat - part of ffmpeg
> package/pkg-generic.mk:146: recipe for target '/home/buildroot/build/instance-0/output/build/minidlna-1.1.4/.stamp_configured' failed
> make: *** [/home/buildroot/build/instance-0/output/build/minidlna-1.1.4/.stamp_configured] Error 1
>
> Bernd, maybe?
>
>>          arm |                mongrel2-v1.9.1 | NOK | http://autobuild.buildroot.net/results/29a3c06653c95cf238fe5abc051270a6b6c4bd5b/
>
> Another zmq static linking problem, missing -lstdc++ somewhere.
>
>>          arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/5e11117048d965bc1fc44c738bb51f11164304af/
>
> /home/peko/autobuild/instance-2/output/build/mono-4.0.2.5/eglib/src/.libs/libeglib.a(libeglib_la-gunicode.o): In function `monoeg_g_get_charset':
> /home/peko/autobuild/instance-2/output/build/mono-4.0.2.5/eglib/src/gunicode.c:223: undefined reference to `locale_charset'
> collect2: error: ld returned 1 exit status
>
> Needs locale support?
>
> Angelo, can you have a look?

I will look into this ASAP!

Sincerely, Angelo

>
>>      powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/aa008f6ea8efede4d760fe86b8b91a55471eaa37/
>
> Same.
>
>>          arm |                  netperf-2.6.0 | NOK | http://autobuild.buildroot.net/results/077714a0ee67057abcff680b244228a409243bbf/
>
> Smells like a GCC 5.x issue:
>
> nettest_omni.o: In function `send_omni_inner':
> nettest_omni.c:(.text+0x5688): undefined reference to `demo_interval_tick'
>
>>          sh4 |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/f89a80c90b4e8bbd910aebc1a1495a9e55b243dc/
>
> /tmp/cc880Ahp.s: Assembler messages:
> /tmp/cc880Ahp.s:19803: Error: pcrel too far
> make[3]: *** [modules/video/CMakeFiles/opencv_video.dir/src/ecc.cpp.o] Error 1
>
> I'll re-exclude OpenCV with the SH4 toolchain.
>
>>       xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/dd384fe0ef02a4205bea66a4a16ca2062afe53b4/
>
> /tmp/ccHCSuXp.s: Assembler messages:
> /tmp/ccHCSuXp.s:114393: Error: operand 2 of 'l32r' has out of range value '4294705124'
> /tmp/ccHCSuXp.s:114397: Error: operand 2 of 'l32r' has out of range value '4294705068'
>
> Max ?
>
>>       x86_64 |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/0a9e2c887c91197089d53754b3ca6726adebe68b/
>>         i686 |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/5b1f72208acf79dfe4164df25f039027e3556671/
>>          arm |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/ee4d7c54c4b1bd08d11b1c5eb10d5fa759e9c9c1/
>>      powerpc |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/4347eed5c460df0771b581d70f0067b72cb42fd3/
>>         i686 |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/6b6a7d8e45ee7f0ae4682567b3983590aea9ee10/
>>          arm |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/b2ec60e783345419c4cc688af1cdcc5270debc57/
>>       xtensa |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/aba106a1b74161c8e9c741180e79ecf437702371/
>
> These should be fixed by http://patchwork.ozlabs.org/patch/498396/.
>
>>         i686 |                  openssh-6.9p1 | NOK | http://autobuild.buildroot.net/results/dce0202e039f4636d68532c4aab8738938b76650/
>
> Weird build issues. Gustavo?
>
>>       xtensa |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/a15c8b5cf90935e42d4605f7f95ff1814c94254c/
>>      powerpc |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/f444ab04da5423db032bc12824da5f577156e957/
>>         bfin |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/bf6b9bcc0cead87c8fb12ec4c7f5ff73e6d61d3f/
>>         bfin |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/881f1e09ad3ba0c62f04349764446d4436a28781/
>
> Some should be fixed by http://patchwork.ozlabs.org/patch/495849/, but
> definitely not all of them. Samuel, since is package is CMake based,
> can you have a look?
>
>>     mips64el |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/cddcc7413680a8e9ec5c1862eb0bbac431bc5961/
>>     mips64el |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/272b4acf7dea6de07d24dda4e23e41b412ffc8c6/
>>     mips64el |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/a605608b723993352016d2aa6ae0e1b4aa03c0dd/
>
> Vicente, a MIPS problem for you :-)
>
>>         i686 |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/06ca186eb9be52b455806d9e965a95c1f6197790/
>>         i686 |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/87e378800a2045f2768a912db28e630088da6f56/
>
> platform/graphics/gstreamer/WebKitWebSourceGStreamer.cpp:357:9: error: reference to 'GMutexLocker' is ambiguous
>
> See https://codereview.qt-project.org/#/c/107411/. Hopefully fixed in
> qt 5.5 which I committed yesterday;
>
>>        nios2 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/e67ef47ea9ff4cbb012d374b3b290fb7bddf7ef3/
>
> /home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/4.8.3/../../../../nios2-linux-gnu/bin/ld: indexcon: No symbol version section for versioned symbol `qpol_policy_rebuild@@VERS_1.3'
> /home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/4.8.3/../../../../nios2-linux-gnu/bin/ld: final link failed: Nonrepresentable section on output
> collect2: error: ld returned 1 exit status
> Makefile:599: recipe for target 'indexcon' failed
>
> Probably some toolchain issue. Easiest solution is to exclude setools
> from NIOS II. Clayton?
>
>>         bfin |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/2ee84c0dc027912e059ca4ae518d6f11fd8317a7/
>>         bfin |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/401e4c48f4d865b2722f284f1038e25c5d420f43/
>
> Probably the infamous _ prefix used in Blackfin symbols. Maybe we can
> also just exclude setools on Blackfin. Who would want SELinux on a
> Blackfin DSP with noMMU anyway?
>
>>          arc |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/ff7cbcbb32dc46bfd008241da4113f79cf440e97/
>
> .tbss issue. Alexey is already working on it.
>
>>          arm | socketcand-8339e62a6bf60be5... | NOK | http://autobuild.buildroot.net/results/8eac9832554dbd1f2e14cf54e5c99e6bf4dfc2cc/
>
> GCC 5.x build issues. Yegor, can you have a look?
>
>>          arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/5c310f4d8ffebca048074660de6707a8fc598778/
>
> Temporary download problem, ignore.
>
>>         bfin |           usb_modeswitch-2.2.5 | NOK | http://autobuild.buildroot.net/results/7417400bf7ce37d2c37e36b5ed31b2dc3e6cf382/
>>         bfin |           usb_modeswitch-2.2.5 | NOK | http://autobuild.buildroot.net/results/05c9e0504af6a6630890f0cff8fdb0033f8b41ff/
>>         bfin |           usb_modeswitch-2.2.5 | NOK | http://autobuild.buildroot.net/results/1f1daec5e7547fd7a1739ce43269110ccf2a5224/
>>         bfin |           usb_modeswitch-2.2.5 | NOK | http://autobuild.buildroot.net/results/3103c9028269a20aa6c53159a48f198e81c90303/
>>          arm |           usb_modeswitch-2.2.5 | NOK | http://autobuild.buildroot.net/results/55beb7af1392cd2bedddee01edde83ce1bbcac6a/
>
> Gustavo, you're regularly bumping usb_modeswitch. Can you have a look?
>
>>          arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/0e114a9b6289cbced6be94a218383fb012284853/
>
> ustr-cmp-code-so-dbg.o: In function `ustr_pool_make_subpool':
> ustr-cmp-dbg-code.c:(.text+0x0): multiple definition of `ustr_pool_make_subpool'
> ustr-b-code-so-dbg.o:ustr-b-dbg-code.c:(.text+0x0): first defined here
>
> Smells like a GCC 5.x issue.
>
> Clayton, this is for you :-)
>
>>          arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/c7fc621245351eb31afab1b96d3f1f2e6ad0bfad/
>
> checking for GLES2/gl2.h... yes
> checking whether to use OpenGL ES 2 support... configure: error: Cannot enable OpenGL ES 2 support without EGL
> package/pkg-generic.mk:146: recipe for target '/home/buildroot/build/instance-0/output/build/webkit-1.11.5/.stamp_configured' failed
> make: *** [/home/buildroot/build/instance-0/output/build/webkit-1.11.5/.stamp_configured] Error 1
> make: Leaving directory '/home/buildroot/build/instance-0/buildroot'
>
> Bernd, Gustavo?
>
>>       x86_64 |                   weston-1.8.0 | NOK | http://autobuild.buildroot.net/results/77501a806fb5f147912e70935b53c9c0a4cb1e74/
>
> RDP compositor doesn't build:
>
>   CC       shared/libshared_la-file-util.lo
> src/compositor-rdp.c: In function 'rdp_peer_init':
> src/compositor-rdp.c:1109:10: error: 'rdpSettings' has no member named 'SurfaceFrameMarkerEnabled'
>   settings->SurfaceFrameMarkerEnabled = TRUE;
>           ^
>
> Yann ?
>
>>      aarch64 | x264-c8a773ebfca148ef04f5a6... | NOK | http://autobuild.buildroot.net/results/474aabb69017c2283daf5cdd83cbd050c1b5023f/
>
> Don't know what's going on. Bernd?
>
>>          arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/9ba4de85136e9ac4a68dcb7ee4285e03168d4a15/
>
> Toolchain problem:
>
>   CXX      libzmq_la-sub.lo
> socket_base.cpp: In member function 'void zmq::socket_base_t::event_connected(std::string&, int)':
> socket_base.cpp:1157:1: error: Internal consistency failure: cfi row mismatch [-Werror]
>  }
>  ^
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
