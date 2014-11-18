From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Nov 2014 23:47:59 +0100
Subject: [Buildroot] [PATCH 1/1] luajit: point /usr/bin/lua to luajit if
 lua not selected
In-Reply-To: <1415503350-2021-1-git-send-email-danomimanchego123@gmail.com>
References: <1415503350-2021-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20141118224759.GU4333@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi, All,

On 2014-11-08 22:22 -0500, Danomi Manchego spake thusly:
> The luajit package is a provider of a lua interpreter, but does
> not install a lua executable, as it can live side by side with lua.

That is not the case in Buildroot: since they are both providers for the
luainterpreter virtual package, only one of them may be enabled at a
time in Buildroot.

(Well, it's possible to enable both in the menuconfig, but then it will
fail early at build time.)

> This is fine for scripts that explicitly invoke luajit, but not
> so good for scripts that just need a lua interpreter and call lua.
> This mod creates a lua symlink so that the non-jit-specific scripts
> will still work.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  package/luajit/luajit.mk |    7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
> index 2c1f8f4..f38088c 100644
> --- a/package/luajit/luajit.mk
> +++ b/package/luajit/luajit.mk
> @@ -64,6 +64,13 @@ define LUAJIT_INSTALL_TARGET_CMDS
>  	$(MAKE) PREFIX="/usr" DESTDIR="$(TARGET_DIR)" LDCONFIG=true -C $(@D) install
>  endef
>  
> +ifneq ($(BR2_PACKAGE_LUA),y)
> +define LUAJIT_INSTALL_SYMLINK
> +	ln -fs luajit $(TARGET_DIR)/usr/bin/lua
> +endef
> +LUAJIT_POST_INSTALL_TARGET_HOOKS += LUAJIT_INSTALL_SYMLINK
> +endif

Well, since only one of lua or luajit can be enabled at a time, there is
not reason for that conditional block.

Otherwise, OK for creating the symlink.

Note: I seem to recall you (or someone else?) already asked to be able
to be able to select both lua and luajit at the same time.

This is unfortunately not possible, given how we hanfdle virtual
packages: only one provider may be active at a time.

However, I think there might be a solution for that, but it is not
really clean. For example, we could do (code stripped down for
readability):

    config BR2_PACKAGE_LUAJIT
        bool "luajit"
        select BR2_PACKAGE_HAS_LUAINTERPRETER if !BR2_PACKAGE_LUA

    if BR2_PACKAGE_LUAJIT

    config BR2_PACKAGE_PROVIDES_LUAINTERPRETER
        default "luajit" if !BR2_PACKAGE_LUA

    endif

But I doubt we want to go down that route in Buildroot...
Thomas, Peter?

Regards,
Yann E. MORIN.

>  define HOST_LUAJIT_BUILD_CMDS
>  	$(MAKE) PREFIX="/usr" BUILDMODE=static -C $(@D) amalg
>  endef
> -- 
> 1.7.9.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
