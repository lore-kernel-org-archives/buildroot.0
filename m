From: olyvine.chen at logiways.com.cn <olyvine.chen@logiways.com.cn>
Date: Tue, 28 Dec 2010 16:42:45 +0800
Subject: [Buildroot] wvstreams configure error
Message-ID: <1293525765.15318.24.camel@olyvine-desktop.logiways-sz.cn>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, all,

I now run into an error when configure wvstreams as following:
##################################################################################
make[2]: Circular wvstreams-depends <- wvstreams dependency dropped.
>>> wvstreams 4.6.1 Configuring
configure: WARNING: unrecognized options: --disable-gtk-doc
configure: WARNING: valgrind/memcheck.h: present but cannot be compiled
configure: WARNING: valgrind/memcheck.h:     check for missing
prerequisite headers?
configure: WARNING: valgrind/memcheck.h: see the Autoconf documentation
configure: WARNING: valgrind/memcheck.h:     section "Present But Cannot
Be Compiled"
configure: WARNING: valgrind/memcheck.h: proceeding with the
preprocessor's result
configure: WARNING: valgrind/memcheck.h: in the future, the compiler
will take precedence
configure: WARNING:     ##
----------------------------------------------- ##
configure: WARNING:     ## Report this to
wvstreams-devel at googlegroups.com ##
configure: WARNING:     ##
----------------------------------------------- ##
configure: WARNING: zlib.h: present but cannot be compiled
configure: WARNING: zlib.h:     check for missing prerequisite headers?
configure: WARNING: zlib.h: see the Autoconf documentation
configure: WARNING: zlib.h:     section "Present But Cannot Be Compiled"
configure: WARNING: zlib.h: proceeding with the preprocessor's result
configure: WARNING: zlib.h: in the future, the compiler will take
precedence
configure: WARNING:     ##
----------------------------------------------- ##
configure: WARNING:     ## Report this to
wvstreams-devel at googlegroups.com ##
configure: WARNING:     ##
----------------------------------------------- ##
configure: WARNING: tr1/functional: present but cannot be compiled
configure: WARNING: tr1/functional:     check for missing prerequisite
headers?
configure: WARNING: tr1/functional: see the Autoconf documentation
configure: WARNING: tr1/functional:     section "Present But Cannot Be
Compiled"
configure: WARNING: tr1/functional: proceeding with the preprocessor's
result
configure: WARNING: tr1/functional: in the future, the compiler will
take precedence
configure: WARNING:     ##
----------------------------------------------- ##
configure: WARNING:     ## Report this to
wvstreams-devel at googlegroups.com ##
configure: WARNING:     ##
----------------------------------------------- ##
configure: WARNING: DBUS is missing.
configure: WARNING: PAM is missing.
configure: WARNING: Qt is missing.
configure: WARNING: OpenSSL is missing.
configure: WARNING: readline is missing.
configure: WARNING: zlib is missing.
configure: error: Required dependencies missing: OpenSSL>=0.9.7 zlib
make[2]: *** [????????/wvstreams-4.6.1/.stamp_configured] Error 1
make[1]: *** [buildroot] Error 2
make: *** [buildroot] Error 2
##################################################################################

However, both openssl and zlib are compiled, and the makefile for
wvstreams is as following:

##################################################################################
WVSTREAMS_VERSION = 4.6.1
WVSTREAMS_SOURCE = wvstreams-$(WVSTREAMS_VERSION).tar.gz
WVSTREAMS_SITE = http://wvstreams.googlecode.com/files/
WVSTREAMS_LIBTOOL_PATCH = NO
WVSTREAMS_AUTORECONF = NO
WVSTREAMS_INSTALL_STAGING = YES
WVSTREAMS_INSTALL_TARGET = YES

ifeq ($(BR2_PACKAGE_OPENSSL),y)
WVSTREAMS_CONF_OPT+=--with-openssl
WVSTREAMS_DEPENDENCIES+=openssl
else
WVSTREAMS_CONF_OPT+=--without-openssl
endif

ifeq ($(BR2_PACKAGE_ZLIB),y)
WVSTREAMS_CONF_OPT+=--with-zlib=$(STAGING_DIR)
WVSTREAMS_DEPENDENCIES+=zlib
else
WVSTREAMS_CONF_OPT+=--without-zlib
endif

WVSTREAMS_CONF_OPT += --without-dbus --with-pam=no --with-tcl=no
--with-qt=no

$(eval $(call AUTOTARGETS,package,wvstreams))

##################################################################################

Can anybody help me?
Thanks and Best regards!
Olyvine.
