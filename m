From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Apr 2015 10:30:34 +0200
Subject: [Buildroot] [PATCH v6 02/15] gpu-viv-bin-mx6q: fix compiling
 issues with EGL_API_FB
In-Reply-To: <1421451251-23366-3-git-send-email-jezz@sysmic.org>
References: <1421451251-23366-1-git-send-email-jezz@sysmic.org>
 <1421451251-23366-3-git-send-email-jezz@sysmic.org>
Message-ID: <20150430103034.4d1032c7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Sat, 17 Jan 2015 00:33:58 +0100, J?r?me Pouiller wrote:

>  define GPU_VIV_BIN_MX6Q_INSTALL_STAGING_CMDS
>  	cp -r $(@D)/usr/* $(STAGING_DIR)/usr
> +	if [ $(GPU_VIV_BIN_MX6Q_LIB_TARGET) == fb ]; then \
> +		$(SED) '/#define EGLAPIENTRY/ a \
> +			#if !defined(EGL_API_X11) && !defined(EGL_API_DFB) && !defined(EGL_API_FB) \n\
> +			#define EGL_API_FB \n\
> +			#endif' $(STAGING_DIR)/usr/include/EGL/eglvivante.h; \
> +	fi

This should have used a make test instead of a shell test, i.e:

ifeq ($(GPU_VIV_BIN_MX6Q_LIB_TARGET),fb)
define GPU_VIV_BIN_MX6Q_FIXUP_FB_HEADERS
	$(SED) '/#define EGLAPIENTRY/ a \
		#if !defined(EGL_API_X11) && !defined(EGL_API_DFB) && !defined(EGL_API_FB) \n\
		#define EGL_API_FB \n\
		#endif' $(STAGING_DIR)/usr/include/EGL/eglvivante.h; \
endef
endif

define GPU_VIV_BIN_MX6Q_INSTALL_STAGING_CMDS
	cp -r $(@D)/usr/* $(STAGING_DIR)/usr
	$(GPU_VIV_BIN_MX6Q_FIXUP_FB_HEADERS)
endef

Can be fixed up when applying the patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
