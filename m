From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Apr 2015 23:52:43 +0200
Subject: [Buildroot] [PATCH 1/1] gmock: new package
In-Reply-To: <1425304883-4332-2-git-send-email-casantos@datacom.ind.br>
References: <1425304883-4332-1-git-send-email-casantos@datacom.ind.br>
 <1425304883-4332-2-git-send-email-casantos@datacom.ind.br>
Message-ID: <20150427235243.3ffef238@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carlos Santos,

On Mon,  2 Mar 2015 11:01:23 -0300, Carlos Santos wrote:

> diff --git a/package/gmock/gmock.hash b/package/gmock/gmock.hash
> new file mode 100644
> index 0000000..4d038e2
> --- /dev/null
> +++ b/package/gmock/gmock.hash
> @@ -0,0 +1,3 @@
> +# No upstream hashes for the following:

We use:

# Locally computed

and a single sha256 hash.

> +md5 073b984d8798ea1594f5e44d85b20d66 gmock-1.7.0.zip
> +sha1 f9d9dd882a25f4069ed9ee48e70aff1b53e3c5a5 gmock-1.7.0.zip
> diff --git a/package/gmock/gmock.mk b/package/gmock/gmock.mk
> new file mode 100644
> index 0000000..5ecf940
> --- /dev/null
> +++ b/package/gmock/gmock.mk
> @@ -0,0 +1,47 @@
> +################################################################################
> +#
> +# gmock
> +#
> +################################################################################
> +
> +GMOCK_VERSION = 1.7.0
> +GMOCK_SOURCE = gmock-$(GMOCK_VERSION).zip
> +GMOCK_SITE = http://googlemock.googlecode.com/files
> +GMOCK_INSTALL_STAGING = YES
> +GMOCK_INSTALL_TARGET = NO
> +GMOCK_LICENSE = BSD-3c
> +GMOCK_LICENSE_FILES = LICENSE
> +GMOCK_DEPENDENCIES = gtest
> +HOST_GMOCK_DEPENDENCIES = host-python
> +
> +GMOCK_CONF_OPTS = --with-gtest=$(STAGING_DIR)/usr/lib/
> +
> +define GMOCK_EXTRACT_CMDS
> +	$(UNZIP) $(DL_DIR)/$(GMOCK_SOURCE) -d $(BUILD_DIR)
> +endef
> +
> +define GMOCK_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/lib/.libs/libgmock.a $(STAGING_DIR)/usr/lib/libgmock.a
> +	$(INSTALL) -D -m 0755 $(@D)/lib/.libs/libgmock_main.a $(STAGING_DIR)/usr/lib/libgmock_main.a
> +	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/gmock/
> +	cp -rp $(@D)/include/gmock/* $(STAGING_DIR)/usr/include/gmock/
> +endef

Why don't you use the default rule for autotools-package staging
installation?

> +
> +
> +# Unzipping inside $(@D) and moving everything from the created subdirectory is
> +# required because unzipping directly in $(BUILD_DIR) would cause host-gmock to
> +# overwrite the gmock subdir instead of unzipping in a host-gmock subdir.
> +define HOST_GMOCK_EXTRACT_CMDS
> +	$(UNZIP) $(DL_DIR)/$(GMOCK_SOURCE) -d $(@D)
> +	mv $(@D)/gmock-$(GMOCK_VERSION)/* $(@D)
> +	rmdir $(@D)/gmock-$(GMOCK_VERSION)
> +endef
> +
> +define HOST_GMOCK_INSTALL_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/scripts/generator/gmock_gen.py $(HOST_DIR)/usr/bin/gmock_gen.py
> +	ln -sf gmock_gen.py $(HOST_DIR)/usr/bin/gmock_gen
> +	cp -rp $(@D)/scripts/generator/cpp $(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
> +endef
> +
> +$(eval $(autotools-package))
> +$(eval $(host-generic-package))

Who is using host-gmock? Your code is not using it apparently, so it
seems like dead code. Can you explain more how it is supposed to be
used? And why would it be a host-generic-package and not
host-autotools-package?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
