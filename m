From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Jun 2021 22:30:17 +0200
Subject: [Buildroot] [PATCHv4 15/16] package/pkg-meson.mk: determine
 'buildtype' based on BR2_ENABLE_RUNTIME_DEBUG iso BR2_ENABLE_DEBUG
In-Reply-To: <20210601143422.25064-16-patrickdepinguin@gmail.com>
References: <20210601143422.25064-1-patrickdepinguin@gmail.com>
 <20210601143422.25064-16-patrickdepinguin@gmail.com>
Message-ID: <20210601203017.GB168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

Eric, and other meson experts: question for you below...

On 2021-06-01 16:34 +0200, Thomas De Schampheleire spake thusly:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> BR2_ENABLE_DEBUG should just steer the availability of debug symbols and
> should have no negative effect on performance.
> 
> Introduction of 'assert' statements, 'debug'-type builds with additional
> logging, etc. should be steered by BR2_ENABLE_RUNTIME_DEBUG instead.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  package/pkg-meson.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index a57820d4d2..dafad3b1eb 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -89,7 +89,7 @@ define $(2)_CONFIGURE_CMDS
>  		--prefix=/usr \
>  		--libdir=lib \
>  		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
> -		--buildtype=$(if $(BR2_ENABLE_DEBUG),debug,release) \
> +		--buildtype=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release) \

I agree on this specific change.

However, more globally: 'buildtype' governs two settings [0]: 'debug'
and 'optimisation'. The 'optimisation' part is already part of our
CFLAGS, so we don't need to drive it from meson.

So, I think that what we need, is to just set the 'debug' option, rather
than the full 'buildtype'.

Thoughts?

[0] https://mesonbuild.com/Builtin-options.html#core-options

>  		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
>  		-Dstrip=false \
>  		-Dbuild.pkg_config_path=$$(HOST_DIR)/lib/pkgconfig \
> -- 
> 2.26.3
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
