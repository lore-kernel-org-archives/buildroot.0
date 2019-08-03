From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Aug 2019 12:18:13 +0200
Subject: [Buildroot] [PATCH] package/ettercap: new package
In-Reply-To: <1557232415-11421-1-git-send-email-jugurtha.belkalem@smile.fr>
 (Jugurtha BELKALEM's message of "Tue, 7 May 2019 14:33:35 +0200")
References: <1557232415-11421-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <87ef22o8m2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jugurtha" == Jugurtha BELKALEM <jugurtha.belkalem@smile.fr> writes:

 > Ettercap is a comprehensive suite for man
 > in the middle attacks.
 > It features sniffing of live connections, content
 > filtering on the fly and many other interesting
 > tricks.

 > Ettercap can help identify misconfigured networks,
 > testing intrusion detection and prevention
 > applications and build robust embedded systems that
 > are "security by design" compliant.

You word wrapping is kind of odd?


 > This tool can be used for security testing or
 > educational purposes.

 > Master branch from :
 > https://github.com/Ettercap/ettercap
 > was used as the source for this packet as it
 > remains in active development (unlike release
 > version which dates back to 2015).

In the mean time 0.8.3 has been released.


> +++ b/package/Config.in
 > @@ -1757,6 +1757,7 @@ endif
 >  endmenu
 
 >  menu "Security"
 > +	source "package/ettercap/Config.in"

Sticking this under libraries -> security is a bit odd. Perhaps a better
place would be Networking applications?


 > +++ b/package/ettercap/0001-Fix-invalid-utf-8-is-not-supported.patch
 > @@ -0,0 +1,33 @@
 > +From b4f8a10100669806de6cb37b1c1f747539e93b31 Mon Sep 17 00:00:00 2001
 > +From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
 > +Date: Tue, 7 May 2019 13:25:44 +0200
 > +Subject: [PATCH] Fix invalid utf-8 is not supported
 > +
 > +Fixes fatal error message generated even when
 > +utf-8 is available.
 > +Ettercap requires gettext package and works fine.
 > + 
 > +Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
 > +---
 > + ettercap-5fb604823c6063676ebdf7cac66b7807acb4f7ed/src/ec_format.c | 5 +----
 > + 1 file changed, 1 insertion(+), 4 deletions(-)
 > +
 > +diff --git a/src/ec_format.c b/ettercap-5fb604823c6063676ebdf7cac66b7807acb4f7ed/src/ec_format.c
 > +index 5c9b850..dd9d972 100644
 > +--- a/src/ec_format.c
 > ++++ b/src/ec_format.c
 > +@@ -417,10 +417,7 @@ int set_utf8_encoding(u_char *fromcode)
 > + 
 > +    /* make sure encoding type is supported */
 > +    cd = iconv_open("UTF-8", (const char*)fromcode);
 > +-   
 > +-   if (cd == (iconv_t)(-1))
 > +-      SEMIFATAL_ERROR("The conversion from %s to UTF-8 is not supported.", fromcode);

This looks very confusing to me - Can you provide more details? What is
fromcode set to here when it fails? What toolchains do you see this
error with? Can we instead turn off HAVE_UTF8 for those cases?


 > diff --git a/package/ettercap/Config.in b/package/ettercap/Config.in
 > new file mode 100644
 > index 0000000..fbab876
 > --- /dev/null
 > +++ b/package/ettercap/Config.in
 > @@ -0,0 +1,22 @@
 > +config BR2_PACKAGE_ETTERCAP
 > +	bool "ettercap"
 > +	select BR2_PACKAGE_ETHTOOL # runtime
 > +	select BR2_PACKAGE_GEOIP # runtime
 > +	select BR2_PACKAGE_GETTEXT # runtime
 > +	select BR2_PACKAGE_LIBCURL # runtime
 > +	select BR2_PACKAGE_LIBNET # runtime
 > +	select BR2_PACKAGE_LIBPCAP # runtime
 > +	select BR2_PACKAGE_LIBPTHREAD_STUB # runtime
 > +	select BR2_PACKAGE_NCURSES # runtime
 > +	select BR2_PACKAGE_OPENSSL # runtime
 > +	select BR2_PACKAGE_ZLIB # runtime

You list all of these as runtime dependencies, but still add them to
ETTERCAP_DEPENDENCIES? Doing a quick test, I see that atleast ncurses is
a build dependency:

  Could NOT find Curses (missing: CURSES_LIBRARY CURSES_INCLUDE_PATH)

Looking a CMakeLists.txt I see that a number of these are optional:

option(ENABLE_CURSES "Enable curses interface" ON)
option(ENABLE_GTK "Enable GTK interface" ON)
option(ENABLE_PLUGINS "Enable plugins support" ON)
option(ENABLE_IPV6 "Enable IPv6 support" OFF)
option(ENABLE_LUA "Enable LUA support (EXPERIMENTAL)" OFF)
option(ENABLE_PDF_DOCS "Enable PDF document generation" OFF)
option(ENABLE_TESTS "Enable Unit Tests" OFF)
option(ENABLE_GEOIP "Build with GeoIP support" ON)
option(LIBRARY_BUILD "Build for libettercap only" OFF)
option(INSTALL_DESKTOP "Install ettercap desktop files" ON)

So it would be nice to only enable these things if the affected packages
are enabled.

Are there really no toolchain dependencies? I see that plugins are
enabled by default, so presumably this means that it uses dlopen() and
hence will not work in a BR2_STATIC_LIBS setup?


 > +ETTERCAP_VERSION = 5fb604823c6063676ebdf7cac66b7807acb4f7ed
 > +ETTERCAP_SITE = $(call github,Ettercap,ettercap,$(ETTERCAP_VERSION))
 > +ETTERCAP_LICENSE = GPL-2.0

The source files contains the "any later version" text, so it should be
GPL-2.0+


> +ETTERCAP_LICENSE_FILES = LICENSE
 > +ETTERCAP_SUPPORTS_IN_SOURCE_BUILD = NO
 > +ETTERCAP_DEPENDENCIES = geoip host-ncurses libzlib \
 > +	libcurl libnet libopenssl libpcap ncurses

Why is host-ncurses needed?

Care to fix these issues and send an updated patch?

-- 
Bye, Peter Korsgaard
