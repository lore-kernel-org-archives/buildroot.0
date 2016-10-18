From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Oct 2016 22:30:02 +0200
Subject: [Buildroot] [PATCH 62/93] libselinux: use
 $(TARGET_CONFIGURE_OPTS) when calling $(MAKE)
In-Reply-To: <1476720440-22239-63-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1476720440-22239-63-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <adad96b2-340b-7093-2f7f-22b39d424bf3@mind.be>
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
>  package/libselinux/libselinux.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
> index 6f94173..bc0d0e3 100644
> --- a/package/libselinux/libselinux.mk
> +++ b/package/libselinux/libselinux.mk
> @@ -23,15 +23,15 @@ LIBSELINUX_MAKE_OPTS = \
>  define LIBSELINUX_BUILD_CMDS
>  	# DESTDIR is needed during the compile to compute library and
>  	# header paths.
> -	$(MAKE) -C $(@D) $(LIBSELINUX_MAKE_OPTS) DESTDIR=$(STAGING_DIR) all
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(LIBSELINUX_MAKE_OPTS) DESTDIR=$(STAGING_DIR) all

 TARGET_CONFIGURE_OPTS is already part of LIBSELINUX_MAKE_OPTS, so it should
have been TARGET_MAKE_ENV here. Don't forget to update subject line.

 Regards,
 Arnout

>  endef
>  
>  define LIBSELINUX_INSTALL_STAGING_CMDS
> -	$(MAKE) -C $(@D) $(LIBSELINUX_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(LIBSELINUX_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
>  endef
>  
>  define LIBSELINUX_INSTALL_TARGET_CMDS
> -	$(MAKE) -C $(@D) $(LIBSELINUX_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(LIBSELINUX_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
>  	# Create the selinuxfs mount point
>  	if [ ! -d "$(TARGET_DIR)/selinux" ]; then mkdir $(TARGET_DIR)/selinux; fi
>  	if ! grep -q "selinuxfs" $(TARGET_DIR)/etc/fstab; then \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
