From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 10 Oct 2018 19:57:58 +0200
Subject: [Buildroot] Analysis results for 2018-10-09
In-Reply-To: <CANQCQpbtrG=C9T9FuznXONdqF9OTq3oqmDdDWKX5PHUhJV_=hg@mail.gmail.com>
References: <20181010060010.4E3C920736@mail.bootlin.com>
 <20181010174814.5ac114f1@windsurf>
 <CANQCQpbtrG=C9T9FuznXONdqF9OTq3oqmDdDWKX5PHUhJV_=hg@mail.gmail.com>
Message-ID: <CAPi7W80_9pcSwfX53xDC8TzgmGLuJ+rwK_T0MyKCOaunMUQNJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

Le mer. 10 oct. 2018 ? 18:28, Matthew Weber <
matthew.weber@rockwellcollins.com> a ?crit :

> Thomas,
>
>
> On Wed, Oct 10, 2018 at 10:48 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello,
> >
> > Here is an analysis of yesterday build results. Johan, Frank,
> > Christian, Fabrice, Peter, Matt, Bernd, Giulio, Baruch, you are in Cc
> > because there are questions/issues for you below. Thanks! :-)
> >
> > On Wed, 10 Oct 2018 08:00:10 +0200 (CEST), Thomas Petazzoni wrote:
> >
> > >       master | 187 |  68 |   0 | 255 |
> >
> > These results are not very good, let's have a look at what's going on,
> > and try to get everyone to help fixing those issues.
> >
> > >          arm |                boa-0.94.14rc21 | NOK |
> http://autobuild.buildroot.net/results/e5ff4589243ce1f11248b5f9fab3cca614a48b11
> | ORPH
> >
> > (cd src && make - --no-print-directory - --jobserver-fds=6,7 -j)
> > make: unrecognized option '--jobserver-fds=6,7'
> >
> > This suddenly started happening on September 9, 2018. We have not
> > bumped boa. I'm not sure what caused this. It fails on different
> > autobuilder machines. Boa is calling submake with $(MFLAGS), which is
> > probably the issue, but why did this suddenly started to happen ?
> >
> > With a minimal configuration with just Boa, I cannot reproduce on my
> > machine here, neither on my autobuilder where the problem is reported
> > to occur.
> >
> > >         i686 |                   boost-1.68.0 | NOK |
> http://autobuild.buildroot.net/results/1ceed7d91627711c12c4866fa6672a02fc6ddc8c
> |
> >
> > libboost_chrono shouldn't have been installed: missing select in
> boost/Config.in
>
Can be fixed by https://patchwork.ozlabs.org/patch/960723.

> >
> > >          arm |                   boost-1.68.0 | NOK |
> http://autobuild.buildroot.net/results/41054f876975214741dccd08eda999a425281b7f
> |
> >
> > libboost_atomic shouldn't have been installed: missing select in
> boost/Config.in
>
Can be fixed by https://patchwork.ozlabs.org/patch/966309.
It should be noted that this patch has been merged upstream:
https://github.com/boostorg/thread/commit/f7581a366294c6f5381e0371c242af327c6da655

