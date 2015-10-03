From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Oct 2015 09:08:57 +0200
Subject: [Buildroot] [PATCH 3/5] package/freerdp: re-add support for
	gstreamer
In-Reply-To: <6bfca930d5e10ea07fffaf7680067658bc68b797.1441569038.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 6 Sep 2015 21:54:20 +0200")
References: <cover.1441569038.git.yann.morin.1998@free.fr>
 <6bfca930d5e10ea07fffaf7680067658bc68b797.1441569038.git.yann.morin.1998@free.fr>
Message-ID: <871tdce8dy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Previously, we expected the user to select gstreamer-0.x on his own,
 > to enable gstreamer support in FreeRDP. This could have been a bit
 > confusing to the user, as he may have enabled gst-1.x but FreeRDP did
 > only support gst-0.x.

 > Also, gstreamer support needs xlib-libxrandr, which was missing in
 > FreeRDP's dependencies, so it was never enabled (AFAICS).

 > (Re-)introduce support for gstreamer-0.x and gstreamer-1.x, since both
 > are supported.

 > We're doing it in a choice, and forcibly select whichever version the
 > user chooses, rather than automatically detect it as previosuly done.
 > We can select gstreamer, as their dependencies are anyway already
 > covered by the ones of FreeRDP.

Is there an advantage to doing so? Now people will not get gstreamer
support by default even though they have gstreamer packages enabled.


 > This also now requires xlib-libxrandr, so hide the choice if X.org is
 > not enabled, still offer the option of not using gstreamer if it is.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 >  package/freerdp/Config.in  | 28 ++++++++++++++++++++++++++++
 >  package/freerdp/freerdp.mk | 14 +++++++++++++-
 >  2 files changed, 41 insertions(+), 1 deletion(-)

 > diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
 > index ab8c3f5..ca57cef 100644
 > --- a/package/freerdp/Config.in
 > +++ b/package/freerdp/Config.in
 > @@ -23,6 +23,34 @@ config BR2_PACKAGE_FREERDP
 
 >  if BR2_PACKAGE_FREERDP
 
 > +choice
 > +	bool "gstreamer support"
 > +	depends on BR2_PACKAGE_XORG7 # xlib-libxrandr

Would people ever want to configure this without explicitly having
enabled gstreamer{,1}?

I think it makes more sense to let this depend on
BR2_PACKAGE_GSTREAMER || BR2_PACKAGE_GSTREAMER1 as well.

> +
 > +config BR2_PACKAGE_FREERDP_GSTREAMER_NO
 > +	bool "none"
 > +

And then move this to the bottom so gstreamer support is enabled by
default.

> +config BR2_PACKAGE_FREERDP_GSTREAMER1
 > +	bool "gstreamer-1.x"
 > +	# gstreamer-1.x dependencies already dependencies of FreeRDP
 > +	select BR2_PACKAGE_GSTREAMER1

This should then be a 'depends on'.

> +	select BR2_PACKAGE_GST1_PLUGINS_BASE
 > +	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
 > +	select BR2_PACKAGE_XLIB_LIBXRANDR
 > +
 > +config BR2_PACKAGE_FREERDP_GSTREAMER
 > +	bool "gstreamer-0.x"
 > +	# gstreamer-0.x dependencies already dependencies of FreeRDP
 > +	select BR2_PACKAGE_GSTREAMER

And here as well.

> +	select BR2_PACKAGE_GST_PLUGINS_BASE
 > +	select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP
 > +	select BR2_PACKAGE_XLIB_LIBXRANDR

Looking at FindGStreamer_0_10.cmake I see it needs libxml2 and uses
pkg-config as well.


> +
 > +endchoice
 > +
 > +comment "gstreamer support needs X.Org"
 > +	depends on !BR2_PACKAGE_XORG7

And then this should also depend on gstreamer|gstreamer1

With that said, I'm not sure we really need such detailed user
configuration. Would there ever be any good reason to NOT enable
gstreamer{,1} support if it is available? And with gstreamer 0.10 being
so old I don't think it is an issue to go for gstreamer1 support if both
are enabled.

But that is something we can improve later. Committed with the above
fixes, thanks!

-- 
Bye, Peter Korsgaard
