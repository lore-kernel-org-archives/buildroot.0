From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Dec 2014 14:31:05 +0100
Subject: [Buildroot] [PATCH v3] leveldb: new package
In-Reply-To: <1419418559-23870-1-git-send-email-ste@junkomatic.net>
References: <1419418559-23870-1-git-send-email-ste@junkomatic.net>
Message-ID: <20141224133105.GA3880@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steve, All,

On 2014-12-24 10:55 +0000, Steve James spake thusly:
> Adds new package: leveldb
> 
>   LevelDB is a fast key-value storage library written at Google that
>   provides an ordered mapping from string keys to string values.
> 
> Signed-off-by: Steve James <ste@junkomatic.net>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
[--SNIP--]
> diff --git a/package/leveldb/leveldb.mk b/package/leveldb/leveldb.mk
> new file mode 100644
> index 0000000..0a4a079
> --- /dev/null
> +++ b/package/leveldb/leveldb.mk
> @@ -0,0 +1,59 @@
> +################################################################################
> +#
> +# leveldb
> +#
> +################################################################################
> +
> +LEVELDB_VERSION = 803d69203a62faf50f1b77897310a3a1fcae712b
> +LEVELDB_SITE = $(call github,google,leveldb,$(LEVELDB_VERSION))
> +LEVELDB_LICENSE = BSD-3c
> +LEVELDB_LICENSE_FILES = LICENSE
> +LEVELDB_INSTALL_STAGING = YES
> +LEVELDB_DEPENDENCIES = snappy
> +
> +# The leveldb build has some basic autoconf-like behaviour which assumes the
> +# target is the host. We hard-wire it to the right outcome for Buildroot
> +# irrespective of the host.
> +LEVELDB_MAKE_ARGS = TARGET_OS=Linux
> +
> +# Default leveldb compiler flags
> +LEVELDB_CFLAGS = -DNDEBUG -I. -I./include -std=c++0x -pthread -DOS_LINUX -DLEVELDB_PLATFORM_POSIX
> +
> +TARGET_CFLAGS += $(LEVELDB_CFLAGS)
> +TARGET_CXXFLAGS += $(LEVELDB_CFLAGS)
> +TARGET_MAKE_ARGS += $(LEVELDB_MAKE_ARGS)

As you have already noticed, this is wrong: variables in Makefiles have
a global scope, so what you are doign here is simply overwriting those
variables for all packages.

What you want to do instead is:

> +define LEVELDB_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) $(TARGET_MAKE_ARGS)
> +endef

    define LEVELDB_BUILD_CMDS
        $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
            CFLAGS="$(TARGET_CFLAGS) $(LEVELDB_CFLAGS)" \
            CXXFLAGS="$(TARGET_CXXFLAGS) $(LEVELDB_CFLAGS)" \
            TARGET_OS=Linux
    endef

(and get rid of no longer needed variables, of course.)

Regards,
Yann E. MORIN.

> +ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> +define LEVELDB_INSTALL_STAGING_CMDS_STATIC
> +	$(INSTALL) -D -m 0644 $(@D)/libleveldb.a $(STAGING_DIR)/usr/lib
> +endef
> +endif
> +
> +ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> +define LEVELDB_INSTALL_STAGING_CMDS_SHARED
> +	$(INSTALL) -D -m 0755 $(@D)/libleveldb.so.1.18 $(STAGING_DIR)/usr/lib
> +	$(HOSTLN) -sf libleveldb.so.1.18 $(STAGING_DIR)/usr/lib/libleveldb.so.1
> +	$(HOSTLN) -sf libleveldb.so.1.18 $(STAGING_DIR)/usr/lib/libleveldb.so
> +endef
> +endif
> +
> +define LEVELDB_INSTALL_STAGING_CMDS
> +	$(LEVELDB_INSTALL_STAGING_CMDS_STATIC)
> +	$(LEVELDB_INSTALL_STAGING_CMDS_SHARED)
> +	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/leveldb
> +	$(INSTALL) -D -m 0644 $(@D)/include/leveldb/*.h $(STAGING_DIR)/usr/include/leveldb
> +endef
> +
> +ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> +define LEVELDB_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/libleveldb.so.1.18 $(TARGET_DIR)/usr/lib
> +	$(HOSTLN) -sf libleveldb.so.1.18 $(TARGET_DIR)/usr/lib/libleveldb.so.1
> +	$(HOSTLN) -sf libleveldb.so.1.18 $(TARGET_DIR)/usr/lib/libleveldb.so
> +endef
> +endif
> +
> +$(eval $(generic-package))
> -- 
> 1.7.10.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
