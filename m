From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 23:06:32 +1300
Subject: [Buildroot] [PATCH v2] jsmn: new package
In-Reply-To: <1483441304-3789-1-git-send-email-david.bachelart@bbright.com>
References: <1483441304-3789-1-git-send-email-david.bachelart@bbright.com>
Message-ID: <20170128230632.71598265@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this contribution! I applied, but after doing a number of
changes. See below.

On Tue,  3 Jan 2017 12:01:44 +0100, David Bachelart wrote:
> diff --git a/package/jsmn/Config.in b/package/jsmn/Config.in
> new file mode 100644
> index 0000000..23d20f5
> --- /dev/null
> +++ b/package/jsmn/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_JSMN
> +	bool "jsmn"
> +	help
> +	  jsmn (pronounced like 'jasmine') is a minimalistic JSON parser in C. It can 
> +	  be easily integrated into resource-limited or embedded projects.

Those lines were too long, so I rewrapped the Config.in help text.

> diff --git a/package/jsmn/jsmn.hash b/package/jsmn/jsmn.hash
> new file mode 100644
> index 0000000..5cc51c3
> --- /dev/null
> +++ b/package/jsmn/jsmn.hash
> @@ -0,0 +1,4 @@
> +# Locally computed
> +md5 78e2731c5697a3c35795b6350402e015    jsmn-6021415cc75e7922d45b12935f56348b064d8a7f.tar.gz
> +sha1    09b1a3493db6b1a77b03bc835aa9be6345db5269    jsmn-6021415cc75e7922d45b12935f56348b064d8a7f.tar.gz
> +sha256  e08993848b2abab62aa9572a560bb6e5ed4762f8537cd67c4de6cb17e17090a0    jsmn-6021415cc75e7922d45b12935f56348b064d8a7f.tar.gz

Having a sha256 is sufficient, we consider it a sufficiently strong
hash.

> +JSMN_VERSION = 6021415cc75e7922d45b12935f56348b064d8a7f
> +JSMN_SITE = $(call github,zserge,jsmn,$(JSMN_VERSION))
> +JSMN_LICENSE = BSD

This is wrong. First BSD is not a license, you must specify BSD-2c or
BSD-3c. But more importantly, the project is not under a BSD license,
it's under a MIT license.

> +JSMN_LICENSE_FILES = LICENSE
> +
> +JSMN_INSTALL_STAGING = YES
> +JSMN_INSTALL_TARGET = NO
> +
> +define JSMN_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +		CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
> +		AR="$(TARGET_AR)"

Instead of passing CC and AR manually, I've used
$(TARGET_CONFIGURE_OPTS), which is shorter and better.

> +endef
> +
> +define JSMN_INSTALL_STAGING_CMDS
> +    $(INSTALL) -m 0644 $(@D)/libjsmn.a $(STAGING_DIR)/usr/lib/
> +    $(INSTALL) -m 0644 $(@D)/jsmn.h $(STAGING_DIR)/usr/include/

Indentation was wrong: you should use one tab to indent commands. And
the destination paths should be full paths, including the filename.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
