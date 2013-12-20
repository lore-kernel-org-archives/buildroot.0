From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 20 Dec 2013 08:48:35 +0100
Subject: [Buildroot] [PATCH] cairo: Build with GLESv2 and VG backends if
	possible
In-Reply-To: <1387243053-5281-1-git-send-email-paul@crapouillou.net> (Paul
 Cercueil's message of "Tue, 17 Dec 2013 02:17:33 +0100")
References: <1387243053-5281-1-git-send-email-paul@crapouillou.net>
Message-ID: <878uvgklnw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paul" == Paul Cercueil <paul@crapouillou.net> writes:

 > Signed-Off-By: Paul Cercueil <paul@crapouillou.net>
 > ---
 >  package/cairo/cairo.mk | 14 ++++++++++++++
 >  1 file changed, 14 insertions(+)

 > diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
 > index 347bb75..aa03a27 100644
 > --- a/package/cairo/cairo.mk
 > +++ b/package/cairo/cairo.mk
 > @@ -54,6 +54,20 @@ else
 >  	CAIRO_CONF_OPT += --disable-directfb
 >  endif
 
 > +ifeq ($(BR2_PACKAGE_HAS_OPENGL_ES),y)
 > +	CAIRO_CONF_OPT += --enable-glesv2
 > +	CAIRO_DEPENDENCIES += libgles
 > +else
 > +	CAIRO_CONF_OPT += --disable-glesv2
 > +endif
 > +
 > +ifeq ($(BR2_PACKAGE_HAS_OPENVG),y)
 > +	CAIRO_CONF_OPT += --enable-vg
 > +	CAIRO_DEPENDENCIES += libopenvg
 > +else
 > +	CAIRO_CONF_OPT += --disable-vg
 > +endif

What openvg / gles providers did you test against? We seem to have a
number of autobuild failures with the rpi provider:

http://autobuild.buildroot.net/results/b7f/b7f71cd412e5a7f801e81140a02c7da04694151f/build-end.log

http://autobuild.buildroot.net/results/f70/f7012c1e09d75dd103b61da364272f6385d2dc7b/build-end.log

http://autobuild.buildroot.net/results/ec5/ec550547f6465b52ba552ca757c9bbeac17cd1c6/build-end.log

http://autobuild.buildroot.net/results/81a/81ae93018ca6d7a61460e0c78d5a60e6a5531dbc/build-end.log

-- 
Bye, Peter Korsgaard
