From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Feb 2017 18:58:48 +0100
Subject: [Buildroot] [PATCH] pkg-cmake: pass <pkg>_CONF_ENV for the
 target configure step
In-Reply-To: <1488130968-20114-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1488130968-20114-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170226175848.GD4043@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-02-26 18:42 +0100, Thomas Petazzoni spake thusly:
> The Buildroot manual documents that <pkg>_CONF_ENV is passed in the
> environment when calling cmake during the configure step. However, the
> actual implementation in pkg-cmake passes HOST_<pkg>_CONF_ENV when
> configuring the host variant of a cmake package, but does not pass
> <pkg>_CONF_ENV when configuring the target variant of a cmake package.
> 
> This commit fixes that by passing <pkg>_CONF_ENV in the environment as
> expected. It should not cause any behavior change, because this
> feature is in fact not used by any package in upstream Buildroot:
> 
> $ grep CONF_ENV $(git grep -l cmake-package package/)
> package/pkg-cmake.mk:$(2)_CONF_ENV			?=
> package/pkg-cmake.mk:	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> package/pkg-cmake.mk:	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> 
> This issue was reported by Olivier <ovalentin@awox.com> as bug #9616.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/pkg-cmake.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 4e0e838..a7c8dc3 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -109,7 +109,7 @@ define $(2)_CONFIGURE_CMDS
>  	cd $$($$(PKG)_BUILDDIR) && \
>  	rm -f CMakeCache.txt && \
>  	PATH=$$(BR_PATH) \
> -	$$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> +	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \

I would have written the extra env on its own line, like is done in e.g.
pkg-autotools:

    [...]
    PATH=$$(BR_PATH) \
    $$($$(PKG)_CONF_ENV) \
    $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
    [...]

Otherwise;

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  		-DCMAKE_INSTALL_SO_NO_EXE=0 \
>  		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
>  		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
> -- 
> 2.7.4
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
