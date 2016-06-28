From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jun 2016 13:48:00 +0200
Subject: [Buildroot] [PATCH] nodm: new package
In-Reply-To: <1466487119-7267-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 (Ezequiel Garcia's message of "Tue, 21 Jun 2016 02:31:59 -0300")
References: <1466487119-7267-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <87twgdmt5b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ezequiel" == Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:

 > Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
 > ---
 > I don't have much experience with PAM, so feel free to suggest
 > a better PAM file.

 > Tested on Minnowboard Turbot, using the minnowboard_max-graphical defconfig.

 >  package/Config.in      |  1 +
 >  package/nodm/Config.in | 14 ++++++++++++++
 >  package/nodm/S90nodm   | 51 ++++++++++++++++++++++++++++++++++++++++++++++++++
 >  package/nodm/nodm.hash |  1 +
 >  package/nodm/nodm.mk   | 28 +++++++++++++++++++++++++++
 >  package/nodm/nodm.pam  | 14 ++++++++++++++
 >  6 files changed, 109 insertions(+)
 >  create mode 100644 package/nodm/Config.in
 >  create mode 100644 package/nodm/S90nodm
 >  create mode 100644 package/nodm/nodm.hash
 >  create mode 100644 package/nodm/nodm.mk
 >  create mode 100644 package/nodm/nodm.pam

 > diff --git a/package/Config.in b/package/Config.in
 > index ce71afb7816a..0f5d1c07dc7d 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -307,6 +307,7 @@ comment "X applications"
 >  	source "package/gtkperf/Config.in"
 >  	source "package/leafpad/Config.in"
 >  	source "package/midori/Config.in"
 > +	source "package/nodm/Config.in"
 >  	source "package/pcmanfm/Config.in"
 >  	source "package/qt-webkit-kiosk/Config.in"
 >  	source "package/rdesktop/Config.in"
 > diff --git a/package/nodm/Config.in b/package/nodm/Config.in
 > new file mode 100644
 > index 000000000000..e6231076b1ee
 > --- /dev/null
 > +++ b/package/nodm/Config.in
 > @@ -0,0 +1,14 @@
 > +config BR2_PACKAGE_NODM
 > +	bool "nodm"
 > +	depends on BR2_PACKAGE_XORG7
 > +	select BR2_PACKAGE_LINUX_PAM

You forgot BR2_PACKAGE_XLIB_LIBX11

 > +
 > +	help

No empty line before help.

> +	  nodm is a minimal display manager that simply logs in
 > +	  as a given user and starts an X session, without asking
 > +	  for username or password.
 > +
 > +	  For those cases where automatic login is needed (and
 > +	  does not imply a security issue), nodm is simple to setup,
 > +	  lightweight, and it should do exactly the right thing.
 > +

Upstream URL?

 > +++ b/package/nodm/nodm.mk
 > @@ -0,0 +1,28 @@
 > +################################################################################
 > +#
 > +# nodm
 > +#
 > +################################################################################
 > +
 > +NODM_VERSION = 0.12
 > +NODM_SOURCE = nodm_$(NODM_VERSION)-1.tar.gz
 > +NODM_SITE = http://http.debian.net/debian/pool/main/n/nodm
 > +NODM_LICENSE = GPLv2+
 > +NODM_LICENSE_FILES = COPYING
 > +NODM_AUTORECONF=YES
 > +
 > +NODM_DEPENDENCIES = xlib_libX11 linux-pam
 > +

Googling around, upstream seems to be:

https://github.com/spanezz/nodm

Any reason why we use Debian instead of upstream directly?


> diff --git a/package/nodm/S90nodm b/package/nodm/S90nodm
 > new file mode 100644
 > index 000000000000..66bb0ca8565b
 > --- /dev/null
 > +++ b/package/nodm/S90nodm
 > @@ -0,0 +1,51 @@
 > +#!/bin/sh
 > +#
 > +# Starts nodm
 > +#
 > +
 > +NODM_XINIT=/usr/bin/xinit

According to the upstream readme, this is no longer used:

NODM_XINIT Was used by older versions of nodm as the path to the xinit
program, but it is now ignored.

> +NODM_FIRST_VT=7
 > +NODM_XSESSION=/etc/X11/Xsession
 > +NODM_OPTIONS=
 > +NODM_X_OPTIONS="-nolisten tcp"
 > +NODM_USER=root
 > +NODM_MIN_SESSION_TIME=60
 > +NODM_X_TIMEOUT=300
 > +
 > +[ -r /etc/nodm.conf ] && . /etc/nodm.conf

Elsewhere we use /etc/default/nodm (which is also what the upstream init
script uses).


 > +++ b/package/nodm/nodm.hash
 > @@ -0,0 +1 @@
 > +sha256	77a002928e832eb6737fb92ad6b3477fce68167b4bc86eba5586868cc1337524	nodm_0.12-1.tar.gz

Please add a comment about where this hash comes from (E.G. locally
calculated if that is what you did).

 > +NODM_AUTORECONF=YES

Space around '=' please.

Care to fixup these issues and resend? Thanks!

-- 
Bye, Peter Korsgaard
