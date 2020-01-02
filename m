From: Christopher McCrory <chrismcc@gmail.com>
Date: Thu, 2 Jan 2020 03:55:43 -0800
Subject: [Buildroot] [PATCH 1/2] package/perl-dbd-mysql: bump to version
 4.050
In-Reply-To: <20200102114347.2403649-1-chrismcc@gmail.com>
References: <20200102114347.2403649-1-chrismcc@gmail.com>
Message-ID: <CALURroQk+Re-mxVK_=amf0hJRKYb8U8roihZ9=LFwgZSVXXvCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 2, 2020 at 3:44 AM Christopher McCrory <chrismcc@gmail.com>
wrote:

> version 4.046_01 fixes compiling against mariadb and also introduces a
> patch
> that brakes with cross compiling, see patch 0001.
> Also the buildroot host-perl ModuleManager gets somthing wrong looking for
> libraries. Instead of checking in the build sysroot, it looks in the host
> systems /lib, /usr/lib, etc.  For a successful build, the host system will
> also need the matching mysql libraries installed.  Running ldd on mysql.so
> should show libmysqlclient, and libmariadb for MariaDB. If the result spits
> out an error about missing libraries, this is the reason.
> This is probably the only builtroot package where this is an issue.
>
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> -
>
>
>

I am successfully using this on a raspberrypi 3 using MariaDB.
php-mysql works there also.


For MariaDB I also needed::

chrismcc at centos8-lxc git]$ cat external/packages/fixup-mariadb/
fixup-mariadb.mk
################################################################################
#
# fixup-mariadb
#
################################################################################

ifeq ($(BR2_PACKAGE_FIXUP_MARIADB),y)

define MARIADB_POST_INSTALL_STAGING_MORE
        $(RM) -v $(STAGING_DIR)/usr/bin/mariadb_config
endef

MARIADB_POST_INSTALL_STAGING_HOOKS += MARIADB_POST_INSTALL_STAGING_MORE

define MARIADB_POST_INSTALL_MORE
$(RM) -r $(TARGET_DIR)/usr/data
endef

MARIADB_POST_INSTALL_TARGET_HOOKS += MARIADB_POST_INSTALL_MORE

endif

$(eval $(generic-package))






-- 
Christopher McCrory
To the optimist, the glass is half full.
To the pessimist, the glass is half empty.
To the engineer, the glass is twice as big as it needs to be.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200102/2b063690/attachment.html>
