From: Jordan Yelloz <jordan@yelloz.me>
Date: Fri, 29 Jul 2016 13:28:52 -0700
Subject: [Buildroot] [PATCH 3/4] swupdate: improved help text for Lua
 support
In-Reply-To: <1469808876.3805.4.camel@embedded.rocks>
References: <20160724232739.14132-1-jordan@yelloz.me>
 <20160724232739.14132-4-jordan@yelloz.me>
 <20160725093253.089ea2a8@free-electrons.com>
 <5f0bb3f1-3f91-0bf0-8677-790dad5e92fe@yelloz.me>
 <1469808876.3805.4.camel@embedded.rocks>
Message-ID: <5100c888-4d02-93f9-606f-2ecc57af969f@yelloz.me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/29/2016 09:14 AM, J?rg Krause wrote:
> On Mo, 2016-07-25 at 09:36 -0700, Jordan Yelloz wrote:
> 
> On 07/25/2016 12:32 AM, Thomas Petazzoni wrote:
> 
> 
> Hello,
> 
> On Sun, 24 Jul 2016 16:27:38 -0700, Jordan Yelloz wrote:
> 
> 
> 
> -	  * Select BR2_PACKAGE_LUA if you want to have Lua
> support.
> +	  * Select BR2_PACKAGE_LUA or BR2_PACKAGE_LUAJIT if you
> want to have Lua
> +	    support.
> +	    CONFIG_HANDLER_IN_LUA is not supported in LuaJIT or
> Lua 5.1.
> +	    swupdate must be manually configured with
> CONFIG_LUAVERSION="jit-5.1"
> +	    to link against luajit.
> 
> 
> What does this last sentence means?
> 
> Thomas
> 
> 
> 
> Regarding CONFIG_LUAVERSION, this is trying to explain how to
> successfully configure swupdate to build against LuaJIT. If you just
> choose LuaJIT, it will not be successful automatically due to some
> minor
> limitations in the swupdate build system.
> 
> swupdate has some build rules that are not that good (it uses
> pkg-config for some parts of the build but uses a secondary list of
> library names to actually link the final executable against) and when
> adding the Lua library to the list of libraries to link, it relies on
> concatenating "lua" with $(CONFIG_LUAVERSION).
> 
> Basically, the only way to get swupdate to link against libluajit-
> 5.1.so
> is to ensure CONFIG_LUAVERSION="jit-5.1" is in your swupdate KConfig
> file. To me, the easiest/safest way of handling that is to expect the
> user to configure swupdate manually with that value.
> 
> 
> I like the idea of using swupdate with LuaJIT!
> 
> How about setting LUAVERSION if LuaJIT is selected? Like adding this somewhere:
> 
> $(call KCONFIG_SET_OPT,CONFIG_LUAVERSION,"jit-5.1")
> 

Hi,

I do prefer this approach. I have made some changes to my patch to
conditionally add KCONFIG_SET_OPT. However, in order to get it working
we will also need to set CONFIG_LUA=y since CONFIG_LUAVERSION depends on
CONFIG_LUA=y.
If everybody approves of automatically enabling some
Lua support in swupdate when lua is enabled in buildroot, we can do
that. And if we do that, we might as well do the same when PUC Lua is
enabled in buildroot.
Otherwise, we will soon have to add some more options to the swupdate
buildroot kconfig and there might be some confusing overlap between the
kconfig of buildroot and that of swupdate.
Something to consider when adding complexity to this is that the current
swupdate defconfig distributed with buildroot has very few features
enabled (no MTD, no shell scripts, no u-boot environment patching). I
would imagine that anyone who uses swupdate with buildroot for anything
serious would keep their own custom defconfig for their project. If
that's the case then it might be best to continue to do as little as
possible and just get out of the way of the user and leave it to them to
properly configure Lua support in swupdate.

--
Jordan
