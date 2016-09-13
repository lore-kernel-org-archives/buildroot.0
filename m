From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Sep 2016 01:23:32 +0200
Subject: [Buildroot] [PATCH 2/2] xen: Remove TARGET_CONFIGURE_OPTS from
 make
In-Reply-To: <1473799504-20372-2-git-send-email-alistair.francis@xilinx.com>
References: <1473799504-20372-1-git-send-email-alistair.francis@xilinx.com>
 <1473799504-20372-2-git-send-email-alistair.francis@xilinx.com>
Message-ID: <dd89e679-681d-a3e6-b37e-1beea8744937@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-09-16 22:45, Alistair Francis wrote:
> The TARGET_CONFIGURE_OPTS variable resulted in a double definition
> error:
> <command-line>:0:0: error: "__OBJECT_FILE__" redefined [-Werror]
> 
> Remove the options to avoid the error.

 This doesn't look right. TARGET_CONFIGURE_OPTS definitely doesn't contain
-D__OBJECT_FILE__ (or you have some very weird stuff in BR2_TARGET_OPTIMIZATION).

 How did you get this error? Can you print the full command line (by setting
BR2_DEBUG_WRAPPER=1 in the environment) to find out how it gets defined twice?

 Regards,
 Arnout

> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
>  package/xen/xen.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/xen/xen.mk b/package/xen/xen.mk
> index e2c797f..8400a77 100644
> --- a/package/xen/xen.mk
> +++ b/package/xen/xen.mk
> @@ -22,8 +22,7 @@ XEN_CONF_OPTS = --disable-ocamltools
>  XEN_CONF_ENV = PYTHON=$(HOST_DIR)/usr/bin/python2
>  XEN_MAKE_ENV = \
>  	XEN_TARGET_ARCH=$(XEN_ARCH) \
> -	CROSS_COMPILE=$(TARGET_CROSS) \
> -	$(TARGET_CONFIGURE_OPTS)
> +	CROSS_COMPILE=$(TARGET_CROSS)
>  
>  ifeq ($(BR2_PACKAGE_XEN_HYPERVISOR),y)
>  XEN_MAKE_OPTS += dist-xen
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
