From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 02 Jan 2012 11:02:27 +0100
Subject: [Buildroot] [PATCH 3/3] Migrate the packages to the new infra
In-Reply-To: <201112202229.19551.arnout@mind.be>
References: <1322047811-12933-1-git-send-email-maxime.ripard@free-electrons.com>
 <1322047811-12933-4-git-send-email-maxime.ripard@free-electrons.com>
 <201112202229.19551.arnout@mind.be>
Message-ID: <4F0180B3.5010105@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/12/2011 22:29, Arnout Vandecappelle wrote:
> On Wednesday 23 November 2011 12:30:11 Maxime Ripard wrote:
>> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>  I only did a partial review, so no Reviewed-by tag.
> [snip]
>> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
>> index 73c4969..0ff27ca 100644
>> --- a/package/busybox/busybox.mk
>> +++ b/package/busybox/busybox.mk
>> @@ -30,11 +30,7 @@ endif
>>  
>>  # If mdev will be used for device creation enable it and copy S10mdev to /etc/init.d
>>  ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
>> -define BUSYBOX_INSTALL_MDEV_SCRIPT
>> -	[ -f $(TARGET_DIR)/etc/init.d/S10mdev ] || \
>> -		install -D -m 0755 package/busybox/S10mdev \
>> -			$(TARGET_DIR)/etc/init.d/S10mdev
>> -endef
>> +BUSYBOX_INIT_SYSV += package/busybox/S10mdev
>  This is not actually equivalent: the original makes sure not to overwrite 
> an existing S10mdev (coming from the skeleton).  Perhaps patch 2/3 should
> include this test as well.

Definitely.

>>  define BUSYBOX_INSTALL_MDEV_CONF
>>  	[ -f $(TARGET_DIR)/etc/mdev.conf ] || \
>>  		install -D -m 0644 package/busybox/mdev.conf \
>> @@ -139,6 +135,7 @@ define BUSYBOX_SET_INIT
>>  endef
>>  endif
>>  
>> +ifeq ($(BR2_INIT_BUSYBOX)$(BR2_INIT_SYSV),y)
>>  define BUSYBOX_INSTALL_LOGGING_SCRIPT
>>  	if grep -q CONFIG_SYSLOGD=y $(@D)/.config; then \
>>  		[ -f $(TARGET_DIR)/etc/init.d/S01logging ] || \
>> @@ -146,12 +143,15 @@ define BUSYBOX_INSTALL_LOGGING_SCRIPT
>>  				$(TARGET_DIR)/etc/init.d/S01logging; \
>>  	else rm -f $(TARGET_DIR)/etc/init.d/S01logging; fi
>>  endef
>> +else
>> +define BUSYBOX_INSTALL_LOGGING_SCRIPT
>> +endef
>> +endif
>  This else part is not necessary: an undefined variable evaluates to nothing.

Ok, good to know

>>  
>>  # We do this here to avoid busting a modified .config in configure
>>  BUSYBOX_POST_EXTRACT_HOOKS += BUSYBOX_COPY_CONFIG
>>  
>>  define BUSYBOX_CONFIGURE_CMDS
>> -	$(BUSYBOX_SET_SYSKLOGD)
>>  	$(BUSYBOX_SET_BB_PWD)
>>  	$(BUSYBOX_SET_LARGEFILE)
>>  	$(BUSYBOX_SET_IPV6)
>> @@ -177,7 +177,6 @@ define BUSYBOX_INSTALL_TARGET_CMDS
>>  		$(INSTALL) -m 0755 -D package/busybox/udhcpc.script \
>>  			$(TARGET_DIR)/usr/share/udhcpc/default.script; \
>>  	fi
>> -	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
>>  	$(BUSYBOX_INSTALL_MDEV_CONF)
>>  	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
>>  endef
> [snip]
> 
>  By the way, doesn't systemd support sysv-style init scripts as well?

It does, but you lose almost if not all the benefits of using systemd
with sysv scripts.


-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
