From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Jan 2013 19:07:40 +0100
Subject: [Buildroot] [PATCH] New package: cache-calibrator
In-Reply-To: <1359391753-14216-1-git-send-email-sho@relinux.de>
References: <1359391753-14216-1-git-send-email-sho@relinux.de>
Message-ID: <5106BE6C.1030900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/01/13 17:49, Stephan Hoffmann wrote:
[snip]

> diff --git a/package/cache-calibrator/Config.in b/package/cache-calibrator/Config.in
> new file mode 100644
> index 0000000..ba3e021
> --- /dev/null
> +++ b/package/cache-calibrator/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_CACHE_CALIBRATOR
> +	bool "cache-calibrator"
> +	help
> +	  Cache Ccalibrator is a small C program that is
                 ^^^ typo

> +	  supposed to analyze a computers (cache-) memory
> +	  system and extract useful information
> +
> +	  http://homepages.cwi.nl/~manegold/Calibrator/

[snip]
> +CACHE_CALIBRATOR_SOURCE = calibrator.c
> +CACHE_CALIBRATOR_SITE = http://homepages.cwi.nl/~manegold/Calibrator/src
> +CACHE_CALIBRATOR_EXTRACT_CMDS = cp $(DL_DIR)/$(CACHE_CALIBRATOR_SOURCE) $(CACHE_CALIBRATOR_DIR)

  Hehe, yet another $(FOO_DIR) for Thomas to fix :-)

  Please change into $(@D).

> +CACHE_CALIBRATOR_LICENSE = Free

  I haven't looked at the actual license, but 'Free' doesn't sound like a 
sufficiently descriptive term. If all else fails, use "Cache calibrator 
license".

> +CACHE_CALIBRATOR_LICENSE_FILES = calibrator.c
> +
> +define CACHE_CALIBRATOR_BUILD_CMDS
> +	$(TARGET_CC) $(@D)/calibrator.c -o $(@D)/cache_calibrator -lm

  Please use $(TARGET_CFLAGS) and $(TARGET_LDFLAGS). These may actually 
have an impact on the measurements.


  Otherwise, looks good :-)

  Regards,
  Arnout


> +endef
> +
> +define CACHE_CALIBRATOR_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/cache_calibrator $(TARGET_DIR)/usr/bin/cache_calibrator
> +endef
> +
> +$(eval $(generic-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
