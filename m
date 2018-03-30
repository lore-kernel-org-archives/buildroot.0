From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Fri, 30 Mar 2018 09:19:44 +0200
Subject: [Buildroot] RFC: gst1-plugins-good 1.14: enable-qt config option
In-Reply-To: <f148b224-5d1d-de86-91fe-13379549cd6a@ginzinger.com>
References: <484a4f60-327f-12a8-e90e-206c81d60253@ginzinger.com>
 <f148b224-5d1d-de86-91fe-13379549cd6a@ginzinger.com>
Message-ID: <70df7422-a3a0-e653-b459-352d862041eb@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-03-28 16:22, Martin Kepplinger wrote:
> TL;DR so far: How to configure in gstreamer-gl-1.0 ? see below.
> 

Let's recap; my example goal here is to run this app:
https://cgit.freedesktop.org/gstreamer/gst-examples/tree/playback/player/qt
on imx6 and play an h264 full HD video with it.

The starting-point is a configuration where "gst-launch-1.0" works using
"playbin" for full HD videos, using V4L2 (vpu, dmabuf, ...) and kmssink.
Here we go:


(The implementation of --enable-qt for gst-plugins-good is ignored for
now, see previous emails)


I have a configuration that builds "qmlgl" now:

BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL=y
BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL=y

BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API=y
BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLES2=y

BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_PLATFORM=y
BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL=y

BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_WINDOW=y
BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_X11=y

BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_DEINTERLACE=y

so what's weird is that, via gst-plugins-base we get a dependency of Qt
on X11 (!?). That's not buildroot's fault. It's in gst-plugins-base's m4
scripts!


So far so good. The gst example player app (using GST_DEBUG=3) currently
fails with


# GST_DEBUG=3 play tears_of_steel_1080p.mov
QStandardPaths: XDG_RUNTIME_DIR not set, defaulting to '/tmp/runtime-root'
No modes available for output "VGA1"
0:00:00.692867667  1227  0x1593e30 WARN     GST_ELEMENT_FACTORY
gstelementfactory.c:456:gst_element_factory_make: no such element
factory "scaletempo"!

** (play:1227): WARNING **: GstPlayer: scaletempo element not available.
Audio pitch will not be preserved during trick modes
file:///usr/qml/QtQuick/Dialogs/DefaultFileDialog.qml:210:25: QML
ListView: Binding loop detected for property "model"
0:00:01.843304001  1227  0x1593e30 WARN                glwindow
gstglwindow.c:293:gst_gl_window_new: Could not create window. user
specified (null), creating dummy window
0:00:01.844303667  1227 0xaff02c00 WARN               glcontext
gstglcontext.c:1244:gst_gl_context_create_thread:<glcontextegl0> Failed
to create context
0:00:01.844429667  1227  0x1593e30 ERROR             qtglwidget
qtitem.cc:350:initWinSys: Failed to initialize egl: EGL_NOT_INITIALIZED
0:00:01.844523334  1227  0x1593e30 WARN                  qtsink
gstqtsink.cc:309:gst_qt_sink_change_state:<sink> error: Could not
initialize window system
0:00:01.844993667  1227  0x1593e30 ERROR                playbin
gstplaybin2.c:5444:activate_group:<playbin> failed to activate sinks
0:00:01.845117334  1227  0x1593e30 ERROR             gst-player
gstplayer.c:1051:emit_error:<player0> Error: Failed to play
(gst-player-error-quark, 0)


what's wrong with EGL here?

thanks

                                martin
