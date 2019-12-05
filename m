From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Dec 2019 12:01:11 +0100
Subject: [Buildroot] [PATCH v2 1/9] new recipe : host-systemd
In-Reply-To: <20191111172443.6874-2-jeremy.rosen@smile.fr>
References: <20191111172443.6874-1-jeremy.rosen@smile.fr>
 <20191111172443.6874-2-jeremy.rosen@smile.fr>
Message-ID: <20191205110111.GB2539@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?my, All,

Here's a quick review, sorry for the delay...

On 2019-11-11 18:24 +0100, J?r?my Rosen spake thusly:
> Add the infrastructure to build the host version of systemd
> * disable all optional features, they can be re-added when needed
> * systemd has creative way of dealing with cross compile
>   we build a "normal" host systemd, but install it in $HOST_DIR
>   we use systemctl --root to correctly act on TARGET_DIR
> * we need to adjust RPATH using patchelf because meson can't do it
>   correctly by itsel
> 
> Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
> ---
>  package/systemd/systemd.mk | 93 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 92490eb86b..d1db60b5ef 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -551,3 +551,96 @@ SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
>  SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
>  
>  $(eval $(meson-package))
> +
> +#
> +# Host-systemd configuration
> +#
[--SNIP--]
> +# Fix RPATH After installation
> +# * systemd provides a install_rpath instruction to meson because the binaries need to link with
> +#   libsystemd which is not in a standard path
> +# * meson can only replace the RPATH, not append to it
> +# * the original rpatch is thus lost.
> +# * the original path had been tweaked by buildroot vial LD_FLAGS to add $(HOST_DIR)/lib
> +# * thus re-tweak rpath after the installation for all binaries that need it

Thanks for the detailed comment. :-)

> +#buildroot detects incorrect RPATH, so adding new binaries should be safe (it won't compile
> +#unless properly integrated).
> +HOST_SYSTEMD_HOST_TOOLS = \
> +	systemd-analyze  systemd-mount systemctl
> +
> +define HOST_SYSTEMD_FIX_RPATH
> +	$(foreach f,$(HOST_SYSTEMD_HOST_TOOLS), \
> +		$(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib:$(HOST_DIR)/lib/systemd $(HOST_DIR)/bin/$(f)
> +	)
> +endef
> +
> +HOST_SYSTEMD_POST_INSTALL_HOOKS +=  HOST_SYSTEMD_FIX_RPATH
> +HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
> +
> +$(eval $(host-meson-package))

So in my review of v1, I said that we did not need a visible option for
the host variant.

However, I think we still need the symbol; just it would not have a
prompt.

The underlying idea, is to decide where/when we actually call "systemctl
preset-all". In my mind, this should be called only once, after all
packages have instaleld their units and dropins, which is indeed what
you do in patch 2.

However, to ensure that host-systemd is built, you make it a build
dependency of systemd itself, which it is in fact not; we just need
host-systemd for target-finalize.

As such, I think we should do like we did for host-eudev: introduce a
blind symbol for the host variant, that the target variant selects, and
not introduce a build dependency. Since there would be a xymbol, the
package would actually be built, and this is guaranteed to happen before
target-finalize.

Then the host variant registers a target-finalize hook, like we do for
eudev. IMHO, this host-systemd stuff is very akin to the eudev one.

For reference, see commits:
    c2fee90943 package/eudev: introduce a host variant
    cf9afa50e1 package/eudev: generate the hwdb.bin
    6feba7cba1 packagesystemd: generate the hwdb.bin

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
