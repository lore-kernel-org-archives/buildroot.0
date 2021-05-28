From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 28 May 2021 23:01:09 +0200
Subject: [Buildroot] [PATCHv3 14/15] package/pkg-meson.mk: determine
 'buildtype' based on BR2_ENABLE_RUNTIME_DEBUG iso BR2_ENABLE_DEBUG
In-Reply-To: <20210525122750.5022-15-patrickdepinguin@gmail.com>
References: <20210525122750.5022-1-patrickdepinguin@gmail.com>
 <20210525122750.5022-15-patrickdepinguin@gmail.com>
Message-ID: <866ad257-d6e9-7dc4-98e7-e83e027f8fac@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25/05/2021 14:27, Thomas De Schampheleire wrote:
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

 I haven't checked yet in the source code what the effect of buildtype is, nor
have I tested it, but the documentation says:


For setting optimization levels and
toggling debug, you can either set the `buildtype` option, or you can
set the `optimization` and `debug` options which give finer control
over the same. Whichever you decide to use, the other will be deduced
from it. For example, `-Dbuildtype=debugoptimized` is the same as
`-Ddebug=true -Doptimization=2` and vice-versa. This table documents
the two-way mapping:

| buildtype      | debug | optimization |
| ---------      | ----- | ------------ |
| plain          | false | 0            |
| debug          | true  | 0            |
| debugoptimized | true  | 2            |
| release        | false | 3            |
| minsize        | true  | s            |

All other combinations of `debug` and `optimization` set `buildtype` to `'custom'`.


So I think this should be just 'custom', regardless of RUNTIME_DEBUG.


 That said, it *is* possible that the debug option has more effect than just
'-g'... So I checked the meson source. There are a bunch of effects.

* For gcc, it just sets -g/-O options.

* On windows and mac, there are a bunch of other effects but I didn't look at that.

* For boost, it selects the "g" suffix if necessary - but we install without
that suffix anyway.

* For rust, it only has effect on optimisation flags. Note that we currently
don't set optimisation flags correctly for rust, so we have something to learn
there.

* For fortran, java, cuda, it als only affects optimisation and debug flags.

* There is one more relevant effect: there is an option "b_ndebug", which
defaults to false. A project can set it to "if-release" - in that case, -DNDEBUG
is passed if the buildtype if 'release'.


 So it sounds like setting buildtype to release in the RUNTIME_DEBUG case is the
right thing to do. There is one caveat (but this is already the case now): it
will force the optimisation to -O3, and I believe that that will override the
optimisation option we set in cflags. But that's essentially what happens now
already, so not something that needs to be addressed by this series.

 In the non-RUNTIME_DEBUG case, however, I don't think we should set to "debug",
because that will add a -g option. Maybe "plain" is the best option.

 Alternatively, we leave buildtype alone, and instead set debug to false,
optimization to the value corresponding to the optimisation level chosen, and
b_ndebug to true or false based on RUNTIME_DEBUG.


 Regards,
 Arnout

>  		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
>  		-Dstrip=false \
>  		-Dbuild.pkg_config_path=$$(HOST_DIR)/lib/pkgconfig \
> 
