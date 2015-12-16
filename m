From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2015 22:45:03 +0100
Subject: [Buildroot] [PATCH v10 01/28] package/efl/libefl: new package
In-Reply-To: <20151216213648.GA3448@free.fr>
References: <1450219240-16938-1-git-send-email-romain.naour@openwide.fr>
 <1450219240-16938-2-git-send-email-romain.naour@openwide.fr>
 <20151216213204.198f5387@free-electrons.com>
 <20151216213648.GA3448@free.fr>
Message-ID: <20151216224503.4b2f1b4b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Dec 2015 22:36:48 +0100, Yann E. MORIN wrote:

> As Romain and I already explained, that's because Lua is a provider for
> the virtual package lua-interpreter, and we can not select a provider.

Have you seen the rest of my e-mail ? I'm quoting it, for good measure:

"""
Also, if I apply just this patch, I get some kconfig warnings:

package/efl/Config.in:1:error: recursive dependency detected!
package/efl/Config.in:1:	symbol BR2_PACKAGE_EFL depends on BR2_PACKAGE_LUA
package/lua/Config.in:1:	symbol BR2_PACKAGE_LUA is selected by BR2_PACKAGE_LIBEDJE
package/efl/libedje/Config.in:4:	symbol BR2_PACKAGE_LIBEDJE is selected by BR2_PACKAGE_LIBETHUMB
package/efl/libethumb/Config.in:4:	symbol BR2_PACKAGE_LIBETHUMB depends on BR2_PACKAGE_EFL
"""

So there is definitely some packages selecting BR2_PACKAGE_LUA, and it's
actually not the only one:

package/dnsmasq/Config.in:      select BR2_PACKAGE_LUA
package/efl/libedje/Config.in:  select BR2_PACKAGE_LUA
package/haserl/Config.in:       select BR2_PACKAGE_LUA
package/lighttpd/Config.in:     select BR2_PACKAGE_LUA

What you cannot do is select BR2_PACKAGE_LUAINTERPRETER to say "select
whichever Lua provider you want". However you can select a particular
Lua interpreter if you need to. And several packages do this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
