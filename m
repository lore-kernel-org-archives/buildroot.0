From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Feb 2016 00:44:42 +0100
Subject: [Buildroot] [PATCH 01/32] package/lz4: bump version to r131
In-Reply-To: <1456437341-19025-2-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
 <1456437341-19025-2-git-send-email-gabe@hashrabbit.co>
Message-ID: <56CF91EA.6040300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Gabe,

 I'm not going to review all of the series yet, just a few of them. The patches
which are pretty independent (like this one) you can resend individually. Only
when you resend the later ones you need to send the entire series.

On 02/25/16 22:55, Gabe Evans wrote:
> systemd v228 requires lz4 >= 125
> 
> Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
> ---
>  package/lz4/lz4.hash |  2 ++
>  package/lz4/lz4.mk   | 19 ++++++++++++-------
>  2 files changed, 14 insertions(+), 7 deletions(-)
>  create mode 100644 package/lz4/lz4.hash
> 
> diff --git a/package/lz4/lz4.hash b/package/lz4/lz4.hash
> new file mode 100644
> index 0000000..1281284
> --- /dev/null
> +++ b/package/lz4/lz4.hash
> @@ -0,0 +1,2 @@
> +# sha256 locally computed
> +sha256 9d4d00614d6b9dec3114b33d1224b6262b99ace24434c53487a0c8fd0b18cfed  lz4-r131.tar.gz
> diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
> index 38e10d8..dbb2221 100644
> --- a/package/lz4/lz4.mk
> +++ b/package/lz4/lz4.mk
> @@ -4,37 +4,42 @@
>  #
>  ################################################################################
>  
> -LZ4_VERSION = r123
> +LZ4_VERSION = r131
>  LZ4_SITE = $(call github,Cyan4973,lz4,$(LZ4_VERSION))
>  LZ4_INSTALL_STAGING = YES
>  LZ4_LICENSE = BSD-2c
>  LZ4_LICENSE_FILES = LICENSE
>  
> +LZ4_MAKE_OPTS = PREFIX=/usr

 I'd prefer to have

LZ4_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) PREFIX=/usr
HOST_LZ4_MAKE_OPTS = $(HOST_CONFIGURE_OPTS) PREFIX=/usr

 However, is the PREFIX useful during the build? If it's only needed at install
time, then I would just pass it there, like we do with DESTDIR already.


 Regards,
 Arnout

> +
>  ifeq ($(BR2_STATIC_LIBS),y)
>  define LZ4_DISABLE_SHARED
> -	$(SED) '/SHARED/d' $(@D)/Makefile
> +	$(SED) '/SHARED/d' $(@D)/lib/Makefile
>  endef
>  LZ4_POST_PATCH_HOOKS += LZ4_DISABLE_SHARED
>  endif
>  
>  define HOST_LZ4_BUILD_CMDS
> -	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)
> +	$(MAKE) $(HOST_CONFIGURE_OPTS) $(LZ4_MAKE_OPTS) -C $(@D)
>  endef
>  
>  define HOST_LZ4_INSTALL_CMDS
> -	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) install DESTDIR=$(HOST_DIR)
> +	$(MAKE) $(HOST_CONFIGURE_OPTS) $(LZ4_MAKE_OPTS) DESTDIR=$(HOST_DIR) \
> +		install -C $(@D)
>  endef
>  
>  define LZ4_BUILD_CMDS
> -	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) liblz4
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(LZ4_MAKE_OPTS) -C $(@D)/lib
>  endef
>  
>  define LZ4_INSTALL_STAGING_CMDS
> -	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) install DESTDIR=$(STAGING_DIR)
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(LZ4_MAKE_OPTS) DESTDIR=$(STAGING_DIR) \
> +		install -C $(@D)
>  endef
>  
>  define LZ4_INSTALL_TARGET_CMDS
> -	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) install DESTDIR=$(TARGET_DIR)
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(LZ4_MAKE_OPTS) DESTDIR=$(TARGET_DIR) \
> +		install -C $(@D)/lib
>  endef
>  
>  $(eval $(generic-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
