From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 Oct 2014 00:09:46 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/clamav: New package
In-Reply-To: <1412459327-14020-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sat, 4 Oct 2014 23:48:47 +0200")
References: <1412459327-14020-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87vbnprlcl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Thanks, a few comments below.

 > +++ b/package/clamav/clamav-0002-static-linking.patch
 > @@ -0,0 +1,58 @@
 > +Fix detection of statically linked libraries
 > +
 > +Ptch submitted upstream: https://bugzilla.clamav.net/show_bug.cgi?id=11132

s/Ptch/Patch. I don't seem to have access to view that patch, even after
creating an account :/


 > diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
 > new file mode 100644
 > index 0000000..417aade
 > --- /dev/null
 > +++ b/package/clamav/clamav.mk
 > @@ -0,0 +1,60 @@
 > +################################################################################
 > +#
 > +# clamav
 > +#
 > +################################################################################
 > +
 > +CLAMAV_VERSION = 0.98.4
 > +CLAMAV_SITE = http://sourceforge.net/projects/clamav/files/clamav/$(CLAMAV_VERSION)
 > +CLAMAV_LICENSE = GPLv2
 > +CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
 > +	COPYING.LGPL COPYING.llvm COPYING.lzma COPYING.regex COPYING.sha256 \
 > +	COPYING.unrar COPYING.zlib

While the entire clamav is indeed GPLv2, all these COPYING files are a
fairly strong indication that the situation is more complicated than
that, especially as it links with openssl.


 > +CLAMAV_AUTORECONF = YES

We normally add a comment about why this is done - E.G. something like:

# clamav-0002-static-linking.patch touches configure.ac

 > +CLAMAV_DEPENDENCIES = openssl zlib $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 > +
 > +# mmap cannot be detected when cross-compiling, needed for mempool support
 > +CLAMAV_CONF_ENV = \
 > +	ac_cv_c_mmap_private=yes
 > +
 > +CLAMAV_CONF_OPTS = \
 > +	--sysconfdir=/etc \

The autotools infrastructure already handles this, so it can be dropped.


 > +	--with-dbdir=/var/lib/clamav \
 > +	--with-openssl=$(STAGING_DIR)/usr \
 > +	--with-zlib=$(STAGING_DIR)/usr \
 > +	--disable-rpath \

Is openssl really a required dependency? It isn't listed here:

http://www.clamav.net/doc/install.html#Requirements

If not, then you should just automatically enable/disable support
depending if openssl is available or not.


 > +	--disable-clamuko \
 > +	--disable-clamav \
 > +	--disable-milter \
 > +	--disable-llvm \
 > +	--disable-clamdtop \
 > +	--enable-mempool

Doesn't clamav need a virus definition database to do anything? Where is
that?

-- 
Bye, Peter Korsgaard
