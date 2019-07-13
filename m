From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Jul 2019 22:47:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/qt5wayland: examples needs
 opengl with qt latest
In-Reply-To: <20190602200734.29324-1-fontaine.fabrice@gmail.com>
References: <20190602200734.29324-1-fontaine.fabrice@gmail.com>
Message-ID: <698c9bc8-b31d-98ba-5bef-6f2b8c12faf0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/06/2019 22:07, Fabrice Fontaine wrote:
> WIth Qt latest, if opengl is not enabled, qt5wayland examples won't be
> built:
> make[3]: Entering directory `/home/dawncrow/buildroot-test/scripts/instance-0/output/build/qt5wayland-5.12.2/examples/wayland'
> Some of the required modules (qtConfig(opengl)) are not available.
> Skipped.
> make[3]: Leaving directory `/home/dawncrow/buildroot-test/scripts/instance-0/output/build/qt5wayland-5.12.2/examples/wayland'
> 
> And build will fail on:
> cp: cannot stat '/home/dawncrow/buildroot-test/scripts/instance-0/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/lib/qt/examples/wayland': No such file or directory
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/902322ca156c14044d4ce53ab2c77f30dd854c98
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/qt5/qt5wayland/qt5wayland.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
> index 449640c881..0bda596f3b 100644
> --- a/package/qt5/qt5wayland/qt5wayland.mk
> +++ b/package/qt5/qt5wayland/qt5wayland.mk
> @@ -60,10 +60,18 @@ endif
>  endif
>  
>  ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
> +ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
> +ifeq ($(BR2_PACKAGE_QT5BASE_OPENGL),y)

 There is a better way to write this condition so you don't need to repeat the
command. However, I don't want to think about it now, and the qt5 versions
distiction is going to go away soon. Therefore, I've applied to master as is,
thanks.

 Regards,
 Arnout

>  define QT5WAYLAND_INSTALL_TARGET_EXAMPLES
>  	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/wayland $(TARGET_DIR)/usr/lib/qt/examples/
>  endef
>  endif
> +else
> +define QT5WAYLAND_INSTALL_TARGET_EXAMPLES
> +	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/wayland $(TARGET_DIR)/usr/lib/qt/examples/
> +endef
> +endif
> +endif
>  
>  define QT5WAYLAND_INSTALL_TARGET_CMDS
>  	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WaylandClient.so* $(TARGET_DIR)/usr/lib
> 
