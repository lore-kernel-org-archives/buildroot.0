From: Mark Leo Sumadero <fryu771@gmail.com>
Date: Fri, 13 Mar 2020 18:26:38 +0800
Subject: [Buildroot] Help: error LONG_BIT definition appears wrong for
 platform
Message-ID: <CAA0OSwgGcbzMe9o35FRqmLBZ5PFMx=1+fDYyiqq0yLk5YJyNpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi I am a beginner on Buildroot and this is my first project
I am currently working on raspberry pi 3B+. One of my project dependencies
is mod_wsgi <https://modwsgi.readthedocs.io/en/develop/>.
I am trying to cross compile mod_wsgi but I can't make it work.

*I have this error: *

>>> mod-wsgi 61359e67448bdfc5fefb1692fd2a97f76394b20c Building
PATH="/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/bin:/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/sbin:/home/falcon/.nvm/versions/node/v12.16.1/bin:/home/falcon/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
 /usr/bin/make -j9  -C
/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/build/mod-wsgi-61359e67448bdfc5fefb1692fd2a97f76394b20c/
/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/apxs
-c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/include/python3.7m
-DNDEBUG  -Wc,-D_LARGEFILE_SOURCE -Wc,-D_LARGEFILE64_SOURCE
-Wc,-D_FILE_OFFSET_BITS=64 -Wc,-Os  src/server/mod_wsgi.c
src/server/wsgi_*.c
-L/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/lib
-L/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/lib/python3.7/config-3.7m
 -lpython3.7m -lpthread -ldl  -lutil -lm
/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/../../usr/build-1/libtool
--silent --mode=compile
/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
-prefer-pic -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Os  -DLINUX -D_REENTRANT -D_GNU_SOURCE
 -I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include
 -I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/../../usr/include/apr-1

-I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/../../usr/include/apr-1
-I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/../../../../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/include/python3.7m
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DNDEBUG
 -c -o src/server/mod_wsgi.lo src/server/mod_wsgi.c && touch
src/server/mod_wsgi.slo
In file included from
/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/include/python3.7m/Python.h:53:0,
                 from src/server/wsgi_python.h:24,
                 from src/server/mod_wsgi.c:22:
/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/include/python3.7m/pyport.h:699:2:
error: #error "LONG_BIT definition appears wrong for platform (bad
gcc/glibc config?)."
 #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc
config?)."
  ^~~~~
apxs:Error: Command failed with rc=65536


*Here is my .mk file*

################################################################################
#
# mod-wsgi
#
################################################################################

MOD_WSGI_VERSION = 61359e67448bdfc5fefb1692fd2a97f76394b20c
MOD_WSGI_SITE = $(call github,GrahamDumpleton,mod_wsgi,$(MOD_WSGI_VERSION))
MOD_WSGI_LICENSE = Apache-2.0
MOD_WSGI_LICENSE_FILES = LICENSE
MOD_WSGI_DEPENDENCIES = apache

MOD_WSGI_CONF_OPTS = \
--oldincludedir=$(STAGING_DIR)/usr/include/ \
--includedir=$(STAGING_DIR)/usr/include/ \
--with-apxs=$(STAGING_DIR)/usr/bin/apxs

ifeq ($(BR2_PACKAGE_PYTHON3),y)
MOD_WSGI_DEPENDENCIES += python3
MOD_WSGI_CONF_ENV += \
LDFLAGS='-L$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)' \
CPPFLAGS='-I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)' \
CFLAGS='-I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)'
# CFLAGS='$(filter-out -D_LARGEFILE64_SOURCE,$(TARGET_CFLAGS))
-I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)'
# MOD_WSGI_CONF_OPTS += \
# --with-python="$(STAGING_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)"
else
MOD_WSGI_DEPENDENCIES += python
MOD_WSGI_CONF_ENV += \
LDFLAGS='-L$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)' \
CPPFLAGS='-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)' \
CFLAGS='-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)'
# CFLAGS='$(filter-out -D_LARGEFILE64_SOURCE,$(TARGET_CFLAGS))
-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)'
# MOD_WSGI_CONF_OPTS += \
# --with-python="$(STAGING_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR)"
endif

# ifeq ($(BR2_PACKAGE_PYTHON3),y)
# MOD_WSGI_DEPENDENCIES += python3
# MOD_WSGI_CONF_OPTS += \
# --with-python="$(STAGING_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)/"
# else
# MOD_WSGI_DEPENDENCIES += python
# MOD_WSGI_CONF_OPTS += \
# --with-python="$(STAGING_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR)/"
# endif

# MOD_WSGI_EXCLUDES = $(TARGET_LIBEXECDIR)/*

# MOD_WSGI_AUTORECONF = YES

$(eval $(autotools-package))

Any idea why the build is failing. Thanks
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200313/c33ef34b/attachment.html>
