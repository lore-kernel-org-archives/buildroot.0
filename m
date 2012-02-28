From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Feb 2012 21:09:49 +0000
Subject: [Buildroot] [PATCH 3/3] qt: Add option to build and install
	tools on the target
In-Reply-To: <1330258388-28391-3-git-send-email-ismael.luceno@gmail.com>
References: <1330258388-28391-1-git-send-email-ismael.luceno@gmail.com>
 <1330258388-28391-3-git-send-email-ismael.luceno@gmail.com>
Message-ID: <201202282109.49513.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 26 February 2012 12:13:08 Ismael Luceno wrote:
[snip]
> +config BR2_PACKAGE_QT_TOOLS
> +	bool "Compile and install tools"
> +	depends on BR2_PACKAGE_QT_SQL_MODULE
> +	help
> +	  If unsure, say N.

 The help should specify which tools are included (and maybe also what
they do).

[snip]
> +QT_TARGET_PROGRAMS += qmlviewer
>  
>  ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
>  QT_INSTALL_LIBS    += QtGui
> @@ -577,7 +584,12 @@ endef
>  define QT_INSTALL_STAGING_CMDS
>  	$(MAKE) -C $(@D) install
>  	mkdir -p $(HOST_DIR)/usr/bin
> -	mv $(addprefix $(STAGING_DIR)/usr/bin/,$(QT_HOST_PROGRAMS)) $(HOST_DIR)/usr/bin
> +	for i in $(addprefix $(STAGING_DIR)/usr/bin/,$(QT_HOST_PROGRAMS)); do \
> +		if [ -x "$$i" ]; then cp "$$i" $(HOST_DIR)/usr/bin; fi; \
> +	done
> +	for i in $(addprefix $(STAGING_DIR)/usr/bin/,$(QT_TARGET_PROGRAMS)); do \
> +		if [ -x "$$i" ]; then cp "$$i" $(TARGET_DIR)/usr/bin; fi; \
> +	done

 I would remove the checks here.  If in some future version these tools 
disappear, we want to notice it and update the .mk file accordingly.  So
the original mv command should be OK.  By the way, if you make such an
additional change (which is unrelated to 'build and install tools on
the target'), it should be mentioned in the commit message.

 For the qmlviewer, I assume it is not built if BR2_PACKAGE_QT_TOOLS is
disabled.  To support that, you can set

QT_TARGET_PROGRAMS += $(if $(BR2_PACKAGE_QT_TOOLS),qmlviewer))

Or alternatively:

QT_TARGET_PROGRAMS-$(BR2_PACKAGE_QT_TOOLS) += qmlviewer

and use $(QT_TARGET_PROGRAMS-y)



 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
