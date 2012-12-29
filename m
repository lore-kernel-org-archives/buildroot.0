From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Sat, 29 Dec 2012 15:06:24 +0200
Subject: [Buildroot] [PATCH 1/5] mesa3d: bumped to 8.0.5
In-Reply-To: <20121229090650.55133161@skate>
References: <1356745553-15362-1-git-send-email-stefan.froberg@petroprogram.com>
 <1356745553-15362-2-git-send-email-stefan.froberg@petroprogram.com>
 <20121229090650.55133161@skate>
Message-ID: <50DEEAD0.7080209@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Good morning Thomas

29.12.2012 10:06, Thomas Petazzoni kirjoitti:
> Dear Stefan Fr?berg,
>
> On Sat, 29 Dec 2012 03:45:49 +0200, Stefan Fr?berg wrote:
>> @@ -4,8 +4,8 @@
>>  #
>>  #############################################################
>>  
>> -MESA3D_VERSION = 7.10.1
>> -MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.gz
>> +MESA3D_VERSION = 8.0.5
>> +MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.bz2
>>  MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
> You could probably add MESA3D_LICENSE and MESA3D_LICENSE_FILES in the
> process.

Ok

>>  MESA3D_AUTORECONF = YES
>>  MESA3D_INSTALL_STAGING = YES
>> @@ -13,12 +13,14 @@ MESA3D_INSTALL_STAGING = YES
>>  MESA3D_CONF_OPT = \
>>  	--disable-egl \
>>  	--disable-glu \
>> -	--disable-glw \
>> -	--disable-glut \
>> -	--disable-gallium \
>> +	--disable-selinux \
>> +	--disable-gallium-llvm \
>> +	--disable-gallium-egl \
>> +	--disable-gallium-gbm \
>>  	--with-driver=dri \
>>  	--with-dri-drivers=swrast \
>> -	--disable-static
>> +	--disable-static \
>> +	--with-gallium-drivers=swrast
>>  
>>  MESA3D_DEPENDENCIES = \
>>  	xproto_glproto \
>> @@ -32,4 +34,24 @@ MESA3D_DEPENDENCIES = \
>>  	host-libxml2 \
>>  	host-python
>>  
>> +# Build host "builtin_compiler" that is needed by
>> +# build process, install it and then do cleanup before
>> +# starting the actual building.
>> +# Additionally, we will make certain that the 
>> +# $(HOST_DIR)/usr/bin/builtin_compiler will be used
>> +# in actual building process.
>> +
>> +define	MESA3D_POST_CONFIGURE_CMDS
>> +	$(MAKE) CC="$(HOSTCC)" CXX="$(HOSTCXX)" CFLAGS="$(HOST_CFLAGS)" CXXFLAGS="$(HOST_CXXFLAGS)" LDFLAGS="$(HOST_LDFLAGS)"  -C $(@D)/src/glsl builtin_compiler
> Can you replace that with:
>
> 	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)/src/glsl builtin_compiler

Sure

>> +	$(INSTALL) $(@D)/src/glsl/builtin_compiler  -m 755 $(HOST_DIR)/usr/bin
>> +	$(MAKE) -C $(@D) clean
>> +	sed -e "s#\.\/builtin_compiler#$(HOST_DIR)/usr/bin/builtin_compiler#g" -i $(@D)/src/glsl/Makefile
> Hum, it is not really nice to have a target package that installs
> something in $(HOST_DIR) (even though it's true quite a few packages
> are already doing this). An alternative solution would be to have a
> host-mesa3d package, that builds and installs only the glsl compiler.
>
> Something along the lines of:
>
> MESA3D_DEPENDENCIES += host-mesa3d
> HOST_MESA3D_CONF_OPT = --disable-as-many-things-as-possible
>
> # We only want to build the glsl compiler
> define HOST_MESA3D_BUILD_CMDS
> 	$(MAKE) -C $(@D)/src/glsl builtin_compiler
> endef
>
> # We only install the glsl compiler
> define HOST_MESA3D_INSTALL_CMDS
> 	$(INSTALL) -D $(@D)/src/glsl/builtin_compiler  -m 755 $(HOST_DIR)/usr/bin/glsl-builtin_compiler
> endef
>
> And then do a patch to mesa3d configure.ac so that we can pass an
> explicit path to the glsl compiler and do at configure time:
> --with-glsl-compiler=$(HOST_DIR)/usr/bin/glsl-builtin_compiler.

I tried doing host-mesa3d build first, where it would build only
builtin_compiler binary but
then it started to complain about missing this and that Xorg host-package.
After 7th needed host-package It started to get really tedious and would
rather not go that
route anymore....
Also, Im not that canny with gnu autoconf to know where and how to put
that new
--with-glsl-compiler  switch in configure.ac.

So I will keep it as it is.


>> +define	MESA3D_BUILD_CMDS
>> +	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
>> +endef
> Why do you need to override the build step here? It seems similar to
> the default one.

I tought so too but apparently it's not. I got some very cryptic error
about missing
src/glsl/libglsl.a   and   "../../bin/mklib  -ru: command not found"
when removing those
lines and using default one.

Maybe it's one of those openembedded patches that I used,
mesa3d-0002-cross-compile.patch or mesa3d-0003-fix-for-x32.patch, that
is somehow conflicting.


Now some coffee...

Thanks!

Stefan

> Thanks!
>
> Thomas
