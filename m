From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Apr 2008 20:08:56 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  oprofile
In-Reply-To: <20080424165429.5E3993C7F0@busybox.net> (ninevoltz@uclibc.org's
	message of "Thu\, 24 Apr 2008 09\:54\:29 -0700 \(PDT\)")
References: <20080424165429.5E3993C7F0@busybox.net>
Message-ID: <87zlrj2khz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ninevoltz" == ninevoltz  <ninevoltz@uclibc.org> writes:

 ninevoltz> Author: ninevoltz
 ninevoltz> Date: 2008-04-24 09:54:29 -0700 (Thu, 24 Apr 2008)
 ninevoltz> New Revision: 21847

 ninevoltz> Log:
 ninevoltz> add oprofile

 ninevoltz> Added:
 ninevoltz>    trunk/buildroot/package/oprofile/
 ninevoltz>    trunk/buildroot/package/oprofile/Config.in
 ninevoltz>    trunk/buildroot/package/oprofile/oprofile-0.9.3-avr32.patch

Please use the .patch.avr32 naming convention.

 ninevoltz> Added: trunk/buildroot/package/oprofile/Config.in
 ninevoltz> ===================================================================
 ninevoltz> --- trunk/buildroot/package/oprofile/Config.in	                        (rev 0)
 ninevoltz> +++ trunk/buildroot/package/oprofile/Config.in	2008-04-24 16:54:29 UTC (rev 21847)
 ninevoltz> @@ -0,0 +1,20 @@
 ninevoltz> +config BR2_PACKAGE_OPROFILE
 ninevoltz> +	bool "oprofile"
 ninevoltz> +	default n
 ninevoltz> +	select BR2_PACKAGE_POPT
 ninevoltz> +	select BR2_INSTALL_LIBSTDCPP

Does that actually work? I mean, does the compiler get recompiled with
C++ support if you select this package after your initial make?

If not, we should make it a depends instead.

 ninevoltz> +	  OProfile leverages the hardware performance counters of the
 ninevoltz> +	  CPU to enable profiling of a wide variety of interesting
 ninevoltz> +	  statistics, which can also be used for basic time-spent
 ninevoltz> +	  profiling. All code is profiled: hardware and software
 ninevoltz> +	  interrupt handlers, kernel modules, the kernel, shared
 ninevoltz> +	  libraries, and applications. 

Trailing space.

 ninevoltz> --- trunk/buildroot/package/oprofile/oprofile-fix-autoconf-brain-damage.patch	                        (rev 0)
 ninevoltz> +++ trunk/buildroot/package/oprofile/oprofile-fix-autoconf-brain-damage.patch	2008-04-24 16:54:29 UTC (rev 21847)
 ninevoltz> @@ -0,0 +1,13 @@
 ninevoltz> +diff --git a/libutil++/bfd_support.cpp b/libutil++/bfd_support.cpp
 ninevoltz> +index a33836f..9b0d1b2 100644
 ninevoltz> +--- a/libutil++/bfd_support.cpp
 ninevoltz> ++++ b/libutil++/bfd_support.cpp
 ninevoltz> +@@ -415,7 +415,7 @@ void bfd_info::close()
 ninevoltz> + }
 ninevoltz> + 
 ninevoltz> + 
 ninevoltz> +-#if SYNTHESIZE_SYMBOLS
 ninevoltz> ++#if SYNTHESIZE_SYMBOLS && 0

What does this fix?

 ninevoltz> +OPROFILE_DIR		:= $(BUILD_DIR)/oprofile-$(OPROFILE_VERSION)
 ninevoltz> +OPROFILE_SITE		:= http://prdownloads.sourceforge.net/oprofile

