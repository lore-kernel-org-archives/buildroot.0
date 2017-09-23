From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 23 Sep 2017 21:02:21 +0200
Subject: [Buildroot] [PATCH] package/linux-tools: add host dependency
 for pkg-config
In-Reply-To: <20170922194144.52761-1-mmayer@broadcom.com>
References: <20170922194144.52761-1-mmayer@broadcom.com>
Message-ID: <0f81dbb9-ed0a-73b8-ff01-1490f12e2c0d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22-09-17 21:41, Markus Mayer wrote:
> We need to include host-pkgconf in the host dependencies, and we need
> to pass HOST_MAKE_ENV to make, so PKG_CONFIG is set properly. Without
> it, the system's pkg-config will be used, and compilation may fail.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
> 
> This is a follow-on to my patches from a couple of months ago.[1] I was
> certain I had already submitted this patch upstream back then, but
> apparently not. So here goes.
> 
> On my Ubuntu 16.04 box, tmon doesn't build (for ARM or MIPS) unless I
> include this change.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2017-July/thread.html#198247
> 
>  package/linux-tools/linux-tool-tmon.mk.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/linux-tools/linux-tool-tmon.mk.in b/package/linux-tools/linux-tool-tmon.mk.in
> index 15931c3..e4afe82 100644
> --- a/package/linux-tools/linux-tool-tmon.mk.in
> +++ b/package/linux-tools/linux-tool-tmon.mk.in
> @@ -7,6 +7,8 @@
>  LINUX_TOOLS += tmon
>  
>  TMON_DEPENDENCIES = host-pkgconf ncurses
> +HOST_TMON_DEPENDENCIES = host-pkgconf

 This variable will never be used, because there is no host-tmon.

> +
>  TMON_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
>  	CC=$(TARGET_CC) \
>  	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
> @@ -24,13 +26,13 @@ define TMON_BUILD_CMDS
>  		exit 1 ; \
>  	fi
>  	$(TMON_DISABLE_STACK_PROTECTOR)
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
> +	$(HOST_MAKE_ENV) $(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \

 That's not the right way to do it. We're building for the target, so we
shouldn't have any host stuff in here. What you want to do is to replace
TARGET_MAKE_ENV with TARGET_CONFIGURE_OPTS. The naming of that variable is not
ideal, but that's historical accident...


 However, I don't understand why you need this. TARGET_MAKE_ENV sets a path that
includes $(HOST_DIR)/bin and that's where our pkg-config resides. So how can it
pick up the pkg-config from the host?

 Regards,
 Arnout

>  		$(TMON_MAKE_OPTS) \
>  		tmon
>  endef
>  
>  define TMON_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
> +	$(HOST_MAKE_ENV) $(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
>  		$(TMON_MAKE_OPTS) \
>  		INSTALL_ROOT=$(TARGET_DIR) \
>  		tmon_install
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
