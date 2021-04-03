From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Apr 2021 09:29:35 +0200
Subject: [Buildroot] [PATCH] package/mender: make xz optional
In-Reply-To: <20210401154453.144605-2-aduskett@gmail.com>
References: <20210401154453.144605-1-aduskett@gmail.com>
 <20210401154453.144605-2-aduskett@gmail.com>
Message-ID: <20210403072935.GU24043@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2021-04-01 08:44 -0700, Adam Duskett spake thusly:
> According to the README.md file, xz is optional.
>   - Remove the dependency on the xz package.
>   - If the xz package is not selected, add "nolzma" to MENDER_TAGS
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/mender/mender.mk b/package/mender/mender.mk
> index 794dd4be8c..1ebd5a2e83 100644
> --- a/package/mender/mender.mk
> +++ b/package/mender/mender.mk
[--SNIP--]
> @@ -81,6 +81,12 @@ endef
>  
>  MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_CONFIG_FILES
>  
> +ifeq ($(BR2_PACKAGE_XZ),y)
> +MENDER_DEPENDENCIES += xz
> +else
> +MENDER_TAGS += nolzma

FOO_TAGS is supposed to be a comma-separated list (but see later):

    https://golang.org/cmd/go/#hdr-Compile_packages_and_dependencies

    -tags tag,list
    a comma-separated list of build tags to consider satisfied during the
    build. For more information about build tags, see the description of
    build constraints in the documentation for the go/build package.
    (Earlier versions of Go used a space-separated list, and that form
    is deprecated but still recognized.)

However, the += assignment operator in Makefile will create a
space-separated list. So when we have neither xz nor dbus, we'll
get:
    MENDER_TAGS=nolzma nodbus

which is pased -as-is to the go build command:

    https://git.buildroot.org/buildroot/tree/package/pkg-golang.mk#n45

    $(2)_BUILD_OPTS += \
        -ldflags "$$($(2)_LDFLAGS)" \
        -tags "$$($(2)_TAGS)" \
        -trimpath \
        -p $(PARALLEL_JOBS)

So, even though the space-separated list is still supported, we should
switch over to the comma-separated list.

Either we require that packages do provide such a comma-seprated list,
or we do it in the infra, with something along those lines:

    diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
    index d07242310d..bfa1a9e9ce 100644
    --- a/package/pkg-golang.mk
    +++ b/package/pkg-golang.mk
    @@ -42,7 +42,7 @@ define inner-golang-package
     
     $(2)_BUILD_OPTS += \
     	-ldflags "$$($(2)_LDFLAGS)" \
    -	-tags "$$($(2)_TAGS)" \
    +	-tags "$$(subst $(space),$(comma),$$(strip $$($(2)_TAGS)))" \
     	-trimpath \
     	-p $(PARALLEL_JOBS)
     

Note that we still need to quote, in case there is no tag, and we need
to strip in case FOO_TAGS contains expansions itself, like
    FOO_TAGS = $(FOO_TAG_BLARK_MAYBE) $(FOO_TAG_MEH_MOSTLY)

Care to look further into that, please?

Regards,
Yann E. MORIN.

> +endif
> +
>  ifeq ($(BR2_PACKAGE_DBUS),y)
>  define MENDER_INSTALL_DBUS_AUTHENTICATION_MANAGER_CONF
>  	$(INSTALL) -D -m 0755 $(@D)/support/dbus/io.mender.AuthenticationManager.conf \
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
