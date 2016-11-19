From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Nov 2016 10:33:35 +0100
Subject: [Buildroot] [PATCH v2 07/15] reproducibility/busybox: disable
 build timestamps
In-Reply-To: <1479460224-6119-8-git-send-email-jezz@sysmic.org>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-8-git-send-email-jezz@sysmic.org>
Message-ID: <1f1f08e9-fb43-3de9-abc9-294096869349@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-11-16 10:10, J?r?me Pouiller wrote:
> From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
> 
> Busybox include a few information about build environment in its binary. This
> feature is incompatible with BR2_REPRODUCIBLE feature. This patch overload build
> information when BR2_REPRODUCIBLE is enabled.

 Commit message is not very English :-)

Busybox includes some information about the build environment in its binary. For
BR2_REPRODUCIBLE, remove that information.


 Regards,
 Arnout

> 
> Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/busybox/busybox.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index fc23a90..f4a241d 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -36,6 +36,12 @@ BUSYBOX_MAKE_ENV = \
>  	$(TARGET_MAKE_ENV) \
>  	CFLAGS="$(BUSYBOX_CFLAGS)" \
>  	CFLAGS_busybox="$(BUSYBOX_CFLAGS_busybox)"
> +
> +ifeq ($(BR2_REPRODUCIBLE),y)
> +BUSYBOX_MAKE_ENV += \
> +	KCONFIG_NOTIMESTAMP=1
> +endif
> +
>  BUSYBOX_MAKE_OPTS = \
>  	CC="$(TARGET_CC)" \
>  	ARCH=$(KERNEL_ARCH) \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
