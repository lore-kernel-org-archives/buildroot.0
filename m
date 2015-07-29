From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jul 2015 10:03:34 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150729063017.EDA6D101EBC@stock.ovh.net>
References: <20150729063017.EDA6D101EBC@stock.ovh.net>
Message-ID: <20150729100334.00137b70@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Clayton, Guillaume, Samuel, Gwenhael, Gustavo, Brendan, Paul, Bernd,
Angelo, Maxime, Simon: see below, there are some questions for you.
Thanks!

On Wed, 29 Jul 2015 08:30:17 +0200 (CEST), Thomas Petazzoni wrote:

>         success : 205
>        failures : 108

So about 1/3 failures, 2/3 successes. Overall stats:

	Issues already fixed:		26
	ARC toolchain issues:		19
	Misc issues:			16
	Musl issues:			10
	SourceForge download issues:	 9
	Quota package issues:		 8
	Static linking issues:		 5
	Gcc too old issues:		 5
	Xtensa toolchain issues:	 3
	Atomic issues:			 3
	gcc 5.x issues:			 1

>       x86_64 |                   acpid-2.0.22 | NOK | http://autobuild.buildroot.net/results/7f25bb30f536b7528266c164a71d6e0761a53545/
>       x86_64 |                   acpid-2.0.22 | NOK | http://autobuild.buildroot.net/results/e3e2a6af2df4558e20033e88815d3b504d453a10/

Musl build issues, fixed by
http://git.buildroot.net/buildroot/commit/?id=1b53609f993bf52c4b201d412fd88a38b334ab62.

>          arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/9721496871d104b4cfb68ce133b5f48612cb7e50/
>          arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/b90b4f9fdb133443113e515fb0509e3880f86879/
>          arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/efdc5c028ef79c5d04b7197b1c3491cac3a52f28/

Musl build problem:

fatal error: sys/cdefs.h: No such file or directory

>          arc |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/a0c55e4692fd94a21236479a7c108e7d75ed2068/
>          arc |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/dd6d2caea475ed488cd6529025125eb8754cffa9/
>          arc |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/c3a3df683357dc476c14e3c26b8361692b7e5767/
>          arc |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/d88244e0a6d28bd6fcff121e0a6babf6a75bdaa7/
>          arc |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/d7a7606ab07515225c7bd69623da9a19498d1f60/

All ARC toolchain problems.

>          arm |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/d5c8e623694728d984bf45a5a0160736b7833d55/
>          arm |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/ede16704d84d7df2fefd29d91dfa261a1cdef0e4/

musl build problems. Clayton, can you have a look?

>          arm |                bootutils-1.0.0 | NOK | http://autobuild.buildroot.net/results/44b00ad46e685dc2d92ac32a2eddc2083088505f/

raidscan.o: In function `main':
raidscan.c:(.text.startup+0x38): undefined reference to `makedev'
collect2: error: ld returned 1 exit status
Makefile:261: recipe for target 'raidscan' failed

static linking issue, maybe?

>          arm |              btrfs-progs-4.1.2 | NOK | http://autobuild.buildroot.net/results/b97f1e9cd459da96e3e1680bb7c43d8103ab12c2/

error: 'PATH_MAX' undeclared (first use in this function)

musl build problem.

>          arc | bullet-19f999ac087e68ffc255... | NOK | http://autobuild.buildroot.net/results/36a47503f8360149ea22660e39d9a049cb0f7f79/

ARC toolchain issue.

>          arm |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/cb623460de30dd7c4ef3275fe13220c1ca0642a5/

c_icap-service.o: In function `load_c_service':
service.c:(.text+0x710): undefined reference to `ci_module_load'
service.c:(.text+0x720): undefined reference to `ci_module_sym'
service.c:(.text+0x774): undefined reference to `ci_module_unload'

Unknown, already happened yesterday. Guillaume, can you have a look?

>          arm |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/2dc978bded498e6116422f32720e1035d9c29507/