> >
> > Fabrice, these two are for you :)
> >
> > >     mips64el |                     brltty-5.6 | NOK |
> http://autobuild.buildroot.net/results/7187e560e66f2bd6073b5510e2782ebdaccfb4a9
> |
> > >     mips64el |                     brltty-5.6 | NOK |
> http://autobuild.buildroot.net/results/5f8e8b8517fda50a2e98a456933260f08054356d
> |
> >
> > Those should be fixed by
> >
> https://git.buildroot.org/buildroot/commit/?id=9143c217213542574586c0e6a9f003e822633917
> .
> >
> > >      aarch64 |                 collectd-5.7.1 | NOK |
> http://autobuild.buildroot.net/results/24a280d6233b3284edd44c4528d8799c6894c11a
> | ORPH
> > >          sh4 |                 collectd-5.7.1 | NOK |
> http://autobuild.buildroot.net/results/63a4f980d7cdb4b0823840f747589803fcd0d69f
> | ORPH
> > >          arc |                 collectd-5.7.1 | NOK |
> http://autobuild.buildroot.net/results/1a6f2fcf1a88ecc5b598dd11c5914dcacf0e1e6b
> | ORPH
> > >          arm |                 collectd-5.7.1 | NOK |
> http://autobuild.buildroot.net/results/b0829bc3343d6dc3065078e94896725b1c808bc1
> | ORPH
> >
> > Fixed by
> >
> https://git.buildroot.org/buildroot/commit/package/collectd?id=d65ea85fddaf64a7762f958d1ce9fb33997648d3
> >
> > >       x86_64 |       docker-containerd-v1.1.3 | NOK |
> http://autobuild.buildroot.net/results/6c26ac3a8aa39abcb5eb390109891790610a759b
> |
> > >       x86_64 |       docker-containerd-v1.1.3 | NOK |
> http://autobuild.buildroot.net/results/10654bccc3d20ec6d29d371c48dd90cbddb8c4da
> |
> > >       x86_64 |       docker-containerd-v1.1.3 | NOK |
> http://autobuild.buildroot.net/results/56b564a27a06792c4854fe983da92d40c0c4708c
> |
> >
> >
> /home/naourr/work/instance-3/output/host/lib/go/pkg/tool/linux_amd64/link:
> running
> /home/naourr/work/instance-3/output/host/bin/x86_64-amd-linux-gnu-gcc
> failed: exit status 1
> > /tmp/go-build283204336/b001/exe/a.out: final close failed: Invalid
> operation
> >
> > Christian, what is happening here? Could you have a look?
> >
> > >       x86_64 |                    erlang-21.0 | NOK |
> http://autobuild.buildroot.net/results/fc633f80c7c36a90e641487f5a888fbb767c2a54
> |
> >
> > In file included from zlib/adler32.c:11:0:
> > zlib/zutil.h:172:39: error: "_LFS64_LARGEFILE" is not defined
> [-Werror=undef]
> >      (!defined(_LARGEFILE64_SOURCE) || _LFS64_LARGEFILE-0 == 0)
> >
> > Seems like a musl/erlang issue. Johan, Frank, could you have a look ?
> >
> > >          arc |               glibc-legal-info | NOK |
> http://autobuild.buildroot.net/results/64c70d82c857c272df171ae6783629c1ba92d812
> | ORPH
> >
> > Fixed by
> >
> https://git.buildroot.org/buildroot/commit/?id=b14ad0bd697038e4cf48ecf48830fb3369f1f25e
> .
> >
> > >     mips64el |                      gpsd-3.18 | NOK |
> http://autobuild.buildroot.net/results/c00d22a6dcadb82a19afab6eacea654d3c41b4c5
> | ORPH
> > >      powerpc |                      gpsd-3.18 | NOK |
> http://autobuild.buildroot.net/results/18599ea12a35b9715a67c1f4e5c4e56906235c94
> | ORPH
> > >          arm |                      gpsd-3.18 | NOK |
> http://autobuild.buildroot.net/results/a13a5d852c83cd1fc9f2d1fc2b7302db515278b8
> | ORPH
> >
> > Fixed by
> https://git.buildroot.org/buildroot/commit/package/gpsd?id=ae2a91322aeaa72d6f5354312056d16dc275470d
> >
> > >     mips64el |        gst-plugins-bad-0.10.23 | NOK |
> http://autobuild.buildroot.net/results/ab39280ceaf967e08abfd1f51efa4613495237f5
> | ORPH
> >
> >
> > gstspanplc.c:223:21: error: dereferencing pointer to incomplete type
> 'plc_state_t {aka struct plc_state_s}'
> >    if (plc->plc_state->missing_samples != 0)
> >
> > Peter (Seiderer) ?
> >
> > >          arm |                   host-go-1.11 | NOK |
> http://autobuild.buildroot.net/results/8d3af6f00bf34737faabc21bdccf7d025462fec7
> |
> >
> > fatal error: unexpected signal during runtime execution
> > [signal SIGBUS: bus error code=0x2 addr=0xc000800010 pc=0x42098d]
> >
> > This particular issue seems to happen only on Matt autobuilder. Matt,
> > can you check if you can reproduce it reliably ?
>
> I'll take a look.
>
> >
> > >      powerpc |                 libmpeg2-0.5.1 | NOK |
> http://autobuild.buildroot.net/results/69f52854b222b5be1a981b96a804098fec5a849b
> | ORPH
> > >      powerpc |                 libmpeg2-0.5.1 | NOK |
> http://autobuild.buildroot.net/results/eb8dc1e67eae123a823fadc17ca7611c2cc7f621
> | ORPH
> >
> > motion_comp_altivec.c:48:12: internal compiler error: Segmentation fault
> >      return vec_ld (A, (uint8_t *)B);
> >
> > Bernd, could you have a look at this PowerPC/Altivec issue ?
>
>
> > >          arm |                    luvi-v2.8.0 | NOK |
> http://autobuild.buildroot.net/results/2bdbb93e6404943e59791773106d8b2680211886
> |
> >
> > luvi 2.8.0 fails to build. Bernd, you bumped this package, and J?rg
> > suggested to revert the bump. Could you discuss this, and provide a fix?
> >
> > >      aarch64 |  Makefile:709: target-finalize | NOK |
> http://autobuild.buildroot.net/results/dcbbae0180bc597c58fc694c3006b623633aab7f
> |
> > >      aarch64 |  Makefile:709: target-finalize | NOK |
> http://autobuild.buildroot.net/results/cef7e38fbd4de65d1830f681a497bc007a897502
> |
> > >          arm |  Makefile:709: target-finalize | NOK |
> http://autobuild.buildroot.net/results/62143510a7ede7d92f55e908306bc367586c2748
> |
> > >      sparc64 |  Makefile:709: target-finalize | NOK |
> http://autobuild.buildroot.net/results/d0c1aa394745ba48d832cc77c23721ca6b453d23
> |
> >
> > See below "target-finalize"
> >
> > >         m68k |                  minizip-2.5.3 | NOK |
> http://autobuild.buildroot.net/results/78b8eb0f9f7f2963f0056834054f16e764bc3106
> |
> >
> >
> /home/buildroot/build/instance-0/output/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libbsd.so:
> undefined reference to `__register_atfork'
> > collect2: error: ld returned 1 exit status
> >
> > I guess it would be fixed by http://patchwork.ozlabs.org/patch/978465/.
> > Someone needs to review this.
> >
> > >      powerpc |           motion-release-4.1.1 | NOK |
> http://autobuild.buildroot.net/results/78061b61cfe3f42554a475c048d54dacacfe11d5
> |
> >
> >
> >
> /home/rclinux/rc-buildroot-test/scripts/instance-0/output/host/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/libavutil.a(hwcontext_drm.o):
> In function `drm_device_create':
> >
> /home/rclinux/rc-buildroot-test/scripts/instance-0/output/build/ffmpeg-3.4.4/libavutil/hwcontext_drm.c:50:
> undefined reference to `drmGetVersion'
> >
> /home/rclinux/rc-buildroot-test/scripts/instance-0/output/build/ffmpeg-3.4.4/libavutil/hwcontext_drm.c:63:
> undefined reference to `drmFreeVersion'
> >
> > Giulio, I believe you worked on this static linking problem between
> > ffmpeg and libdrm. What is the status of this ?
> >
> > >          arm |                    netsnmp-5.8 | NOK |
> http://autobuild.buildroot.net/results/9f02e0f09ae2d2a66a8d33d73f1bdd45ea8b0f16
> | ORPH
> >
> > configure: error: The DTLS based transports require the libssl library
> from OpenSSL to be available and support DTLS
> >
> > Bernd, you did the last version bump of netsnmp, could you have a look ?
> >
> > >          arm | open-plc-utils-1be781d1ea81... | NOK |
> http://autobuild.buildroot.net/results/67bc5e7ac8ae1c49c035b022a394d2f746705cf2
> |
> >
> > I assume this would be fixed by
> > http://patchwork.ozlabs.org/patch/981495/.
> >
> > >          arc | package/glibc/glibc.mk:143:... | NOK |
> http://autobuild.buildroot.net/results/4a1ddb5c0afb1e80ac769d36cb720372f7bb5457
> |
> >
> > Fixed by
> >
> https://git.buildroot.org/buildroot/commit/package/glibc?id=b14ad0bd697038e4cf48ecf48830fb3369f1f25e
> .
> >
> > >          arm |                     php-7.2.10 | NOK |
> http://autobuild.buildroot.net/results/7b7e25bfd269f7c252d15ab4e9f1b68348823478
> | ORPH
> >
> > multiple definition of
> `icu_60::MessageFormatAdapter::getArgTypeList(icu_60::MessageFormat const&,
> int&)'
> >
> > Long standing issue. Anyone brave enough to investigate ?
> >
> > > microblazeel |               ptpd2-ptpd-2.3.1 | NOK |
> http://autobuild.buildroot.net/results/1c00bfa77c38f0aad7643344b16d8f401c9b927a
> | ORPH
> > >          arm |               ptpd2-ptpd-2.3.1 | NOK |
> http://autobuild.buildroot.net/results/298fda61ab5a192c235027e1b4c57aba4e6b8b37
> | ORPH
> > >     mips64el |               ptpd2-ptpd-2.3.1 | NOK |
> http://autobuild.buildroot.net/results/8fe8061cb27cbab8f02e6dfb0a870d76be3f7f3e
> | ORPH
> > >       xtensa |               ptpd2-ptpd-2.3.1 | NOK |
> http://autobuild.buildroot.net/results/80b014e965b088e6767af671d39657b415f82453
> | ORPH
> > >       mipsel |               ptpd2-ptpd-2.3.1 | NOK |
> http://autobuild.buildroot.net/results/40f1090a0eb720d4cce2715bca51823213efb9f9
> | ORPH
> > >          arm |               ptpd2-ptpd-2.3.1 | NOK |
> http://autobuild.buildroot.net/results/55933c2c4ecf8a84b283c93adf0c2ed8a4f03301
> | ORPH
> > >     mips64el |               ptpd2-ptpd-2.3.1 | NOK |
> http://autobuild.buildroot.net/results/08d40b95945ed0e61805b07446b5eb5731f23198
> | ORPH
> >
> > Should be fixed by http://patchwork.ozlabs.org/patch/964746/. I haven't
> > had the chance to review it.
> >
> > >   aarch64_be |                 qt5base-5.11.2 | NOK |
> http://autobuild.buildroot.net/results/aeddb85c0262cdc23019c72e1c390d3885cb4ae4
> |
> > >   aarch64_be |                 qt5base-5.11.2 | NOK |
> http://autobuild.buildroot.net/results/5bec7d7f14befa3a03f902ef90cc2c6589943ec2
> |
> >
> >
> /home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64_be-linux-gnu/7.3.1/../../../../aarch64_be-linux-gnu/bin/ld.gold:
> internal error in update_erratum_insn, at
> /home/tcwg-buildslave/workspace/tcwg-make-release/builder_arch/amd64/label/tcwg-x86_64-build/target/aarch64_be-linux-gnu/snapshots/binutils-gdb.git~users~linaro~binutils-2_28-branch/gold/aarch64.cc:998
> >
> > Compiler bug it seems. Anyone to have a look ?
> >
> > >       mipsel |                qt5webkit-5.9.1 | NOK |
> http://autobuild.buildroot.net/results/7aca204c7fd486def6306412b0a6e0bfb8234786
> |
> >
> > {standard input}: Assembler messages:
> > {standard input}:708: Error: opcode not supported on this processor:
> mips32r6 (mips32r6) `movz $v0,$t8,$t7'
> > {standard input}:759: Error: opcode not supported on this processor:
> mips32r6 (mips32r6) `movz $v1,$t8,$t7'
> > {standard input}:765: Error: opcode not supported on this processor:
> mips32r6 (mips32r6) `movz $t2,$t8,$t7'
> >
> > We should disable qt5webkit on mips32r6. Peter ?
> >
> > >          arm |                qt5webkit-5.9.1 | NOK |
> http://autobuild.buildroot.net/results/b8ae1b94891206746815fa85fafabfbd6bed8c74
> |
> >
> >
> /home/naourr/work/instance-3/output/build/qt5webkit-5.9.1/Source/WebCore//.obj/platform/leveldb/LevelDBDatabase.o:
> In function
> `WebCore::LevelDBDatabase::openInMemory(WebCore::LevelDBComparator const*)':
> >
> LevelDBDatabase.cpp:(.text._ZN7WebCore15LevelDBDatabase12openInMemoryEPKNS_17LevelDBComparatorE+0x22):
> undefined reference to `leveldb::NewMemEnv(leveldb::Env*)'
> >
> > Ah, yes, we have a patch fixing that in patchwork. I don't like it a
> > lot, but I guess that's the only option.
> >
> > >          arm |               spandsp-20180108 | NOK |
> http://autobuild.buildroot.net/results/05885325ec274cb9860d423c57eed5e7063aedc0
> |
> >
> > checking for TIFFOpen in -ltiff... no
> > configure: error: "Cannot build without libtiff (does your system
> require a libtiff-devel package?)"
> >
> > Bernd, you added spandsp recently, could you have a look ?
> >
> > >      powerpc |                      squid-4.2 | NOK |
> http://autobuild.buildroot.net/results/e679ef90219c5e8f9c94ddcd7d3f9582f79ef751
> | ORPH
> >
> > ../../src/StatHist.h:112:30: error: invalid pure specifier (only '= 0'
> is allowed) before ';' token
> > ../../src/StatHist.h:113:31: error: invalid pure specifier (only '= 0'
> is allowed) before ';' token
> >
> > Not sure. Baruch, you recently bumped the squid package, could you have
> > a look ?
> >
> > > microblazeel |                target-finalize | NOK |
> http://autobuild.buildroot.net/results/068fa36a0be7a2207144cfcc9d595d6099bd9e39
> |
> > >       xtensa |                target-finalize | NOK |
> http://autobuild.buildroot.net/results/3b17b82658842849cf72d01b6f6a4f735e13a642
> |
> > >       xtensa |                target-finalize | NOK |
> http://autobuild.buildroot.net/results/c76bf4a1902da001de673c2160e7f68f83072feb
> |
> > >         mips |                target-finalize | NOK |
> http://autobuild.buildroot.net/results/a0f68aba5c02cbf053c0a425667f1393ef71a0e5
> |
> > >          arc |                target-finalize | NOK |
> http://autobuild.buildroot.net/results/21adc28431f328526d88158e98e84b2fab2e4275
> |
> > >       mipsel |                target-finalize | NOK |
> http://autobuild.buildroot.net/results/0bf569d8d0ae380bdd1c8b6ddfa111e85670e981
> |
> > >      powerpc |                target-finalize | NOK |
> http://autobuild.buildroot.net/results/f92fd883386a547d42e0c699f7db859f2918e3f2
> |
> > >      powerpc |                target-finalize | NOK |
> http://autobuild.buildroot.net/results/ca096daed97a11b9be1618bd284b626527414e88
> |
> > >          arm |                target-finalize | NOK |
> http://autobuild.buildroot.net/results/8b4ce48f1b612710b8f2bb1b4ca3b203e1ed6293
> |
> > >      aarch64 |                target-finalize | NOK |
> http://autobuild.buildroot.net/results/797e736dc81d84e63a9293a7b1b62d7d4ae29194
> |
> > >          arc |                target-finalize | NOK |
> http://autobuild.buildroot.net/results/dd94cc60c4eb5a102b04db52b0ee2c7417c0c2f5
> |
> > >       x86_64 |                target-finalize | NOK |
> http://autobuild.buildroot.net/results/8329204dc3737635b92c2fdef224992f3c302f0c
> |
> > >          arm |                target-finalize | NOK |
> http://autobuild.buildroot.net/results/5ab016529d2ec177f2865ac184d4a91149a649db
> |
> > >   aarch64_be |                target-finalize | NOK |
> http://autobuild.buildroot.net/results/b8e27bd74c40cbc6f6ed9c5df4f0021af4fda050
> |
> > >     mips64el |                target-finalize | NOK |
> http://autobuild.buildroot.net/results/a5f6626116e8e721d5f6eb1d0aebf4656b9452f0
> |
> > >          arm |                target-finalize | NOK |
> http://autobuild.buildroot.net/results/89b5cc38f7b45046417fa20bbd8078646e9c39ef
> |
> > >      aarch64 |                target-finalize | NOK |
> http://autobuild.buildroot.net/results/a28d07fd7999f1505a346598ea62ac3c212db7a2
> |
> > >          arc |                target-finalize | NOK |
> http://autobuild.buildroot.net/results/c905171b7a2beb768e23c7b834c50df0764500e1
> |
> >
> > I had a look at those 22 (18+4) failures, and all of them are caused
> either by
> > pysnmp or psycopg2 issues with Python 3.7.0. pysnmp was fixed today
> > (
> https://git.buildroot.org/buildroot/commit/?id=8122a1d85b6cc9f2adcb1243521c04ba4cae0510
> ).
> > So the only package remaining package to fix is psycopg2.
> >
> > Asaf, Yegor, Adam, could one of you take care of fixing psycopg2 soon ?
> >
> > Related to this, I find it a bit annoying that all those issues are
> > detected at the target-finalize step, since package maintainers are not
> > properly notified. Should we move the byte-compile step as the end of
> > each Python package installation, so that if it fails, it fails
> > earlier, and within the context of that package ? Is the
> > byte-compilation process smart enough to skip compiling when a .pyc
> > file already exists and is newer than the matching .py file ? It would
> > be interesting to do a time comparison between doing per-package
> > byte-compilation and one global byte-compilation at the end.
> >
> >
> > >          arc |               traceroute-2.1.0 | NOK |
> http://autobuild.buildroot.net/results/22855418dcb5bca4b6499991bc810b368a0cfcd5
> |
> >
> > make[3]: *** No rule to make target '-lm', needed by 'traceroute'.  Stop.
> > make[3]: *** Waiting for unfinished jobs....
> >
> > Meh ?
> >
> > >  powerpc64le |              util-linux-2.32.1 | NOK |
> http://autobuild.buildroot.net/results/7b79a5fa265e2387cab421e42b3c946562e4781b
> |
> >
> >
> > checking for SELINUX... no
> > configure: error: SELinux selected but libselinux not found or too old
> >
> > We've been having this one for a while. Could some SELinux person
> > (Matt ? Adam ?) debug this ?
>
> I can take a look.

I worked on this one without finding how to fix it.
Here is my finding so I hope it could help you.
It seems that the issue is that libselinux is really not built before
util-linux. Indeed, we can see in
http://autobuild.buildroot.net/results/7b79a5fa265e2387cab421e42b3c946562e4781b/build-time.log,
that only libsepol is built.
I don't know why libselinux is not built perhaps because libselinux,
libsepol and all other selinux packages share the same archive (i.e.
https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20180524
)?

>   Before I dig to deep, I'd suggest applying the 2.8
> bump (http://patchwork.ozlabs.org/project/buildroot/list/?series=66983).
> I've finished runtime testing and it would be good to fix this and
> perform my testing on the latest.
>
> Note, this report doesn't have it, but there has been a standing
> host-libsemanage 2.7 failure I've been ignoring until the 2.8 is
> applied. (http://autobuild.buildroot.net/?reason=host-libsemanage-2.7)
>
> Matt
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181010/fc61cf10/attachment-0001.html>
