From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 17 Jul 2019 00:13:39 +0200
Subject: [Buildroot] Installed external gstreamer,
 enabled WebRTC and installed external libnice plugins to buildroot, however,
 libnice is missing
In-Reply-To: <CADNjvP-y6qyxE5bLFer-n-cNVVCDEv+WnoPX0yH8Cbg_bVba=Q@mail.gmail.com>
References: <CADNjvP9-5R2z+aUN7xKARboNkiReWVpZ7tNFg+xj81DObTE6fQ@mail.gmail.com>
 <76760dd0-ddab-6599-f60d-2f564b74e6ad@mind.be>
 <CADNjvP-y6qyxE5bLFer-n-cNVVCDEv+WnoPX0yH8Cbg_bVba=Q@mail.gmail.com>
Message-ID: <20190717001339.2ec38c30@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vered,

On Tue, 16 Jul 2019 16:30:02 +0300, Vered Kalef <vered.kalef@gmail.com> wrote:

> Hi
> upgraded buildroot version to 2018.05.3, so, I'll have libnice 1.14 built
> in .
> I enabled it.
> Restored the connection between webrtc and original libnice.
> I saw that I should have the plugins nicesrc and nicesink (the plugins are
> part of libnice associated with gstreamer).
> Still I get that libnice is missing in the installation - libnice elements
> are not available
> I'm still missing an installation.

As already said in [1] you need the following patches (not included in 2018.5,
but on master or 2019.05):

	# libnice: add gstreamer support [2]
	$ git cherry-pick 689c083f571e0c88463a451cb4e64c1470b67afb

	# package/gst1-plugins-bad: add webrtc option [3]
	$ git cherry-pick baffecda1678d68ab6d16514ae1903d2d4dc1e5d

Regards,
Peter

[1] http://lists.busybox.net/pipermail/buildroot/2019-July/254128.html
[2] https://git.buildroot.net/buildroot/commit/?id=689c083f571e0c88463a451cb4e64c1470b67afb
[3] https://git.buildroot.net/buildroot/commit/?id=baffecda1678d68ab6d16514ae1903d2d4dc1e5d

> Regards,
> Vered
>
> On Sun, Jul 14, 2019 at 9:55 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
> >
> >
> > On 14/07/2019 12:10, Vered Kalef wrote:
> > > Hi all,
> > > I'm working with buildroot 18.02.
> > > I've installed External gstreamer version 14.0.
> > > I've managed to update the plugins-bad, to hold webrtc option.
> > > For the webrtc I had to update libnice version, so I've installed it as
> > external
> > > libnice 0.1.14.
> > > Now -
> > > gst-inspect-1.0 webrtc
> > > shows that webrtc exists!
> > >
> > > Should it work as well:
> > > gst-inspect-1.0 libnice
> >
> >  I don't think libnice itself is a gstreamer plugin, so this wouldn't
> > work. I
> > might be wrong though.
> >
> >
> > > Is the installation of libnice as external is problematic?
> > > I've called the external plugin CUSTOM_LIBNICE and referred to it from
> > > custom-gst1-plugins-bad.mk <http://custom-gst1-plugins-bad.mk> -
> > >
> > > ifeq ($(BR2_PACKAGE_CUSTOM_GST1_PLUGINS_BAD_PLUGIN_WEBRTC),y)
> > > CUSTOM_GST1_PLUGINS_BAD_CONF_OPTS += --enable-webrtc
> > > CUSTOM_GST1_PLUGINS_BAD_DEPENDENCIES += custom-gst1-plugins-base
> > CUSTOM_LIBNICE
> >
> >  I guess it is custom-libnice here, not CUSTOM_LIBNICE?
> >
> >  Can you check what the build log says about libnice?
> >
> >  Can you check if libnice is installed on your target?
> >
> >  Regards,
> >  Arnout
> >
> > > else
> > > CUSTOM_GST1_PLUGINS_BAD_CONF_OPTS += --disable-webrtc
> > > endif
> > >
> > > *The errors I got - *
> > > 0:00:05.765174600 17318 0x7fff64004400 WARN               webrtcbin
> > > gstwebrtcbin.c:2991:gst_webrtc_bin_request_new_pad:<webrtcbin0> error:
> > libnice
> > > elements are not available
> > > 0:00:05.765219000 17318 0x7fff64004400 LOG              GST_MESSAGE
> > > gstmessage.c:301:gst_message_new_custom: source webrtcbin0: creating new
> > message
> > > 0x7fff640bf2c0 error
> > > 0:00:05.765249100 17318 0x7fff64004400 WARN               structure
> > > gststructure.c:1832:priv_gst_structure_append_to_gstring: No value
> > transform to
> > > serialize field 'gerror' of type 'GError'
> > > 0:00:05.765239500 17318 0x7fff64004400 DEBUG                GST_BUS
> > > gstbus.c:318:gst_bus_post:<bus0> [msg 0x7fff640bf2c0] posting on bus
> > error
> > > message: 0x7fff640bf2c0, time 99:99:99.999999999, seq-num 65, element
> > > 'webrtcbin0', GstMessageError, gerror=(GError)NULL,
> > > debug=(string)"gstwebrtcbin.c\(2991\):\ gst_webrtc_bin_request_new_pad\
> > \(\):\
> > > /GstPipeline:pipeline0/GstWebRTCBin:webrtcbin0:\012libnice\ elements\
> > are\ not\
> > > available";
> > > 0:00:05.765261300 17318 0x7fff64004400 DEBUG                    bin
> > > gstbin.c:3715:gst_bin_handle_message_func:<pipeline0> [msg
> > 0x7fff640bf2c0]
> > > handling child webrtcbin0 message of type error
> > > 0:00:05.765283100 17318 0x7fff64004400 WARN               structure
> > > gststructure.c:1832:priv_gst_structure_append_to_gstring: No value
> > transform to
> > > serialize field 'gerror' of type 'GError'
> > > 0:00:05.765281100 17318 0x7fff64004400 DEBUG                GST_BUS
> > > gstbus.c:318:gst_bus_post:<bus1> [msg 0x7fff640bf2c0] posting on bus
> > error
> > > message: 0x7fff640bf2c0, time 99:99:99.999999999, seq-num 65, element
> > > 'webrtcbin0', GstMessageError, gerror=(GError)NULL,
> > > debug=(string)"gstwebrtcbin.c\(2991\):\ gst_webrtc_bin_request_new_pad\
> > \(\):\
> > > /GstPipeline:pipeline0/GstWebRTCBin:webrtcbin0:\012libnice\ elements\
> > are\ not\
> > > available";
> > > 0:00:05.765327400 17318 0x7fff64004400 INFO        GST_ERROR_SYSTEM
> > > gstelement.c:2172:gst_element_message_full_with_details:<webrtcbin0>
> > posted
> > > error message: Your GStreamer installation is missing a plug-in.
> > >
> > > Thanks in advance,
> > > Vered
> > >
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at busybox.net
> > > http://lists.busybox.net/mailman/listinfo/buildroot
> > >
> >
