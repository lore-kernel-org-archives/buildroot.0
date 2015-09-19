From: =?utf-8?B?5bed5bO2IOa1qQ==?= <kei-k@ca2.so-net.ne.jp>
Date: Sat, 19 Sep 2015 19:22:23 +0900
Subject: [Buildroot] [PATCH 1/1] Signed-off-by: Hiroshi Kawashima
	<kei-k@ca2.so-net.ne.jp>
In-Reply-To: <38121FAB319C3344930C920E7B518313252D32D7@LEMAIL01.le.imgtec.org>
References: <201509190155.t8J1t0tf027928@ms-omx02.plus.so-net.ne.jp>
 <38121FAB319C3344930C920E7B518313252D32D7@LEMAIL01.le.imgtec.org>
Message-ID: <338A0FC7-D817-440A-9EE8-527222222F81@ca2.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear, Vincent.

I will post improved patch later.

Thank you again.

> 2015/09/19 17:34?Vincent Olivert Riera <Vincent.Riera@imgtec.com> ?????
> 
> Dear Hiroshi Kawashima,
> 
> you have put your SoB in the subject, when it should be at the bottom
> of your commit log.
> 
> Also, it's good to use the standard subject when adding new packages:
> 
> <PKG>: new package
> 
> See an example here:
> 
> http://git.buildroot.net/buildroot/commit
> /?id=9646e80fca281030eb5d3125f499a60231476373
> 
> Also, when sending a new version, you have to add v2 (or the version
> number) after PATCH in your subject and a small changelog so other can
> know what changed between versions. And don't forget yo mark your
> previous patch as superseded in Patchwork. Worth reading this:
> 
> http://nightly.buildroot.org/manual.html#submitting-patches
> 
> More comments below; please keep reading.
> 
> On 19/09/15 02:55, Hiroshi Kawashima wrote:
>> Adding new package, squeezelite is a sound client for Logitech Media Server.
>> ---
>>  package/squeezelite/Config.in      |   30 ++++++++++++++++++++++++++++++
>>  package/squeezelite/squeezelite.mk |   34 ++++++++++++++++++++++++++++++++++
>>  2 files changed, 64 insertions(+), 0 deletions(-)
>>  create mode 100644 package/squeezelite/Config.in
>>  create mode 100644 package/squeezelite/squeezelite.mk
>> 
>> diff --git a/package/squeezelite/Config.in b/package/squeezelite/Config.in
>> new file mode 100644
>> index 0000000..33e1d08
>> --- /dev/null
>> +++ b/package/squeezelite/Config.in
>> @@ -0,0 +1,30 @@
>> +config BR2_PACKAGE_SQUEEZELITE
>> +	bool "squeezelite"
>> +	depends on BR2_USE_WCHAR	# flac
> 
> No tab before the comment. Just a space.
> 
> You are also missing a dependency on MMU introduced by MPG123, so:
> 
> depends on BR2_USE_MMU # mpg123
> 
> And you are also missing a dependency on THREADS introduced by
> ALSA_LIB, so:
> 
> depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
> 
>> +	select BR2_PACKAGE_ALSA_LIB
>> +	select BR2_PACKAGE_FLAC
>> +	select BR2_PACKAGE_LIBMAD
>> +	select BR2_PACKAGE_LIBVORBIS
>> +	select BR2_PACKAGE_FAAD2
>> +	select BR2_PACKAGE_MPG123
>> +	select BR2_PACKAGE_LIBSOXR
>> +	help
>> +	  Logitech Media Server client
>> +	  https://code.google.com/p/squeezelite/
>> +
>> +config BR2_PACKAGE_SQUEEZELITE_ENABLE_RESAMPLE
>> +	bool "Enable resampling function"
>> +	default y
>> +	depends on BR2_PACKAGE_SQUEEZELITE
>> +	help
>> +	  Enable resampling function
>> +
>> +config BR2_PACKAGE_SQUEEZELITE_WITH_RESAMPLE_MP
>> +	bool "Use OpenMP for resampling"
>> +	default y
>> +	depends on BR2_PACKAGE_SQUEEZELITE_ENABLE_RESAMPLE
>> +	help
>> +	  Enable OpenMP support for resampling
>> +
>> +comment "squeezelite needs a toolchain w/ wchar (incur from flac)"
> 
> I would place this comment at the end of the BR2_PACKAGE_SQUEEZELITE,
> before defining the BR2_PACKAGE_SQUEEZELITE_ENABLE_RESAMPLE and
> BR2_PACKAGE_SQUEEZELITE_WITH_RESAMPLE_MP.
> 
> The "(incur from flac)" comment is not needed.
> 
> You need to add "threads" to the comment as well. It should look like
> this:
> 
> comment "squeezelite needs a toolchain w/ wchar, threads"
> 
>> +	depends on !BR2_USE_WCHAR
> 
> And you also need to put the MMU and THREAD dependencies here, so it
> should look like this:
> 
> depends on BR2_USE_MMU
> depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> 
>> diff --git a/package/squeezelite/squeezelite.mk b/package/squeezelite/squeezelite.mk
>> new file mode 100644
>> index 0000000..1ea3007
>> --- /dev/null
>> +++ b/package/squeezelite/squeezelite.mk
>> @@ -0,0 +1,34 @@
>> +################################################################################
>> +#
>> +# squeezelite -- Logitech Media Server client
> 
> Only the package name here. No description.
> 
>> +#
>> +################################################################################
>> +
>> +SQUEEZELITE_VERSION = v1.8
>> +SQUEEZELITE_SITE = https://code.google.com/p/squeezelite
>> +SQUEEZELITE_SITE_METHOD = git
>> +SQUEEZELITE_LICENSE = GPLv3
>> +SQUEEZELITE_LICENSE_FILE = LICENSE.txt
>> +SQUEEZELITE_INSTALL_STAGING = NO
> 
> It won't be installed in staging by default, so this line is not needed.
> 
>> +SQUEEZELITE_DEPENDENCIES = alsa-lib flac libmad libvorbis faad2 mpg123 libsoxr
>> +
>> +#SQUEEZELITE_OPTS = "-DLINKALL"
> 
> What's this? If it's not used, then remove it.
> 
>> +SQUEEZELITE_OPTS = ""
> 
> You don't need to initialize this. Anyway, keep reading as there are
> more comments regarding this variable.
> 
>> +
>> +ifeq ($(BR2_PACKAGE_SQUEEZELITE_ENABLE_RESAMPLE),y)
>> +	SQUEEZELITE_OPTS += -DRESAMPLE
> 
> Better to use a variable name like SQUEEZELITE_MAKE_OPTS which is
> commonly used in Buildroot.
> 
>> +	ifeq ($(BR2_PACKAGE_SQUEEZELITE_WITH_RESAMPLE_MP),y)
>> +		SQUEEZELITE_OPTS += -DRESAMPLE_MP
> 
> Same here.
> 
>> +	endif
>> +endif
>> +
>> +define SQUEEZELITE_BUILD_CMDS
>> +    $(MAKE) OPTS="$(SQUEEZELITE_OPTS)" \
> 
> $(TARGET_MAKE_ENV) always in front of $(MAKE). And also use
> $(SQUEEZELITE_MAKE_OPTS).
> 
>> +	CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
>> +endef
>> +
>> +define SQUEEZELITE_INSTALL_TARGET_CMDS
>> +    $(INSTALL) -D -m 0755 $(@D)/squeezelite $(TARGET_DIR)/usr/bin
>> +endef
>> +
>> +$(eval $(generic-package))
>> 
> 
> Also, when you add a new package, you need to add it to the right
> category in package/Config.in, otherwise the users won't be able to
> select it from the menuconfig.
> 
> Regards,
> 
> Vincent.
