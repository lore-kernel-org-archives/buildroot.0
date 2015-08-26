From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Aug 2015 15:20:55 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/tvheadend: Fix static build
In-Reply-To: <1440537516-1908-1-git-send-email-bernd.kuhls@t-online.de>
References: <1440537516-1908-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150826152055.1a997b1f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Tue, 25 Aug 2015 23:18:36 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/bd0/bd0e8619df7cd8f21da96ae470691b1ebb2f156c/
> http://autobuild.buildroot.net/results/f1c/f1c40ac9dda5ceeb5665d021333058eb29828d62/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: Put everything in the if-static_libs-then clause (Jerzy)
> 
>  package/tvheadend/tvheadend.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
> index ec04e6f..29ecf4f 100644
> --- a/package/tvheadend/tvheadend.mk
> +++ b/package/tvheadend/tvheadend.mk
> @@ -71,6 +71,14 @@ define TVHEADEND_CONFIGURE_CMDS
>  	)
>  endef
>  
> +ifeq ($(BR2_STATIC_LIBS),y)
> +# remove hardcoded -ldl for static builds
> +define TVHEADEND_FIX_MAKEFILE_FOR_STATIC_BUILD
> +	$(SED) 's/-ldl -lpthread -lm/-lpthread -lm/' $(@D)/Makefile
> +endef
> +TVHEADEND_POST_CONFIGURE_HOOKS += TVHEADEND_FIX_MAKEFILE_FOR_STATIC_BUILD
> +endif

Instead of this hack, could you implement a better fix that can be
upstreamed? -ldl is indeed needed only to build the extras. Can you try
(and push upstream) something like the following patch?

diff --git a/Makefile b/Makefile
index 037e2fa..1b28c8d 100644
--- a/Makefile
+++ b/Makefile
@@ -38,9 +38,9 @@ CFLAGS  += -fms-extensions -funsigned-char -fno-strict-aliasing
 CFLAGS  += -D_FILE_OFFSET_BITS=64
 CFLAGS  += -I${BUILDDIR} -I${ROOTDIR}/src -I${ROOTDIR}
 ifeq ($(CONFIG_ANDROID),yes)
-LDFLAGS += -ldl -lm
+LDFLAGS += -lm
 else
-LDFLAGS += -ldl -lpthread -lm
+LDFLAGS += -lpthread -lm
 endif
 ifeq ($(CONFIG_LIBICONV),yes)
 LDFLAGS += -liconv

There is no need for any other change it seems, since -ldl is already
passed explicitly when building the extra that uses dlsym().

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
