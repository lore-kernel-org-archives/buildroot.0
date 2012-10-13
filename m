From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Oct 2012 11:29:28 +0200
Subject: [Buildroot] [PATCH] beecrypt: enable OpenMP if Buildroot GCC
 supports it
In-Reply-To: <1350071690-11279-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1350071690-11279-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <50793478.1090305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/10/12 21:54, Stefan Fr?berg wrote:
>
> Signed-off-by: Stefan Fr?berg<stefan.froberg@petroprogram.com>
> ---
>   package/beecrypt/beecrypt.mk |    6 ++++++
>   1 files changed, 6 insertions(+), 0 deletions(-)
>
> diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
> index d165aee..101d0df 100644
> --- a/package/beecrypt/beecrypt.mk
> +++ b/package/beecrypt/beecrypt.mk
> @@ -18,6 +18,12 @@ BEECRYPT_CONF_OPT = \
>   		--without-java \
>   		--without-python
>
> +ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
> +BEECRYPT_CONF_OPT += --enable-openmp
> +else
> +BEECRYPT_CONF_OPT += --disable-openmp
> +endif
> +

  This doesn't solve the underlying issue that -lgomp isn't included.  In
addition, it would only enable openmp for internal toolchains, while it may
be present for ct-ng or external toolchains as well.  I think the automatic
detection works well in this case.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
