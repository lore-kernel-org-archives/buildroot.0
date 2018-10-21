From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 22 Oct 2018 00:18:24 +0100
Subject: [Buildroot] [PATCH v3] qt5base: Qt KMS support does not depend on
 opengl
In-Reply-To: <1518540366-13393-1-git-send-email-joshua.henderson@microchip.com>
References: <1518540366-13393-1-git-send-email-joshua.henderson@microchip.com>
Message-ID: <2357aab6-f2e6-54d4-0e37-63955864e94e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 13/02/2018 16:46, Joshua Henderson wrote:
> Qt KMS support should not explicitly depend on the availability of opengl.
> Don't explicitly disable KMS if opengl is not available and fallback to
> detecting if libdrm is available before disabling kms.
>
> The scenario where this is necessary involves using the Qt linuxfb backend
> "dumb buffer" support via the DRM API. This is new in Qt 5.9 [1] and only
> requires KMS, but not opengl.

?This sounds like we should handle the Qt 5.6 case specially.

?However, on Qt 5.6, it builds fine with the -kms option, it just ends up not
being used. That means we have a redundant dependency on libdrm, but that
doesn't matter that much. Handling the Qt 5.6 case differently would make the
code quite a bit more complicated.

?Therefore, I explained the above in the commit log an applied to master, thanks.

?Sorry it took so long.


?Regards,
?Arnout


>
> [1] http://doc.qt.io/qt-5/embedded-linux.html#linuxfb
>
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Julien Corjon <corjon.j@ecagroup.com>
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
>
> ---
>
> v3:
> - Reorganize libdrm/egl make condition to be more clear.
>
> v2:
> - If libdrm is configured, make it an explicit dependency.
> ---
> package/qt5/qt5base/qt5base.mk | 11 +++++++++--
> 1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index b3f9c79..644852d 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -35,12 +35,19 @@ endif
> QT5BASE_CONFIGURE_OPTS += $(call qstrip,$(BR2_PACKAGE_QT5BASE_CUSTOM_CONF_OPTS))
> +ifeq ($(BR2_PACKAGE_LIBDRM),y)
> +QT5BASE_CONFIGURE_OPTS += -kms
> +QT5BASE_DEPENDENCIES += libdrm
> +else
> +QT5BASE_CONFIGURE_OPTS += -no-kms
> +endif
> +
> # Uses libgbm from mesa3d
> ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
> -QT5BASE_CONFIGURE_OPTS += -kms -gbm
> +QT5BASE_CONFIGURE_OPTS += -gbm
> QT5BASE_DEPENDENCIES += mesa3d
> else
> -QT5BASE_CONFIGURE_OPTS += -no-kms
> +QT5BASE_CONFIGURE_OPTS += -no-gbm
> endif
> ifeq ($(BR2_ENABLE_DEBUG),y)
