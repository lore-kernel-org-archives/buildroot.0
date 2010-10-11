From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Mon, 11 Oct 2010 14:00:24 -0500
Subject: [Buildroot] Changing install location of a package
In-Reply-To: <AANLkTi=ZZM0xD0-Hwh_HwkAMZ3D+Bwfhz_cp1i-1ACCQ@mail.gmail.com>
References: <0D753D10438DA54287A00B02708426976450782937@AUSP01VMBX24.collaborationhost.net>
	<AANLkTi=ZZM0xD0-Hwh_HwkAMZ3D+Bwfhz_cp1i-1ACCQ@mail.gmail.com>
Message-ID: <0D753D10438DA54287A00B0270842697645097E95E@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday, October 10, 2010 2:35 PM, Martin Banky wrote:
> On Fri, Oct 8, 2010 at 2:59 PM, H Hartley Sweeten <hartleys@visionengravers.com> wrote:
>>
>> Is there a way to setup a .mk file for a package to configure and install
>> the package into a place other than /bin, /sbin, /usr/bin or /usr/sbin? 
>> Or is this actually handled internally by the .configure of the package?>
>
> Yes, you would need to setup the .mk file to install the package into a
> different location. It will depend on the package type. If it's an
> autotools package, then you will have to do one of two things. The choice
> would be based on whether the existing options are acceptable, but just
> need to be added to, then add/change (PKG)_CONF_OPT, or the existing
> options are not acceptable, then redefine (PKG)_CONFIGURE_CMDS. If it's
> a gentargets package, then the only choice you have is to change
> (PKG)_CONFIGURE_CMDS. If it's a manual makefile package, then you will
> have to add/change the configuration step, if it has one, and/or the
> installation step, if necessary. I would suggest that you read
> buildroot/docs/buildroot.html. It has a lot of good information about
> creating and changing packages.

Thanks for the reply.

My package is autotools based.  Currently my *.mk looks something like this.


FOO_VERSION = 0.0.1
FOO_SOURCE = foo-$(FOO_VERSION).tar.gz
FOO_SITE = http://dummysite
FOO_AUTORECONF = YES
FOO_INSTALL_STAGING = NO
FOO_INSTALL_TARGET = YES

FOO_CONF_OPT = --with-freetype-prefix=$(STAGING_DIR)/usr \
		--with-sdl-prefix=$(STAGING_DIR)/usr \
		--with-sdl-exec-prefix=$(STAGING_DIR)/usr

FOO_DEPENDENCIES = sdl sdl_image

$(eval $(call AUTOTARGETS,package,foo))


To install the package inro a different location I assume I need to override the
--prefix option in the ./configure step.  But this appears to be hardcoded to
/usr in Makefile.autotools.in:

# Configure package for target
define $(2)_CONFIGURE_CMDS
	(cd $$($$(PKG)_SRCDIR) && rm -rf config.cache && \
	$$(TARGET_CONFIGURE_OPTS) \
	$$(TARGET_CONFIGURE_ARGS) \
	$$($$(PKG)_CONF_ENV) \
	./configure \
		$$(if $$(filter YES,$$($$(PKG)_USE_CONFIG_CACHE)),--cache-file="$(BUILD_DIR)/tgt-config.cache",) \
		--target=$$(GNU_TARGET_NAME) \
		--host=$$(GNU_TARGET_NAME) \
		--build=$$(GNU_HOST_NAME) \
		--prefix=/usr \
		--exec-prefix=/usr \
		--sysconfdir=/etc \
		$$(DISABLE_DOCUMENTATION) \
		$$(DISABLE_NLS) \
		$$(DISABLE_LARGEFILE) \
		$$(DISABLE_IPV6) \
		$$(QUIET) $$($$(PKG)_CONF_OPT) \
	)

Will adding --prefix/{somedir} to FOO_CONF_OPT override this?

Thanks,
Hartley
