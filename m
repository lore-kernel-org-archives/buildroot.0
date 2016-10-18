From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Oct 2016 22:30:48 +0200
Subject: [Buildroot] [PATCH 63/93] libselinux: use
 $(HOST_CONFIGURE_OPTS) when calling $(MAKE)
In-Reply-To: <1476720440-22239-64-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1476720440-22239-64-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <27936ade-d4f1-b90e-16b3-7f82b4d6d68b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-10-16 18:06, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  package/libselinux/libselinux.mk | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
> index bc0d0e3..36abf49 100644
> --- a/package/libselinux/libselinux.mk
> +++ b/package/libselinux/libselinux.mk
> @@ -64,18 +64,18 @@ HOST_LIBSELINUX_MAKE_OPTS = \
>  define HOST_LIBSELINUX_BUILD_CMDS
>  	# DESTDIR is needed during the compile to compute library and
>  	# header paths.
> -	$(MAKE1) -C $(@D) $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) \
> +	$(HOST_CONFIGURE_OPTS) $(MAKE1) -C $(@D) $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) \

 HOST_CONFIGURE_OPTS is already part of HOST_LIBSELINUX_MAKE_OPTS, so this
should have been HOST_MAKE_ENV (+ subject line).

 Regards,
 Arnout

>  		SHLIBDIR=$(HOST_DIR)/usr/lib all
>  	# Generate python interface wrapper
> -	$(MAKE1) -C $(@D) $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) swigify pywrap
> +	$(HOST_CONFIGURE_OPTS) $(MAKE1) -C $(@D) $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) swigify pywrap
>  endef
>  
>  define HOST_LIBSELINUX_INSTALL_CMDS
> -	$(MAKE) -C $(@D) $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) \
> +	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) \
>  		SHLIBDIR=$(HOST_DIR)/usr/lib SBINDIR=$(HOST_DIR)/usr/sbin install
>  	(cd $(HOST_DIR)/usr/lib; $(HOSTLN) -sf libselinux.so.1 libselinux.so)
>  	# Install python interface wrapper
> -	$(MAKE) -C $(@D) $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) install-pywrap
> +	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) install-pywrap
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
