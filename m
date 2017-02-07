From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 7 Feb 2017 12:18:02 +0200
Subject: [Buildroot] [PATCH] ruby: assume we always have finite,
 isinf and isnan for uClibc
In-Reply-To: <20170207094759.45076-1-Vincent.Riera@imgtec.com>
References: <20170207094759.45076-1-Vincent.Riera@imgtec.com>
Message-ID: <20170207101802.ftxepyhshb6juvjk@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente,

On Tue, Feb 07, 2017 at 09:47:59AM +0000, Vicente Olivert Riera wrote:
> uClibc has __finite, __isinf and __isnan, and Ruby's configure script
> checks for finite, isinf and isnan (note the missing leading __).
> Because of the naming difference the checks fail, therefore the symbols
> HAVE_FINITE, HAVE_ISINF and HAVE_ISNAN are not defined.
> Ruby code relies on those symbols in order to define its own version of
> the finite, isinf and isnan functions. Since the symbols haven't been
> defined, those definitions cause conflicts with the already-existing
> functions.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/f34/f34dc20749c6f6d12c51eddf3ee6c2ef41d7c13d/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/ruby/ruby.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
> index 4c6459b..30b53d7 100644
> --- a/package/ruby/ruby.mk
> +++ b/package/ruby/ruby.mk
> @@ -29,6 +29,13 @@ RUBY_CFLAGS += -O2
>  endif
>  RUBY_CONF_ENV = CFLAGS="$(RUBY_CFLAGS)"
>  
> +ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)

IIUC these symbols are always defined (either as macros or as functions), so 
why not make this unconditional?

> +RUBY_CONF_ENV += \
> +	ac_cv_func_finite=yes \
> +	ac_cv_func_isinf=yes \
> +	ac_cv_func_isnan=yes
> +endif
> +
>  ifeq ($(BR2_bfin),y)
>  RUBY_CONF_ENV += ac_cv_func_dl_iterate_phdr=no
>  # Blackfin doesn't have FFI closure support, needed by the fiddle

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
