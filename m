From: Vered Kalef <vered.kalef@gmail.com>
Date: Mon, 8 Jul 2019 15:30:01 +0300
Subject: [Buildroot] How do I enable webrtc as part of external
 gstreamer, in buildroot
In-Reply-To: <20190707204022.65affaec@gmx.net>
References: <CADNjvP-VYgO7ctGsOjZxudkA7k6PzT4FNt+JRACmUV6=bh_E=Q@mail.gmail.com>
 <20190704202528.63f7d667@gmx.net>
 <CADNjvP_HU1+D+LXwVtVosxpvDiUGZC=uEUCET10RpiG+oVn63Q@mail.gmail.com>
 <20190707204022.65affaec@gmx.net>
Message-ID: <CADNjvP8jLnPK7DvDtpacTCn2g=DowwPr-C+KX7649aenVutaDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 7, 2019 at 9:40 PM Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Vered,
>
> please keep buildroot at busybox.net in CC
>
> On Sun, 7 Jul 2019 11:05:34 +0300, Vered Kalef <vered.kalef@gmail.com>
> wrote:
>
> > On Thu, Jul 4, 2019 at 9:25 PM Peter Seiderer <ps.report@gmx.net> wrote:
> >
> > > Hello Vered,
> > >
> > > On Thu, 4 Jul 2019 15:38:59 +0300, Vered Kalef <vered.kalef@gmail.com>
> > > wrote:
> > >
> > > > Hi all,
> > > > I'm trying to install external gstreamer with webrtc enabled on
> > > buildroot.
> > >
> > > What do your mean with 'external'? Why 'external'?
> > >
> >
> > I use buildroot 14.0. It doesn't contain webrtc build in and I can't
> update
> > to a later version so I added as an external the gstreamer with webrtc
> > enabled.
>
> 14.0 does not make sense, the buildroot versions are
> <year>.<month>.<release>,
> did you mean 2014.02, 2014.05, 2014.8 or 2014.11?
>
The version is 2018.02

>
> > I renamed the packaged so it won't conflict with the one built in within
> > buildroot.
> >
> > >
> > > > It seems this option is missing within the buildroot.
> > >
> > > Which option? There is definitely an GStreamer webrtc option (since
> > > 2019.05), see [1]...
> > >
> > I don't see the option webrtc enabled, only webrtc-audio-processing,
> which
> > is different altogether.
> >
> > >
> > > Which Buildroot version do you use?
> > >
> > 14.0
>
> I saw the option of webrtc, as you've mentioned, but, I can't upgrade to
gstreamer version 1.16 .


> >
> > >
> > > > I've configured the mk file and the Config.in file.
> > > > After installation when I check gst-inspect webrtcbin, I get -
> > > >
> > > > No such element or plugin ?webrtcbin'
> > > > What am I missing?
> > >
> > > Take a look at the gst1-plugins-bad configure output (or
> > > build/gst1-plugins-bad-<version>/config.log for a hint
> > > what is missing (look for webrtc entries)....
>
This file made the difference. It seems the problem is an old version of
libnice, it should be greater than 0.1.14, so, I think I'll upgrade to
buildroot 2018.11, which holds libnice 0.1.14
and create the external gstreamer with webrtc enabled as you've done in
version 2019.5.
In your opinion will it do the work?



> Please take a look at the build/gst1-plugins-bad-<version>/config.log, is
> webrtc enabled
> e.g.:
>
> configure:91279: *** checking feature: WebRTC ***
> configure:91283: *** for plug-ins: webrtc ***
> configure:91327: checking for NICE
> configure:91335: $PKG_CONFIG --exists --print-errors "nice >= 0.1.14"
> configure:91338: $? = 0
> configure:91353: $PKG_CONFIG --exists --print-errors "nice >= 0.1.14"
> configure:91356: $? = 0
> configure:91396: result: yes
> configure:91412: *** These plugins will be built: webrtc
>
> > >
> > > Do you open the dump and view the log file or is it additional log
> file?
> > Within the dump I see  -
> > 0:00:51.704162800  1051 0x7fff64004400 LOG      GST_ELEMENT_FACTORY
> > gstelementfactory.c:438:gst_element_factory_make: gstelementfactory: make
> > "webrtcbin" "(NULL)"
> > 0:00:51.704206500  1051 0x7fff64004400 LOG      GST_ELEMENT_FACTORY
> > gstelementfactory.c:142:gst_element_factory_find: no such element factory
> > "webrtcbin"
> > 0:00:51.704213200  1051 0x7fff64004400 WARN     GST_ELEMENT_FACTORY
> > gstelementfactory.c:456:gst_element_factory_make: no such element factory
> > "webrtcbin"!
>
> Nothing new, gstreamer is unable to find an element named webrtcbin,
> make sure the plugin libgstwebrtc.so is build and installed (at the right
> location and with the right dependencies) at the target...
>
> Regards,
> Peter
>
> >
> > > gst1-plugins-bad/Config.in config
> > > > BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC bool "webrtc" depends on
> > > > !BR2_STATIC_LIBS # libnice -> gnutls select
> > > BR2_PACKAGE_GST1_PLUGINS_BASE #
> > > > libgstsdp select BR2_PACKAGE_LIBNICE help WebRTC plugins (webrtcbin
> - a
> > > bin
> > > > for webrtc connections comment "webrtc needs a toolchain w/ dynamic
> > > > library" depends on BR2_STATIC_LIBS gst1-plugins-bad/
> gst1-plugins-bad.mk
> > > > ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC),y)
> > > > GST1_PLUGINS_BAD_CONF_OPTS += --enable-webrtc
> > > GST1_PLUGINS_BAD_DEPENDENCIES
> > > > += libnice GST1_PLUGINS_BAD_DEPENDENCIES += gst1-plugins-base
> libnice
> > > else
> > > > GST1_PLUGINS_BAD_CONF_OPTS += --disable-webrtc endif
> > > >
> > >
> > > Mind to share your config and/or defconfig file?
> > >
> > Added.
> >
> > >
> > > Regards,
> > > Peter
> > >
> > > [1]
> > >
> https://git.buildroot.net/buildroot/tree/package/gstreamer1/gst1-plugins-bad/Config.in#n566
> > >
> > > > Regards,
> > > > Vered
> > >
> > > Regards,
> > Vered
>
> Any other ideas?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190708/8f0f81f9/attachment.html>
