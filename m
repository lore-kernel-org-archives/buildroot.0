From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Jan 2014 11:16:29 +0100
Subject: [Buildroot] [PATCH 1/1] minidlna: Fix configure ffmpeg
	detection when OpenSSL support is enabled
In-Reply-To: <BLU0-SMTP258246699D2172CA1E77C80D9BB0@phx.gbl> (Bernd Kuhls's
 message of "Sat, 18 Jan 2014 09:51:39 +0100")
References: <BLU0-SMTP258246699D2172CA1E77C80D9BB0@phx.gbl>
Message-ID: <877g9k5s3m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <berndkuhls@hotmail.com> writes:

 > Fixes http://autobuild.buildroot.net/results/c66/c663a518f65e786895d9ad8866193f70cbd6e96d//
 > Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
 > ---
 >  package/minidlna/minidlna.mk |    7 ++++++-
 >  1 file changed, 6 insertions(+), 1 deletion(-)

 > diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
 > index 94c2641..174f650 100644
 > --- a/package/minidlna/minidlna.mk
 > +++ b/package/minidlna/minidlna.mk
 > @@ -13,13 +13,18 @@ MINIDLNA_DEPENDENCIES = \
 >  	ffmpeg flac libvorbis libogg libid3tag libexif libjpeg sqlite \
 >  	host-xutil_makedepend
 
 > +ifeq ($(BR2_PACKAGE_OPENSSL),y)
 > +MINIDLNA_FFMPEG_SSL_LIBS=-lcrypto -lssl
 > +endif

I don't think that's the right fix. Looking at config.log I see:

configure:9248: checking for avformat_open_input in -lavformat
configure:9273: /home/peko/source/buildroot/output/host/usr/bin/nios2-linux-gnu-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -L/usr/local/lib conftest.c -lavformat   >&5
/home/peko/source/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/4.7.3/../../../../nios2-linux-gnu/bin/ld: warning: library search path "/usr/local/lib" is unsafe for cross-compilation
/home/peko/source/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/4.7.3/../../../../nios2-linux-gnu/bin/ld: /home/peko/source/buildroot/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/crt1.o: undefined reference to symbol '_gp'
/home/peko/source/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/4.7.3/../../../../nios2-linux-gnu/bin/ld: note: '_gp' is defined in DSO /home/peko/source/buildroot/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/libssl.so.1.0.0 so try adding it to the linker command line
/home/peko/source/buildroot/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/libssl.so.1.0.0: could not read symbols: Invalid operation
collect2: error: ld returned 1 exit status

I don't know anything about nios, but I believe _gp is a linker
generated symbol:

http://sourceware-org.1504.n7.nabble.com/PATCH-2-4-MIPS-Linux-LD-Correct-the-definition-of-gp-td125740.html
https://lists.debian.org/debian-mips/2013/05/msg00018.html

Ezequiel, can you help please?

-- 
Bye, Peter Korsgaard
