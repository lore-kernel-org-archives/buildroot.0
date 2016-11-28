From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 28 Nov 2016 21:29:01 +0200
Subject: [Buildroot] [PATCH v1] postgresql: fix
 pgac_cv_snprintf_long_long_int_modifier
In-Reply-To: <1480359231-29949-1-git-send-email-ps.report@gmx.net>
References: <1480359231-29949-1-git-send-email-ps.report@gmx.net>
Message-ID: <20161128192901.www7lldws5fvneki@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Mon, Nov 28, 2016 at 07:53:51PM +0100, Peter Seiderer wrote:
> Supplementary change the pgac_cv_snprintf_long_long_int_modifier from
> complete format '%lld' to modifier 'll' version only (forgotten in commit
> 02c43157ab09f6fe4078fd1145fc9d403d66c089 ([1])).

The original commit that introduced pgac_cv_snprintf_long_long_int_format 
caching (3d3f70b5677, postgresql: avoid AC_TRY_RUN when testing snprintf()) 
did so because of AC_TRY_RUN calls. These were removed in upstream commit 
a2edb023d [1]. It is most likely safe to remove these cached values now.

[1] https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=a2edb023d08778c3346bbbf4ca82ef7f6e9283eb

> Fixes Bug 9451 ([2]).
> 
> [1] https://git.buildroot.net/buildroot/commit/?id=02c43157ab09f6fe4078fd1145fc9d403d66c089
> [2] https://bugs.busybox.net/show_bug.cgi?id=9451
> 
> Reported-by: Daniel <dde@innovaphone.com>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

baruch

> ---
>  package/postgresql/postgresql.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> index d46e8c0..786ef48 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -13,7 +13,7 @@ POSTGRESQL_INSTALL_STAGING = YES
>  POSTGRESQL_CONFIG_SCRIPTS = pg_config
>  POSTGRESQL_CONF_ENV = \
>  	ac_cv_type_struct_sockaddr_in6=yes \
> -	pgac_cv_snprintf_long_long_int_modifier="%lld" \
> +	pgac_cv_snprintf_long_long_int_modifier="ll" \
>  	pgac_cv_snprintf_size_t_support=yes
>  POSTGRESQL_CONF_OPTS = --disable-rpath

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
