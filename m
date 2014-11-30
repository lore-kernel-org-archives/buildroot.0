From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Nov 2014 21:40:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server:
	libunwind support is broken on mips64
In-Reply-To: <1417299035-17050-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sat, 29 Nov 2014 23:10:35 +0100")
References: <1417299035-17050-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87bnnojub1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes
 > http://autobuild.buildroot.net/results/e8f/e8f68163802f31359cee15fa3ca52547e06d1f27/
 > http://autobuild.buildroot.net/results/994/9947222da8682a358f81f8ac924c12596fd09ee8/
 > http://autobuild.buildroot.net/results/df9/df92d9b682976b77d9e1e4c39afca52b7512d847/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk |    4 +++-
 >  1 file changed, 3 insertions(+), 1 deletion(-)

 > diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
 > b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
 > index 4db8b09..cae06e6 100644
 > --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
 > +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
 > @@ -144,7 +144,9 @@ ifeq ($(BR2_PACKAGE_FREETYPE),y)
 >  XSERVER_XORG_SERVER_DEPENDENCIES += freetype
 >  endif
 > -ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 > +# libunwind support is broken on mips64
 > +# https://www.libreoffice.org/bugzilla/show_bug.cgi?id=79939

This doesn't have anything to do with libreoffice. That URL is
apparently an alias for bugs.freedesktop.org (the official bugtracker
for xorg), so I've used that as URL instead.


 > +ifeq ($(BR2_PACKAGE_LIBUNWIND)$(BR2_mips64el),y)
 >  XSERVER_XORG_SERVER_DEPENDENCIES += libunwind

That's not good as builds on mips64el WITHOUT libunwind now ends up
pulling in libunwind (and breaking the build).

We need to match on LIBUNWIND and !mips64el, so there needs so be a
seperator in between, like:

ifeq ($(BR2_PACKAGE_LIBUNWIND)-$(BR2_mips64el),y-)

Even if it looks a bit odd.

Committed with those fixes, thanks.

-- 
Bye, Peter Korsgaard
