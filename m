From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Oct 2018 13:17:03 +0100
Subject: [Buildroot] [-v2] package/mosquitto: installing the mosquitto
 broker can be optional
In-Reply-To: <20181029165424.1282-1-titouan.christophe@railnova.eu> (Titouan
 Christophe's message of "Mon, 29 Oct 2018 17:54:24 +0100")
References: <20181024190103.24158-1-titouan.christophe@railnova.eu>
 <20181029165424.1282-1-titouan.christophe@railnova.eu>
Message-ID: <871s87hbnk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

 > The mosquitto package providess both the MQTT client library and
 > a broker, and the latter may be not needed (when connecting to
 > a remote broker). It should be therefore possible to not install and
 > start it on the target

 > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>

I don't see a changelog. You didn't change anything regarding the
toolchain dependencies. Does this mean that you also need mmu/sync for
just building the utilities or was this part just forgotten?

 >  define MOSQUITTO_INSTALL_STAGING_CMDS
 > -	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
 > +	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) DIRS=$(MOSQUITTO_MAKE_DIRS) \
 >  		$(MOSQUITTO_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
 >  endef
 
 >  define MOSQUITTO_INSTALL_TARGET_CMDS
 > -	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
 > +	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) DIRS=$(MOSQUITTO_MAKE_DIRS) \
 >  		$(MOSQUITTO_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
 >  	rm -f $(TARGET_DIR)/etc/mosquitto/*.example
 >  	$(INSTALL) -D -m 0644 $(@D)/mosquitto.conf \
 >  		$(TARGET_DIR)/etc/mosquitto/mosquitto.conf

Is mosquitto.conf also needed when the broker isn't installed?

-- 
Bye, Peter Korsgaard
