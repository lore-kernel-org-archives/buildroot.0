From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 05 Aug 2014 21:37:51 +0200
Subject: [Buildroot] [PATCH 2 of 2 v3] infra/pkg-kconfig: incorporate
	oldconfig call to avoid endless rebuilds
In-Reply-To: <20140805192715.GC4268@free.fr>
References: <patchbomb.1407235011@localhost>
 <707fc324a92e62b98ca1.1407235013@localhost> <20140805192715.GC4268@free.fr>
Message-ID: <0243edd5-42d7-4617-a35d-e40368157fb5@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
>Thomas?, All,
>
>On 2014-08-05 12:36 +0200, Thomas De Schampheleire spake thusly:
>> The configure step of the busybox package performs 'make oldconfig', which
>> causes the .config file to be updated. Thus, the .config file is more recent
>> than our stamp file .stamp_kconfig_fixup_done. On a subsequent build, our
>> dependency rules would kick in, and run the config fixup again, thus
>> kicking in the package's configure, build and install steps yet once
>> more, that, ad infinitum.
>> 
>> One solution is to modify kconfig-package to introduce an explicit touch of
>> the .kconfig_fixup_config_done stamp file, as post-configure hook.
>> 
>> Another solution, implemented by this patch, is to move the oldconfig call
>> from the package's .mk file to the kconfig-package infrastructure and make
>> sure it is done as part of the fixup commands. This way, the stamp file will
>> only be touched once, after the full fixup (including oldconfig) and no
>> endless rebuilds will occur.
>> 
>> Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> Suggested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
>[tested with running multiple 'make' in sequence; tested that
> busybox-menuconfig still forces a fixup and a rebuild]
>Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
>Regards,
>Yann E. MORIN.
>
>> ---
>> v3: implement alternative implementation
>> 
>>  package/busybox/busybox.mk |  2 --
>>  package/pkg-kconfig.mk     |  9 ++-------
>>  package/uclibc/uclibc.mk   |  6 ------
>>  3 files changed, 2 insertions(+), 15 deletions(-)
>> 
>> diff -r f81734945d5b -r 707fc324a92e package/busybox/busybox.mk
>> --- a/package/busybox/busybox.mk	Tue Aug 05 00:06:57 2014 +0200
>> +++ b/package/busybox/busybox.mk	Tue Aug 05 11:39:06 2014 +0200
>> @@ -205,8 +205,6 @@
>>  endef
>>  
>>  define BUSYBOX_CONFIGURE_CMDS
>> -	@yes "" | $(MAKE) ARCH=$(KERNEL_ARCH) CROSS_COMPILE="$(TARGET_CROSS)" \
>> -		-C $(@D) oldconfig
>>  	$(BUSYBOX_NOCLOBBER_INSTALL)
>>  endef
>>  
>> diff -r f81734945d5b -r 707fc324a92e package/pkg-kconfig.mk
>> --- a/package/pkg-kconfig.mk	Tue Aug 05 00:06:57 2014 +0200
>> +++ b/package/pkg-kconfig.mk	Tue Aug 05 11:39:06 2014 +0200
>> @@ -50,6 +50,8 @@
>>  # The exact rules are specified by the package .mk file.
>>  $$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/.config
>>  	$$($(2)_KCONFIG_FIXUP_CMDS)
>> +	@yes "" | $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
>> +		$$($(2)_KCONFIG_OPT) oldconfig
>>  	$$(Q)touch $$@
>>  
>>  # Before running configure, the configuration file should be present and fixed
>> diff -r f81734945d5b -r 707fc324a92e package/uclibc/uclibc.mk
>> --- a/package/uclibc/uclibc.mk	Tue Aug 05 00:06:57 2014 +0200
>> +++ b/package/uclibc/uclibc.mk	Tue Aug 05 11:39:06 2014 +0200
>> @@ -431,12 +431,6 @@
>>  	$(UCLIBC_LOCALE_CONFIG)
>>  	$(UCLIBC_WCHAR_CONFIG)
>>  	$(UCLIBC_STRIP_CONFIG)
>> -	yes "" | $(MAKE1) -C $(@D) \
>> -		$(UCLIBC_MAKE_FLAGS) \
>> -		PREFIX=$(STAGING_DIR) \
>> -		DEVEL_PREFIX=/usr/ \
>> -		RUNTIME_PREFIX=$(STAGING_DIR) \
>> -		oldconfig
>>  endef

One small note that I did not explicitly mention in the
commit message: this MAKE1 becomes a MAKE in the infra. I don't think this a problem, but full disclosure...

Best regards,
Thomas
