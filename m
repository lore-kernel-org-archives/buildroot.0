From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Feb 2014 19:29:51 +0100
Subject: [Buildroot] [PATCH 1/2] infra: improve dependency check in
 virtual packages.
In-Reply-To: <1393235404-2693-2-git-send-email-eric.le.bihan.dev@free.fr>
References: <1393235404-2693-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1393235404-2693-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20140224182951.GB11048@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, All,

On 2014-02-24 10:50 +0100, Eric Le Bihan spake thusly:
> The current version of dependency check for virtual package <foo>
> defines FOO_CONFIGURE_CMDS to print an error message if the
> dependencies are not met.
> 
> This patch updates all the virtual packages to use the GNU Make control
> function $(error text...) instead.
> 
> This makes the error happen at the beginning of the build, with a clearer
> message.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Somewhat-unrelated to this change, see a comment below...

> ---
>  package/luainterpreter/luainterpreter.mk |    6 ++++++
>  package/opengl/libegl/libegl.mk          |    7 +++----
>  package/opengl/libgles/libgles.mk        |    7 +++----
>  package/opengl/libopenmax/libopenmax.mk  |    7 +++----
>  package/opengl/libopenvg/libopenvg.mk    |    7 +++----
>  package/powervr/powervr.mk               |    7 +++----
>  6 files changed, 21 insertions(+), 20 deletions(-)
> 
> diff --git a/package/luainterpreter/luainterpreter.mk b/package/luainterpreter/luainterpreter.mk
> index c37d621..5443477 100644
> --- a/package/luainterpreter/luainterpreter.mk
> +++ b/package/luainterpreter/luainterpreter.mk
> @@ -9,4 +9,10 @@ LUAINTERPRETER_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_LUA_INTERPRET
>  
>  LUAINTERPRETER_ABIVER = $(call qstrip,$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION))
>  
> +ifeq ($(BR2_PACKAGE_HAS_LUA_INTERPRETER),y)
> +ifeq ($(LUAINTERPRETER_DEPENDENCIES),)
> +$(error No lua interpreter implementation selected. Configuration error.)
> +endif
> +endif
> +
>  $(eval $(generic-package))
> diff --git a/package/opengl/libegl/libegl.mk b/package/opengl/libegl/libegl.mk
> index b2b74f1..3311e50 100644
> --- a/package/opengl/libegl/libegl.mk
> +++ b/package/opengl/libegl/libegl.mk
> @@ -7,11 +7,10 @@
>  LIBEGL_SOURCE =
>  LIBEGL_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_OPENGL_EGL))
>  
> +ifeq ($(BR2_PACKAGE_HAS_OPENGL_EGL),y)
>  ifeq ($(LIBEGL_DEPENDENCIES),)
> -define LIBEGL_CONFIGURE_CMDS
> -	echo "No libEGL implementation selected. Configuration error."
> -	exit 1
> -endef
> +$(error No libEGL implementation selected. Configuration error.)
> +endif
>  endif
>  
>  $(eval $(generic-package))

I don't know about you folks, but I'm beginning to see a pattern here...

If all of our BR2_PACKAGE_HAS_FOOBAR options would match the corresponding
FOOBAR_DEPENDENCIES, then we could use something like (absolutely untested,
only pure random thoughts):

    $(eval $(call virtual-package,FooBar))

whith 'virtual-package' something like:

    define virtual-package
    ifeq ($(BR2_PACKAGE_HAS_$(call upper,$(1))),y)
    ifeq ($($(call upper,$(1))_DEPENDENCIES),)
    $(error No $(1) implementation selected. Configuration error.)
    endif
    endif
    endef

But then we would need:
    s/BR2_PACKAGE_HAS_OPENGL_EGL/BR2_PACKAGE_HAS_LIBEGL/
    s/BR2_PACKAGE_HAS_OPENGL_GLES/BR2_PACKAGE_HAS_LIBGLES/
    s/BR2_PACKAGE_HAS_OPENMAX/BR2_PACKAGE_HAS_LIBOPENMAX/
    s/BR2_PACKAGE_HAS_OPENVG/BR2_PACKAGE_HAS_LIBOPENVG/

Lua interpreter and PowerVR already match this.

We could even go further, so as to only require a call to 'virtual-package'
and not to 'generic-package', with some carefully-crafted Makefile
constructs (but we would loose the capitalisation of eg. lbEGL, since the
package is named 'libegl', all in lower-case). 'virtual-package' could
even override FOOBAR_SOURCE="" before calling generic-package behind the
hood. This would make writing virtual packages even easier.

Thought?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
