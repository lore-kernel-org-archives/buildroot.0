From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 May 2015 09:20:09 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-05-21
In-Reply-To: <20150522063013.33F0D100C04@stock.ovh.net> (Thomas Petazzoni's
 message of "Fri, 22 May 2015 08:30:13 +0200 (CEST)")
References: <20150522063013.33F0D100C04@stock.ovh.net>
Message-ID: <874mn52i52.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Build statistics for 2015-05-21
 > ===============================

 >         success : 293
 >        failures : 8  

Wee, looks good!

> Detail of failures
 > ===================

 >      powerpc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/23af5e660dd5b1cc0dd274f8fa809e772245b028/

Looks like a static linking issue. Unless somebody feels like digging
into the cmake setup I'll simply mark it as !BR2_STATIC_LIBS.

 >      powerpc |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/7faece26b986e7db42472f6db66c137038573555/
 >          arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/7d73337ad9b50cc04dbd3414d85d3d125ad4108d/
 >          arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/739c4f448568eb6ba5ccffe8a075e0f797c7109b/

The funky erlang issues on gcc75.


 >         i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/04a1c48d484debd7894fd32997ed50d3a0110b93/
 >       x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/9accdfec87aa9922a4096b84a61a6e2dfd53561e/

Gaah, more ipmiutil issues. I believe Yann is looking into this.


 >          arc |                  mpg123-1.22.1 | NOK | http://autobuild.buildroot.net/results/25f8088ecb276ff4559a56fcc4f1b92d11f7deac/

Fixed by http://git.buildroot.net/buildroot/commit/?id=dea306c78b5d4c571555c50512e212a725b594b9


 >         bfin |        opentyrian-9c9f0ec3532b | NOK | http://autobuild.buildroot.net/results/5d215b8895ac082002b38159beb94693a04a51bb/

Sounds like a -lstdc++ issue with static linking. I'll try to find time
to have a closer look.

 >         bfin |                      php-5.6.9 | NOK | http://autobuild.buildroot.net/results/b4c0e62a2ce718cf4bfad0ce328c853dc0de7f11/

Sounds like the php bump brough some extra architecture dependencies:

/ssd1/thomas/autobuild/instance-1/output/build/php-5.6.9/ext/pcre/pcrelib/pcre_jit_compile.c:65:2: error: #error Unsupported architecture

It apparently also breaks for arc:

http://autobuild.buildroot.net/results/641/6418b26140b16b6f04452a9b05431c392de04238/build-end.log

I doubt there's a lot of php users on any of those archs, so perhaps we
should just disable it there?

>          arm |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/485daba6024d8f25d7488eae2e7a18db0f9ac663/

The package apparently has an optional dependency on leveldb, but we
don't explicitly handle that and it looks like it forgets to link
against it:

Running configure tests...

Checking for fontconfig... no
Checking for gccdepends... yes
Checking for glx... no
Checking for gnuld... yes
Checking for icu... yes
Checking for leveldb... no

..

Use ........................... tiled_backing_store cross_platform_context_menus libxml2 zlib gstreamer gstreamer010 native_fullscreen_video leveldb glib

..


/home/chroot/media/code/buildroot/autobuilder/instance-1/output/build/qt5webkit-5.4.1/Source/WebCore//.obj/platform/leveldb/LevelDBDatabase.o: In function `WebCore::LevelDBDatabase::openInMemory(WebCore::LevelDBComparator const*)':
LevelDBDatabase.cpp:(.text._ZN7WebCore15LevelDBDatabase12openInMemoryEPKNS_17LevelDBComparatorE+0x22): undefined reference to `leveldb::NewMemEnv(leveldb::Env*)'
collect2: error: ld returned 1 exit status
Makefile.api:111: recipe for target '../lib/libQt5WebKit.so.5.4.1' failed


>         bfin |               spidev_test-v3.0 | NOK | http://autobuild.buildroot.net/results/0c862f64aebf6bc454af78116fe146af5f20547c/

kernel.org cgit instance apparently had issues and our mirroring fails
with the funky filename.

The problem is that the ?id=3.0 part gets interpreted by the web server
as the query string (which it is), so it looks for spidev_test.c which
doesn't exist.

To fix it we would need to URL encode these arguments (like
spidev_test.c%3fid=v3.0) whenever we try to access the mirrors.

-- 
Bye, Peter Korsgaard
