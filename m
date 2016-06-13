From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jun 2016 22:18:53 +0200
Subject: [Buildroot] [PATCH 1/3] package/qt: Fix Kconfig for OpenGL
	support
In-Reply-To: <1465842195-21158-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Mon, 13 Jun 2016 20:23:13 +0200")
References: <1465842195-21158-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <878ty8yh8y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > BR2_PACKAGE_QT_OPENGL_ES was moved to a choice option. This option kind
 > can apparently not be selected by other packages. Therefore this patch
 > introduces a new Kconfig option BR2_PACKAGE_QT_OPENGL which takes care
 > of OpenGL support as such, BR2_PACKAGE_QT_OPENGL_NONE is not needed
 > anymore now. The choice options are now only used to determine the
 > type of OpenGL support.

 > This patch contains the necessary preparation to fix a build error in
 > the qwt package.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/qt/Config.in | 14 +++++++++++---
 >  1 file changed, 11 insertions(+), 3 deletions(-)

 > diff --git a/package/qt/Config.in b/package/qt/Config.in
 > index 14b13ce..2ca0cb5 100644
 > --- a/package/qt/Config.in
 > +++ b/package/qt/Config.in
 > @@ -350,14 +350,20 @@ config BR2_PACKAGE_QT_PHONON_BACKEND
 >  	  Build the platform Phonon plugin.
 >  	  If unsure, say n.
 
 > +config BR2_PACKAGE_QT_OPENGL
 > +	bool "OpenGL support"
 > +	depends on BR2_PACKAGE_HAS_LIBGL || \
 > +	(BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_HAS_LIBGLES)
 > +	help

This doesn't match with the dependencies of the _GL_DESKTOP / _OPENGL_ES
options, so you can enable this and have none of the options available
(E.G. the intel mesa3d driver without X11).

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
