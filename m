From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Jan 2020 23:34:21 +0100
Subject: [Buildroot] [PATCH 1/2] package/gensio: new package
In-Reply-To: <20200121014014.32703-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Mon, 20 Jan 2020 18:40:13 -0700")
References: <20200121014014.32703-1-james.hilliard1@gmail.com>
Message-ID: <875zh0v5zm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > A library to abstract stream I/O like serial port, TCP, telnet, UDP,
 > SSL, IPMI SOL, etc.

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Please run check-package before submitting:

package/gensio/Config.in:5: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
package/gensio/gensio.mk:8: remove default value of _SOURCE variable (http://nightly.buildroot.org/#generic-package-reference)

 > ---
 >  DEVELOPERS                 |  1 +
 >  package/Config.in          |  1 +
 >  package/gensio/Config.in   |  8 ++++++++
 >  package/gensio/gensio.hash |  6 ++++++
 >  package/gensio/gensio.mk   | 25 +++++++++++++++++++++++++
 >  5 files changed, 41 insertions(+)
 >  create mode 100644 package/gensio/Config.in
 >  create mode 100644 package/gensio/gensio.hash
 >  create mode 100644 package/gensio/gensio.mk

 > diff --git a/DEVELOPERS b/DEVELOPERS
 > index a1eb052652..07fd0e0055 100644
 > --- a/DEVELOPERS
 > +++ b/DEVELOPERS
 > @@ -1132,6 +1132,7 @@ F:	configs/pine64_defconfig
 >  F:	configs/pine64_sopine_defconfig
 
 >  N:	James Hilliard <james.hilliard1@gmail.com>
 > +F:	package/gensio/
 >  F:	package/lua-std-debug/
 >  F:	package/lua-std-normalize/
 >  F:	package/pipewire/
 > diff --git a/package/Config.in b/package/Config.in
 > index 4c94914680..e932d46ef8 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -1992,6 +1992,7 @@ menu "Networking applications"
 >  	source "package/fping/Config.in"
 >  	source "package/freeswitch/Config.in"
 >  	source "package/freeswitch-mod-bcg729/Config.in"
 > +	source "package/gensio/Config.in"

gensio is (primarily) a library, so it should go under libraries ->
Networking.

 > +################################################################################
 > +#
 > +# gensio
 > +#
 > +################################################################################
 > +
 > +GENSIO_VERSION = 1.3.3
 > +GENSIO_SOURCE = gensio-$(GENSIO_VERSION).tar.gz
 > +GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 > +GENSIO_LICENSE = GPL-2.0+
 > +GENSIO_LICENSE_FILES = COPYING

Only the utilities are GPL-2.0+, the library is LGPL-2.1+, so it should
be:

GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
GENSIO_LICENSE_FILES = COPYING.LIB COPYING

And the hash for COPYING.LIB should be added as well.

 > +GENSIO_INSTALL_STAGING = YES
 > +
 > +GENSIO_CONF_OPTS += \
 > +	--without-openipmi \
 > +	--without-swig \
 > +	--without-python

You will also need to do something about openssl. The configure script
seems quite broken though as there isn't really any way to explicitly
disable openssl support:

checking for openssl/ssl.h in /usr/local/ssl... no
checking for openssl/ssl.h in /usr/lib/ssl... no
checking for openssl/ssl.h in /usr/ssl... no
checking for openssl/ssl.h in /usr/pkg... no
checking for openssl/ssl.h in /usr/local... no
checking for openssl/ssl.h in /usr... yes
checking whether compiling and linking against OpenSSL works... no

..

>>> gensio 1.3.3 Building
PATH="/home/peko/source/buildroot/output-ser2net/host/bin:/home/peko/source/buildroot/output-ser2net/host/sbin:/home/peko/bin:/home/peko/.local/bin:/home/peko/bin:/home/peko/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"  /usr/bin/make -j5  -C /home/peko/source/buildroot/output-ser2net/build/gensio-1.3.3/
/usr/bin/make  all-recursive
Making all in lib
  CC       gensio.lo
  CC       gensio_osops.lo
  CC       gensio_net.lo
  CC       gensio_udp.lo
  CC       gensio_stdio.lo
arm-linux-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include'
make[4]: *** [Makefile:509: gensio.lo] Error 1
make[4]: *** Waiting for unfinished jobs....
arm-linux-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include'
arm-linux-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include'
make[4]: *** [Makefile:509: gensio_net.lo] Error 1
make[4]: *** [Makefile:509: gensio_udp.lo] Error 1
arm-linux-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include'
make[4]: *** [Makefile:509: gensio_osops.lo] Error 1
arm-linux-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include'
make[4]: *** [Makefile:509: gensio_stdio.lo] Error 1
make[3]: *** [Makefile:424: all-recursive] Error 1
make[2]: *** [Makefile:356: all] Error 2

So that is no good :/

Care to fix these issues and resend?

-- 
Bye, Peter Korsgaard
