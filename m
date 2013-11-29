From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Nov 2013 15:39:00 +0100
Subject: [Buildroot] [PATCH] hostapd: fix static build failure
In-Reply-To: <1385735143-8323-1-git-send-email-gustavo@zacarias.com.ar>
References: <1385735143-8323-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20131129153900.1084221a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 29 Nov 2013 11:25:43 -0300, Gustavo Zacarias wrote:
> libnl-3 uses threads and this isn't accounted for in hostapd (or
> libnl-3*.pc files for that matter - hostapd doesn't use pkg-config
> anyway).
> Since linking order matters for static scenarios also throw in -lnl-3
> into LIBS first since it gets appended to in hostapd makefiles to add
> libnl-3.
> 
> Fixes:
> http://autobuild.buildroot.net/results/d4a/d4a9f44effeb08eda6c4b32764274ae81d185d5e/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/hostapd/hostapd.mk | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
> index 4d31df5..0fbd8bc 100644
> --- a/package/hostapd/hostapd.mk
> +++ b/package/hostapd/hostapd.mk
> @@ -10,13 +10,14 @@ HOSTAPD_SUBDIR = hostapd
>  HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
>  HOSTAPD_DEPENDENCIES = libnl
>  HOSTAPD_CFLAGS = $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/
> -HOSTAPD_LDFLAGS = $(TARGET_LDFLAGS)
>  HOSTAPD_LICENSE = GPLv2/BSD-3c
>  HOSTAPD_LICENSE_FILES = README
>  
> -# libnl needs -lm (for rint) if linking statically
> +# libnl-3 needs -lm (for rint) and -lpthread if linking statically
> +# And library order matters hence stick -lnl-3 first since it's appended
> +# in the hostapd Makefiles as in LIBS+=-lnl-3 ... thus failing
>  ifeq ($(BR2_PREFER_STATIC_LIB),y)
> -HOSTAPD_LDFLAGS += -lm

So before this commit we were defining HOSTAPD_LDFLAGS...

> +HOSTAPD_LIBS += -lnl-3 -lm -lpthread
>  endif
>  
>  define HOSTAPD_LIBNL_CONFIG
> @@ -93,7 +94,7 @@ endef
>  
>  define HOSTAPD_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) CFLAGS="$(HOSTAPD_CFLAGS)" \
> -		LDFLAGS="$(TARGET_LDFLAGS)" \

but not using it? :-)

> +		LDFLAGS="$(TARGET_LDFLAGS)" LIBS="$(HOSTAPD_LIBS)" \
>  		$(MAKE) CC="$(TARGET_CC)" -C $(@D)/$(HOSTAPD_SUBDIR)
>  endef
>  

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
