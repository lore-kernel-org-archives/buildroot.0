From: Julien Boibessot <julien.boibessot@free.fr>
Date: Sun, 30 Mar 2014 18:23:17 +0200
Subject: [Buildroot] [PATCH] Add agg (Anti-Grain Geometry) package
In-Reply-To: <53320546.5030909@mind.be>
References: <1395411147-14354-1-git-send-email-julien.boibessot@free.fr>
 <53320546.5030909@mind.be>
Message-ID: <533844F5.8010906@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

thanks for the review.

On 03/25/2014 11:37 PM, Arnout Vandecappelle wrote:
> On 21/03/14 15:12, julien.boibessot at free.fr wrote:
>> From: Julien Boibessot <julien.boibessot@armadeus.com>
>>
>> This library will be needed by gnash (soon coming Flash player).
>>
>> Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
>> ---
>>  package/Config.in     |    1 +
>>  package/agg/Config.in |   13 +++++++++++++
>>  package/agg/agg.mk    |   40 ++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 54 insertions(+), 0 deletions(-)
>>  create mode 100644 package/agg/Config.in
>>  create mode 100644 package/agg/agg.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 688ed4d..3b34a67 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -556,6 +556,7 @@ source "package/lockdev/Config.in"
>>  endmenu
>>  
>>  menu "Graphics"
>> +source "package/agg/Config.in"
>>  source "package/atk/Config.in"
>>  source "package/cairo/Config.in"
>>  source "package/fltk/Config.in"
>> diff --git a/package/agg/Config.in b/package/agg/Config.in
>> new file mode 100644
>> index 0000000..a842098
>> --- /dev/null
>> +++ b/package/agg/Config.in
>> @@ -0,0 +1,13 @@
>> +config BR2_PACKAGE_AGG
>> +	bool "agg"
>> +	depends on BR2_INSTALL_LIBSTDCPP
>> +	select BR2_PACKAGE_SDL
>> +	help
>> +	  The Anti-Grain Geometry project. A High Quality 2D Graphics Rendering
>> +	  Engine for C++.
>> +	  We select the SDL backend by default.
>> +
>> +	  http://www.antigrain.com/index.html
>> +
>> +comment "agg needs a toolchain with C++ support"
>> +	depends on !BR2_INSTALL_LIBSTDCPP
>> diff --git a/package/agg/agg.mk b/package/agg/agg.mk
>> new file mode 100644
>> index 0000000..05be931
>> --- /dev/null
>> +++ b/package/agg/agg.mk
>> @@ -0,0 +1,40 @@
>> +###############################################################################
>> +#
>> +# agg
>> +#
>> +###############################################################################
>> +
>> +AGG_VERSION = 2.5
>> +AGG_SITE = http://www.antigrain.com/
>> +AGG_LICENSE = GPLv3+
>> +AGG_LICENSE_FILES = COPYING
>> +AGG_INSTALL_STAGING = YES
>> +AGG_AUTORECONF = YES
>  Why is autoreconf needed? You take a release and don't have patches.

there is no "configure" in sources, so I thought it was the way to
regenerate it.
Another way to do that ?

>
>> +
>> +AGG_DEPENDENCIES = host-pkgconf sdl
>> +
>> +AGG_CONF_OPT = \
>> +        --with-sdl-prefix=$(STAGING_DIR)/usr \
>  Is this option really needed? It should be the default location for sdl...

it seems mandatory, otherwise "configure" takes the Host installed SDL
devt files in /usr/include/SDL/

>
>> +        --disable-sdltest
>> +
>> +ifeq ($(BR2_PACKAGE_SDL_X11),)
>> +AGG_CONF_OPT += \
>> +	--with-x=NO \
>> +	--disable-examples # examples require X11
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_FREETYPE),y)
>> +AGG_DEPENDENCIES += freetype
>> +AGG_CONF_OPT += --enable-freetype
>> +else
>> +AGG_CONF_OPT += --disable-freetype
>> +endif
>> +
>> +define AGG_CREATE_MISSING_FILES
>> +	touch $(@D)/NEWS $(@D)/AUTHORS $(@D)/README
>> +# Fixes reconfiguring with recent automake:
>> +	$(SED) 's/AM_C_PROTOTYPES//' $(@D)/configure.in
>> +endef
>> +AGG_POST_EXTRACT_HOOKS += AGG_CREATE_MISSING_FILES
>  If you don't autoreconf, this wouldn't be needed, right?

maybe, but I don't know how to bypass autoreconf :-)
I could call agg's "autogen.sh" but Buildroot AUTORECONF is doing the
same no ?

Regards,
Julien
