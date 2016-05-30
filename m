From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 May 2016 17:22:17 +0200
Subject: [Buildroot] [PATCH v4] openzwave: new package
In-Reply-To: <25411_1464600165_574C0665_25411_219_1_5b748601-166d-4115-9569-971779a5f3f2@OPEXCLILM5F.corporate.adroot.infra.ftgroup>
 (fabrice fontaine's message of "Mon, 30 May 2016 11:22:37 +0200")
References: <25411_1464600165_574C0665_25411_219_1_5b748601-166d-4115-9569-971779a5f3f2@OPEXCLILM5F.corporate.adroot.infra.ftgroup>
Message-ID: <871t4j3712.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>>   <fabrice.fontaine@orange.com> writes:

 > Free software library that interfaces with selected Z-Wave PC
 > controllers, allowing anyone to create applications that manipulate and
 > respond to devices on a Z-Wave network, without requiring in-depth
 > knowledge of the Z-Wave protocol

 > Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
 > ---
 > Changes v3 -> v4 (after review of Peter Korsgaard):
 >  - Add a patch to fix git revision

 > +++ b/package/openzwave/openzwave.mk
 > @@ -0,0 +1,52 @@
 > +################################################################################
 > +#
 > +# openzwave
 > +#
 > +################################################################################
 > +
 > +OPENZWAVE_VERSION = v1.4
 > +OPENZWAVE_SITE = $(call github,OpenZWave,open-zwave,$(OPENZWAVE_VERSION))
 > +OPENZWAVE_LICENSE = LGPLv3+, GPLv3 (examples), Apache-2.0 (sh2ju.sh)
 > +OPENZWAVE_LICENSE_FILES = license/license.txt license/lgpl.txt \
 > +	license/gpl.txt license/Apache-License-2.0.txt
 > +
 > +OPENZWAVE_DEPENDENCIES = host-pkgconf udev
 > +OPENZWAVE_INSTALL_STAGING = YES
 > +
 > +define OPENZWAVE_BUILD_CMDS
 > +	$(TARGET_MAKE_ENV) $(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D)
 > +endef
 > +
 > +# Set instlibdir to install libopenzwave.so* in the correct directory
 > +# otherwise openzwave will check that /lib64 exists (on the host) to
 > +# know if the library should be installed in $(PREFIX)/lib or $(PREFIX)/lib64.
 > +# Set pkgconfigdir to /lib/pkgconfig to install libopenzwave.pc in the
 > +# correct directory otherwise openzwave will call
 > +# "pkg-config --variable pc_path pkg-config" which returns an incorrect value.
 > +# Set sysconfdir to /etc/openzwave to install openzwave configuration files in
 > +# the correct directory otherwise openzwave will install configuration files in
 > +# $(PREFIX)/etc/openzwave.
 > +define OPENZWAVE_INSTALL_STAGING_CMDS
 > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 > +		PREFIX=/usr DESTDIR=$(STAGING_DIR) \
 > +		instlibdir=/usr/lib \
 > +		pkgconfigdir=/usr/lib/pkgconfig \
 > +		sysconfdir=/etc/openzwave \
 > +		install

This is a bit of a mess. At least sysconfdir is also used at build time
for the default configuration directory, but it is hardcoded as
$PREFIX/etc/openzwave, and other places in the source code hardcodes
/etc/openzwave:

strings libopenzwave.so.1.4 | grep /etc
/etc/openzwave/
Cannot find a path to the configuration files at %s, Using /etc/openzwave/ instead...
/usr/local/etc/openzwave/

We also need to pass DOXYGEN= to get it to not spend time on building
documentation during the installation step. As there's several variables
and we need to pass (a subset of) them to build / staging-install /
target-install I've added them to an OPENZWAVE_MAKE_OPTS variable and
used that everywhere.

Committed to next with that fixed, thanks.

-- 
Bye, Peter Korsgaard
