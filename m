From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 05 Jan 2014 11:07:47 +0100
Subject: [Buildroot] [PATCH] ZNC: new package
In-Reply-To: <1388876370-3441-1-git-send-email-cedric.chepied@gmail.com>
 (=?utf-8?Q?=22C=C3=A9dric_Ch=C3=A9pied=22's?= message of "Sat, 4 Jan 2014
 23:59:30 +0100")
References: <1388876370-3441-1-git-send-email-cedric.chepied@gmail.com>
Message-ID: <877gae7nd8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "C?dric" == C?dric Ch?pied <cedric.chepied@gmail.com> writes:

 > ZNC is an IRC bouncer.
 > It is available in menu "Networking applications"
 > ---
 >  package/Config.in     |  1 +
 >  package/znc/Config.in |  6 ++++++
 >  package/znc/znc.mk    | 22 ++++++++++++++++++++++
 >  3 files changed, 29 insertions(+)
 >  create mode 100644 package/znc/Config.in
 >  create mode 100644 package/znc/znc.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index 35de506..925a6bf 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -936,6 +936,7 @@ source "package/wpa_supplicant/Config.in"
 >  source "package/wvdial/Config.in"
 >  source "package/xinetd/Config.in"
 >  source "package/xl2tp/Config.in"
 > +source "package/znc/Config.in"
 
 >  endmenu
 
 > diff --git a/package/znc/Config.in b/package/znc/Config.in
 > new file mode 100644
 > index 0000000..ef5db26
 > --- /dev/null
 > +++ b/package/znc/Config.in
 > @@ -0,0 +1,6 @@
 > +config BR2_PACKAGE_ZNC
 > +       bool "znc"
 > +       select BR2_PACKAGE_OPENSSL
 > +       select BR2_PACKAGE_PERL
 > +       help
 > +         Advanced IRC bouncer
 > diff --git a/package/znc/znc.mk b/package/znc/znc.mk
 > new file mode 100644
 > index 0000000..59d10f2
 > --- /dev/null
 > +++ b/package/znc/znc.mk
 > @@ -0,0 +1,22 @@
 > +ZNC_VERSION = 1.2
 > +ZNC_SOURCE = znc-$(ZNC_VERSION).tar.gz
 > +ZNC_SITE = http://znc.in/releases
 > +ACL_INSTALL_STAGING = YES

Why does it need to install into staging? It's a program and not a
library, right?


 > +
 > +# While the configuration system uses autoconf, the Makefiles are
 > +# hand-written and do not use automake. Therefore, we have to hack
 > +# around their deficiencies by passing installation paths.
 > +ACL_INSTALL_STAGING_OPT = 			\
 > +	prefix=$(STAGING_DIR)/usr 		\
 > +	exec_prefix=$(STAGING_DIR)/usr 		\
 > +	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib	\
 > +	install-dev install-lib
 > +
 > +ACL_INSTALL_TARGET_OPT = 			\
 > +	prefix=$(TARGET_DIR)/usr 		\
 > +	exec_prefix=$(TARGET_DIR)/usr 		\
 > +	install install-lib

Out of interest, what does PKG_DEVLIB_DIR do and why don't we pass it
for TARGET?

-- 
Bye, Peter Korsgaard
