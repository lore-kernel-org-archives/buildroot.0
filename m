From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Aug 2019 17:12:23 +0200
Subject: [Buildroot] [PATCHv2] package/jack1: new package
In-Reply-To: <20190803095906.23790-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sat, 3 Aug 2019 11:59:06 +0200")
References: <20190803095906.23790-1-yann.morin.1998@free.fr>
Message-ID: <87pnlmb7vs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: Adam Heinrich <adam@adamh.cz>
 > This patch adds a new jack1 package alongside the existing jack2.

 > While jack1 and jack2 are two equivalent implementations of the same
 > protocol, they differ in a few details and both of them are being
 > actively used (jack2 is not considered to be a replacement of jack1).

 > It is not possible to enable both at the same time, so hide away jack1
 > when jack2 is enabled (to keep existing defconfig files working).

 > For more information, see:
 > https://github.com/jackaudio/jackaudio.github.com/wiki/Q_difference_jack1_jack2

 > Signed-off-by: Adam Heinrich <adam@adamh.cz>
 > [yann.morin.1998 at free.fr:
 >   - fix coding style
 >   - use the release tarball, not a git clone
 > ]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > ---
 >  package/Config.in        |  1 +
 >  package/jack1/Config.in  | 33 +++++++++++++++++++++++++++++++++
 >  package/jack1/jack1.hash |  5 +++++
 >  package/jack1/jack1.mk   | 28 ++++++++++++++++++++++++++++

A DEVELOPERS entry was missing, I've added it.

 >  4 files changed, 67 insertions(+)
 >  create mode 100644 package/jack1/Config.in
 >  create mode 100644 package/jack1/jack1.hash
 >  create mode 100644 package/jack1/jack1.mk

 > +++ b/package/jack1/Config.in
 > @@ -0,0 +1,33 @@
 > +config BR2_PACKAGE_JACK1
 > +	bool "jack1"
 > +	depends on BR2_USE_MMU # fork()
 > +	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
 > +	depends on !BR2_STATIC_LIBS
 > +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 > +	depends on !BR2_PACKAGE_JACK2
 > +	select BR2_PACKAGE_ALSA_LIB
 > +	select BR2_PACKAGE_ALSA_LIB_HWDEP
 > +	select BR2_PACKAGE_ALSA_LIB_RAWMIDI
 > +	select BR2_PACKAGE_ALSA_LIB_SEQ
 > +	select BR2_PACKAGE_BERKELEYDB
 > +	select BR2_PACKAGE_LIBSNDFILE
 > +	select BR2_PACKAGE_LIBSAMPLERATE

Ideally we want this list sorted, so libsamplerate before libndfile

 > +++ b/package/jack1/jack1.mk
 > @@ -0,0 +1,28 @@
 > +################################################################################
 > +#
 > +# jack1
 > +#
 > +################################################################################
 > +
 > +JACK1_VERSION = 0.125.0
 > +JACK1_SOURCE = jack-audio-connection-kit-$(JACK1_VERSION).tar.gz
 > +JACK1_SITE = http://jackaudio.org/downloads
 > +JACK1_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
 > +JACK1_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
 > +JACK1_INSTALL_STAGING = YES
 > +
 > +# Dependency to celt can't be met: jack1 requires celt >= 0.8.0 but we
 > +# only have 0.5.1.3 and we cannot upgrade.
 > +JACK1_DEPENDENCIES = berkeleydb libsamplerate libsndfile alsa-lib

Looking at configure.ac it uses pkg-config to find dependencies, so I've
added host-pkgconf.

> +
 > +ifeq ($(BR2_PACKAGE_OPUS),y)
 > +JACK1_DEPENDENCIES += opus
 > +endif

I don't see any references to opus in the source code, so I've dropped
this.

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
