From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Dec 2014 00:02:43 +0100
Subject: [Buildroot] [PATCH] leveldb: new package
In-Reply-To: <201412151541.19296.ste@junkomatic.net>
References: <201412151541.19296.ste@junkomatic.net>
Message-ID: <20141216230243.GE4192@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steve, All,

On 2014-12-15 15:41 +0000, Steve James spake thusly:
> Adds new package: leveldb
> 
>   LevelDB is a fast key-value storage library written at Google that
>   provides an ordered mapping from string keys to string values.
> 
> Signed-off-by: Steve James <ste@junkomatic.net>
[--SNIP--]
> diff --git a/package/leveldb/leveldb.mk b/package/leveldb/leveldb.mk
> new file mode 100644
> index 0000000..d11ef59
> --- /dev/null
> +++ b/package/leveldb/leveldb.mk
> @@ -0,0 +1,34 @@
> +################################################################################
> +#
> +# leveldb
> +#
> +################################################################################
> +
> +LEVELDB_VERSION = 1.18
> +LEVELDB_SITE = https://github.com/google/leveldb/archive/
> +LEVELDB_SOURCE = v$(LEVELDB_VERSION).tar.gz

There is a simple way to add packages from GitHub, see:
    http://nightly.buildroot.org/#_tips_and_tricks

Basically, that means wirting:

    LEVELDB_SOURCE = $(call github,google,leveldb,$(LEVELDB_VERSION))

I know the manual says to prefer the "green button" but in this case, it
means we would end up with a tarball locally named v1.18.tar.gz.

This is not nice, because there is thus no way to know what package it
applies to, and we usually have tarballs named foo-version.tar.gz

So, in this case, I would prefer we use the github helper, even though
upstream has uploaded release tarballs.

> +LEVELDB_LICENSE = BSD-3c
> +LEVELDB_LICENSE_FILES = LICENSE
> +LEVELDB_INSTALL_STAGING = YES
> +LEVELDB_DEPENDENCIES = snappy
> +
> +define LEVELDB_BUILD_CMDS
> +	$(MAKE) CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" -C $(@D) all

Passing CC and CXX is not enough, because you are missing the CFLAGS and
CXXFLAGS, as well as others, like LDFLAGS.

We usually write:

    $(MAKE) $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) -C $(@D)

> +endef
> +
> +define LEVELDB_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 0644 $(@D)/libleveldb.a       $(STAGING_DIR)/usr/lib
> +	$(INSTALL) -D -m 0755 $(@D)/libleveldb.so.1.18 $(STAGING_DIR)/usr/lib
> +	$(HOSTLN) -sf libleveldb.so.1.18 $(STAGING_DIR)/usr/lib/libleveldb.so.1
> +	$(HOSTLN) -sf libleveldb.so.1.18 $(STAGING_DIR)/usr/lib/libleveldb.so
> +	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/leveldb
> +	$(INSTALL) -D -m 0644 $(@D)/include/leveldb/*.h $(STAGING_DIR)/usr/include/leveldb
> +endef
> +
> +define LEVELDB_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/libleveldb.so.1.18 $(TARGET_DIR)/usr/lib
> +	$(HOSTLN) -sf libleveldb.so.1.18 $(TARGET_DIR)/usr/lib/libleveldb.so.1
> +	$(HOSTLN) -sf libleveldb.so.1.18 $(TARGET_DIR)/usr/lib/libleveldb.so

I think you are the first one to actually use HOSTLN! :-)
Hmm, in fact I already used it in keyutils. Hehe! :-)

> +endef

Ah, we have had a very recent (like, *very* recent) change that allows
the user to select what libraries they want:
  - shared only
  - static only
  - both

So, you'd want to write something like:

    ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
    define LEVELDB_INSTALL_STAGING_STATIC
        $(INSTALL) -D -m 0644 $(@D)/libleveldb.a       $(STAGING_DIR)/usr/lib
    endef
    endif

    ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
    define LEVELDB_INSTALL_STAGING_SHARED
        $(INSTALL) -D -m 0755 $(@D)/libleveldb.so.1.18 $(STAGING_DIR)/usr/lib
        $(HOSTLN) -sf libleveldb.so.1.18 $(STAGING_DIR)/usr/lib/libleveldb.so.1
        $(HOSTLN) -sf libleveldb.so.1.18 $(STAGING_DIR)/usr/lib/libleveldb.so
    endef
    endif

    define LEVELDB_INSTALL_STAGING_CMDS
        $(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/leveldb
        $(INSTALL) -D -m 0644 $(@D)/include/leveldb/*.h $(STAGING_DIR)/usr/include/leveldb
        $(LEVELDB_INSTALL_STAGING_STATIC)
        $(LEVELDB_INSTALL_STAGING_SHARED)
    endef

    ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
    define LEVELDB_INSTALL_TARGET_CMDS
        $(INSTALL) -D -m 0755 $(@D)/libleveldb.so.1.18 $(TARGET_DIR)/usr/lib
        $(HOSTLN) -sf libleveldb.so.1.18 $(TARGET_DIR)/usr/lib/libleveldb.so.1
        $(HOSTLN) -sf libleveldb.so.1.18 $(TARGET_DIR)/usr/lib/libleveldb.so
    endef
    endif

Otherwise, this looks real good!

Regards,
Yann E. MORIN.

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