gcc 5 issue, already fixed by
http://git.buildroot.net/buildroot/commit/?id=9c7182f30ccd52b1028b69516803bfcba1ec6812

>       x86_64 |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/117479b2fe7c8416ea2bcf65b721395ebdb17bd8/

Probably a musl issue. Samuel, can you have a look?

>          arc |                 cppunit-1.13.2 | NOK | http://autobuild.buildroot.net/results/2e5526e794fa62856fcdfdbf33278e41e2bf52a0/

Portability.h:121:21: error: 'CppUnit' does not name a type

Not sure what's going on. Any C++ person to look into this?

>       x86_64 |            dmraid-1.0.0.rc16-3 | NOK | http://autobuild.buildroot.net/results/e49d781a31f539fc961843ff779ec80fa6fced9a/

error: '_PATH_MOUNTED' undeclared (first use in this function)

musl problem. Any taker?

>       xtensa |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/8ac227ff6d8d052ea7d00f249ea11fb3037147f7/
>          arm |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/fe8857b6013dbc6342c2a4b06ab90c4229e8077b/
>      powerpc |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/aa473c992a506e6218ea0e29eae19c615f1678e3/
>       x86_64 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/bfc6797beed8db9b921d444e856fddf6f6a74ed3/
>         i686 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/f65f36f38397f076050ca2dfbbb7961928906a0b/
>       x86_64 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/0e4b1f1625a6ba790cd9d68059f783f961793eb6/
>      aarch64 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/deabb60ea38d4d6b7f7ac882a5c8c3446bc4dcc5/
>         sh4a |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/fb0332a378dd9572494b0d5314189a2b680bc83c/
>         sh4a |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/08efeea07be5b565756ddecda4c0c2b87c80dc66/

Download problems.

>          arc |                     fltk-1.3.3 | NOK | http://autobuild.buildroot.net/results/c5a884764ee731fd234856085d83f599b19ef9c5/

ARC toolchain problem.

>          arc |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/d0c884379e6d00c30e51755ca23f3cfff3755bf2/

Same.

>       x86_64 |                 gnuradio-3.7.5 | NOK | http://autobuild.buildroot.net/results/f79203ecba17e1195de7b9f533994fc6d671028e/

error: 'mode_t' has not been declared

musl build problem. Gwenhael, you are the author of the gnuradio
package, can you have a look?

> microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/f284c5c23705f76dea9f502fa581e5383008dee0/
>          arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/9bca274f6f7331f60b9563a449fbf02b37bdf7ad/
>          arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/321c5888ce18aa4d9f428efdf4e1b844c4023345/
>          arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/c7bb82f38b36f499f75bd8e68ade1f6aba1c2219/

Misc timeouts, including the infamous host-erlang-rebar one :/

>      powerpc |                 iproute2-4.1.1 | NOK | http://autobuild.buildroot.net/results/3657c60eaddc3626a89deac3abac8971584f4126/
>      powerpc |                 iproute2-4.1.1 | NOK | http://autobuild.buildroot.net/results/fa810f310c7540e02c0ed84c4a3ce74ab602daa5/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=869af2ad3de46c79677699f007a5ee942aa0bb3d.

>        sparc | libatomic_ops-libatomic_ops... | NOK | http://autobuild.buildroot.net/results/03b3122f27916eab19d635df7ce28acb1e330f69/

Atomic operation issue. Gustavo, Brendan maybe?

>      powerpc |                  libebml-1.3.1 | NOK | http://autobuild.buildroot.net/results/f86e7a07863cce31fa188e134e52ed6937338846/

In file included from src/EbmlUnicodeString.cpp:44:0:
./ebml/EbmlUnicodeString.h:60:26: error: expected ')' before 'const'
   UTFstring(std::wstring const &);

Don't know. Some random C++ issue.

>          arm |                  libepoxy-v1.2 | NOK | http://autobuild.buildroot.net/results/baa00eabdc736627c88fcb609acedb0383204b12/

The usual EGL failure.

>      powerpc |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/6e9f2bf02e0a165826e9fab194d6bad7901051a9/

