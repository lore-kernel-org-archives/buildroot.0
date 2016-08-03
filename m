From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Aug 2016 22:35:03 +0200
Subject: [Buildroot] [PATCH 1/1] gst1-plugins-bad: hls: allow user to
	select crypto backend
In-Reply-To: <57A1F5DA.9020507@imgtec.com> (Rahul Bedarkar's message of "Wed, 
 3 Aug 2016 19:17:06 +0530")
References: <1470226767-21018-1-git-send-email-rahul.bedarkar@imgtec.com>
 <20160803142925.3af9c6b7@free-electrons.com>
 <57A1F5DA.9020507@imgtec.com>
Message-ID: <87mvkth9qg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Rahul" == Rahul Bedarkar <Rahul.Bedarkar@imgtec.com> writes:

Hi,

 >> I'm not sure I want to see a choice for this. Could we instead have
 >> the .mk file automatically selected the backend according to which
 >> crypto package(s) are available?

 > HLS plugin only supports above three crypto backends. If user hasn't
 > specified which backend to use then build system tries find nettle or
 > libgcrypt or openssl in order. If none of the backend is available
 > then HLS plugin gets disabled internally.

 > Automatically selecting the backend based on which crypto packages are
 > available, will work only if atleast one of supported crypto packages
 > are selected already. If none of the supported packages are available,
 > then we may need to add dependency on one of those crypto packages in
 > .mk without selecting them in Config.in. That looks like broken
 > dependency ?

Yes, but we can do something like (untested):

config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS
        bool "hls"
        select BR2_PACKAGE_NETTLE if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_OPENSSL)
        help
          Fragmented streaming plugins

and then in the .mk:

ifeq ($(BR2_PACKAGE_NETTLE),y)
GST1_PLUGINS_BAD_DEPENDENCIES += nettle
GST1_PLUGINS_BAD_CONF_OPTS += --with-hls-crypto=nettle
else ifeq ($(BR2_PACKAGE_GNUTLS),y)
GST1_PLUGINS_BAD_DEPENDENCIES += libgcrypt
GST1_PLUGINS_BAD_CONF_OPTS += --with-hls-crypto=libgcrypt \
	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
else
GST1_PLUGINS_BAD_DEPENDENCIES += openssl
GST1_PLUGINS_BAD_CONF_OPTS += --with-hls-crypto=openssl
endif

-- 
Bye, Peter Korsgaard
