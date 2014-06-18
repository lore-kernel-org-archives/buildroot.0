From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 18 Jun 2014 14:18:46 +0200
Subject: [Buildroot] [PATCH 2/3] netatalk: add support for zeroconf
In-Reply-To: <1402943011-12166-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 16 Jun 2014 15:23:30 -0300")
References: <1402943011-12166-1-git-send-email-gustavo@zacarias.com.ar>
 <1402943011-12166-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87d2e64di1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/netatalk/netatalk.mk | 8 +++++++-
 >  1 file changed, 7 insertions(+), 1 deletion(-)

 > diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
 > index 1285af2..ab628a4 100644
 > --- a/package/netatalk/netatalk.mk
 > +++ b/package/netatalk/netatalk.mk
 > @@ -19,7 +19,6 @@ NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99" \
 >  	ac_cv_path_NETA_LDCONFIG=""
 >  NETATALK_CONF_OPT += --with-cnid-cdb-backend \
 >  	--with-bdb=$(STAGING_DIR)/usr \
 > -	--disable-zeroconf \
 >  	--with-ssl-dir=$(STAGING_DIR)/usr \
 >  	--with-libgcrypt-dir=$(STAGING_DIR)/usr \
 >  	--with-shadow \
 > @@ -30,6 +29,13 @@ NETATALK_CONF_OPT += --with-cnid-cdb-backend \
 >  	--with-dtrace=no \
 >  	--with-mysql-config=no
 
 > +ifeq ($(BR2_PACKAGE_AVAHI)$(BR2_PACKAGE_DBUS),yy)
 > +	NETATALK_DEPENDENCIES += avahi
 > +	NETATALK_CONF_OPT += --enable-zeroconf=$(STAGING_DIR)/usr

The dependencies for libavahi-client is avahi with the daemon and dbus,
so this should be:

ifeq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yy)

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
