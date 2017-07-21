From: Glenn Coombs <glenn.coombs@gmail.com>
Date: Fri, 21 Jul 2017 15:39:35 +0800
Subject: [Buildroot] How to build the qt plugin in gst1-plugins-bad ?
In-Reply-To: <20170719120113.62df8762@windsurf>
References: <CADujc4q8d1AMFmvoD_62qnOkNSntuCCGCe4+Pkatp4P382srfg@mail.gmail.com>
 <20170719113553.6669def3@windsurf>
 <CADujc4o_1XZLQymNx3fQk5n9FOhg=9xNKw5U2GPSsGBCxHyhSA@mail.gmail.com>
 <20170719120113.62df8762@windsurf>
Message-ID: <CADujc4oPL-onF043v64kvhyUP7SUxEu6Jc6ArGg_PKj6ohTD_Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for all your help.  I have now succeeded in building this plugin.
After upgrading buildroot to the latest master I had to change the
following settings:

* set the "Default graphical platform" to "eglfs" in section target
packages->Graphic libraries and applications/Qt5
* enable "opengl" in section target packages->Audio and video
applications->gstreamer 1.1->gst1-plugins-bad
* enable "qt" in section target packages->Audio and video
applications->gstreamer 1.1->gst1-plugins-bad

The last of these required me to modify the Config.in and
gst1-plugins-bad.mk files in the gst1-plugins-bad directory to create the
new "qt" setting.  The diff for these changes is as follows:

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in
b/package/gstreamer1/gst1-plugins-bad/Config.in
index 0c97899..22aacb3 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -349,6 +349,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_PNM
        help
          PNM plugin

+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_QT
+       bool "qt"
+       help
+         Qt plugin
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RAWPARSE
        bool "rawparse"
        help
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 2e9e6f1..1caca13 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -58,8 +58,7 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
        --disable-schro \
        --disable-zbar \
        --disable-spandsp \
-       --disable-gtk3 \
-       --disable-qt
+       --disable-gtk3

 GST1_PLUGINS_BAD_DEPENDENCIES = gst1-plugins-base gstreamer1

@@ -403,6 +402,12 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-pnm
 endif

+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_QT),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-qt
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-qt
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RAWPARSE),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-rawparse
 else

Hopefully those changes can be incorporated into buildroot so that other
people will be able to make use of this package.

--
Glenn

On 19 July 2017 at 18:01, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Wed, 19 Jul 2017 17:55:54 +0800, Glenn Coombs wrote:
>
> > Thanks for the debug.  Is that section with HAVE_WINDOW_VIV_FB from the
> > build/gst1-plugins-bad-1.10.4/configure.ac file?  I have this section in
> > that file at line 1059:
> >
> >       if test "x$NEED_EGL" != "xno"; then
> >         if test "x$HAVE_WINDOW_WAYLAND" = "xyes" -o "x$HAVE_WINDOW_X11" =
> > "xyes" -o "x$HAVE_WINDOW_DISPMANX" = "xyes"; then
> >           GL_LIBS="$GL_LIBS -lEGL $EGL_LIBS"
> >           GL_CFLAGS="$GL_CFLAGS $EGL_CFLAGS"
> >           USE_EGL=yes
> >         fi
> >       fi
> >
> > As you can see I am missing the HAVE_WINDOW_VIV_FB bit.  Looking at the
> > output of dmesg on my target system I can see this version: Buildroot
> > 2017.05-00055-g338f004.  Presumably I need an even newer version of
> > buildroot than I already have ?
>
> gst1-plugins-bad has been upgraded in commit
> 38e95aa170360850d68459516965b98cc15f3f49, which is *after* the commit
> you're currently based on. Your commit is 55 commits after 2017.05,
> while the gst1-plugins-bad has been done 807 commits after 2017.05.
>
> So yes: update your Buildroot to the latest master! :-)
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170721/b7ac5d9d/attachment.html>
