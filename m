From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 19 May 2014 23:07:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/webkit: Fix OpenGL-related
	dependencies
In-Reply-To: <20140519204247.GD3508@free.fr> (Yann E. MORIN's message of "Mon, 
 19 May 2014 22:42:47 +0200")
References: <1400525369-32257-1-git-send-email-bernd.kuhls@t-online.de>
 <878upxjyhs.fsf@dell.be.48ers.dk> <20140519204247.GD3508@free.fr>
Message-ID: <874n0ljx4l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> WEBKIT_DEPENDENCIES += \
 >> $(if $(BR_PACKAGE_XLIB_LIBXCOMPOSITE),xlib_libXcomposite) \
 >> $(if $(BR_PACKAGE_XLIB_LIBXDAMAGE),xlib_libXdamage)

 > Not that I dislike this, but we explicitly state in the manual that
 > multi-lines are prefered over single-lines:
 >     http://buildroot.net/downloads/manual/manual.html#writing-rules-config-in

 > Let's try to at least pretend we ourself respect our own rules. ;-)

True. I think what the manual means (atleast that's my opinion) is that
single line syntax is fine for simple statements (like dependencies) -
E.G.:

FOO_DEPENDENCIES += $(if $(BR2_PACKAGE_BAR),bar)

But not when you need to repeat the test for E.G. configure options and
dependencies:

FOO_CONF_OPT += $(if $(BR2_PACKAGE_BAR),--with-bar,--without-bar)
FOO_DEPENDENCIES += $(if $(BR2_PACKAGE_BAR),bar)

This should preferably only do the test once, E.G.:

ifeq ($(BR2_PACKAGE_BAR),y)
FOO_CONF_OPT += --with-bar
FOO_DEPENDENCIES += bar
else
FOO_CONF_OPT += --without-bar
endif

-- 
Bye, Peter Korsgaard