$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net ?

 ninevoltz> +OPROFILE_SOURCE		:= oprofile-$(OPROFILE_VERSION).tar.gz
 ninevoltz> +OPROFILE_CAT		:= $(ZCAT)
 ninevoltz> +
 ninevoltz> +OPROFILE_BINARIES	:= utils/ophelp
 ninevoltz> +OPROFILE_BINARIES	+= pp/opannotate pp/oparchive pp/opgprof pp/opreport
 ninevoltz> +OPROFILE_BINARIES	+= daemon/oprofiled
 ninevoltz> +
 ninevoltz> +$(DL_DIR)/$(OPROFILE_SOURCE):
 ninevoltz> +	$(WGET) -P $(DL_DIR) $(OPROFILE_SITE)/$(OPROFILE_SOURCE)
 ninevoltz> +
 ninevoltz> +oprofile-source: $(DL_DIR)/$(OPROFILE_SOURCE)
 ninevoltz> +
 ninevoltz> +$(OPROFILE_DIR)/.unpacked: $(DL_DIR)/$(OPROFILE_SOURCE)
 ninevoltz> +	$(OPROFILE_CAT) $(DL_DIR)/$(OPROFILE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 ninevoltz> +	toolchain/patch-kernel.sh $(OPROFILE_DIR) package/oprofile/ \*.patch*
 ninevoltz> +	$(CONFIG_UPDATE) $(OPROFILE_DIR)
 ninevoltz> +	touch $@
 ninevoltz> +
 ninevoltz> +$(OPROFILE_DIR)/.configured: $(OPROFILE_DIR)/.unpacked
 ninevoltz> +	(cd $(OPROFILE_DIR); rm -f config.cache;		\
 ninevoltz> +		$(TARGET_CONFIGURE_OPTS)			\
 ninevoltz> +		$(TARGET_CONFIGURE_ARGS)			\
 ninevoltz> +		./configure					\
 ninevoltz> +			--target=$(GNU_TARGET_NAME)		\
 ninevoltz> +			--host=$(GNU_TARGET_NAME)		\
 ninevoltz> +			--build=$(GNU_HOST_NAME)		\
 ninevoltz> +			--prefix=/usr				\
 ninevoltz> +			--sysconfdir=/etc			\
 ninevoltz> +			--localstatedir=/var			\
 ninevoltz> +			--includedir=/include			\
 ninevoltz> +	);
 ninevoltz> +	touch $@


Why not use AUTOTOOLS?

 ninevoltz> +
 ninevoltz> +$(OPROFILE_DIR)/daemon/oprofiled: $(OPROFILE_DIR)/.configured
 ninevoltz> +	PATH=$(TARGET_PATH) $(MAKE) -C $(OPROFILE_DIR)
 ninevoltz> +	touch -c $@
 ninevoltz> +
 ninevoltz> +$(TARGET_DIR)/usr/bin/oprofiled: $(OPROFILE_DIR)/daemon/oprofiled
 ninevoltz> +	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/bin
 ninevoltz> +	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/share/oprofile/avr32
 ninevoltz> +	$(INSTALL) -m 644 $(addprefix $(OPROFILE_DIR)/events/avr32/, events unit_masks) $(TARGET_DIR)/usr/share/oprofile/avr32

avr32?

 ninevoltz> +	$(INSTALL) -m 644 $(OPROFILE_DIR)/libregex/stl.pat $(TARGET_DIR)/usr/share/oprofile
 ninevoltz> +	$(INSTALL) -m 755 $(OPROFILE_DIR)/utils/opcontrol $(TARGET_DIR)/usr/bin
 ninevoltz> +	$(INSTALL) -m 755 $(addprefix $(OPROFILE_DIR)/, $(OPROFILE_BINARIES)) $(TARGET_DIR)/usr/bin
 ninevoltz> +	$(STRIP) --strip-unneeded $(addprefix $(TARGET_DIR)/usr/bin/, $(notdir $(OPROFILE_BINARIES)))
 ninevoltz> +	touch -c $@
 ninevoltz> +
 ninevoltz> +oprofile: uclibc popt binutils_target $(TARGET_DIR)/usr/bin/oprofiled

Doesn't it need popt at configure time?

-- 
Bye, Peter Korsgaard
