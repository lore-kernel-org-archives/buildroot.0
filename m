From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Oct 2016 16:50:19 +0200
Subject: [Buildroot] [PATCH 34/51] jack2: use $(TARGET_MAKE_ENV) when
 calling $(MAKE)
In-Reply-To: <1476396838-12276-35-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1476396838-12276-35-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <82330fcf-15c9-7cb1-9116-64ce2dfd1cf2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-10-16 00:13, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> In this case in particular it's $(TARGET_CONFIGURE_OPTS), which includes
> $(TARGET_MAKE_ENV).

 Incredible, you predicted http://patchwork.ozlabs.org/patch/682287/ ! Before
that patch, TARGET_CONFIGURE_OPTS did not include TARGET_MAKE_ENV... Or are we
missing something?

 Regards,
 Arnout

> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  package/jack2/jack2.mk | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
> index f6ab974..fa9e451 100644
> --- a/package/jack2/jack2.mk
> +++ b/package/jack2/jack2.mk
> @@ -53,16 +53,22 @@ define JACK2_CONFIGURE_CMDS
>  endef
>  
>  define JACK2_BUILD_CMDS
> -	(cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS))
> +	(cd $(@D); \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		$(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS))
>  endef
>  
>  define JACK2_INSTALL_TARGET_CMDS
> -	(cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(TARGET_DIR) \
> +	(cd $(@D); \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		$(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(TARGET_DIR) \
>  		install)
>  endef
>  
>  define JACK2_INSTALL_STAGING_CMDS
> -	(cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(STAGING_DIR) \
> +	(cd $(@D); \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		$(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(STAGING_DIR) \
>  		install)
>  endef
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
