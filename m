From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Jan 2020 16:19:57 +0100
Subject: [Buildroot] [PATCH 1/2] libmodescurity: new package
In-Reply-To: <20200110140017.15045-1-frank.vanbever@essensium.com> (Frank
 Vanbever's message of "Fri, 10 Jan 2020 15:00:16 +0100")
References: <20200110140017.15045-1-frank.vanbever@essensium.com>
Message-ID: <87d0brmj8i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Vanbever <frank.vanbever@essensium.com> writes:

Thanks for the patch! A few comments:

s|libmodescurity|package/libmodsecurity| in the subject.


 > Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
 > ---
 >  DEVELOPERS                                    |  3 +
 >  package/Config.in                             |  1 +
 >  ...-CANONICAL_HOST-cannot-be-determined.patch | 31 ++++++++++
 >  ...test-for-uClinux-in-configure-script.patch | 28 +++++++++
 >  package/libmodsecurity/Config.in              | 14 +++++
 >  package/libmodsecurity/libmodsecurity.hash    |  4 ++
 >  package/libmodsecurity/libmodsecurity.mk      | 59 +++++++++++++++++++
 >  7 files changed, 140 insertions(+)
 >  create mode 100644 package/libmodsecurity/0001-Fail-when-CANONICAL_HOST-cannot-be-determined.patch
 >  create mode 100644 package/libmodsecurity/0002-test-for-uClinux-in-configure-script.patch
 >  create mode 100644 package/libmodsecurity/Config.in
 >  create mode 100644 package/libmodsecurity/libmodsecurity.hash
 >  create mode 100644 package/libmodsecurity/libmodsecurity.mk

 > diff --git a/DEVELOPERS b/DEVELOPERS
 > index 80843dd1a1..534f4d746c 100644
 > --- a/DEVELOPERS
 > +++ b/DEVELOPERS
 > @@ -955,6 +955,9 @@ F:	package/ucl/
 >  F:	package/upx/
 >  F:	package/zxing-cpp/
 
 > +N:	Frank Vanbever <frank.vanbever@essensium.com>
 > +F:	package/libmodsecurity/
 > +
 >  N:	Ga?l Portay <gael.portay@collabora.com>
 >  F:	package/qt5/qt5virtualkeyboard/
 >  F:	package/qt5/qt5webengine/
 > diff --git a/package/Config.in b/package/Config.in
 > index 873a592d64..190cc4217c 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -2032,6 +2032,7 @@ menu "Networking applications"
 >  	source "package/leafnode2/Config.in"
 >  	source "package/lft/Config.in"
 >  	source "package/lftp/Config.in"
 > +	source "package/libmodsecurity/Config.in"

Isn't libmodsecurity a library? If so, then a better location would be
Libraries -> Networking or Libraries -> Security


 >  	source "package/lighttpd/Config.in"
 >  	source "package/linknx/Config.in"
 >  	source "package/links/Config.in"
 > diff --git a/package/libmodsecurity/0001-Fail-when-CANONICAL_HOST-cannot-be-determined.patch b/package/libmodsecurity/0001-Fail-when-CANONICAL_HOST-cannot-be-determined.patch
 > new file mode 100644
 > index 0000000000..d725d136ff
 > --- /dev/null
 > +++ b/package/libmodsecurity/0001-Fail-when-CANONICAL_HOST-cannot-be-determined.patch
 > @@ -0,0 +1,31 @@
 > +From 0832208360aab69fbaec76225db67801840a33fe Mon Sep 17 00:00:00 2001
 > +From: Frank Vanbever <frank.vanbever@essensium.com>
 > +Date: Fri, 10 Jan 2020 11:14:43 +0100
 > +Subject: [PATCH] Fail when CANONICAL_HOST cannot be determined
 > +
 > +When the CANONICAL_HOST is unknown the configure script exits
 > +with exit code 0 even though no makefile was produced.
 > +
 > +patch was submitted upstream: https://github.com/SpiderLabs/ModSecurity/pull/2235
 > +
 > +Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
 > +---
 > + configure.ac | 2 +-
 > + 1 file changed, 1 insertion(+), 1 deletion(-)
 > +
 > +diff --git a/configure.ac b/configure.ac
 > +index 95e48843..5e6971f4 100644
 > +--- a/configure.ac
 > ++++ b/configure.ac
 > +@@ -193,7 +193,7 @@ case $host in
 > +     ;;
 > +        *)
 > +     echo "Unknown CANONICAL_HOST $host"
 > +-    exit
 > ++    exit 1

What is the use of this patch in Buildroot? I mean, it looks correct but
we should ensure the configure script can correctly detect
CANONICAL_HOST (whatever that is), so this should never trigger?


 > +++ b/package/libmodsecurity/libmodsecurity.mk
 > @@ -0,0 +1,59 @@
 > +################################################################################
 > +#
 > +# libmodsecurity
 > +#
 > +################################################################################
 > +
 > +LIBMODSECURITY_VERSION = 3.0.3
 > +LIBMODSECURITY_SOURCE = modsecurity-v$(LIBMODSECURITY_VERSION).tar.gz
 > +LIBMODSECURITY_SITE = https://github.com/SpiderLabs/ModSecurity/releases/download/$(LIBMODSECURITY_VERSION)
 > +LIBMODSECURITY_INSTALL_STAGING = YES
 > +LIBMODSECURITY_LICENSE = Apache-2.0
 > +LIBMODSECURITY_LICENSE_FILES = LICENSE
 > +LIBMODSECURITY_AUTORECONF = YES

Please add a comment about why this is done, E.G.

0002-test-for-uClinux-in-configure-script.patch

 > +LIBMODSECURITY_CONF_ENV = \
 > +	ac_cv_file_others_libinjection_src_libinjection_html5_c=yes # Necessary to work around AC_CHECK_FILE cross-compile limitation
 > +
 > +LIBMODSECURITY_DEPENDENCIES = pcre
 > +LIBMODSECURITY_CONF_OPTS =  --disable-examples

One space too many after =

> +
 > +ifeq ($(BR2_PACKAGE_LIBXML2),y)
 > +LIBMODSECURITY_DEPENDENCIES += libxml2
 > +LIBMODSECURITY_CONF_OPTS += --with-libxml="$(STAGING_DIR)"
 > +else
 > +LIBMODSECURITY_CONF_OPTS += --with-libxml="no"

Is the more standard --without-libxml not supported?

 > +ifeq ($(BR2_PACKAGE_LUA),y)
 > +LIBMODSECURITY_DEPENDENCIES += lua

Does this work both with lua 5.1 and 5.3?

-- 
Bye, Peter Korsgaard
