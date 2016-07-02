From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 16:04:25 +0200
Subject: [Buildroot] [PATCH] dmalloc: fix static build
In-Reply-To: <20160613060717.GA8502@waldemar-brodkorb.de>
References: <20160613060717.GA8502@waldemar-brodkorb.de>
Message-ID: <20160702160425.58b463bf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Jun 2016 08:07:17 +0200, Waldemar Brodkorb wrote:
> For example coldfire uses FLAT binaries, which are statically
> build. Fixes following autobuild failure:
> http://autobuild.buildroot.net/results/cc4233a4c3f92275a4071c172330c920c35219ca/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/dmalloc/dmalloc.mk | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
> index 6eb87c6..18a6fa0 100644
> --- a/package/dmalloc/dmalloc.mk
> +++ b/package/dmalloc/dmalloc.mk
> @@ -58,11 +58,15 @@ define DMALLOC_INSTALL_STAGING_CMDS
>  		-C $(@D) install
>  endef
>  
> -define DMALLOC_INSTALL_TARGET_CMDS
>  ifeq ($(BR2_STATIC_LIBS),)
> +define DMALLOC_INSTALL_TARGET_CMDS
>  	cp -dpf $(STAGING_DIR)/usr/lib/libdmalloc*.so $(TARGET_DIR)/usr/lib
> -endif
>  	cp -dpf $(STAGING_DIR)/usr/bin/dmalloc $(TARGET_DIR)/usr/bin/dmalloc
>  endef
> +else
> +define DMALLOC_INSTALL_TARGET_CMDS
> +	cp -dpf $(STAGING_DIR)/usr/bin/dmalloc $(TARGET_DIR)/usr/bin/dmalloc
> +endef
> +endif

Instead of duplicating the code that installs the program, I've created
a temporary variable that does the library installation, and which only
gets defined if BR2_STATIC_LIBS is empty:

ifeq ($(BR2_STATIC_LIBS),)
define DMALLOC_INSTALL_SHARED_LIB
        cp -dpf $(STAGING_DIR)/usr/lib/libdmalloc*.so $(TARGET_DIR)/usr/lib
endef
endif

define DMALLOC_INSTALL_TARGET_CMDS
        $(DMALLOC_INSTALL_SHARED_LIB)
        cp -dpf $(STAGING_DIR)/usr/bin/dmalloc $(TARGET_DIR)/usr/bin/dmalloc
endef

Applied with this modification. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
