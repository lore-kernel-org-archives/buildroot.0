From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Apr 2017 21:59:51 +0200
Subject: [Buildroot] [PATCHv3] mpir: fix build failure fixes:
 http://autobuild.buildroot.net/results/49b/49b4d4b8d8afc3e0353529146270ee8b289dc8be/
In-Reply-To: <1492442439-2540-1-git-send-email-semenak94@mail.ru>
References: <mpir: fix build failure>
 <1492442439-2540-1-git-send-email-semenak94@mail.ru>
Message-ID: <52c5366d-312c-2491-8e6f-14b0997b325e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-04-17 17:20, Semyon Kolganov wrote:
>  http://autobuild.buildroot.net/results/b4c/b4c65ad8f35299588de67917be5d020a7f641ce7/
> 
> Signed-off-by: Semyon Kolganov <semenak94@mail.ru>
> ---
> Changes between v1 and v2:
>  - removed unneeded depend on
>  - fixed build for powerpc
> ---
>  package/mpir/mpir.mk | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/package/mpir/mpir.mk b/package/mpir/mpir.mk
> index 430d587..2a5807b 100644
> --- a/package/mpir/mpir.mk
> +++ b/package/mpir/mpir.mk
> @@ -12,4 +12,17 @@ MPIR_LICENSE_FILES = COPYING.LIB
>  MPIR_INSTALL_STAGING = YES
>  MPIR_DEPENDENCIES = gmp host-yasm
>  
> +ifeq ($(BR2_MIPS_NABI32),y)
> +MPIR_CONF_OPTS += ABI=n32
> +endif
> +
> +ifeq ($(BR2_MIPS_NABI64),y)
> +MPIR_CONF_OPTS += ABI=n64
> +endif
> +
> +ifeq ($(BR2_powerpc_CLASSIC),y)
> +MPIR_CONF_OPTS += ABI=mode64
> +export MPN_PATH=generic

 This is not good, because it will *globally* export that variable, not just for
this package.

 Instead, you should set
MPIR_CONF_ENV += MPN_PATH=generic

(and if it is also needed at build time, same for MPIR_MAKE_ENV).

 Regards,
 Arnout

> +endif
> +
>  $(eval $(autotools-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
