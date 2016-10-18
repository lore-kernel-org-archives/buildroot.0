From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Oct 2016 23:38:54 +0200
Subject: [Buildroot] [PATCH 91/93] qt: use $(TARGET_MAKE_ENV) when
 calling $(MAKE)
In-Reply-To: <1476720440-22239-92-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1476720440-22239-92-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <9d82dd47-b4d5-728a-ed2f-3cef7b95a0b5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-10-16 18:07, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  package/qt/qt.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/qt/qt.mk b/package/qt/qt.mk
> index 8c0ff7b..508f35a 100644
> --- a/package/qt/qt.mk
> +++ b/package/qt/qt.mk
> @@ -505,7 +505,7 @@ endef
>  endif
>  
>  define QT_CONFIGURE_CMDS
> -	-[ -f $(@D)/Makefile ] && $(MAKE) -C $(@D) confclean
> +	-[ -f $(@D)/Makefile ] && $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) confclean

 The configure call itself is missing TARGET_MAKE_ENV as well. It _does_ have a
QT_CONFIGURE_ENV which is never set, so you can replace that one.

 Regards,
 Arnout

>  	$(QT_CONFIGURE_IPV6)
>  	$(QT_CONFIGURE_CONFIG_FILE)
>  	# Fix compiler path
> @@ -632,7 +632,7 @@ endef
>  # remove the sysroot path from them, since pkg-config already adds it
>  # automatically.
>  define QT_INSTALL_STAGING_CMDS
> -	$(MAKE) -C $(@D) install
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
>  	mkdir -p $(HOST_DIR)/usr/bin
>  	mv $(addprefix $(STAGING_DIR)/usr/bin/,$(QT_HOST_PROGRAMS)) $(HOST_DIR)/usr/bin
>  	ln -sf $(STAGING_DIR)/usr/mkspecs $(HOST_DIR)/usr/mkspecs
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
