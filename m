From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 18 Apr 2016 00:29:20 +0200
Subject: [Buildroot] [PATCH 1/1] flatcc: new package
In-Reply-To: <1460769824-19461-1-git-send-email-steve.derosier@lairdtech.com>
References: <1460769824-19461-1-git-send-email-steve.derosier@lairdtech.com>
Message-ID: <57140E40.9040700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Steve,

  Thanks for your contribution. I have a few comments, will you fix them and repost?


On 04/16/16 03:23, Steve deRosier wrote:
> This adds flatcc as a new package, pulling v0.3.0 from github. flatcc has
> both a host tool - the compiler, and libraries for the target.
>
> Signed-off-by: Steve deRosier <steve.derosier@lairdtech.com>
> ---
>   package/Config.in        |  1 +
>   package/flatcc/Config.in |  8 ++++++++
>   package/flatcc/flatcc.mk | 41 +++++++++++++++++++++++++++++++++++++++++

  You should also add a hash file.

>   3 files changed, 50 insertions(+)
>   create mode 100644 package/flatcc/Config.in
>   create mode 100644 package/flatcc/flatcc.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index bcfe13b..9e3d953 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1201,6 +1201,7 @@ menu "Other"
>   	source "package/ding-libs/Config.in"
>   	source "package/eigen/Config.in"
>   	source "package/elfutils/Config.in"
> +	source "package/flatcc/Config.in"
>   	source "package/fftw/Config.in"
>   	source "package/flann/Config.in"
>   	source "package/gflags/Config.in"
> diff --git a/package/flatcc/Config.in b/package/flatcc/Config.in
> new file mode 100644
> index 0000000..4f84f06
> --- /dev/null
> +++ b/package/flatcc/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_FLATCC
> +	bool "flatcc"

  I doesn't seem to build on big-endian, so add
	depends on BR2_ENDIAN == "LITTLE"

> +	help
> +	  flatcc is C language implementation of Google Flatbuffers. It consists
> +	  of both a library for the target as well as a flatbuffer compiler tool
> +	  for the host.

  Help text should be wrapped at 72 columns, where the tab counts as 8, so 62 
significant characters.

> +
> +	  https://github.com/dvidelabs/flatcc
> diff --git a/package/flatcc/flatcc.mk b/package/flatcc/flatcc.mk
> new file mode 100644
> index 0000000..28fb89b
> --- /dev/null
> +++ b/package/flatcc/flatcc.mk
> @@ -0,0 +1,41 @@
> +################################################################################
> +#
> +# FLATCC
> +#
> +################################################################################
> +FLATCC_VERSION = v0.3.0

  There's a v0.3.2 now.

> +FLATCC_SITE =$(call github,dvidelabs,flatcc,$(FLATCC_VERSION))
                 ^ missing space

> +FLATCC_LICENSE = Apache-2.0
> +FLATCC_LICENSE_FILES = LICENSE
> +FLATCC_INSTALL_STAGING = YES
> +FLATCC_DEPENDENCIES += host-flatcc

  The + is redundant.

> +
> +FLATCC_CONF_OPTS += -DFLATCC_TEST=OFF -DFLATCC_PORTABLE=ON

  Why set portable to ON? AFAICS in the CMakeLists.txt, it should be detected 
properly based on the cross-gcc version... But maybe that's something new in v0.3.2.

> +HOST_FLATCC_CONF_OPTS += -DFLATCC_TEST=OFF
> +
> +define HOST_FLATCC_INSTALL_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/bin/flatcc $(HOST_DIR)/usr/bin/flatcc

  I was going to say: this shouldn't be needed - but in fact it is, it looks 
like they have a weird CMakeLists.txt that doesn't even have an 'install' 
target... Se yes, this is needed.

> +endef


> +
> +ifeq ($(BR2_STATIC_LIBS),y)
> +	FLATCC_INSTALL_TARGET = NO

  We don't usually do this. However, in this case it does make sense because 
it's an elegant way to not execute the INSTALL_TARGET_COMMANDS that install the 
non-existent .so files.

  That said, it should not be indented. We only indent commands (inside a define 
block), not variable assignments.


> +define FLATCC_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/lib/libflatcc.a $(STAGING_DIR)/usr/lib/libflatcc.a
> +	$(INSTALL) -D -m 0755 $(@D)/lib/libflatccrt.a $(STAGING_DIR)/usr/lib/libflatccrt.a
> +	cp -r $(@D)/include/flatcc $(STAGING_DIR)/usr/include/.
> +endef
> +else
> +define FLATCC_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/lib/libflatcc.so $(STAGING_DIR)/usr/lib/libflatcc.so
> +	$(INSTALL) -D -m 0755 $(@D)/lib/libflatccrt.so $(STAGING_DIR)/usr/lib/libflatccrt.so
> +	cp -r $(@D)/include/flatcc $(STAGING_DIR)/usr/include/.
> +endef
> +endif

  Here you forgot about the STATIC_SHARED case. The proper way to do it would be:

ifeq ($(BR2_SHARED_LIBS),)
define FLATCC INSTALL_STAGING_STATIC
	... libflatcc.a and libflatccrt.a
endef
endif
ifeq ($(BR2_STATIC_LIBS),)
define FLATCC_INSTALL_STAGING_SHARED
	... libflatcc.so and libflatccrt.so
endef
endif

define FLATCC_INSTALL_STAGING_COMMANDS
	cp -r $(@D)/include/flatcc $(STAGING_DIR)/usr/include/.
	$(FLATCC_INSTALL_STAGING_STATIC)
	$(FLATCC_INSTALL_STAGING_SHARED)
endef

Alternatively, the condition for static could be:
ifeq ($(BR2_STATIC_LIBS)$(BR2_STATIC_SHARED_LIBS),y)



  Regards,
  Arnout

> +
> +define FLATCC_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/lib/libflatcc.so $(TARGET_DIR)/usr/lib/libflatcc.so
> +	$(INSTALL) -D -m 0755 $(@D)/lib/libflatccrt.so $(TARGET_DIR)/usr/lib/libflatccrt.so
> +endef
> +
> +$(eval $(cmake-package))
> +$(eval $(host-cmake-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
