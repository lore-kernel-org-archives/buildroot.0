From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 11 Jul 2013 07:22:00 +0200
Subject: [Buildroot] [PATCH] minidlna: new package
In-Reply-To: <1367824390-3967-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Mon, 6 May 2013 08:13:10 +0100")
References: <1367824390-3967-1-git-send-email-spdawson@gmail.com>
Message-ID: <87zjtteknb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> Signed-off-by: Simon Dawson <spdawson@gmail.com>

 spdawson> +config BR2_PACKAGE_MINIDLNA
 spdawson> +	bool "minidlna"
 spdawson> +	depends on BR2_LARGEFILE # ffmpeg
 spdawson> +	depends on BR2_INET_IPV6 # ffmpeg
 spdawson> +	depends on BR2_USE_MMU # fork
 spdawson> +	select BR2_PACKAGE_FFMPEG
 spdawson> +	select BR2_PACKAGE_FLAC
 spdawson> +	select BR2_PACKAGE_LIBVORBIS # selects libogg
 spdawson> +	select BR2_PACKAGE_LIBOGG
 spdawson> +	select BR2_PACKAGE_LIBID3TAG # selects zlib
 spdawson> +	select BR2_PACKAGE_LIBEXIF
 spdawson> +	select BR2_PACKAGE_LIBJPEG
 spdawson> +	select BR2_PACKAGE_SQLITE
 spdawson> +	select BR2_PACKAGE_HOST_XUTIL_MAKEDEPEND

We don't have such a host symbol and don't select host packages (except
for the few we have under Host Utilities.


 spdawson> +++ b/package/minidlna/minidlna-0002-fix-Makefile.patch
 spdawson> @@ -0,0 +1,20 @@
 spdawson> +Fix the Makefile.
 spdawson> +
 spdawson> +N.B. The upstream CVS HEAD has been converted to GNU autotools, but a
 spdawson> +tarball has not yet been released. When the next release tarball is made
 spdawson> +available, this patch can be removed.
 spdawson> +
 spdawson> +Signed-off-by: Simon Dawson <spdawson@gmail.com>
 spdawson> +
 spdawson> +diff -Nurp a/Makefile b/Makefile
 spdawson> +--- a/Makefile	2012-01-17 22:49:01.000000000 +0000
 spdawson> ++++ b/Makefile	2013-05-04 22:29:19.947073948 +0100
 spdawson> +@@ -64,7 +64,7 @@ install-conf:
 spdawson> + 	$(INSTALL) -d $(ETCINSTALLDIR)
 spdawson> + 	$(INSTALL) --mode=0644 minidlna.conf $(ETCINSTALLDIR)
 spdawson> + 
 spdawson> +-minidlna:	$(BASEOBJS) $(LNXOBJS) $(LIBS)
 spdawson> ++minidlna:	$(BASEOBJS) $(LNXOBJS)

'Fix the Makefile' is not very descriptive.

 spdawson> +++ b/package/minidlna/minidlna.mk
 spdawson> @@ -0,0 +1,44 @@
 spdawson> +#############################################################
 spdawson> +#
 spdawson> +# minidlna
 spdawson> +#
 spdawson> +#############################################################
 spdawson> +
 spdawson> +MINIDLNA_VERSION = 1.0.25
 spdawson> +MINIDLNA_SITE = http://downloads.sourceforge.net/project/minidlna/minidlna/$(MINIDLNA_VERSION)
 spdawson> +MINIDLNA_SOURCE = minidlna_$(MINIDLNA_VERSION)_src.tar.gz
 spdawson> +MINIDLNA_LICENSE = GPLv2+ BSD-3c

LICENCE explicitly states:

Version 2 is the only version of this license which this version of
MiniDLNA (or modified versions derived from this one) may be distributed
under.

So it is GPLv2, not GPLv2+.


 spdawson> +MINIDLNA_LICENSE_FILES = LICENSE LICENCE.miniupnpd

The first license file is called LICENCE.


 spdawson> +
 spdawson> +MINIDLNA_DEPENDENCIES = \
 spdawson> +	ffmpeg flac libvorbis libogg libid3tag libexif libjpeg sqlite \
 spdawson> +	host-xutil_makedepend
 spdawson> +
 spdawson> +MINIDLNA_CFLAGS=$(TARGET_CFLAGS) \
 spdawson> +	-I"$(STAGING_DIR)/usr/include" \
 spdawson> +	-I"$(STAGING_DIR)/usr/include/libavutil" \
 spdawson> +	-I"$(STAGING_DIR)/usr/include/libavcodec" \
 spdawson> +	-I"$(STAGING_DIR)/usr/include/libavformat"

The compiler already looks in STAGING_DIR/usr/include, so the first line
can get dropped.

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
