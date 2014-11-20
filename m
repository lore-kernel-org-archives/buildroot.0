From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Nov 2014 22:41:41 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-11-19
In-Reply-To: <XnsA3EBC78DF44F4berndkuhlsPkbjNfxxIA@bernd-kuhls.de> (Bernd
 Kuhls's message of "Thu, 20 Nov 2014 19:37:02 +0100")
References: <20141120073014.164A510107F@stock.ovh.net>
 <20141120094407.4b487379@free-electrons.com>
 <XnsA3EBC78DF44F4berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <87zjbleei2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

Hi,

>> Bernd, can you have a look?

 > I still[1] can not reproduce the bug on my machine. Apparently it happens 
 > only on Peter.s autobuilder: http://autobuild.buildroot.net/?reason=clamav-
 > 0.98.4.

I did a manual test build on gcc16 and I see:

(with make CLAMAV_MAKE_OPTS='V=1' BR2_JLEVEL=1 clamav)

libtool: link: /home/peko/tmp/buildroot/output/host/usr/bin/armv5-ctng-linux-gnueabi-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -fno-strict-aliasing -o clamscan output.o getopt.o optparser.o actions.o misc.o clamscan.o manager.o  ../libclamav/.libs/libclamav.so -L/home/peko/tmp/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib -L/usr/lib -lbz2 -lssl -lcrypto -lz -lm -ldl -lpthread -Wl,-rpath -Wl,/home/peko/tmp/buildroot/output/build/clamav-0.98.5/libclamav/.libs
../libclamav/.libs/libclamav.so: undefined reference to `bzDecompress'
../libclamav/.libs/libclamav.so: undefined reference to `bzDecompressInit'
../libclamav/.libs/libclamav.so: undefined reference to `bzDecompressEnd'
collect2: error: ld returned 1 exit status

As the -L/usr/lib hints of, the bzip2 detection is failing. From
config.log:

configure:17633: checking how to link with libbz2
configure:18093: result: /usr/lib/libbz2.so
configure:18134: checking for BZ2_bzDecompressInit in -lbz2
configure:18159: /home/peko/tmp/buildroot/output/host/usr/bin/armv5-ctng-linux-gnueabi-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -fno-strict-aliasing -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/home/peko/tmp/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include  -L/usr/lib conftest.c -lbz2  -ldl  >&5
/usr/lib/libbz2.so: file not recognized: File format not recognized


 > @Peter: Could you please try this patch locally on your autobuilder?

 > --- a/package/clamav/clamav.mk
 > +++ b/package/clamav/clamav.mk
 > @@ -16,6 +16,7 @@ CLAMAV_DEPENDENCIES = openssl zlib $(if $(BR2
 > _NEEDS_GETTEXT_IF_LOCALE),gettext)

 >  # mmap cannot be detected when cross-compiling, needed for mempool support
 >  CLAMAV_CONF_ENV = \
 > +       LIBBZ2_PREFIX=$(STAGING_DIR)/usr \
 >         ac_cv_c_mmap_private=yes

Thanks, but that doesn't work:

Applying buildroot-libtool-v2.4.patch using patch: 
patching file ltmain.sh
(cd /home/peko/tmp/buildroot/output/build/clamav-0.98.5/ && ... \
LIBBZ2_PREFIX=/home/peko/tmp/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr ac_cv_c_mmap_private=yes CONFIG_SITE=/dev/null ./configure
..
checking how to link with libbz2... /usr/lib/libbz2.so
checking for BZ2_bzDecompressInit in -lbz2... no
checking bzlib.h usability... yes
checking bzlib.h presence... yes

and it naturally still fails at the linking step.

Looking closer at the configure script I see we need to pass
ac_cv_libbz2_libs and ac_cv_libbz2_ltlibs instead. With that done it
works.

I'll cook a patch to do so.

-- 
Bye, Peter Korsgaard
