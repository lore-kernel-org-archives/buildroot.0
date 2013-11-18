From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 18 Nov 2013 08:37:52 +0100
Subject: [Buildroot] [PATCH] alsa-lib: Disable mixer in alsa-lib when
	BR2_PREFER_STATIC_LIB is selected.
In-Reply-To: <1384746819-16110-1-git-send-email-Sonic.adi@gmail.com> (sonic
 adi's message of "Mon, 18 Nov 2013 11:53:39 +0800")
References: <1384746819-16110-1-git-send-email-Sonic.adi@gmail.com>
Message-ID: <8761rqxir3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "sonic" == sonic adi <sonic.adi@gmail.com> writes:

 > From: Sonic Zhang <sonic.zhang@analog.com>
 > The mixer in ALSA library depends on runtime library loader which
 > doesn't available if building for static library.

 > Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
 > ---
 >  package/alsa-lib/alsa-lib.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
 > index a7ffd77..145bcf8 100644
 > --- a/package/alsa-lib/alsa-lib.mk
 > +++ b/package/alsa-lib/alsa-lib.mk
 > @@ -19,7 +19,7 @@ ALSA_LIB_CONF_OPT = --with-alsa-devdir=$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_DEVD
 
 >  # Can't build with static & shared at the same time (1.0.25+)
 >  ifeq ($(BR2_PREFER_STATIC_LIB),y)
 > -ALSA_LIB_CONF_OPT += --enable-shared=no
 > +ALSA_LIB_CONF_OPT += --enable-shared=no --disable-mixer

We already have BR2_PACkAGE_ALSA_LIB_MIXER to control if the mixer
support should be enabled or not, so you should instead make that option
depend on !BR2_PREFER_STATIC_LIB.

You also need to propagate this dependency to the reverse deps of the
option:

git grep -l 'select BR2_PACKAGE_ALSA_LIB_MIXER'
package/alsa-utils/Config.in
package/alsamixergui/Config.in
package/gstreamer/gst-plugins-base/Config.in
package/gstreamer1/gst1-plugins-base/Config.in
package/mpd/Config.in

Care to fix this and resend? Thanks.

-- 
Bye, Peter Korsgaard
