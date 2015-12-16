From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2015 21:32:04 +0100
Subject: [Buildroot] [PATCH v10 01/28] package/efl/libefl: new package
In-Reply-To: <1450219240-16938-2-git-send-email-romain.naour@openwide.fr>
References: <1450219240-16938-1-git-send-email-romain.naour@openwide.fr>
 <1450219240-16938-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151216213204.198f5387@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Tue, 15 Dec 2015 23:40:13 +0100, Romain Naour wrote:

> Also, add BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG config option in order to
> select all recommended packages that allows to build libefl without the
> extra-long --enable-i-really-know-what-i-am-doing...

I am still not entirely happy with your recommended config mechanism.
What I want to see is the visible option "recommended config"
completely removed. See my proposal in the attached patch 0001.

My attached patch 0002 also rewraps some Config.in help text.

But I have more issues, see below.


> diff --git a/package/efl/Config.in b/package/efl/Config.in
> index 7ce5a36..3a5e708 100644
> --- a/package/efl/Config.in
> +++ b/package/efl/Config.in
> @@ -1,8 +1,13 @@
>  menuconfig BR2_PACKAGE_EFL
>  	bool "Enlightenment Foundation Libraries"
> -	depends on BR2_USE_WCHAR
> -	# libeina uses madvise(). To revisit when bumping EFL to 1.8
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_PACKAGE_HAS_UDEV # libudev
> +	depends on BR2_PACKAGE_LUA # lua 5.1 or better

So we really need Lua itself, and not LuaJIT ? If we need only Lua (and
not LuaJIT), why don't we select it ? If we can use either Lua or
LuaJIT, then we should "depends on BR2_PACKAGE_LUAINTERPRETER.

Also, if I apply just this patch, I get some kconfig warnings:

package/efl/Config.in:1:error: recursive dependency detected!
package/efl/Config.in:1:	symbol BR2_PACKAGE_EFL depends on BR2_PACKAGE_LUA
package/lua/Config.in:1:	symbol BR2_PACKAGE_LUA is selected by BR2_PACKAGE_LIBEDJE
package/efl/libedje/Config.in:4:	symbol BR2_PACKAGE_LIBEDJE is selected by BR2_PACKAGE_LIBETHUMB
package/efl/libethumb/Config.in:4:	symbol BR2_PACKAGE_LIBETHUMB depends on BR2_PACKAGE_EFL

But it's true that your series later removes libedje, so maybe I should
just not care about this: it's hard to do the big change you're doing
without having some intermediate steps that are imperfect.

Can you let me know the answer for the Lua/LuaJIT question so that we
can move forward with this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-efl-rework-recommended-config-mechanism.patch
Type: text/x-patch
Size: 2939 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151216/90e0d879/attachment.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0002-efl-rewrap-Config.in-help-texts.patch
Type: text/x-patch
Size: 4920 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151216/90e0d879/attachment-0001.bin>
