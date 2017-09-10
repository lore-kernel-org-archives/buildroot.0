From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 10 Sep 2017 23:24:32 +0200
Subject: [Buildroot] [PATCH v3] gst1-plugins-bad: fix build against
 openjpeg 2.2
In-Reply-To: <CAAP7ucJwBX01nGdTWchRESw_5WqoA4TQSSTJk8ERSRPZT-hYDA@mail.gmail.com>
References: <20170908133156.10357-1-ps.report@gmx.net>
 <CAAP7uc+zUqWR8w484d5uOtfCPgrkE7o=vaHHgBw7OSTvL1S5Rg@mail.gmail.com>
 <20170910095931.7ad07fe6@gmx.net>
 <CAAP7ucJwBX01nGdTWchRESw_5WqoA4TQSSTJk8ERSRPZT-hYDA@mail.gmail.com>
Message-ID: <20170910232432.69e3c57b@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Aleksander,

On Sun, 10 Sep 2017 21:25:06 +0200, Aleksander Morgado <aleksander@aleksander.es> wrote:

> Hey Peter,
> 
> Do you have host-gettext explicitly enabled? Could you attach the output of

Tested with your patch applied, my patch applied with the following changes:

--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -15,7 +15,7 @@ GST1_PLUGINS_BAD_LICENSE = LGPL-2.0+, LGPL-2.1+
 
 # patch 0001-openjpeg-Fix-build-against-openjpeg-2.2.patch touches configure.ac
 GST1_PLUGINS_BAD_AUTORECONF = YES
-GST1_PLUGINS_BAD_GETTEXTIZE = YES
+#GST1_PLUGINS_BAD_GETTEXTIZE = YES
 
 GST1_PLUGINS_BAD_CONF_OPTS = \
        --disable-examples \
@@ -65,7 +65,7 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
        --disable-gtk3 \
        --disable-qt
 
-GST1_PLUGINS_BAD_DEPENDENCIES = gst1-plugins-base gstreamer1
+GST1_PLUGINS_BAD_DEPENDENCIES = host-gettext gst1-plugins-base gstreamer1
 
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 # RPI has odd locations for several required headers.


> the make command when rebuilding the package?

Yes, see attachment make-gst1_plugins-bad.log.gz.

Regards,
Peter

> 
> On Sep 10, 2017 09:59, "Peter Seiderer" <ps.report@gmx.net> wrote:
> 
> > Hello Aleksander,
> >
> > On Sat, 9 Sep 2017 22:26:19 +0200, Aleksander Morgado <  
> > aleksander at aleksander.es> wrote:  
> >  
> > > Hey Thomas and Peter,
> > >  
> > > > Changes v2 -> v3:
> > > >   - add _GETTEXTIZE (instead of Makefile.in.in patch, suggested by  
> > Thomas Petazzoni)  
> > > >
> > > > Changes v1 ->v2:
> > > >  - add _AUTORECONF (suggested by Peter Korsgaard)  
> > >
> > > Re-running gettextize just to make autoreconf work is a bit overkill;
> > > gettextize is something that the package maintainer runs to get the
> > > i18n setup ready and among other things it may update gnulib imported
> > > files in unexpected ways. I'd bet that letting just autopoint work as
> > > expected (as a step part of autoreconf) would be way more than enough
> > > here (i.e. no _GETTEXTIZE needed), but that step is currently disabled
> > > in buildroot by default since some years ago.
> > >
> > > See for reference this patch I sent last month, that makes autopoint
> > > work again during autoreconf:
> > > http://lists.busybox.net/pipermail/buildroot/2017-August/200941.html
> > >  
> >
> > Sorry, did a quick test of your patch for the gst1-plugins-bad test
> > case, did not work, I still get the following error message:
> >
> >   *** error: gettext infrastructure mismatch: using a Makefile.in.in from
> > gettext version 0.17 but the autoconf macros are from gettext version 0.19
> >
> > Regards,
> > Peter
> >
> >
> > And the defconfig used:
> >
> > BR2_INIT_NONE=y
> > BR2_SYSTEM_BIN_SH_NONE=y
> > # BR2_PACKAGE_BUSYBOX is not set
> > BR2_PACKAGE_GSTREAMER1=y
> > # BR2_PACKAGE_GSTREAMER1_PARSE is not set
> > # BR2_PACKAGE_GSTREAMER1_GST_DEBUG is not set
> > # BR2_PACKAGE_GSTREAMER1_PLUGIN_REGISTRY is not set
> > # BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS is not set
> > # BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOCONVERT is not set
> > BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORATE=y
> > BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOTESTSRC=y
> > BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ENCODING=y
> > BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_GIO=y
> > # BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PLAYBACK is not set
> > # BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE is not set
> > BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_SUBPARSE=y
> > # BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME is not set
> > BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TREMOR=y
> > BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OPUS=y
> > BR2_PACKAGE_GST1_PLUGINS_BAD=y
> > BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ACCURIP=y
> > BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ADPCMDEC=y
> > BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOFXBAD=y
> > BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BAYER=y
> > BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CAMERABIN2=y
> > BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS=y
> > BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVBSUBOVERLAY=y
> > BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FACEOVERLAY=y
> > BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_INTER=y
> > BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_IVFPARSE=y
> > BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGPSMUX=y
> > BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_PCAPPARSE=y
> > BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_REMOVESILENCE=y
> > BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTMP=y
> > BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SPEED=y
> > BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BZ2=y
> > BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVB=y
> > BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS=y
> > BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIBMMS=y
> > BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MUSEPACK=y
> > BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENJPEG=y
> > BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SHM=y
> > BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBP=y
> > BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP=y
> > BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_X265=y
> > BR2_PACKAGE_JPEG=y
> >  

-------------- next part --------------
A non-text attachment was scrubbed...
Name: make-gst1_plugins-bad.log.gz
Type: application/gzip
Size: 13209 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170910/e295ff19/attachment.bin>
