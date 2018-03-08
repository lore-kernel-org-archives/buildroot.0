From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 08 Mar 2018 09:05:07 +0100
Subject: [Buildroot] [PATCH] mpd-mpc: bump to version 0.29
In-Reply-To: <20180307225421.30632-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Wed, 7 Mar 2018 23:54:21 +0100")
References: <20180307225421.30632-1-joerg.krause@embedded.rocks>
Message-ID: <874llrkn64.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Since version 0.29 MPDs mpc only supports the meson build. Therefore,
 > adapt the package infrastructure according to the user manual.

 > Also add a hash for the license file.

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
 > ---
 >  package/mpd-mpc/mpd-mpc.hash |  3 ++-
 >  package/mpd-mpc/mpd-mpc.mk   | 29 +++++++++++++++++++++++++----
 >  2 files changed, 27 insertions(+), 5 deletions(-)

 > diff --git a/package/mpd-mpc/mpd-mpc.hash b/package/mpd-mpc/mpd-mpc.hash
 > index 8336893744..972d169438 100644
 > --- a/package/mpd-mpc/mpd-mpc.hash
 > +++ b/package/mpd-mpc/mpd-mpc.hash
 > @@ -1,2 +1,3 @@
 >  # Locally calculated after checking pgp signature
 > -sha256	a4337d06c85dc81a638821d30fce8a137a58d13d510be34a11c1cce95cabc547	mpc-0.28.tar.xz
 > +sha256  02f1daec902cb48f8cdaa6fe21c7219f6231b091dddbe437a3a4fb12cb07b9d3  mpc-0.29.tar.xz
 > +sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
 > diff --git a/package/mpd-mpc/mpd-mpc.mk b/package/mpd-mpc/mpd-mpc.mk
 > index 6c15c0d9a3..3eecf8a3ef 100644
 > --- a/package/mpd-mpc/mpd-mpc.mk
 > +++ b/package/mpd-mpc/mpd-mpc.mk
 > @@ -5,12 +5,33 @@
 >  ################################################################################
 
 >  MPD_MPC_VERSION_MAJOR = 0
 > -MPD_MPC_VERSION = $(MPD_MPC_VERSION_MAJOR).28
 > +MPD_MPC_VERSION = $(MPD_MPC_VERSION_MAJOR).29
 >  MPD_MPC_SITE = http://www.musicpd.org/download/mpc/$(MPD_MPC_VERSION_MAJOR)
 >  MPD_MPC_SOURCE = mpc-$(MPD_MPC_VERSION).tar.xz
 >  MPD_MPC_LICENSE = GPL-2.0+
 >  MPD_MPC_LICENSE_FILES = COPYING
 > -MPD_MPC_DEPENDENCIES = host-pkgconf libmpdclient
 > -MPD_MPC_CONF_ENV = ac_cv_prog_cc_c99='-std=c99'
 > +MPD_MPC_DEPENDENCIES = host-meson host-pkgconf libmpdclient
 
 > -$(eval $(autotools-package))
 > +MPD_MPC_CONF_OPTS += \
 > +	--prefix=/usr \
 > +	--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
 > +	--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf
 > +
 > +MPD_MPC_NINJA_OPTS = $(if $(VERBOSE),-v)

Same comment regarding -j option.

Committed, thanks.

-- 
Bye, Peter Korsgaard
