From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Apr 2014 00:32:50 +0200
Subject: [Buildroot] [PATCH 5/6] tz: new package
In-Reply-To: <9cca87f955e4a184666ee5e6a83e4ee242b0ebc7.1396900553.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 7 Apr 2014 21:58:07 +0200")
References: <cover.1396900553.git.yann.morin.1998@free.fr>
 <9cca87f955e4a184666ee5e6a83e4ee242b0ebc7.1396900553.git.yann.morin.1998@free.fr>
Message-ID: <874n23a1v1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
 > uClibc can not use timezone info from tzdata as-is, but accepts setting
 > the local timezone in /etc/TZ.

 > Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
 > [yann.morin.1998 at free.fr: make it a blind package; little tweak to help text]
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 > +++ b/package/tz/tz.mk
 > @@ -0,0 +1,30 @@
 > +################################################################################
 > +#
 > +# tz
 > +#
 > +################################################################################
 > +
 > +TZ_SOURCE =
 > +TZ_DEPENDENCIES = host-tzdata host-tzdump
 > +TZ_LICENSE = Public domain
 > +
 > +define TZ_BUILD_CMDS
 > +	(cd $(HOST_DIR)/usr/share/zoneinfo/posix/;                 \
 > +		for i in $$(find . -type f); do                    \
 > +			mkdir -p $(@D)/output/$$(dirname $$i);         \
 > +			$(TZDUMP) -p . -q $${i#./} > $(@D)/output/$$i; \
 > +		done                                               \
 > +	)
 > +endef
 > +
 > +define TZ_INSTALL_TARGET_CMDS
 > +	mkdir -p $(TARGET_DIR)/usr/share/zoneinfo/uclibc
 > +	cp -a $(@D)/output/* $(TARGET_DIR)/usr/share/zoneinfo/uclibc
 > +	if [ -n "$(BR2_TARGET_LOCALTIME)" ]; then                     \
 > +		ln -sf /usr/share/zoneinfo/uclibc/$(BR2_TARGET_LOCALTIME) \
 > +			$(TARGET_DIR)/etc/TZ;                                 \
 > +	fi

Same comments as for tzdata. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
