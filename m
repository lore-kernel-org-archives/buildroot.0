From: Louis-Paul CORDIER <lpdev@cordier.org>
Date: Fri, 19 Jun 2020 12:22:22 +0200
Subject: [Buildroot] [PATCH v6 20/28] qt5: Fix pkgconfig search path for
 per-package infrastructure
In-Reply-To: <20200217212350.29750-21-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-21-anaumann@ultratronik.de>
Message-ID: <a339f273-33f3-f232-eac4-6e50427abf6d@cordier.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 2/17/20 10:23 PM, Andreas Naumann wrote:
> Per default qmake uses the pkg-config binary and search path detected by qt5base
> and set in mkspecs/qconfig.pri. For per-package infra, this leads to packages
> not contained in qt5base not being detected.
> To overcome this, set the correct pathes in the global QMAKE variable.
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> ---
>   package/qt5/qt5.mk | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
> index eb2a749678..c3b9f69c3f 100644
> --- a/package/qt5/qt5.mk
> +++ b/package/qt5/qt5.mk
> @@ -33,4 +33,6 @@ endef
>   endif
>   
>   # Variable for other Qt applications to use
> -QT5_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++
> +QT5_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++ \
> +	PKG_CONFIG_SYSROOT_DIR=$(STAGING_DIR) \
> +	PKG_CONFIG_LIBDIR=$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig
> 

Andreas, all,

I attached 2 additional patches, that fix compile issue on x86 platform 
(see 
http://lists.busybox.net/pipermail/buildroot/2020-June/285123.html). I 
based my work on top of 2020.05 tag, plus:

- [v6,19/28] core/pkg-infra: Add per-package support in qmake infra 
(https://patchwork.ozlabs.org/project/buildroot/patch/20200217212350.29750-20-anaumann at ultratronik.de/)
- [v6,20/28] qt5: Fix pkgconfig search path for per-package 
infrastructure 
(https://patchwork.ozlabs.org/project/buildroot/patch/20200217212350.29750-21-anaumann at ultratronik.de/)

Description of my patches:

1. The first one is fixing the absolute path added in .pri and .pc files 
when building qt5base. When using sysroot, thos abolute path are 
breaking the compilation because they are pointing to directories 
outside the sysroot.

2. The second one is fixing .cmake files that also contains absolute 
paths after qt5base installation

I'm now able to use full parallel build with per-package with Qt5.

Thank you for your hard work Andreas,

BR,
Louis-Paul CORDIER
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-core-pkg-infra-Fix-pkg-config-and-.pri-absolute-path.patch
Type: text/x-patch
Size: 1889 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200619/9c71f155/attachment.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0002-package-qt5base-fix-absolute-path-generated-in-.cmak.patch
Type: text/x-patch
Size: 1085 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200619/9c71f155/attachment-0001.bin>
