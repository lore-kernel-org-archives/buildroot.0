From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
Date: Mon, 07 Mar 2011 18:27:37 +0100
Subject: [Buildroot] [PATCH] libv4l: Add new package libv4l
In-Reply-To: <20110307144212.337d7778@surf>
References: <1299253620-10707-1-git-send-email-schwarzkopf@sensortherm.de>
	<20110307144212.337d7778@surf>
Message-ID: <4D751589.2050408@sensortherm.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

i have made a new patch with the changes.

Thanks for your response!

The libv4l utilities are in my next patch.

Regards,

Klaus



Am 07.03.2011 14:42, schrieb Thomas Petazzoni:
> Hello Klaus,
>
> Thanks for this new package. A couple of comments below.
>
> On Fri,  4 Mar 2011 16:47:00 +0100
> Klaus Schwarzkopf<schwarzkopf@sensortherm.de>  wrote:
>
>> --- /dev/null
>> +++ b/package/libv4l/Config.in
>> @@ -0,0 +1,10 @@
>> +config BR2_PACKAGE_LIBV4L
>> +	bool "libv4l"
>> +	depends on BR2_LARGEFILE
>> +	help
>> +	  	libv4l is an accompanying collection of libraries that adds a thin abstraction layer on top of video4linux2 (V4L2) devices.
>> +
>> +		http://freshmeat.net/projects/libv4l
>
> The help text indentation should be one tab + 2 spaces, and should be
> wrapped at a reasonable length (~80 columns).
>
>> +#############################################################
>> +#
>> +# libv4l
>> +#
>> +#############################################################
>> +LIBV4L_VERSION = 0.8.1
>
> Version 0.8.3 is the latest release. Any reason not to use it ?
>
>> +LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
>> +LIBV4L_SITE = http://linuxtv.org/downloads/v4l-utils/
>> +LIBV4L_INSTALL_STAGING = YES
>> +LIBV4L_INSTALL_TARGET = YES
>
>> +LIBV4L_CONF_OPT = --enable-shared \
>> +		  --enable-static \
>
> Since you're using the GENTARGETS infrastructure, this line is useless.
>
>> +
>> +define LIBV4L_BUILD_CMDS
>> + 	#$(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D) all
>
> Comment, remove.
>
>> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/lib PREFIX=/usr LINKTYPE=static
>> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/lib PREFIX=/usr
>
> static linking is only needed when BR2_PREFER_STATIC_LIB is used. So
> something like :
>
> LIBV4L_MAKE_OPTS = PREFIX=/usr
> ifeq ($(BR2_PREFER_STATIC_LIB),y)
> LIBV4L_MAKE_OPTS += LINKTYPE=static
> endif
>
> define LIBV4L_BUILD_CMDS
> 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/lib $(LIBV4AL_MAKE_OPTS)
> endif
>
> Moreover, why do you build only the library ? There are some utilities
> in utils/ that may be interesting to build (not all of them, since at
> least one of them depends on Qt, and we don't want libv4l to depend on
> Qt). You could add a sub-option "Install libv4l utils" to be able to
> selectively install or not the libv4l utilities.
>
>> +#CFLAGS=-DO_LARGEFILE=0400000
>
> Comment, remove.
>
>> +endef
>> +
>> +define LIBV4L_INSTALL_STAGING_CMDS
>> + 	$(INSTALL) -D -m 0755 $(@D)/lib/libv4l1/libv4l1.a $(STAGING_DIR)/usr/lib/libv4l1.a
>> + 	$(INSTALL) -D -m 0644 $(@D)/lib/include/libv4l1.h $(STAGING_DIR)/usr/include/libv4l1.h
>> + 	$(INSTALL) -D -m 0755 $(@D)/lib/libv4l1/libv4l1.so* $(STAGING_DIR)/usr/lib
>> +
>> + 	$(INSTALL) -D -m 0755 $(@D)/lib/libv4l2/libv4l2.a $(STAGING_DIR)/usr/lib/libv4l2.a
>> + 	$(INSTALL) -D -m 0644 $(@D)/lib/include/libv4l2.h $(STAGING_DIR)/usr/include/libv4l2.h
>> + 	$(INSTALL) -D -m 0755 $(@D)/lib/libv4l2/libv4l2.so* $(STAGING_DIR)/usr/lib
>> +
>> + 	$(INSTALL) -D -m 0755 $(@D)/lib/libv4lconvert/libv4lconvert.a $(STAGING_DIR)/usr/lib/libv4l2.a
>> + 	$(INSTALL) -D -m 0644 $(@D)/lib/include/libv4lconvert.h $(STAGING_DIR)/usr/include/libv4lconvert.h
>> + 	$(INSTALL) -D -m 0755 $(@D)/lib/libv4lconvert/libv4lconvert.so* $(STAGING_DIR)/usr/lib
>> +endef
>> +
>> +define LIBV4L_INSTALL_TARGET_CMDS
>> + 	$(INSTALL) -D -m 0755 $(@D)/lib/libv4l1/libv4l1.so* $(TARGET_DIR)/usr/lib
>> + 	$(INSTALL) -D -m 0755 $(@D)/lib/libv4l2/libv4l2.so* $(TARGET_DIR)/usr/lib
>> + 	$(INSTALL) -D -m 0755 $(@D)/lib/libv4lconvert/libv4lconvert.so* $(TARGET_DIR)/usr/lib
>> +endef
>
> Why don't you use the "make install" target here ? The libv4l Makefile
> supports the $(DESTDIR) variable, so something like:
>
> define LIBV4L_INSTALL_STAGING_CMDS
> 	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) PREFIX=/usr install
> endif
>
> define LIBV4L_INSTALL_TARGET_CMDS
> 	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr install
> endif
>
> should work.
>
>> +$(eval $(call GENTARGETS,package,libv4l))
>> +#$(eval $(call AUTOTARGETS,package,libv4l))
>
> Comment, remove.
>
> Regards!
>
> Thomas