Source/FreeImage.h:817:77: error: unknown type name 'wchar_t'

Seems like we need wchar support for libfreeimage. Any taker for this easy patch?

>        sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/3eb14acd65ee606cda9686525b6b1d3094a866cd/
>        sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/cd40a2c0d10f8a0cc104ca82c5686d1e7cc9f26f/

Atomic, fixed by
http://git.buildroot.net/buildroot/commit/?id=e4a707e79838680984cd4bb25b5a9959fc44ddc8.

>     mips64el |                libiscsi-1.15.0 | NOK | http://autobuild.buildroot.net/results/c07f03755d246ed2047fb4d1a8f5f9e91a30831f/
>     mips64el |                libiscsi-1.15.0 | NOK | http://autobuild.buildroot.net/results/f7e848cf6dd8852365d6a5cff24b0e2dd302a213/

gcc vs. ld issue, fixed by
http://git.buildroot.net/buildroot/commit/?id=84471f1e4b531a262e8f4d2423baf5257ecd29fc.

>      powerpc |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/e1414b1af8bab539221656cdc978d152ce8f66b8/

Tries to generate a shared library in a BR2_STATIC_LIBS configuration.

>      aarch64 |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/547739a745f838e1685cf2aac630ae5ab05712ee/
>       mipsel |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/7d0ad8dceffcd41ba5932bde95c7d51d24751c4b/
>          arm |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/f8074f0a278a07c47834d76cae647f1706a78c33/

pth_mctx.c: In function '__pth_mctx_set':
pth_mctx.c:480:2: error: #error "Unsupported Linux (g)libc version and/or platform"
 #error "Unsupported Linux (g)libc version and/or platform"
  ^

To be investigated.

>          arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/e60ef93ee9121be10fb2bc1b6860ae9b43f720a3/
>          arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/d127dbf1c0461a355dcbe59e4c76a59a1efdfae7/
>          arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/32105cec1594d43a625131bc6b16e12559d2776e/
>          arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/a732d4c604489fedeb12e970cf1de55b68f2ddc9/
>          arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/d8b7bc49b5091262677b11b3c1d2aa1d3d48b697/

ARC toolchain issues. Alexey, is this specific problem fixed by the
latest ARC updates?

>      powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/bbd8f786775c1a77219908210f52346652104b4f/
>      powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/7a31bd79eececd008549a9bb180f030eedbd32a9/
>      powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/3941bc90180892d01902687bfd2cab7325ef4fab/
>      powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/73f852a7302c2609afe8492b0ac69ecf1de0d152/
>      powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/37f875c435ecd7038ae85158756b8f711477f222/

Too old gcc.

>          sh4 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/629cbae701c3057940a63d7b938cc01e3bad881c/

error: unknown type name 'ucontext_t'

Should probably disable libsigsegv on SuperH.

>          arm |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/746d20ad19dc1a79bb74ed6aa348050fcca2b18e/

Tries to link with -ldl in a static library build. Paul, you are the
original author of the lightning package. Can you have a look?

>          arm |       make: *** [_all] Error 2 | NOK | http://autobuild.buildroot.net/results/cca3116a058a5b857776907440d95f0fdd36def8/

PAM issue with musl:

error: '_PATH_LASTLOG' undeclared (first use in this function)

Clayton, can you have a look?

>      powerpc |       make: *** [_all] Error 2 | NOK | http://autobuild.buildroot.net/results/3640f74037e1f7ebe658edf37fe974f1bb6b7550/

iproute2 kernel header problem, already fixed.

>          arm |                  mesa3d-10.6.2 | NOK | http://autobuild.buildroot.net/results/6e313e2a4b2ff092d187ac564f25c14aaaceb0dd/

