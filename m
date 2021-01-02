From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 18:42:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/wqy-zenhei: new package
In-Reply-To: <20201204141737.27942-1-klaus@linux.vnet.ibm.com>
References: <20201204141737.27942-1-klaus@linux.vnet.ibm.com>
Message-ID: <20210102184224.13096374@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Klaus,

Thanks for this contribution! I have applied your patch to master, with
a number of changes. See below for details.

On Fri,  4 Dec 2020 11:17:37 -0300
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com> wrote:


> diff --git a/package/wqy-zenhei/Config.in b/package/wqy-zenhei/Config.in
> new file mode 100644
> index 0000000000..26fd1e8a93
> --- /dev/null
> +++ b/package/wqy-zenhei/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_WQY_ZENHEI
> +	bool "wqy-zenhei (Free Chinese-capable fonts)"

Changed to:

	bool "wqy-zenhei (Free Chinese-capable fonts)"

Indeed for consistency reason, we try to only use the lower-case
package name as the short prompt for packags.


> +	help
> +	  "WenQuanYi Zen Hei" is a Hei-Ti Style (sans-serif) Chinese
> +	  font capable of text formatting and on-screen display of both
> +	  simplified and traditional forms of Chinese Hanzi glyphs
> +	  (among many other languages). Both the proportional
> +	  "WenQuanYi Zen Hei", as well as the monospaced typeface
> +	  "WenQuanYi Zen Hei Mono" provides over 35,000 glyphs,
> +	  including over 21,000 Chinese Hanzi. This font provides full
> +	  coverage of GBK (CP936) charset, CJK Unified Ideographs, as
> +	  well as the code-points needed for zh_CN, zh_SG, zh_TW, zh_HK,
> +	  zh_MO, ja (Japanese) and ko (Korean) locales for fontconfig.

I've added some upstream URL for the project here:

	  https://sourceforge.net/projects/wqy/

> diff --git a/package/wqy-zenhei/wqy-zenhei.hash b/package/wqy-zenhei/wqy-zenhei.hash
> new file mode 100644
> index 0000000000..86ae38da4f
> --- /dev/null
> +++ b/package/wqy-zenhei/wqy-zenhei.hash
> @@ -0,0 +1,3 @@
> +# locally computed sha256 from:
> +# https://downloads.sourceforge.net/project/wqy/wqy-zenhei/0.9.45%20%28Fighting-state%20RC1%29/wqy-zenhei-0.9.45.tar.gz

Indicating the URL from which the tarball is downloaded and then the
hash calculated locally is not very useful. Also, SourceForge provides
md5 and sha1 hashes, and the hash of the license file was missing. So,
I've changed to:

+# from https://sourceforge.net/projects/wqy/files/wqy-zenhei/0.9.45%20%28Fighting-state%20RC1%29/
+md5  4c6c3f4e902dd5ee0a121e8c41d040bd  wqy-zenhei-0.9.45.tar.gz
+sha1  b86b65d3048ade868fcc89229cfac6baf80a3e54  wqy-zenhei-0.9.45.tar.gz
+# locally calculated
+sha256  e4b7e306475bf9427d1757578f0e4528930c84c44eaa3f167d4c42f110ee75d6  wqy-zenhei-0.9.45.tar.gz
+sha256  871c2a85e6bbf7bec65043820b706a265ed95d4e58c577fbb2c9f60c39c26ca7  COPYING


> +WQY_ZENHEI_VERSION = 0.9.45
> +WQY_ZENHEI_SITE = https://downloads.sourceforge.net/project/wqy/wqy-zenhei/$(WQY_ZENHEI_VERSION)%20%28Fighting-state%20RC1%29
> +WQY_ZENHEI_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/wqy-zenhei

This was not needed, as it was used only once.

> +WQY_ZENHEI_LICENSE =  GPL-v2

This should have been:

+WQY_ZENHEI_LICENSE =  GPL-2.0-with-font-exception

> +WQY_ZENHEI_LICENSE_FILES = COPYING
> +
> +ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
> +define WQY_ZENHEI_FONTCONFIG_CONF_INSTALL_CMDS
> +	$(INSTALL) -D -m 0644 $(@D)/43-wqy-zenhei-sharp.conf \
> +	    $(TARGET_DIR)/usr/share/fontconfig/conf.avail/43-wqy-zenhei-sharp.conf
> +	$(INSTALL) -D -m 0644 $(@D)/44-wqy-zenhei.conf \
> +	    $(TARGET_DIR)/usr/share/fontconfig/conf.avail/44-wqy-zenhei.conf
> +endef
> +endif
> +
> +define WQY_ZENHEI_INSTALL_TARGET_CMDS
> +	mkdir -p $(WQY_ZENHEI_TARGET_DIR)
> +	$(INSTALL) -m 644 $(@D)/wqy-zenhei.ttc $(WQY_ZENHEI_TARGET_DIR)

Replaced those two lines with:

+       $(INSTALL) -D -m 0644 $(@D)/wqy-zenhei.ttc \
+               $(TARGET_DIR)/usr/share/fonts/wqy-zenhei/wqy-zenhei.ttc


> +	$(WQY_ZENHEI_FONTCONFIG_CONF_INSTALL_CMDS)
> +endef
> +
> +$(eval $(generic-package))

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
