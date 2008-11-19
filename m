From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Wed, 19 Nov 2008 02:44:44 +0100
Subject: [Buildroot] [PATCH 0/7] add Phonon support to qtopia4
Message-ID: <200811190244.44817.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series adds Phonon configuration to qtopia4 and its required
packages.

Phonon is the multimedia API from KDE 4 which has been integrated into Qt 4.4.
For playback under Linux the GStreamer multimedia framework is used.

GStreamer plugins can be selected or disabled from Kconfig. This config support
is available for all dependency-less plugins and for plugins with external
dependencies that I have tested. Some plugins are disabled, because they caused
configure/compile problems for me. The rest is automatically handled by
configure for now. 

I've successful tested audio and video playback on i386 (OSS) and avr32
(at32_abdac OSS driver).
However with avr32 there were some problems. I got the error "Could not
get/set settings from/to resource" which has been caused by the oss plugin and
can be traced back to gst-plugins-good-0.10.11/sys/oss/gstosssink.c:
I had to remove the following line calling an ioctl()
    SET_PARAM (oss, SNDCTL_DSP_SETFRAGMENT, tmp, "SETFRAGMENT");
to be able to hear sound and play videos.

I use Atmel's Buildroot for avr32 development. There the gstreamer plugins
weren't installed into $(TARGET_DIR)/usr/lib/gstreamer-0.10/. Using the uClibc
Buildroot with i386 it worked. I don't know whether the problem is caused by
the old Atmel Buildroot or the other architecture and I haven't yet looked
into it.

In gst-plugins-base/configure there are several places where
/usr/include/gstreamer-0.10/gst/gstconfig.h is grepped for configuration
instead of $STAGING_DIR/usr/include/gstreamer-0.10/gst/gstconfig.h. The path
is evaluated in the configure script by 
  GST_CONFIGPATH=`$PKG_CONFIG --variable=includedir gstreamer-0.10`"/gst/gstconfig.h"
So what should be done here to get the correct path?

For anyone interested in testing it, here are some simple programs:

1) Play the sine tone, for more info see the GStreamer FAQ/Doc

$ gst-launch audiotestsrc ! audioconvert ! audioresample ! osssink


2) Sound with Phonon, usage: ./phonon_sound -qws soundfile.{ogg,mp3,wav}

#include <QtGui>
#include <phonon>

int main(int argc, char *argv[])
{
	QApplication app(argc, argv);

	Phonon::MediaObject *music =
		Phonon::createPlayer(Phonon::MusicCategory,
				Phonon::MediaSource(argv[1]));
	music->play();

	return app.exec();
}


3) Video with Phonon, usage: ./phonon_video -qws videofile.{ogg,avi}

#include <QtGui>
#include <phonon>

int main(int argc, char *argv[])
{
	QApplication app(argc, argv);

	QWidget *win = new QWidget;
	win->setFixedSize(320, 240);

	Phonon::VideoPlayer *player =
		new Phonon::VideoPlayer(Phonon::VideoCategory, win);
	player->play(Phonon::MediaSource(argv[1]));

	win->show();

	return app.exec();
}


2+3) qmake project file

TEMPLATE = app
TARGET = 
DEPENDPATH += .
INCLUDEPATH += .

QT += phonon

# Input
SOURCES += main.cpp



Markus Heidelberg (7):
  package: add liboil package
  package/multimedia: add libtheora package
  package/multimedia: add gstreamer package
  package/multimedia: add gst-plugins-base package
  package/multimedia: add gst-plugins-good package
  package/multimedia: add gst-plugins-ugly package
  qtopia4: add Phonon support

 package/Config.in                                  |    1 +
 package/liboil/Config.in                           |    6 +
 package/liboil/liboil.mk                           |   34 +++
 package/multimedia/Config.in                       |    5 +
 package/multimedia/gst-plugins-base/Config.in      |   81 +++++++
 ...ins-base-0.10.21-build_fix_missing_gtkdoc.patch |   31 +++
 .../gst-plugins-base/gst-plugins-base.mk           |  137 +++++++++++
 package/multimedia/gst-plugins-good/Config.in      |  122 ++++++++++
 .../gst-plugins-good/gst-plugins-good.mk           |  242 ++++++++++++++++++++
 package/multimedia/gst-plugins-ugly/Config.in      |   50 ++++
 .../gst-plugins-ugly/gst-plugins-ugly.mk           |   81 +++++++
 package/multimedia/gstreamer/Config.in             |    9 +
 ...streamer-0.10.21-build_fix_missing_gtkdoc.patch |   43 ++++
 package/multimedia/gstreamer/gstreamer.mk          |   35 +++
 package/multimedia/libtheora/Config.in             |   10 +
 package/multimedia/libtheora/libtheora.mk          |   21 ++
 package/qtopia4/Config.in                          |    9 +
 package/qtopia4/qtopia4.mk                         |   16 ++
 18 files changed, 933 insertions(+), 0 deletions(-)
 create mode 100644 package/liboil/Config.in
 create mode 100644 package/liboil/liboil.mk
 create mode 100644 package/multimedia/gst-plugins-base/Config.in
 create mode 100644 package/multimedia/gst-plugins-base/gst-plugins-base-0.10.21-build_fix_missing_gtkdoc.patch
 create mode 100644 package/multimedia/gst-plugins-base/gst-plugins-base.mk
 create mode 100644 package/multimedia/gst-plugins-good/Config.in
 create mode 100644 package/multimedia/gst-plugins-good/gst-plugins-good.mk
 create mode 100644 package/multimedia/gst-plugins-ugly/Config.in
 create mode 100644 package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
 create mode 100644 package/multimedia/gstreamer/Config.in
 create mode 100644 package/multimedia/gstreamer/gstreamer-0.10.21-build_fix_missing_gtkdoc.patch
 create mode 100644 package/multimedia/gstreamer/gstreamer.mk
 create mode 100644 package/multimedia/libtheora/Config.in
 create mode 100644 package/multimedia/libtheora/libtheora.mk
