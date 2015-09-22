From: kei <kei-k@ca2.so-net.ne.jp>
Date: Tue, 22 Sep 2015 21:46:00 +0900
Subject: [Buildroot] [PATCH v10 1/1] squeezelite: new package
In-Reply-To: <1442923734.5410.39.camel@embedded.rocks>
References: <201509221038.t8MAc9DS019932@ms-omx03.plus.so-net.ne.jp>
 <1442923734.5410.39.camel@embedded.rocks>
Message-ID: <2C237626-118B-4EF0-A53C-F33B3E4A8986@ca2.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jorg.

On 2015/09/22, at 21:08, J?rg Krause <joerg.krause@embedded.rocks> wrote:

> Dear Hiroshi Kawashima,
> 
> please see my comment below...
> 
> On Di, 2015-09-22 at 19:38 +0900, kei-k at ca2.so-net.ne.jp wrote:
>> Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
>> ---
>> package/Config.in                  |    1 +
>> package/squeezelite/Config.in      |   27
>> +++++++++++++++++++++++++++
>> package/squeezelite/squeezelite.mk |   27
>> +++++++++++++++++++++++++++
>> 3 files changed, 55 insertions(+), 0 deletions(-)
>> create mode 100644 package/squeezelite/Config.in
>> create mode 100644 package/squeezelite/squeezelite.mk
>> 
>> diff --git a/package/Config.in b/package/Config.in
>> index 5158371..2a47420 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -33,6 +33,7 @@ menu "Audio and video applications"
>> 	source "package/opus-tools/Config.in"
>> 	source "package/pulseaudio/Config.in"
>> 	source "package/sox/Config.in"
>> +	source "package/squeezelite/Config.in"
>> 	source "package/tidsp-binaries/Config.in"
>> 	source "package/tovid/Config.in"
>> 	source "package/tstools/Config.in"
>> diff --git a/package/squeezelite/Config.in
>> b/package/squeezelite/Config.in
>> new file mode 100644
>> index 0000000..119ade1
>> --- /dev/null
>> +++ b/package/squeezelite/Config.in
>> @@ -0,0 +1,27 @@
>> +config BR2_PACKAGE_SQUEEZELITE
>> +	bool "squeezelite"
>> +	depends on BR2_USE_WCHAR # flac
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
>> +	depends on BR2_USE_MMU # mpg123
>> +	select BR2_PACKAGE_ALSA_LIB
>> +	select BR2_PACKAGE_FLAC
>> +	select BR2_PACKAGE_LIBMAD
>> +	select BR2_PACKAGE_LIBVORBIS
>> +	select BR2_PACKAGE_FAAD2
>> +	select BR2_PACKAGE_MPG123
>> +	help
>> +	  Logitech Media Server client
>> +
>> +	  https://code.google.com/p/squeezelite/
>> +if BR2_PACKAGE_SQUEEZELITE
>> +config BR2_PACKAGE_SQUEEZELITE_RESAMPLE
>> +	bool "Enable resampling function"
>> +	select BR2_PACKAGE_LIBSOXR
>> +	depends on BR2_PACKAGE_SQUEEZELITE
>> +	help
>> +	  Enable resampling function
>> +endif
> 
> Please add some newlines here and remove "depends on
> BR2_PACKAGE_SQUEEZELITE":
> 
> [...]
> 	select BR2_PACKAGE_MPG123
> 	help
> 	  Logitech Media Server client
> 
> 	  https://code.google.com/p/squeezelite/>
> 
> if BR2_PACKAGE_SQUEEZELITE
> 
> config BR2_PACKAGE_SQUEEZELITE_RESAMPLE
> 	bool "Enable resampling function"
> 	select BR2_PACKAGE_LIBSOXR
> 	help
> 	  Enable resampling function
> 
> endif
> 
> comment "squeezelite needs a toolchain w/ wchar, threads"
> [?]
> 
OK

>> +comment "squeezelite needs a toolchain w/ wchar, threads"
>> +	depends on BR2_USE_MMU
>> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
>> diff --git a/package/squeezelite/squeezelite.mk
>> b/package/squeezelite/squeezelite.mk
>> new file mode 100644
>> index 0000000..4defa31
>> --- /dev/null
>> +++ b/package/squeezelite/squeezelite.mk
>> @@ -0,0 +1,27 @@
>> +####################################################################
>> ############
>> +#
>> +# squeezelite
>> +#
>> +####################################################################
>> ############
>> +
>> +SQUEEZELITE_VERSION = v1.8
>> +SQUEEZELITE_SITE = https://code.google.com/p/squeezelite
>> +SQUEEZELITE_SITE_METHOD = git
>> +SQUEEZELITE_LICENSE = GPLv3
>> +SQUEEZELITE_LICENSE_FILE = LICENSE.txt
>> +SQUEEZELITE_DEPENDENCIES = alsa-lib flac libmad libvorbis faad2
>> mpg123 libsoxr
> 
> Remove libsoxr here. It's added conditionally below.
> 
OK

>> +ifeq ($(BR2_PACKAGE_SQUEEZELITE_RESAMPLE),y)
>> +SQUEEZELITE_MAKE_OPTS += -DRESAMPLE -DRESAMPLE_MP
>> +endif
> 
> Add SQUEEZELITE_DEPENDENCIES += libsoxr and remove -DRESAMPLE_MP here:
> 
> ifeq ($(BR2_PACKAGE_SQUEEZELITE_RESAMPLE),y)
> SQUEEZELITE_DEPENDENCIES += libsoxr
> SQUEEZELITE_MAKE_OPTS += -DRESAMPLE
> endif
> 
OK

>> +define SQUEEZELITE_BUILD_CMDS
>> +    $(TARGET_MAKE_ENV) $(MAKE) OPTS="$(SQUEEZELITE_MAKE_OPTS)" \
>> +		CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
>> +endef
> 
> Did you tried Thomas comment here:
> "Have you tried using $(TARGET_CONFIGURE_OPTS) instead of manually
> passing CC and LD ?"
> 
Yes, I tried, but make fails.
So I back to it.


>> +define SQUEEZELITE_INSTALL_TARGET_CMDS
>> +	$(INSTALL) -D -m 0755 $(@D)/squeezelite
>> $(TARGET_DIR)/usr/bin
>> +endef
>> +
>> +$(eval $(generic-package))
> 
> Best regards
> J?rg Krause
