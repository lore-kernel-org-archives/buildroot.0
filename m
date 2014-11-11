From: Jeff Horn <outforaride@gmail.com>
Date: Tue, 11 Nov 2014 13:26:15 -0800
Subject: [Buildroot] host ldconfig package
In-Reply-To: <CAM7q1LmUEctUgvix+28NX=qeHfPVYM_XC4WFyo_=LA3uVOieqw@mail.gmail.com>
References: <CAM7q1LnRANa1wFbb=5o8yuyYyJrQyU_CUDqTaNwQ7tC7905L-A@mail.gmail.com>
 <1456757.71s6JAxXJf@aquila>
 <CAM7q1LnW3-XFTqh-yWBZTb9O6XEy_CKxtjZhq62GYPmrd-a-PA@mail.gmail.com>
 <CADCpmyNMs7yTdGEzurOEvpHHSPJsDVHCEv6+dMT3s1ez9tR2Pg@mail.gmail.com>
 <CAM7q1LmUEctUgvix+28NX=qeHfPVYM_XC4WFyo_=LA3uVOieqw@mail.gmail.com>
Message-ID: <CAM7q1LnW4voHzfMSNZhpQe5Lf_-2LnihOCBd6ZpsXEAvonc4cw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, I have the fsl-gst-plugins working without the need for a hacked
version of ldconfig. I modified libfslcodec and libfslparser to run a
post install and move the libs from /usr/lib/imx-mm to /usr/lib.

I also run a post install for the gst-fsl-plugins to fix the
/usr/share/*.cf paths. There has to be a way to tell configure the
correct path but I am no autotools guru.

With this patch my Qt5 video.qml file comes right up.

Jeff

diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
index 8d8b8b4..947dfb6 100644
--- a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
+++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
@@ -26,6 +26,7 @@ GST_FSL_PLUGINS_CONF_ENV = \
 GST_FSL_PLUGINS_DEPENDENCIES += linux
 GST_FSL_PLUGINS_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -idirafter
$(LINUX_DIR)/include/uapi"

+
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 GST_FSL_PLUGINS_DEPENDENCIES += xlib_libX11
 GST_FSL_PLUGINS_CONF_OPTS += --enable-x11
@@ -40,4 +41,12 @@ endef

 GST_FSL_PLUGINS_POST_PATCH_HOOKS += GST_FSL_PLUGINS_PATCH_M4

+# Fix *.cf paths
+define GST_FSL_PLUGINS_CF_FIXUP
+ find $(TARGET_DIR)/usr/share -maxdepth 1 -type f \
+ -name *.cf -exec sed -i 's|$(STAGING_DIR)||g' {} \;
+endef
+
+GST_FSL_PLUGINS_POST_INSTALL_TARGET_HOOKS += GST_FSL_PLUGINS_CF_FIXUP
+
 $(eval $(autotools-package))
diff --git a/package/libfslcodec/libfslcodec.mk
b/package/libfslcodec/libfslcodec.mk
index 1a364bb..103f1e6 100644
--- a/package/libfslcodec/libfslcodec.mk
+++ b/package/libfslcodec/libfslcodec.mk
@@ -16,6 +16,9 @@ LIBFSLCODEC_REDISTRIBUTE = NO

 LIBFSLCODEC_INSTALL_STAGING = YES

+# only enable for hard float on the i.mx6q
+LIBFSLCODEC_CONF_OPTS = --enable-fhw --enable-vpu
+
 # The archive is a shell-self-extractor of a bzipped tar. It happens
 # to extract in the correct directory (libfslcodec-x.y.z)
 # The --force makes sure it doesn't fail if the source dir already exists.
@@ -35,5 +38,11 @@ endef

 # FIXME The Makefile installs both the arm9 and arm11 versions of the
 # libraries, but we only need one of them.
+define LIBFSLCODEC_POST_INSTALL_FIXUP
+ find $(TARGET_DIR)/usr/lib/imx-mm -mindepth 2 -maxdepth 2 -not -type d \
+ -exec cp {} $(TARGET_DIR)/usr/lib \;
+endef
+
+LIBFSLCODEC_POST_INSTALL_TARGET_HOOKS += LIBFSLCODEC_POST_INSTALL_FIXUP

 $(eval $(autotools-package))
diff --git a/package/libfslparser/libfslparser.mk
b/package/libfslparser/libfslparser.mk
index d52b151..0882a67 100644
--- a/package/libfslparser/libfslparser.mk
+++ b/package/libfslparser/libfslparser.mk
@@ -16,6 +16,9 @@ LIBFSLPARSER_REDISTRIBUTE = NO

 LIBFSLPARSER_INSTALL_STAGING = YES

+# only enable for hard float on the i.mx6q
+LIBFSLCODEC_CONF_OPTS = --enable-fhw --enable-vpu
+
 # The archive is a shell-self-extractor of a bzipped tar. It happens
 # to extract in the correct directory (libfslparser-x.y.z)
 # The --force makes sure it doesn't fail if the source dir already exists.
@@ -39,4 +42,13 @@ endef
 # without AUTORECONF, configure fails to find install-sh.
 LIBFSLPARSER_AUTORECONF = YES

+# FIXME The Makefile installs both the arm9 and arm11 versions of the
+# libraries, but we only need one of the
+define LIBFSLPARSER_POST_INSTALL_FIXUP
+ find $(TARGET_DIR)/usr/lib/imx-mm -mindepth 2 -maxdepth 2 -not -type d \
+ -exec cp {} $(TARGET_DIR)/usr/lib \;
+endef
+
+LIBFSLPARSER_POST_INSTALL_TARGET_HOOKS += LIBFSLPARSER_POST_INSTALL_FIXUP
+
 $(eval $(autotools-package))

On Mon, Nov 10, 2014 at 4:04 PM, Jeff Horn <outforaride@gmail.com> wrote:
> Gary, All
>
> On Sat, Nov 8, 2014 at 1:56 PM, Gary Bisson <bisson.gary@gmail.com> wrote:
>> Jeff, Jerome, All,
>>
>> Jeff, could you confirm everything works fine once the library paths have
>> been added to ld.so.conf?
>
> I managed to get Qt5 video playback working! However, the only way I
> could make it work was to run my hacked version of ldconfig and I had
> to edit the /usr/share/*.cf as the path referenced my host build
> sysroot and not the target sysroot. With those two modifications the
> Qt5 Qml video element works fine. In addition, Qt 5.3 appears to take
> advantage of hardware acceleration.
>
> Note that adding /usr/lib/imx-mm to ld.so.conf alone did not resolve
> the missing plugin issue. I'm not sure what I am missing or doing
> wrong. I might try and modify the gst-fsl-plugins.mk file to move the
> libs from /usr/lib/imx-mm to /usr/lib and that will eliminate a need
> for both ldconfig and ld.so.conf.
>
> I'll keep working on this but things look promising. I'm very new to
> buildroot so I'll double check that I am not missing something in the
> build.
>
> Thanks,
> Jeff
>
>>
>> Let me know if I can be of any help either writing the fix or testing it.
>>
>> Thanks,
>> Gary
