From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Tue, 16 Sep 2008 10:54:29 +0100
Subject: [Buildroot] Freetype and Makefile.autotools.in
Message-ID: <1221558869.12213.4.camel@lnx32dtp04>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I had an attempt today at changing the freetype.mk file to use
autotools.in.  see below:

#############################################################
#
# freetype
#
#############################################################
FREETYPE_VERSION = $(strip $(subst ",, $(BR2_FREETYPE_VERSION)))
FREETYPE_SITE =
http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/freetype
FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
FREETYPE_INSTALL_STAGING = YES
FREETYPE_INSTALL_TARGET = YES
FREETYPE_MAKE_OPT = CCexe="$(HOSTCC)"
FREETYPE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR)/usr install-strip
FREETYPE_DEPENDENCIES = uclibc pkgconfig

$(eval $(call AUTOTARGETS,package,freetype))

However the problem is that the auto patching of ltmain.sh fails so the
build never happens.
I have seen this before where I have packages that cannot be patched by
buildroot-libtool.patch 

See below:
Applying buildroot-libtool.patch using plaintext: 
patching file ltmain.sh
Hunk #1 FAILED at 273.
Hunk #2 succeeded at 4886 (offset 2478 lines).
Hunk #3 FAILED at 5030.
Hunk #4 FAILED at 5374.
Hunk #5 succeeded at 5059 with fuzz 1 (offset -564 lines).
Hunk #6 FAILED at 5384.
4 out of 6 hunks FAILED -- saving rejects to file ltmain.sh.rej

Perhaps we could have an option that allows the auto-patching of libtool
to be applied?
something like PKGNAME_LIBTOOL_PATCH (default yes)

What do people think?
Daniel Laird
