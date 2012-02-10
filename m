From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 10 Feb 2012 11:00:30 +0100
Subject: [Buildroot] [PATCH v3 directfb] directfb: font handling
	requires libbz2
In-Reply-To: <1328826314-30424-2-git-send-email-twoerner@gmail.com> (Trevor
 Woerner's message of "Thu, 9 Feb 2012 17:25:14 -0500")
References: <1328826314-30424-1-git-send-email-twoerner@gmail.com>
 <1328826314-30424-2-git-send-email-twoerner@gmail.com>
Message-ID: <8762ff2ekh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Trevor" == Trevor Woerner <twoerner@gmail.com> writes:

 Trevor> From: Trevor Woerner <twoerner@gmail.com>
 Trevor> One of the libraries which is built by directfb, libidirectfbfont_ft2.so,
 Trevor> requires libbz2:

That's not true. Freetype might optionally have bzip2 support, but it
isn't a requirement for directfb.

E.G. I did a basic build here:

./host/usr/bin/i586-linux-readelf -a \
  staging/usr/lib/directfb-1.4-6/interfaces/IDirectFBFont/libidirectfbfont_ft2.so
  | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libdirect-1.4.so.6]
 0x00000001 (NEEDED)                     Shared library: [libdirectfb-1.4.so.6]
 0x00000001 (NEEDED)                     Shared library: [libfusion-1.4.so.6]
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 0x00000001 (NEEDED)                     Shared library: [libfreetype.so.6]
 0x00000001 (NEEDED)                     Shared library: [libm.so.0]
 0x00000001 (NEEDED)                     Shared library: [libdl.so.0]
 0x00000001 (NEEDED)                     Shared library: [libpthread.so.0]
 0x00000001 (NEEDED)                     Shared library: [libgcc_s.so.1]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]

So the only thing that should be fixed is to ensure bzip2 is built
before freetype (and zlib as well) if enabled. I'll fix that.

-- 
Bye, Peter Korsgaard
