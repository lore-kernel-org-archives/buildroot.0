From: Ulf Samuelsson <ulf@atmel.com>
Date: Sun, 23 Sep 2007 16:20:54 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <20070923111328.GC20058@aon.at>
References: <20070923095847.0E10030058@busybox.net>
	<20070923111328.GC20058@aon.at>
Message-ID: <1190557254.7015.7.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

s?n 2007-09-23 klockan 13:13 +0200 skrev Bernhard Fischer:
> On Sun, Sep 23, 2007 at 02:58:47AM -0700, ulf at uclibc.org wrote:
> >Author: ulf
> >Date: 2007-09-23 02:58:47 -0700 (Sun, 23 Sep 2007)
> >New Revision: 19960
> >
> >Log:
> >Use correct path to vmlinux, Fix bad SED of config
> >
> >Modified:
> >   trunk/buildroot/target/linux/Makefile.in
> >
> >
> >Changeset:
> >Modified: trunk/buildroot/target/linux/Makefile.in
> >===================================================================
> >--- trunk/buildroot/target/linux/Makefile.in	2007-09-23 09:56:21 UTC (rev 19959)
> >+++ trunk/buildroot/target/linux/Makefile.in	2007-09-23 09:58:47 UTC (rev 19960)
> >@@ -143,7 +147,7 @@
> > 
> > $(LINUX26_DIR)/.configured: $(LINUX26_DIR)/.patched $(LINUX26_KCONFIG)
> > 	cp -dpf $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
> >-	$(SED) '/CONFIG_AEABI/d' $(LINUX26_DIR)/.config
> >+	$(SED) '/CONFIG_AEABI=y/d' $(LINUX26_DIR)/.config
> 
> What's wrong with that?
> /CONFIG_AEABI/d is the proper thing to do to erase all occurances.
> 
> > ifeq ($(BR2_ARM_EABI),y)
> > 	echo "CONFIG_AEABI=y" >> $(LINUX26_DIR)/.config
> > 	$(SED) '/CONFIG_OABI_COMPAT/d' $(LINUX26_DIR)/.config
> >@@ -151,7 +155,7 @@
> > else
> > 	echo "# CONFIG_AEABI is not set" >> $(LINUX26_DIR)/.config
> > endif
> >-	$(SED) '/CONFIG_IPV6/d' $(LINUX26_DIR)/.config
> >+	$(SED) '/CONFIG_IPV6=y/d' $(LINUX26_DIR)/.config
> 
> ditto.

This erases all CONFIG_IPV6_* as well, even when commented away,
so when "make oldconfig" done, the build stops and waits
for a value of those configuration items.

I would like the build to progress without user input.


BR
Ulf Samuelsson
