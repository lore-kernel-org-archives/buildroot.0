From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 21:37:41 +0200
Subject: [Buildroot] [PATCHv2 1/1] xterm: x-includes and x-libraries
 must be set for cross-compiling
In-Reply-To: <20150726175949.GI3770@free.fr>
References: <1437932796-16216-1-git-send-email-bas@bmail.ru>
 <20150726175949.GI3770@free.fr>
Message-ID: <55B53705.7010703@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mikhail, Yann, All,

Le 26/07/2015 19:59, Yann E. MORIN a ?crit :
> Mikhail, All,
> 
> On 2015-07-26 20:46 +0300, kyak spake thusly:
>> From: Mikhail Peselnik <bas@bmail.ru>
>>
>> These flags need to be set so that the configure script would
>> correctly use libICE from cross-toolchain rather than from host.
>> Also, the xterm package is missing the freetype2 dependency, as
>> noted by Romain Naour.

This patch does two things: add x-includes, x-libraries and add freetype2
dependency.
It would be good to split these changes in two different patches.

>>
>> This fix is similar to "package/efl/libevas: x-includes and x-libraries
>> must be set for cross-compiling" done by Romain Naour on libecore.
>>
>> Signed-off-by: Mikhail Peselnik <bas@bmail.ru>
> 
> The From filed does not match your Signed-off-by; please fix your git
> config with:
> 
>     git config --global user.name 'Mikhail Peselnik'
>     git config --global user.email 'bas at bmail.ru'
> 
>> ---
>>  package/xterm/Config.in | 1 +
>>  package/xterm/xterm.mk  | 7 +++++--
>>  2 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/xterm/Config.in b/package/xterm/Config.in
>> index e17d2c6..f549df4 100644
>> --- a/package/xterm/Config.in
>> +++ b/package/xterm/Config.in
>> @@ -4,6 +4,7 @@ config BR2_PACKAGE_XTERM
>>  	select BR2_PACKAGE_XLIB_LIBXAW
>>  	depends on BR2_PACKAGE_XORG7
>>  	depends on BR2_USE_MMU # fork()
>> +	depends on BR2_PACKAGE_FREETYPE
> 
> This should be a 'select' rather than a 'depends on'.

In not sure about select. There is a --disable-freetype option, see below.

> 
>>  	help
>>  	  xterm terminal emulator
>>  
>> diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
>> index 56f692d..f7a332d 100644
>> --- a/package/xterm/xterm.mk
>> +++ b/package/xterm/xterm.mk
>> @@ -10,6 +10,9 @@ XTERM_SITE = ftp://invisible-island.net/xterm
>>  XTERM_DEPENDENCIES = ncurses xlib_libXaw
>>  XTERM_LICENSE = MIT
>>  XTERM_LICENSE_FILES = version.c
>> -XTERM_CONF_OPTS = --enable-256-color
>> -
>> +XTERM_CONF_OPTS = --enable-256-color \
>> +	--x-includes=$(STAGING_DIR)/usr/include \
>> +	--x-libraries=$(STAGING_DIR)/usr/lib \
>> +	--with-freetype-cflags=$(STAGING_DIR)/usr/include \
> 
> I guess this should instead be: -I$(STAGING_DIR)/usr/include
> 
>> +	--with-freetype-libs=$(STAGING_DIR)/usr/lib
> 
> And this: -L$(STAGING_DIR)/usr/lib
> 
> You may also want to add:
> 
>     --with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config

Maybe something like this (untested):

ifeq ($(BR2_PACKAGE_FREETYPE),y)
XTERM_CONF_OPTS += --with-freetype-config="$(STAGING_DIR)/usr/bin/freetype-config" \
                   --with-freetype-cflags="-I$(STAGING_DIR)/usr/include" \
                   --with-freetype-libs="-L$(STAGING_DIR)/usr/lib"
else
XTERM_CONF_OPTS += --disable-freetype
endif

But it you think that freetype must always be selected, this is ok.

Thoughts ?

Best regards,
Romain Naour

> 
> Regards,
> Yann E. MORIN.
> 
>>  $(eval $(autotools-package))
>> -- 
>> 2.4.6
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
