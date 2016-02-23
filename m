From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Feb 2016 23:33:20 +0100
Subject: [Buildroot] [PATCH v2] qt: add font license information
In-Reply-To: <1456264376-28974-1-git-send-email-ps.report@gmx.net>
References: <1456264376-28974-1-git-send-email-ps.report@gmx.net>
Message-ID: <56CCDE30.2050903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/23/16 22:52, Peter Seiderer wrote:

 I would mention the discussion about the commas in the commit log, like this:

-----
With this implementation, the different licenses will be separated with
<space><comma>. This is not nice, but to avoid it a pretty ugly construct is needed:
QT_LICENSE = $(shell echo $(QT_LICENSE_BITS) | sed 's% , %, %g')

Since the <space><comma> is just a minor nuisance, we're not going to that kind
of complexity.
-----

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - update most font licenses (thanks to Arnout Vandecappelle)
>   - add comma-separator between the licenses (no nice solution,
>     will add ' ,', but without the starting problem at:
> 
>     QT_LICENSE = LGPLv2.1 with exceptions or GPLv3
>     ifneq ($(BR2_PACKAGE_QT_LICENSE_APPROVED),y)
>     QT_LICENSE += or Digia Qt Commercial license
>     endif
> ---
>  package/qt/qt.mk | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/package/qt/qt.mk b/package/qt/qt.mk
> index a64d32f..beadb41 100644
> --- a/package/qt/qt.mk
> +++ b/package/qt/qt.mk
> @@ -660,13 +660,33 @@ define QT_INSTALL_TARGET_FONTS
>  	mkdir -p $(TARGET_DIR)/usr/lib/fonts
>  	cp -dpf $(QT_FONTS) $(TARGET_DIR)/usr/lib/fonts
>  endef
> +ifeq ($(BR2_PACKAGE_QT_FONT_MICRO),y)
> +# Public Domain as stated in the font source src/3rdparty/fonts/micro.bdf
> +QT_LICENSE += , Public Domain (Micro font)
>  endif
> +ifeq ($(BR2_PACKAGE_QT_FONT_FIXED),y)
> +# according to https://launchpad.net/ubuntu/vivid/+source/qtbase-opensource-src/+copyright

 Given that they were wrong before, this isn't a great reference :-) But it is
in fact specified in src/3rdparty/fonts/5x7.bdf

> +QT_LICENSE += , Public Domain (Fixed font)

 Same issue as with helvetica/japanese: same license is specified twice. So use
the same approach as below.

> +endif
> +ifneq ($(BR2_PACKAGE_QT_FONT_HELVETICA)$(BR2_PACKAGE_QT_FONT_JAPANESE),)
> +QT_LICENSE += , Adobe Helvetica license (Helvetica/Japanese fonts)
> +QT_LICENSE_FILES += src/3rdparty/fonts/COPYING.Helvetica
> +endif
> +ifeq ($(BR2_PACKAGE_QT_FONT_UNIFONT),y)
> +QT_LICENSE += , Freeware (Unifont font)
> +QT_LICENSE_FILES += src/3rdparty/fonts/COPYRIGHT.Unifont
> +endif
> +endif # QT_FONTS
>  
>  ifeq ($(BR2_PACKAGE_QT_QTFREETYPE)$(BR2_PACKAGE_QT_SYSTEMFREETYPE),y)
>  define QT_INSTALL_TARGET_FONTS_TTF
>  	mkdir -p $(TARGET_DIR)/usr/lib/fonts
>  	cp -dpf $(STAGING_DIR)/usr/lib/fonts/*.ttf $(TARGET_DIR)/usr/lib/fonts
>  endef
> +QT_LICENSE += , Bitstream license (DejaVu/Vera TrueType fonts)
> +QT_LICENSE_FILES += src/3rdparty/fonts/COPYRIGHT.DejaVu \
> +	src/3rdparty/fonts/README.DejaVu \
> +	src/3rdparty/fonts/COPYRIGHT.Vera
>  endif
>  endif # BR2_PACKAGE_QT_EMBEDDED
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
