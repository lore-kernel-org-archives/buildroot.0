From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 23:06:49 +0200
Subject: [Buildroot] [PATCH v2] package/apparmor: fix compilation with
 libintl
In-Reply-To: <20200425140356.6448-1-angelo@amarulasolutions.com>
References: <20200425140356.6448-1-angelo@amarulasolutions.com>
Message-ID: <20200427230649.5dec909e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 25 Apr 2020 16:03:56 +0200
Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:

> +ifeq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
> +APPARMOR_MAKE_OPTS += WITH_LIBINTL=1

I've added:

APPARMOR_DEPENDENCIES += gettext

here, otherwise, gettext is not guaranteed to be built before.

It is not strictly necessary, because the issue only occurs when the
libintl.h from gettext has replaced the one from the C library. So the
issue only appears when gettext has been compiled/installed before
apparmor.

But still, if BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL=y, it means that
gettext will be built, so we'd rather depend on it so that we have
gettext support in apparmor.

Applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
