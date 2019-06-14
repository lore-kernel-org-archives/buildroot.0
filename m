From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Fri, 14 Jun 2019 23:28:50 +0200
Subject: [Buildroot] [PATCH 23/27] package/tvheadend: fix PIE build
 failures
In-Reply-To: <20190614210346.121013-24-giulio.benetti@micronovasrl.com>
References: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
 <20190614210346.121013-24-giulio.benetti@micronovasrl.com>
Message-ID: <29c94e29-defc-cb40-3dbd-9fc4ae132f93@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Il 14/06/2019 23:03, Giulio Benetti ha scritto:
> Package tvheadend builds using '-pie' linker flag in any case. This
> leads to linking failure if toolchain doesn't support 'pie'.
> 
> Add patch to fix tvheadend's Makefile bug where '-pie' flag is hardcoded
> making it depend on '--disable-pie' as compiler's flags already are
> treated.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---

Already opened a PR upstream for this patch:
https://github.com/tvheadend/tvheadend/pull/1279

>   ...pie-linking-according-to-disable-pie.patch | 34 +++++++++++++++++++
>   package/tvheadend/tvheadend.mk                |  4 +++
>   2 files changed, 38 insertions(+)
>   create mode 100644 package/tvheadend/0002-Makefile-fix-pie-linking-according-to-disable-pie.patch
> 
> diff --git a/package/tvheadend/0002-Makefile-fix-pie-linking-according-to-disable-pie.patch b/package/tvheadend/0002-Makefile-fix-pie-linking-according-to-disable-pie.patch
> new file mode 100644
> index 0000000000..385c94b36b
> --- /dev/null
> +++ b/package/tvheadend/0002-Makefile-fix-pie-linking-according-to-disable-pie.patch
> @@ -0,0 +1,34 @@
> +From 5cbf08213222cb507d365e6cbda87277f0b8f31e Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@micronovasrl.com>
> +Date: Fri, 14 Jun 2019 14:25:08 +0200
> +Subject: [PATCH] Makefile: fix -pie linking according to --disable-pie
> +
> +Only compilation follows './configure --disable-pie', linking instead
> +doesn't, because '-pie' flag is passed to LDFLAGS uncoditionally.
> +
> +So add '-pie' flag only if CONFIG_PIE=yes.
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> +---
> + Makefile | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 41783b546..4e5a947a3 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -62,7 +62,10 @@ LDFLAGS += -ldl -lm
> + else
> + LDFLAGS += -ldl -lpthread -lm
> + endif
> +-LDFLAGS += -pie -Wl,-z,now
> ++ifeq ($(CONFIG_PIE),yes)
> ++LDFLAGS += -pie
> ++endif
> ++LDFLAGS += -Wl,-z,now
> + ifeq ($(CONFIG_LIBICONV),yes)
> + LDFLAGS += -liconv
> + endif
> +--
> +2.17.1
> +
> diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
> index e92c111082..b192a33d4a 100644
> --- a/package/tvheadend/tvheadend.mk
> +++ b/package/tvheadend/tvheadend.mk
> @@ -94,6 +94,10 @@ else
>   TVHEADEND_CONF_OPTS += --disable-pcre
>   endif
>   
> +ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
> +TVHEADEND_CONF_OPTS += --disable-pie
> +endif
> +
>   TVHEADEND_DEPENDENCIES += dtv-scan-tables
>   
>   # The tvheadend build system expects the transponder data to be present inside
> 

-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
