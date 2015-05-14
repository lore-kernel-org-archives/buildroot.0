From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 May 2015 00:58:15 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150514231309.4e8158df@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 14 May 2015 23:13:09 +0200")
References: <20150514063016.DE5B7100C9A@stock.ovh.net>
 <20150514231309.4e8158df@free-electrons.com>
Message-ID: <87y4kqdawo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Thu, 14 May 2015 08:30:16 +0200 (CEST), Thomas Petazzoni wrote:

 >> xtensa | alsa-utils-1.0.29 | NOK |
 >> http://autobuild.buildroot.net/results/5347b57d23b44e1b011a499875ce638ed654418a/

 > Static linking issue:

 > undefined reference to `_snd_module_rawmidi_virt'

Kind of, but the real issue is just a dependency issue.

alsa-lib/src/rawmidi/Makefile.am has:

if BUILD_SEQ
librawmidi_la_SOURCES += rawmidi_virt.c
endif

So alsa-utils-amidi needs to select alsa-lib-seq as well. rawmidi_virt.c
does have some code depending on shared/static, so that might explain
why it only triggers for static builds.

I've added a commit to add this dependency.


 >> arm | armadillo-4.000.4 | NOK |
 >> http://autobuild.buildroot.net/results/31be76d4cbc1193458d3a4cdd4a0ccc1087d313e/

 > Fixed by http://patchwork.ozlabs.org/patch/472141/.

Committed.


 >> powerpc | boost-1.57.0 | NOK |
 >> http://autobuild.buildroot.net/results/9faeba9f811bb3507861003d78eec245f8a93db9/
 >> nios2 | boost-1.57.0 | NOK |
 >> http://autobuild.buildroot.net/results/46f9d84e6db10ce7cbe48653f6da4450aceceb4c/
 >> powerpc | boost-1.57.0 | NOK |
 >> http://autobuild.buildroot.net/results/7852f40e6bae93f953a588bbd6902c2b1cee8a42/
 >> powerpc | boost-1.57.0 | NOK |
 >> http://autobuild.buildroot.net/results/13b43105caf4d3952de70030b51f8d96cf6604ee/
 >> nios2 | boost-1.57.0 | NOK |
 >> http://autobuild.buildroot.net/results/e119b1ef55c546e0d0598b85c46ceefa5c43d5a6/

 > The nios2 problems are due to a toolchain issue. We should simply
 > disable boost with this toolchain.

Yes, will you send a patch?


 > The PowerPC problems are due to a uClibc bug. I've done some tests, and
 > boost-1.57.0 builds fine on PowerPC/glibc, ARM/uClibc, but fails on
 > PowerPC/uClibc. It's the boost-log module that causes the problem.

So what then, make the boost-log option depend on
!(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)?


 >> arm | lcdproc-0.5.7 | NOK |
 >> http://autobuild.buildroot.net/results/4ac625f4e888ba859a5867671664dc8d041ec9b9/
 >> arm | lcdproc-0.5.7 | NOK |
 >> http://autobuild.buildroot.net/results/61450e889c3912e38e52759812fbb6ce03270788/

 > Builds with -shared -static when static linking. Bad.

From a very quick look it didn't seem trivial to fix, so I've simply
marked it as !BR2_STATIC_LIBS.


 >> bfin | libarchive-3.1.2 | NOK |
 >> http://autobuild.buildroot.net/results/5f7b69a324b72dfb522a9299804c113414db348c/

 > libacl.a: No such file or directory

 > I don't know.

The .libs/libacl.a sounds like libtool getting confused. Other than that
I also don't know.


 >> nios2 | libcap-ng-0.7.4 | NOK |
 >> http://autobuild.buildroot.net/results/d136f763ca3389cdc6a404db7a4fc0cd18329955/

 > Compiler bug:

 > /tmp/ccAiYLAw.s: Assembler messages:
 > /tmp/ccAiYLAw.s:951: Error: bad expression

I've blacklisted that toolchain for libcap-ng (and the reverse deps).


 >> x86_64 | libupnpp-0.8.6 | NOK |
 >> http://autobuild.buildroot.net/results/f383bf4d7572a7dd59d382cd06a9baeb37e9161c/

 > checking for curl_easy_init in -lcurl... no
 > configure: error: libcurl not found

 > Smells like a static linking issue.

Yes, fixed already:

http://git.buildroot.net/buildroot/commit/?id=f7638ca23229bc9dfe3696f562afc63bda6bd1f0


 >> arm | mongoose-5.6 | NOK |
 >> http://autobuild.buildroot.net/results/372515ba0a09a23237ae34024658f21c2625d6e7/

 > mongoose.c:1326:19: fatal error: dlfcn.h: No such file or directory

 > Needs shared library support.

Or better, it needs to be built with -DMONGOOSE_NO_DL as the shared
library support doesn't do anything sensible.

I've added a commit to do so.


 >> nios2 | mosquitto-1.4.1 | NOK |
 >> http://autobuild.buildroot.net/results/b853369452115b0c6f32c6c960af2dbdf71a74af/

 > Infamous "undefined reference to symbol '_gp'" issue.

:/ Should we depend on !BR2_nios2?


 >> mipsel | postgresql-9.4.1 | NOK |
 >> http://autobuild.buildroot.net/results/f9ed96d22e91cdba9ad92c4d4ea52e422bf1f1c9/

 > /home/buildroot/build/instance-0/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(c_zlib.o):
 > In function `zlib_stateful_expand_block':
 > c_zlib.c:(.text+0x78): undefined reference to `inflate'

 > Static linking issue. Do we really want to support static linking of
 > postgresql?

I don't think so, lets just mark it as !BR2_STATIC_LIBS.



 >> powerpc | python-pyqt-4.11.3 | NOK |
 >> http://autobuild.buildroot.net/results/d2bf71cdd0fe9b0049ba2889de89ccc36cfdc58a/

 > We need to apply http://patchwork.ozlabs.org/patch/468134/.

Is that an ack? If so, please reply to the patch with it.


 >> arm | qt5base-5.4.1 | NOK |
 >> http://autobuild.buildroot.net/results/f403a76ac0abbf8488373c0dffb4487f5d98c55d/

 > g++: error: unrecognized command line option '-fuse-ld=gold'

The problem is that qt5base doesn't understand cross compilation. It
correctly checks if the target compiler supports the gold linker and
then ends up using -fuse-ld=gold with both the host and target
compilers, so it breaks on old hosts.

I'm not sure how we should fix that. Any ideas?

Thanks for all checking all these build issues!

-- 
Bye, Peter Korsgaard
