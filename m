From: =?UTF-8?Q?J=C3=A9r=C3=B4me_Pouiller?= <jezz@sysmic.org>
Date: Thu, 08 Aug 2013 09:55:36 +0200
Subject: [Buildroot] [PATCH 2 of 2] strongswan: fix build error 'no rule
 to make target libtls.la'
In-Reply-To: <2efbe693b936c3357e14.1375896857@BEANTN0L019720>
References: <patchbomb.1375896855@BEANTN0L019720>
 <2efbe693b936c3357e14.1375896857@BEANTN0L019720>
Message-ID: <0bf0ce2270b8b3c7872c34f4acd71091@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 2013-08-07 19:34, Thomas De Schampheleire wrote:
> In some strongswan configurations, an implicit dependency could be 
> missing.
> This commit patches strongswan to force this dependency when needed.
>
> Fixes several autobuild failures, like:
> 
> http://autobuild.buildroot.net/results/643f5b33973d5b12ffe6d84254bf3be9ed81d0ad/
> 
> http://autobuild.buildroot.net/results/24bcdcb83119e416c92458fa9ff2f5269957a743/
>
> Signed-off-by: Thomas De Schampheleire 
> <thomas.de.schampheleire@gmail.com>
>
> ---
>  package/strongswan/strongswan-0001-force-tls-when-needed.patch |  72 
> +++++++++++
>  package/strongswan/strongswan.mk                               |   8 
> +
>  2 files changed, 80 insertions(+), 0 deletions(-)
>
> diff --git
> a/package/strongswan/strongswan-0001-force-tls-when-needed.patch
> b/package/strongswan/strongswan-0001-force-tls-when-needed.patch
> new file mode 100644
> --- /dev/null
> +++ b/package/strongswan/strongswan-0001-force-tls-when-needed.patch
> @@ -0,0 +1,72 @@
> +Force libtls when libpttls is enabled
> +
> +The libpttls library expects libtls.la to be present:
> +libpttls_la_LIBADD = $(top_builddir)/src/libtls/libtls.la
> +but there is no expressed dependency between them. Therefore, it is 
> possible to
> +create a configuration where libpttls is enabled and libtls is not, 
> causing a
> +build failure:
> +
> +make[4]: *** No rule to make target `../../src/libtls/libtls.la', 
> needed by `libpttls.la'.  Stop.
> +
> +libpttls is enabled through USE_PTTLS, set when tnc_tnccs == true.
> +  tnc_tnccs is true when any of tnc-imc, tnc_imv, tnccs_11,
> tnccs_dynamic or eap_tnc is true.
> +
> +libtls is enabled through USE_TLS, set when tls == true.
> +  tls is true when any of eap_tls, eap_ttls or eap_peap is true.
> +
> +This patch forces tls to true, when tnc_tnccs is true, so that the 
> required libtls.la dependency
> +is built before it is used by libpttls.
Agreed


[...]
> diff --git a/package/strongswan/strongswan.mk 
> b/package/strongswan/strongswan.mk
> --- a/package/strongswan/strongswan.mk
> +++ b/package/strongswan/strongswan.mk
> @@ -66,4 +66,12 @@ STRONGSWAN_DEPENDENCIES +=
>        $(if $(BR2_PACKAGE_MYSQL_CLIENT),mysql_client)
>  endif
>
> +# Strongswan uses AC_LIB_PREFIX, which is relatively new.
> +# Avoid make to try reconfiguring due to timestamp changes,
> +# after patching configure{,.in}.
> +define STRONGSWAN_AVOID_RECONF_HOOK
> +	touch $(@D)/aclocal.m4
> +endef
> +STRONGSWAN_POST_PATCH_HOOKS += STRONGSWAN_AVOID_RECONF_HOOK
> +
>  $(eval $(autotools-package))
Indeed, strongswan autoreconf does not seems to work. Although, I think 
it can be resolved by adding
lib-prefix.m4 (provided by m4 package) to m4/macro/ and adding 
"m4_include(m4/macros/lib-prefix.m4)"
before AC_LIB_PREFIX.

(I don't understand how it works for upstream)


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
