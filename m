From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Oct 2015 20:36:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/libcrossguid: new package
In-Reply-To: <1443468421-24604-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Mon, 28 Sep 2015 21:27:01 +0200")
References: <1443468421-24604-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <8737xr4x4u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Needed by Kodi 16.x-Jarvis:
 > https://github.com/xbmc/xbmc/commit/6f8171f53992fc2eaabf71f6fa47ebed1da0d43d

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/Config.in                    |  1 +
 >  package/libcrossguid/Config.in       | 13 +++++++++++++
 >  package/libcrossguid/libcrossguid.mk | 28 ++++++++++++++++++++++++++++
 >  3 files changed, 42 insertions(+)
 >  create mode 100644 package/libcrossguid/Config.in
 >  create mode 100644 package/libcrossguid/libcrossguid.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index 72b55c9..42a25be 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -1091,6 +1091,7 @@ menu "Other"
 >  	source "package/libcap-ng/Config.in"
 >  	source "package/libcgroup/Config.in"
 >  	source "package/libcofi/Config.in"
 > +	source "package/libcrossguid/Config.in"
 >  	source "package/libdaemon/Config.in"
 >  	source "package/libee/Config.in"
 >  	source "package/libev/Config.in"
 > diff --git a/package/libcrossguid/Config.in b/package/libcrossguid/Config.in
 > new file mode 100644
 > index 0000000..fb74c36
 > --- /dev/null
 > +++ b/package/libcrossguid/Config.in
 > @@ -0,0 +1,13 @@
 > +config BR2_PACKAGE_LIBCROSSGUID
 > +	bool "libcrossguid"
 > +	depends on BR2_INSTALL_LIBSTDCPP

You use -std=c++11 so we need gcc >= 4.7, similar to E.G. jsoncpp.


 > +LIBCROSSGUID_VERSION = 8f399e8bd4252be9952f3dfa8199924cc8487ca4
 > +LIBCROSSGUID_SITE = $(call github,graeme-hill,crossguid,$(LIBCROSSGUID_VERSION))
 > +LIBCROSSGUID_LICENSE = MIT
 > +LIBCROSSGUID_LICENSE_FILES = LICENSE
 > +LIBCROSSGUID_INSTALL_STAGING = YES
 > +LIBCROSSGUID_DEPENDENCIES = util-linux
 > +
 > +define LIBCROSSGUID_BUILD_CMDS
 > +	(cd $(@D); $(TARGET_CONFIGURE_OPTS) $(TARGET_CXX) -c guid.cpp -o guid.o -Wall -std=c++11 -DGUID_LIBUUID)
 > +	(cd $(@D); $(TARGET_CONFIGURE_OPTS) $(TARGET_AR) rvs libcrossguid.a guid.o)
 > +endef

As we only call TARGET_CXX / TARGET_AR and none of them use the
variables set by TARGET_CONFIGURE_OPTS that can be dropped to get a
simpler command line.

You are forgetting to pass $(TARGET_CXXFLAGS). -Wall isn't strictly needed
for anything.


> +
 > +define LIBCROSSGUID_INSTALL_STAGING_CMDS
 > +	$(INSTALL) -D -m 644 $(@D)/libcrossguid.a $(STAGING_DIR)/usr/lib/libcrossguid.a
 > +	$(INSTALL) -D -m 644 $(@D)/guid.h $(STAGING_DIR)/usr/include/guid.h
 > +endef
 > +
 > +define LIBCROSSGUID_INSTALL_TARGET_CMDS
 > +	$(INSTALL) -D -m 644 $(@D)/libcrossguid.a $(TARGET_DIR)/usr/lib/libcrossguid.a
 > +endef

There isn't any need to install a static library to target, so this
should be dropped (and _INSTALL_TARGET = NO).

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
