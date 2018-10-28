From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Oct 2018 08:08:36 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/mjpg-streamer: add optional
 dependency to zeromq
In-Reply-To: <20181025190732.3474-2-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Thu, 25 Oct 2018 21:07:32 +0200")
References: <20181025190732.3474-1-bernd.kuhls@t-online.de>
 <20181025190732.3474-2-bernd.kuhls@t-online.de>
Message-ID: <87h8h61rbf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > The ZeroMQ output module also depends on protobuf, see upstream PR 145.
 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Given how much depends on host-pkgconf I think it makes more sense to
make host-pkgconf an unconditional dependency for robustness reasons
when bumping the version.

But that can be done later - Committed, thanks.

> ---
 > v2: no changes

 >  package/mjpg-streamer/mjpg-streamer.mk | 7 +++++++
 >  1 file changed, 7 insertions(+)

 > diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
 > index de8bad0c03..4077a3dcbc 100644
 > --- a/package/mjpg-streamer/mjpg-streamer.mk
 > +++ b/package/mjpg-streamer/mjpg-streamer.mk
 > @@ -29,6 +29,13 @@ else
 >  MJPG_STREAMER_CONF_OPTS += -DPLUGIN_INPUT_OPENCV=OFF
 >  endif
 
 > +ifeq ($(BR2_PACKAGE_PROTOBUF_C)$(BR2_PACKAGE_ZEROMQ),yy)
 > +MJPG_STREAMER_CONF_OPTS += -DPLUGIN_OUTPUT_ZMQSERVER=ON
 > +MJPG_STREAMER_DEPENDENCIES += host-pkgconf protobuf-c zeromq
 > +else
 > +MJPG_STREAMER_CONF_OPTS += -DPLUGIN_OUTPUT_ZMQSERVER=OFF
 > +endif
 > +
 >  ifeq ($(BR2_PACKAGE_SDL),y)
 >  MJPG_STREAMER_CONF_OPTS += -DPLUGIN_OUTPUT_VIEWER=ON
 >  MJPG_STREAMER_DEPENDENCIES += host-pkgconf sdl
 > -- 
 > 2.19.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
