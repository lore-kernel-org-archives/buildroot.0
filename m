From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 19 Oct 2018 09:01:35 -0500
Subject: [Buildroot] [PATCH v2] skeleton-init-common: improve /etc/hosts
 generation
In-Reply-To: <20181019135824.981-1-casantos@datacom.com.br>
References: <20181019135824.981-1-casantos@datacom.com.br>
Message-ID: <CANQCQpYiXhU3YqQdeRjt2EOE9ASsEjDR40wg+UBujRSAXUKVRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos,

On Fri, Oct 19, 2018 at 8:58 AM Carlos Santos <casantos@datacom.com.br>
wrote:
>
> If BR2_TARGET_GENERIC_HOSTNAME contains a FQDN, strip the host part and
> add it as an alias, e.g.
>
>     127.0.1.1   hostname.example.com hostname
>
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

> ---
> Changes v1->v2: remove stray "else"
> ---
>  package/skeleton-init-common/skeleton-init-common.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/package/skeleton-init-common/skeleton-init-common.mk
b/package/skeleton-init-common/skeleton-init-common.mk
> index e8a0522052..02f86df359 100644
> --- a/package/skeleton-init-common/skeleton-init-common.mk
> +++ b/package/skeleton-init-common/skeleton-init-common.mk
> @@ -41,10 +41,15 @@ SKELETON_INIT_COMMON_PASSWD_METHOD = $(call
qstrip,$(BR2_TARGET_GENERIC_PASSWD_M
>  SKELETON_INIT_COMMON_BIN_SH = $(call qstrip,$(BR2_SYSTEM_BIN_SH))
>
>  ifneq ($(SKELETON_INIT_COMMON_HOSTNAME),)
> +SKELETON_INIT_COMMON_HOSTS_LINE = $(SKELETON_INIT_COMMON_HOSTNAME)
> +SKELETON_INIT_COMMON_SHORT_HOSTNAME = $(firstword $(subst .,
,$(SKELETON_INIT_COMMON_HOSTNAME)))
> +ifneq
($(SKELETON_INIT_COMMON_HOSTNAME),$(SKELETON_INIT_COMMON_SHORT_HOSTNAME))
> +SKELETON_INIT_COMMON_HOSTS_LINE += $(SKELETON_INIT_COMMON_SHORT_HOSTNAME)
> +endif
>  define SKELETON_INIT_COMMON_SET_HOSTNAME
>         mkdir -p $(TARGET_DIR)/etc
>         echo "$(SKELETON_INIT_COMMON_HOSTNAME)" >
$(TARGET_DIR)/etc/hostname
> -       $(SED) '$$a \127.0.1.1\t$(SKELETON_INIT_COMMON_HOSTNAME)' \
> +       $(SED) '$$a \127.0.1.1\t$(SKELETON_INIT_COMMON_HOSTS_LINE)' \
>                 -e '/^127.0.1.1/d' $(TARGET_DIR)/etc/hosts
>  endef
>  SKELETON_INIT_COMMON_TARGET_FINALIZE_HOOKS +=
SKELETON_INIT_COMMON_SET_HOSTNAME
> --
> 2.14.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / RC Linux Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted Third
Party Intellectual Property (TPIP) content must be encrypted and sent to
matthew.weber at corp.rockwellcollins.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181019/4497daca/attachment.html>