checking for LIBUDEV... no
configure: error: Cannot use static libraries for DRI drivers
make: *** [/home/test/autobuild/instance-1/output/build/mesa3d-10.6.2/.stamp_configured] Error 1
make: Leaving directory `/home/test/autobuild/instance-1/buildroot'

Bernd, can you have a look?

>       x86_64 |                   midori-0.4.6 | NOK | http://autobuild.buildroot.net/results/34c31adb95edd07f08257dacf4a7f48e4049fc72/

vala/midori compatibility problem, Gustavo warned about this one. We
need to merge the remaining webkit/midori updates from Gustavo.

>      powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/f7863af051b2b856280a944749b91ba5b552b53d/
>          arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/08ec78b88abd16af8e7fc3c5e7d05eb0dbbe9613/
>      powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/aebfbd4e7fe46edbd3798563df28b4d89903becd/

locale problem. Angelo, can you investigate ?

>      powerpc |                  mpg123-1.22.2 | NOK | http://autobuild.buildroot.net/results/b4f229b0f7e8c36e19e3cf6e21506d4876f30749/

checking for snd_pcm_open in -lasound... no
checking if you are too dumbing dumb for the dummy... no
configure: error: One/some of your requested audio modules failed the test!

Not sure. Anyone to look into this?

>          arc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/17808e50f3c8963875bb950b44c475b5f243c560/
>          arc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/78bbcebd249d604890cefd5c95b5474cfec3255e/
>          arc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/59c3891ab16b8b1ba731058044633fa6b0769249/

ARC toolchain issues.

>          arm | net-tools-3eb367aedf1280f35... | NOK | http://autobuild.buildroot.net/results/e36635ad58dc191db58bc78443bafe8bbb87985a/

Missing -lintl when static linking:

undefined reference to `libintl_gettext'

Anyone to investigate?

>          arm |                 netatalk-3.1.7 | NOK | http://autobuild.buildroot.net/results/edcd3db6ad071e52f5ed5e5265e2f6af76779219/

afpd-uam.o: In function `uam_load':
uam.c:(.text+0x18): undefined reference to `mod_open'
uam.c:(.text+0xd0): undefined reference to `mod_symbol'
uam.c:(.text+0x1b0): undefined reference to `mod_close'

Static linking issue. Maxime, netatalk is your package, can you have a look?

>          arm |                      ola-0.9.6 | NOK | http://autobuild.buildroot.net/results/e14e1700d4fe359c56be57587bdb509e002e5753/

