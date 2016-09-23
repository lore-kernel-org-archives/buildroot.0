From: Rahul Jain <rahul.jain@imgtec.com>
Date: Fri, 23 Sep 2016 11:38:17 +0530
Subject: [Buildroot] [PATCH 4/4] uhttpd: new package
In-Reply-To: <dfc9b7d7-cd7e-9e18-0f4d-dd3f14596a93@mind.be>
References: <1474017387-3985-1-git-send-email-Rahul.Jain@imgtec.com>
 <1474017387-3985-4-git-send-email-Rahul.Jain@imgtec.com>
 <dfc9b7d7-cd7e-9e18-0f4d-dd3f14596a93@mind.be>
Message-ID: <57E4C6D1.20605@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Thanks for your review comments.

> Does it work with luajit as well?
yes

I have fixed review comments in following patch
http://patchwork.ozlabs.org/patch/673249/

Thanks,
Rahul Jain

On Saturday 17 September 2016 02:43 AM, Arnout Vandecappelle wrote:
>   Hi Rahul,
>
>   Just a few small remarks, otherwise looks good.
>
> On 16-09-16 11:16, Rahul Jain wrote:
> [snip]
>> diff --git a/package/uhttpd/Config.in b/package/uhttpd/Config.in
>> new file mode 100644
>> index 0000000..ec105ee
>> --- /dev/null
>> +++ b/package/uhttpd/Config.in
>> @@ -0,0 +1,18 @@
>> +config BR2_PACKAGE_UHTTPD
>> +	bool "uhttpd"
>> +	depends on !BR2_STATIC_LIBS # dlopen()
>> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
>> +	depends on BR2_USE_MMU # fork()
>
>   It's incredible that a tiny HTTP server has all these arch dependencies :-)
>
>> +	select BR2_PACKAGE_LIBUBOX
>> +	select BR2_PACKAGE_JSON_C
>> +	help
>> +	  uHTTPd is a tiny single threaded HTTP server with TLS, CGI and Lua
>> +	  support. It is intended as a drop-in replacement for the Busybox
>> +	  HTTP daemon.
>> +
>> +	  https://git.openwrt.org/?p=project/uhttpd.git;a=summary
>
>   Perhaps this is a slightly more useful URL:
>
> https://wiki.openwrt.org/doc/howto/http.uhttpd
>
>> +
>> +comment "uhttpd needs a toolchain w/ dynamic library"
>> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>> +	depends on BR2_USE_MMU
>> +	depends on BR2_STATIC_LIBS
>> diff --git a/package/uhttpd/uhttpd.mk b/package/uhttpd/uhttpd.mk
>> new file mode 100644
>> index 0000000..d336ff1
>> --- /dev/null
>> +++ b/package/uhttpd/uhttpd.mk
>> @@ -0,0 +1,32 @@
>> +################################################################################
>> +#
>> +# uhttpd
>> +#
>> +################################################################################
>> +
>> +UHTTPD_VERSION = 59e0c739634f46a164d939e54416287b91ff8a9b
>> +UHTTPD_SITE = git://git.openwrt.org/project/uhttpd.git
>
>   We prefer http URLs, they have a better chance of passing company firewalls.
>
>   Also, please add a hash file.
>
>> +UHTTPD_LICENSE = ISC
>> +UHTTPD_DEPENDENCIES = libubox json-c
>> +
>> +ifeq ($(BR2_PACKAGE_LUA_5_1),y)
>
>   Does it work with luajit as well? We don't do it anywhere else at the moment,
> but perhaps a condition like
>
> ifeq ($(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION),"5.1")
>
> would be fitting.
>
>> +UHTTPD_DEPENDENCIES += lua
>> +UHTTPD_CONF_OPTS += -DLUAPATH=/usr/lib/lua/$(LUAINTERPRETER_ABIVER) \
>
>   I don't see LUAPATH used anywhere?
>
>   I would add an explicit -DLUA_SUPPORT=ON
>
>> +	-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include
>
>   Is this really needed? It looks like CMakeLists will discover this itself with
> its home-grown variant of pkg_check_modules. And you don't specify LUA_LIBS so
> it will use pkg-config for that anyway.
>
>> +else
>> +UHTTPD_CONF_OPTS += -DLUA_SUPPORT=OFF
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_USTREAM_SSL),y)
>> +UHTTPD_DEPENDENCIES += ustream-ssl
>
>   Explicit -DTLS_SUPPORT=ON
>
>> +else
>> +UHTTPD_CONF_OPTS += -DTLS_SUPPORT=OFF
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_UBUS),y)
>> +UHTTPD_DEPENDENCIES += ubus
>
>   Same here.
>
>   Regards,
>   Arnout
>
>> +else
>> +UHTTPD_CONF_OPTS += -DUBUS_SUPPORT=OFF
>> +endif
>> +
>> +$(eval $(cmake-package))
>>
>
