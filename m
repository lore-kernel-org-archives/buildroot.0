From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Tue, 7 Jun 2016 13:57:20 +0200
Subject: [Buildroot] [PATCH] package/middleclass: new package
In-Reply-To: <20160607132500.6a82f641@free-electrons.com>
References: <20160606130409.19533-1-m.niestroj@grinn-global.com>
 <20160607132500.6a82f641@free-electrons.com>
Message-ID: <6ae25da6-14b9-4c4c-deb2-f840e46bc125@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 07.06.2016 13:25, Thomas Petazzoni wrote:
> Hello,
>
> On Mon,  6 Jun 2016 15:04:09 +0200, Marcin Niestroj wrote:
>> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
>
> Thanks for this contribution! However I have a few comments, see below.
>
>> diff --git a/package/middleclass/Config.in b/package/middleclass/Config.in
>> new file mode 100644
>> index 0000000..712064a
>> --- /dev/null
>> +++ b/package/middleclass/Config.in
>> @@ -0,0 +1,9 @@
>> +config BR2_PACKAGE_MIDDLECLASS
>> +	bool "middleclass"
>> +	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
>
> This dependency is not necessary, since you're already including
> package/middleclass/Config.in within the following condition:
>
> if BR2_PACKAGE_HAS_LUAINTERPRETER && !BR2_STATIC_LIBS

Thanks for pointing it. I used some other package as reference, so I 
missed that.

>
>> diff --git a/package/middleclass/middleclass.mk b/package/middleclass/middleclass.mk
>> new file mode 100644
>> index 0000000..3e21452
>> --- /dev/null
>> +++ b/package/middleclass/middleclass.mk
>> @@ -0,0 +1,18 @@
>> +################################################################################
>> +#
>> +# middleclass
>> +#
>> +################################################################################
>> +
>> +MIDDLECLASS_VERSION = v4.0.0
>> +MIDDLECLASS_SITE = $(call github,kikito,middleclass,$(MIDDLECLASS_VERSION))
>> +MIDDLECLASS_DEPENDENCIES = luainterpreter
>> +MIDDLECLASS_LICENSE = MIT
>> +MIDDLECLASS_LICENSE_FILES = MIT-LICENSE.txt
>> +
>> +define MIDDLECLASS_INSTALL_TARGET_CMDS
>> +	$(INSTALL) -m 0644 -D $(@D)/middleclass.lua \
>> +		$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/middleclass.lua
>> +endef
>> +
>> +$(eval $(generic-package))
>
> Could you use the luarocks package infrastructure instead? The
> middleclass package is available in luarocks, and it greatly simplifies
> the Lua packages. See the luaexpat package for an example. The
> Buildroot manual also has extensive documentation about the luarocks
> package infrastructure.

I tried to use luarocks for that package. However I encountered two
issues with that approach:

1) middleclass is not consistent with it's version. In most places it
is 4.0.0. However in rockspec [1] it defines it's version as 4.0-0. I
guess it should be 4.0.0-0 instead. This inconsistency needs some
tweaks in Buildroot package makefile.

2) When middleclass is installed with luarocks on my host, it downloads
*.rockspec directly instead of *.src.rock. I think that Buildroot is
not supporting that case, but please correct me if I am wrong. It was 
not straightforward to make it work for me.

Above issues made me unable to add support for middleclass using
luarocks in a reasonable time. It was much simpler with current
approach.

[1] 
https://github.com/kikito/middleclass/blob/master/rockspecs/middleclass-4.0-0.rockspec

>
> Thanks a lot!
>
> Thomas
>

-- 
Marcin Niestroj