undefined reference to `ola::network::TCPSocket::ReadDescriptor() const'

Simon, can you have a look?

>       xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/762327dd24b0f6053c0a2ce712da9604344592e1/
>       xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/6fa8d70f8ccf937680c6740a6adbc943d79a5987/
>       xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/2e7315c8589f50bb0a002eb39b11ee15211843a8/

Xtensa toolchain problem.

>          arm |                protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/deeccf52fa62a647cb5b0a3781519b5abd08a2db/

Weird:

make[4]: *** [atomicops_internals_x86_gcc.lo] Error 1
make[4]: *** Waiting for unfinished jobs....
make[4]: *** [stringprintf.lo] Error 1
make[4]: *** [extension_set.lo] Error 1
make[4]: *** [common.lo] Error 1
make[4]: *** [atomicops_internals_x86_msvc.lo] Error 1

it looks like a parallel build problem, but not sure.

Anyone to look into this?

>       xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/96763264226fcd6160c4792005c0e618aa4a82e0/

Static linking broken:

compiling plugin/qlibrary_unix.cpp
plugin/qlibrary_unix.cpp:67:19: fatal error: dlfcn.h: No such file or directory
 #include <dlfcn.h>


>       x86_64 |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/002f98d33729963ae4c9b31d7bbccc1a9e09c547/
>      aarch64 |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/63bfee000256e27fe0ed5796710541387bcfa173/
>     mips64el |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/b81a57b09d0aa6a9b117ea2a87f67ff36319d7bf/
>      powerpc |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/d9ae6d4b3a73b2db3bd92488d9d0207b69a69f00/
>      aarch64 |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/baf104c7613c6f5e4fd9728ece8b9d9548b6714c/
>          arm |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/39e47f1d89084b9885d0db1637c30c208cf3fd3d/
>         i686 |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/a08bc5f677e684b1298088bc1424706228950376/
>         mips |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/adcce9b946fcc9867eb089cf5946786757fad31e/
>          arm |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/f924e34bb5f6df83f5761b5bc863137a538756f6/
>       xtensa |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/b29db9dbd3b954b8afc5d63e2f3f79ce04d3b630/

These should all be fixed by
http://git.buildroot.net/buildroot/commit/?id=34b4e42a2cfcc829bd5a926703a543ecf5f50b2c.

>         sh4a |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/bba8faf210414d956cc07629b8ba99ceed0ebdf6/
>      aarch64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/f525b48e2982adc4987cb772be92eeda30569c13/
>      aarch64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/0d2c2cd0bda1dd3c1e137117df535d8e02d67e8b/
>          arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/a815a4f943e6a07f87f8f6bbf9910459575db311/
>         i686 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/1b72769e65444322de4bfcb02200b7d999f9f5c1/
>          arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/195f6c34904b8185d44611c3d56084cb7d3e8a14/
>     mips64el |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/aac02dd6c5ea04ea70cfa6921a04b5558a9bbe7f/
>          arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/fbaec431108bec088ff543771c52f2bc20e15b31/

Weird build issues.

>          arm |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/97b54954816123b938075b5ba4b61b8c1d2d406e/

armv7-ctng-linux-gnueabihf-gcc: error: policy_scan.c: No such file or directory
armv7-ctng-linux-gnueabihf-gcc: fatal error: no input files

This smells like a parallel build problem. Clayton ?

>          arc |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/d4bd7f0ea0c32428beeceb3b6d1d4f71030a9950/
>          arc |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/9062de0b97772ddb896e8d0698a9f388c9279fff/
>          arc |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/b9c79850558a794548ebf6cda342cfa5344581f9/
>          arc |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/47ba9ff7c51cbdececeaae3d0c5e27bb80e419d4/
>          arc |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/8520963d2a89da6e950c24d09636db29db73cd19/
>          arc |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/15fa8333809de37764226ebfa54ef549be56709b/

ARC toolchain issues.

>        sparc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/2e97f8490a81b5959f6dd5285fa5a10fd9603b51/

/ssd1/thomas/autobuild/instance-0/output/build/systemd-221/src/libsystemd/sd-hwdb/sd-hwdb.c:345: undefined reference to `__sync_sub_and_fetch_4'
collect2: error: ld returned 1 exit status

Atomic issue. Brendan?

>          arm | tinyalsa-f2a7b6d3d81bd337a5... | NOK | http://autobuild.buildroot.net/results/5032afa35710496802745a55d04a0d497437b947/

/home/buildroot/build/instance-0/output/host/usr/bin/arm-linux-gcc tinypcminfo.o -L. -ltinyalsa -o tinypcminfo
tinypcminfo.o: In function `main':
tinypcminfo.c:(.text+0x2f0): undefined reference to `pcm_get_format_name'

Probably a gcc 5.x related issue.

>         bfin |           usb_modeswitch-2.2.5 | NOK | http://autobuild.buildroot.net/results/7899a37d2c766716a1deff58e8be94c5c4962240/
>         bfin |           usb_modeswitch-2.2.5 | NOK | http://autobuild.buildroot.net/results/ac41bb4f831911244f739eb90097cd41081d43ba/
>         bfin |           usb_modeswitch-2.2.5 | NOK | http://autobuild.buildroot.net/results/eeb5d9368d15b10d46e8af67cd7772643eeeac0c/

All fixed by
http://git.buildroot.net/buildroot/commit/?id=c2cb0c420526906733d66c3229dce0f08cad437d.

>      aarch64 |                     webp-0.4.3 | NOK | http://autobuild.buildroot.net/results/022ae38a44e9a7ab5e4ae237c652c7240189efb6/

internal compiler error: in simplify_const_unary_operation, at simplify-rtx.c:1539

Anyone to report this to upstream gcc ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
