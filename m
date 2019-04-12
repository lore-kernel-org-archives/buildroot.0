From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 12 Apr 2019 23:26:34 +0200
Subject: [Buildroot] [PATCH v2] package/qt5/qt5virtualkeyboard: fix
 legal-info failure
In-Reply-To: <20190412082455.65397-1-giulio.benetti@micronovasrl.com>
References: <4549a443-50cb-3a96-a390-4b68b6328f76@micronovasrl.com>
 <20190412082455.65397-1-giulio.benetti@micronovasrl.com>
Message-ID: <4f3d6cf0-7cdd-ce66-eda7-d1e038c8e1df@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/04/2019 10:24, Giulio Benetti wrote:
> After version bump, all sha256 were updated, but not the changed license
> files paths for version 5.12.2.
> 
> Update license files paths for 5.12.2.
> 
> Fixes:
> http://autobuild.buildroot.net/results/3812f4a6313fab57766c7b98defa723c58a8fa76/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  .../5.12.2/qt5virtualkeyboard.hash                 |  8 ++++----
>  .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk   | 14 +++++++++++++-
>  2 files changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/package/qt5/qt5virtualkeyboard/5.12.2/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/5.12.2/qt5virtualkeyboard.hash
> index 69c947359a..245f2b4a70 100644
> --- a/package/qt5/qt5virtualkeyboard/5.12.2/qt5virtualkeyboard.hash
> +++ b/package/qt5/qt5virtualkeyboard/5.12.2/qt5virtualkeyboard.hash
> @@ -3,7 +3,7 @@ sha256 7111de5c78f8a0d29394409727647b90ae5906fd5105c843af98c3ae3804248d qtvirtua
>  
>  # Hashes for license files:
>  sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
> -sha256 7a45a9769d19545480a241230e6ea520b5156fac00930dcd69b6886749743d10 src/virtualkeyboard/3rdparty/lipi-toolkit/MIT_LICENSE.txt
> -sha256 05cc719deafd0ab083b03296bb2911de10d116953b626a7629b9ca59938038b1 src/virtualkeyboard/3rdparty/openwnn/NOTICE
> -sha256 b5830d96fb5a7e7e7ebcc295f352846b4b998e78fdc8f9aa68e134d2e4b39986 src/virtualkeyboard/3rdparty/pinyin/NOTICE
> -sha256 9400a6128693d2f25653698e695f554660c71efccc8c21af28bf143e35199db6 src/virtualkeyboard/3rdparty/tcime/COPYING

 Shouldn't these still be kept for the 5.6 version? Maybe with a comment above.

 Regards,
 Arnout

> +sha256 7a45a9769d19545480a241230e6ea520b5156fac00930dcd69b6886749743d10 src/plugins/lipi-toolkit/3rdparty/lipi-toolkit/MIT_LICENSE.txt
> +sha256 05cc719deafd0ab083b03296bb2911de10d116953b626a7629b9ca59938038b1 src/plugins/openwnn/3rdparty/openwnn/NOTICE
> +sha256 b5830d96fb5a7e7e7ebcc295f352846b4b998e78fdc8f9aa68e134d2e4b39986 src/plugins/pinyin/3rdparty/pinyin/NOTICE
> +sha256 9400a6128693d2f25653698e695f554660c71efccc8c21af28bf143e35199db6 src/plugins/tcime/3rdparty/tcime/COPYING
> diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> index 3f1ebdbaa4..814b454010 100644
> --- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> +++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> @@ -26,19 +26,31 @@ QT5VIRTUALKEYBOARD_QMAKEFLAGS += CONFIG+="$(foreach lang,$(QT5VIRTUALKEYBOARD_LA
>  
>  ifneq ($(filter ja_JP all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
>  QT5VIRTUALKEYBOARD_LICENSE := $(QT5VIRTUALKEYBOARD_LICENSE), Apache-2.0 (openwnn)
> +ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
>  QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/openwnn/NOTICE
> +else
> +QT5VIRTUALKEYBOARD_LICENSE_FILES += src/plugins/openwnn/3rdparty/openwnn/NOTICE
> +endif
>  endif
>  
>  ifneq ($(filter zh_CN all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
>  QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES
>  QT5VIRTUALKEYBOARD_LICENSE := $(QT5VIRTUALKEYBOARD_LICENSE), Apache-2.0 (pinyin)
> +ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
>  QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/pinyin/NOTICE
> +else
> +QT5VIRTUALKEYBOARD_LICENSE_FILES += src/plugins/pinyin/3rdparty/pinyin/NOTICE
> +endif
>  endif
>  
>  ifneq ($(filter zh_TW all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
>  QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES
>  QT5VIRTUALKEYBOARD_LICENSE := $(QT5VIRTUALKEYBOARD_LICENSE), Apache-2.0 (tcime), BSD-3-Clause (tcime)
> +ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
>  QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/tcime/COPYING
> +else
> +QT5VIRTUALKEYBOARD_LICENSE_FILES += src/plugins/tcime/3rdparty/tcime/COPYING
> +endif
>  endif
>  endif
>  
> @@ -49,7 +61,7 @@ QT5VIRTUALKEYBOARD_LICENSE := $(QT5VIRTUALKEYBOARD_LICENSE), MIT (lipi-toolkit)
>  ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
>  QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/lipi-toolkit/license.txt
>  else
> -QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/lipi-toolkit/MIT_LICENSE.txt
> +QT5VIRTUALKEYBOARD_LICENSE_FILES += src/plugins/lipi-toolkit/3rdparty/lipi-toolkit/MIT_LICENSE.txt
>  endif
>  endif
>  
> 
