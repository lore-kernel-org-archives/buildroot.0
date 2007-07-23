From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 23 Jul 2007 15:34:00 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  alsa-lib
In-Reply-To: <1185196685.21840.25.camel@elrond.sweden.atmel.com>
References: <20070723075415.0C7BDA467A@busybox.net>
	<20070723103336.GA7044@aon.at>
	<1185196685.21840.25.camel@elrond.sweden.atmel.com>
Message-ID: <20070723133400.GC7902@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 23, 2007 at 03:18:05PM +0200, Ulf Samuelsson wrote:
>
>>+$(ALSA_LIB_DIR)/src/.libs/$(ALSA_LIB_BINARY): $(ALSA_LIB_DIR)/.configured
>> >+	$(MAKE) -C $(ALSA_LIB_DIR)
>> >+	@touch -c $@
>> >+
>> >+$(STAGING_DIR)/$(ALSA_LIB_TARGET_BINARY): $(ALSA_LIB_DIR)/src/.libs/$(ALSA_LIB_BINARY)
>> >+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(ALSA_LIB_DIR) install
>> >+	@touch -c $@
>> >+
>> >+$(TARGET_DIR)/$(ALSA_LIB_TARGET_BINARY): $(STAGING_DIR)/$(ALSA_LIB_TARGET_BINARY)
>> >+	@mkdir -p $(TARGET_DIR)/usr/share/alsa
>> >+	@mkdir -p $(TARGET_DIR)/usr/lib/alsa-lib
>> >+	cp -dpf  $(STAGING_DIR)/lib/libasound.so*  $(TARGET_DIR)/usr/lib/
>> >+	cp -rdpf $(STAGING_DIR)/usr/share/alsa/*   $(TARGET_DIR)/usr/share/alsa/
>> >+	cp -rdpf $(STAGING_DIR)/usr/lib/alsa-lib/* $(TARGET_DIR)/usr/lib/alsa-lib/
>> 
>> install(1) would be cleaner, especially if you consider that it's a new
>> package.
>
>make install is done on the staging dir.

make install != install(1)
man install
$(INSTALL) -D /thisfile /thatfile /there/newdir
or something like that.

>I think the reason for not doing make install on the target dir is
>that it will add a lot of other stuff which is not wanted on an embedded
>system.

This is unrelated but true, yes :)

>It is a matter of taste if you "install and remove", or just copy
>the *needed* stuff. 

I prefer to just copy the needed stuff.

>Have to discuss with Someone Else(tm) if you insist.

Just using install(1) for new packages -- and eventually gradually
fixing old ones -- is sufficient. We can easily either use busybox's
install or have our own in buildroot to circumvent eventual buggy
incarnations on the host. This would also help the MacOS10 folks, i'd
say.
