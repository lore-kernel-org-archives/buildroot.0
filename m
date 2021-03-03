From: Dan Raymond <draymond@foxvalley.net>
Date: Wed, 3 Mar 2021 10:37:12 -0700
Subject: [Buildroot] [PATCH 1/1] fix failure during 'make
 linux-menuconfig' when PATH env var has spaces
In-Reply-To: <9469affa-d61e-347a-ef52-1ce6b1a11a23@mind.be>
References: <16100eb6-bac8-2e4d-65f2-26333179f3b8@foxvalley.net>
 <9469affa-d61e-347a-ef52-1ce6b1a11a23@mind.be>
Message-ID: <8d34f040-ac81-f000-895b-2607b5c0a018@foxvalley.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 3/3/2021 10:11 AM, Arnout Vandecappelle wrote:

>   Hi Dan,
>
> On 01/03/2021 03:40, Dan Raymond wrote:
>>  ?$(2)_CONFIGURATOR_MAKE_ENV = \
>> -??? $$(filter-out PATH=% PKG_CONFIG=% PKG_CONFIG_SYSROOT_DIR=% \
>> -??? ?? PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=% PKG_CONFIG_ALLOW_SYSTEM_LIBS=% \
>> -??? ?? PKG_CONFIG_LIBDIR=%,$$($(2)_MAKE_ENV)) \
>> +??? $$(call strip_env,PATH PKG_CONFIG PKG_CONFIG_SYSROOT_DIR \
>> +??? ?? PKG_CONFIG_ALLOW_SYSTEM_CFLAGS PKG_CONFIG_ALLOW_SYSTEM_LIBS \
>> +??? ?? PKG_CONFIG_LIBDIR,$$($(2)_MAKE_ENV)) \
>>  ???? PKG_CONFIG_PATH="$(HOST_PKG_CONFIG_PATH)"
> This is a bit of half-hearted quoting. It happens to work for spaces, but
> breaks down on double quotes, backslashes, dollar signs, and probably others as
> well.
>
>   I don't like to solve one specific corner case but leaving the door wide open
> for different ones...
>
>   Unfortunately, proper shell quoting is really really hard.
>
>   Therefore, I'd propose to skirt around the issue entirely by overriding the
> environment variables directly. Something like this (untested):
>
> $(2)_CONFIGURATOR_MAKE_ENV = \
> 	$$($(2)_MAKE_ENV) \
> 	PATH="$$(BR_PATH)" \
> 	PKG_CONFIG= \
> 	...

I like your idea.? It is much simpler.? I'll prepare a new patch and 
test it.? But why are you setting PATH="$$(BR_PATH)"? Previously the 
PATH variable was stripped entirely.
