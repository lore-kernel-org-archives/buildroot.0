From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 06 Apr 2014 00:11:36 +0200
Subject: [Buildroot] [PATCH 2/2] exim: new package
In-Reply-To: <20140405183515.473bebd4@skate>
References: <1394124890-29254-1-git-send-email-luca@lucaceresoli.net>
 <1394124890-29254-3-git-send-email-luca@lucaceresoli.net>
 <20140405183515.473bebd4@skate>
Message-ID: <53407F98.9080602@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

thanks for applying my patch and improving it.

However now that we have a "Mail" category exim should be placed there.
I'm sending a patch to move it.

Thomas Petazzoni wrote:
> Dear Luca Ceresoli,
>
> On Thu,  6 Mar 2014 17:54:50 +0100, Luca Ceresoli wrote:
>> ---
>
> You also for your SoB here.
>
>> diff --git a/package/exim/exim.mk b/package/exim/exim.mk
>> new file mode 100644
>> index 0000000..011d0a4
>> --- /dev/null
>> +++ b/package/exim/exim.mk
>> @@ -0,0 +1,41 @@
>> +#############################################################
>> +#
>> +# exim
>> +#
>> +#############################################################
>> +
>> +EXIM_VERSION = 4.82
>> +EXIM_SOURCE = exim-$(EXIM_VERSION).tar.bz2
>> +EXIM_SITE = ftp://ftp.exim.org/pub/exim/exim4
>> +EXIM_LICENSE = GPLv2+
>> +EXIM_LICENSE_FILES = LICENCE
>> +EXIM_DEPENDENCIES = pcre berkeleydb
>> +
>> +# These echos seem to be the sanest way to feed CC and CFLAGS to exim
>> +define EXIM_CONFIGURE_CMDS
>> +	install -D package/exim/Local-Makefile $(@D)/Local/Makefile
>
> I've used $(INSTALL) -m0644 instead
>
>> +	echo "CC=$(TARGET_CC)" >>$(@D)/Local/Makefile
>> +	echo "CFLAGS=$(TARGET_CFLAGS)" >>$(@D)/Local/Makefile
>> +	echo "HOSTCC=$(HOSTCC)" >>$(@D)/Local/Makefile
>> +	echo "HOSTCFLAGS=$(HOSTCFLAGS)" >>$(@D)/Local/Makefile
>
> I've added AR and RANLIB here, otherwise the exim build system uses the
> native versions.

Did you actually experience a build error, or just fixed ased on visual
inspection? That's weird, the code I submitted works here. But my build
environment is different, this might justify a different behaviour.

Of course I am not against this change, in the worst case it's useless.
Just curious.

>
>> +endef
>> +
>> +# "The -j (parallel) flag must not be used with make"
>> +# (http://www.exim.org/exim-html-current/doc/html/spec_html/ch04.html)
>> +define EXIM_BUILD_CMDS
>> +	build=br $(MAKE1) -C $(@D)
>> +endef
>> +
>> +define EXIM_INSTALL_TARGET_CMDS
>> +	$(INSTALL) -D -m 755 package/exim/S86exim \
>> +		$(TARGET_DIR)/etc/init.d/S86exim
>
> I've moved this to EXIM_INSTALL_INIT_SYSV.
>
>> +	DESTDIR=${TARGET_DIR} INSTALL_ARG="-no_chown -no_symlink" build=br \
>> +	  $(MAKE1) -C $(@D) install
>> +	chmod u+s ${TARGET_DIR}/usr/sbin/exim
>
> I've replaced both {TARGET_DIR} by (TARGET_DIR)
>
> I've committed with those changes.
>
> However, upon startup, I get an exim failure, would be good to have a
> look:
>
> Starting exim...
> 1970-01-01 00:00:06 Exim configuration error in line 541 of /etc/exim/configure:
>    router dnslookup: cannot find router driver "dnslookup"
>
> My defconfig is:
>
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2014.02-rc1.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_13=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> BR2_PACKAGE_EXIM=y

I'll have a look at this error.


-- 
Luca
