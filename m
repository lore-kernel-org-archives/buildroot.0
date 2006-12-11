From: Thomas Lundquist <lists@zelow.no>
Date: Mon, 11 Dec 2006 22:56:48 +0100
Subject: [Buildroot] [patch] qtopia4
In-Reply-To: <20061211134347.GA21997@aon.at>
References: <20061211093336.GA11591@zelow.no> <20061211102408.GB20661@aon.at>
	<20061211120041.GB11591@zelow.no> <20061211134347.GA21997@aon.at>
Message-ID: <20061211215648.GA15000@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 11, 2006 at 02:43:47PM +0100, Bernhard Fischer wrote:
> 
> No. Some people who only have "gzip -d -c" but no zcat will stumble
> across this. Please use $(ZCAT) -- or $(BZCAT) for bz2.

fixed. just forgot that it's like that now.

> >+BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME)))
> >+#"
> 
> cosmetics, but looks like there are some closing parentheses missing to
> make vi happy..

I count three of each (open and close).

But checking the package/Makefile.in I notice that they have been added
there aswell.

So, ok.

> Why spawn a subshell? Can't you just $(subst ",,$()) like for the
> username?

but of course.

> >+
> >+ifeq ($(BR2_LARGEFILE),y)
> >+QTOPIA4_LARGEFILE=-no-largefile
> >+else
> >+QTOPIA4_LARGEFILE=-no-largefile
> >+endif
> 
> No way to toggle largefile-support on, even if asked to?

*blush*

> >+	$(SED) 's/-O2/-Os/;' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
> 
> shouldn't this rather be
> s/-O2/-Os $(TARGET_CFLAGS)/

then it could be 
s/-O2/$(TARGET_CFLAGS)/

since -Os should be included.

Something tells me that I shouldn't do that here. Don't ask me why, I
spent quite alot of time getting qtopia to compile at all.

> Also, all trailing command separators (i.e. ';') in sed are superfluous.

It's a habit. Any real reason we should make it a requirement not to
have it or is it just for looks?

> >+	cp $(QTOPIA4_QCONFIG_FILE) \
> >+	 	$(QTOPIA4_TARGET_DIR)/$(QTOPIA4_QCONFIG_FILE_LOCATION)
> >+	(cd $(QTOPIA4_TARGET_DIR); rm -rf config.cache; \
> >+		PATH=$(TARGET_PATH) \
> >+		CFLAGS="$(TARGET_CFLAGS)" \
> >+		CXXFLAGS="$(TARGET_CXXFLAGS)" \
> 
> Sounds like this is will break for anybody that doesn't have a plain
> "gcc" nor "g++" binary. Honor the user's HOSTCC and HOSTCXX vars,
> please.

If Troll/qtopia would, I would.
(No, they don't seem to honour CC nor CXX)

> >+$(QTOPIA4_TARGET_DIR)/lib/libQtCore.so.$(QTOPIA4_VER): $(QTOPIA4_TARGET_DIR)/.configured
> >+	# $(TARGET_CONFIGURE_OPTS) $(MAKE) PATH=$(STAGING_DIR)/bin:$(STAGING_DIR)/usr/bin:$$PATH CROSS_COMPILE=$(KERNEL_CROSS) CC=$(TARGET_CC) -C $(QTOPIA4_TARGET_DIR)
> >+	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
> >+		-C $(QTOPIA4_TARGET_DIR) sub-src
> >+	touch $(QTOPIA4_TARGET_DIR)/.compiled
> 
> Doesn't sound correct, or does QT create the .compiled file and you just
> update it's timestamp here?

Ehh, old gruff. Not needed any more.

> >+		# -C $(QTOPIA4_TARGET_DIR) sub-src

> Please remove the above.

removed the superfluous comments.

> *.so.*, not *.so* ?

both works.

I'll send you a new patch with or without ;.
(and if you really don't want them I guess I have to remove them from
other packages I've planned to submit.)


Thomas.
