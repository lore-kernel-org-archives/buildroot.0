From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 22:17:16 +0100
Subject: [Buildroot] [PATCH v6] gtest/gmock: bump to version 1.8.0
In-Reply-To: <1487070316-12583-1-git-send-email-casantos@datacom.ind.br>
References: <1473290219-27701-1-git-send-email-casantos@datacom.ind.br>
 <1487070316-12583-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20170305221716.4bffa10f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Feb 2017 09:05:16 -0200, Carlos Santos wrote:
> GTest version 1.8.0 includes gmock so merge both packages inside gtest
> 
> In this merge:
> 
> - Add gmock as a suboption of gtest (BR2_PACKAGE_GTEST_GMOCK)
>   following advice from Arnout Vandecappelle
> - Add BR2_PACKAGE_GMOCK as a legacy entry, selecting BR2_PACKAGE_GTEST
>   and BR2_PACKAGE_GTEST_GMOCK.
> - Use cmake to install libraries and headers and add missing files
>   (gtest.pc, gtest-config, gmock.pc) in
>   GTEST_POST_INSTALL_STAGING_HOOKS instead of redefining
>   GTEST_INSTALL_STAGING_CMDS
> - Remove patch on Python as gmock/gtest now supports python 3.0
>   (commit 456fc2b5c4e9ebf05a5987dfe1ff0ac9ffeb53cc)
> - Add the correct license in HOST_GTEST_LICENSE as all python code in
>   googlemock/scripts/generator is licensed under Apache-2.0 and not
>   BSD-3c
> - Fix URL of gtest project in Config.in
> - Remove the gmock entry from DEVELOPERS
> - Install gmock_gen directly, instead of as a symlink to gmock_gen.py
> 
> Notice that any external package that depends on gmock will cause an
> immediate build termination because make doesn't know how to build
> gmock. Since the user has just removed gmock from the legacy menu, it
> should be quite obvious what needs to be done.
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> Reviewed-by: Romain Naour <romain.naour@gmail.com>

As we discussed, I have applied this v6, with a few changes, see below.


> +config BR2_PACKAGE_GMOCK
> +	bool "gmock removed"

It's not exactly removed, but merged into gtest, so I've changed the
prompt slightly here.


> +ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
> +GTEST_DEPENDENCIES = host-gtest

Using a '=' here is not a good idea, += should be used instead. I agree
'=' works fine, but if someone else adds another GTEST_DEPENDENCIES =
above, then it will not be taken into account.

Generally speaking, for conditional assignments to <pkg>_DEPENDENCIES,
I really prefer when += is used.

> +endif
> +
> +HOST_GTEST_LICENSE = Apache-2.0
> +HOST_GTEST_LICENSE_FILES = googlemock/scripts/generator/LICENSE
> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +HOST_GTEST_PYTHON_VERSION = $(PYTHON3_VERSION_MAJOR)
> +HOST_GTEST_DEPENDENCIES = host-python3

Ditto.

> +else
> +HOST_GTEST_PYTHON_VERSION = $(PYTHON_VERSION_MAJOR)
> +HOST_GTEST_DEPENDENCIES = host-python

Ditto.


> +# GTest's CMakeLists.txt uses a tricky logic:
> +# - by default sets BUILD_GMOCK to ON and BUILD_GTEST to OFF
> +# - if BUILD_GMOCK is ON then builds gmock, which in its turn builds gtest,
> +#   regardless the value of BUILD_GTEST
> +# - otherwise, if BUILD_GTEST is ON then build gtest, only
> +# So, to build only gtest we must set BUILD_GTEST to ON and BUILD_GMOCK to OFF
> +# to revert the default values. Setting both to ON is not really necessary but
> +# describes clearly what we intend to do.

I really don't see what's tricky in the need to enable what you want to
build, and disable what you don't want, which is exactly what the
following piece of code does. So I've dropped this comment.

> +GTEST_CONF_OPTS += -DBUILD_GTEST=ON
> +ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
> +GTEST_CONF_OPTS += -DBUILD_GMOCK=ON
> +else
> +GTEST_CONF_OPTS += -DBUILD_GMOCK=OFF
> +endif
> +
> +define GTEST_GMOCK_INSTALL_MISSING_FILE
> +	$(INSTALL) -D -m 0644 package/gtest/gmock.pc \
> +		$(STAGING_DIR)/usr/lib/pkgconfig/gmock.pc
> +endef

I've moved this...

> +
> +GTEST_POST_INSTALL_STAGING_HOOKS = GTEST_INSTALL_MISSING_FILES
> +ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)

... inside the condition where it is actually used.

> +GTEST_POST_INSTALL_STAGING_HOOKS += GTEST_GMOCK_INSTALL_MISSING_FILE
> +endif

Thanks a lot for having worked on this, and going through the numerous
iterations!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
