From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 24 Apr 2008 23:21:50 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/java:	classpath
	concierge jamvm
In-Reply-To: <20080424164821.800223C7C2@busybox.net>
References: <20080424164821.800223C7C2@busybox.net>
Message-ID: <20080424212150.GE10167@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 24, 2008 at 09:48:21AM -0700, ninevoltz at uclibc.org wrote:
>Author: ninevoltz
>Date: 2008-04-24 09:48:20 -0700 (Thu, 24 Apr 2008)
>New Revision: 21845
>
>Log:
>bump to 0.97.1, removed patch as it has been already applied in upstream revision 0.97.0 (http://gcc.gnu.org/bugzilla/buglist.cgi?product=classpath&target_milestone=0.97)
>also fix change in package path that prevented patches from being applied
>
>Removed:
>   trunk/buildroot/package/java/classpath/classpath-avr32-endianness.patch
>
>Modified:
>   trunk/buildroot/package/java/classpath/classpath.mk
>   trunk/buildroot/package/java/concierge/concierge.mk
>   trunk/buildroot/package/java/jamvm/jamvm.mk
>
>
>Changeset:
>Deleted: trunk/buildroot/package/java/classpath/classpath-avr32-endianness.patch

>Modified: trunk/buildroot/package/java/concierge/concierge.mk
>===================================================================
>--- trunk/buildroot/package/java/concierge/concierge.mk	2008-04-24 14:26:48 UTC (rev 21844)
>+++ trunk/buildroot/package/java/concierge/concierge.mk	2008-04-24 16:48:20 UTC (rev 21845)
>@@ -10,19 +10,20 @@
> CONCIERGE_SITE_BUNDLES = http://concierge.sourceforge.net/bundles/
> 
> $(DL_DIR)/concierge:
>-	mkdir -p $(DL_DIR)/concierge/
>-	$(WGET) -P $(DL_DIR)/concierge/ $(CONCIERGE_SITE)/concierge-$(CONCIERGE_VERSION).jar
>-	$(WGET) -P $(DL_DIR)/concierge/ $(CONCIERGE_SITE_BUNDLES)shell-1.0.0.RC2.jar
>-	$(WGET) -P $(DL_DIR)/concierge/ $(CONCIERGE_SITE_BUNDLES)service-tracker-1.0.0.RC2.jar
>-	$(WGET) -P $(DL_DIR)/concierge/ $(CONCIERGE_SITE_BUNDLES)event-admin-1.0.0.RC2.jar
>+	 mkdir -p $(DL_DIR)/concierge/

Wow, now that's really broken, but ok, we can top that for sure

>+	 $(WGET) -P $(DL_DIR)/concierge/ $(CONCIERGE_SITE)/concierge-$(CONCIERGE_VERSION).jar
>+	 $(WGET) -P $(DL_DIR)/concierge/ $(CONCIERGE_SITE_BUNDLES)shell-1.0.0.RC2.jar
>+	 $(WGET) -P $(DL_DIR)/concierge/ $(CONCIERGE_SITE_BUNDLES)service-tracker-1.0.0.RC2.jar
>+	 $(WGET) -P $(DL_DIR)/concierge/ $(CONCIERGE_SITE_BUNDLES)event-admin-1.0.0.RC2.jar


> 
> $(TARGET_DIR)/usr/lib/concierge/: $(DL_DIR)/concierge

alright, that tops it.

>+	mkdir -p $(TARGET_DIR)/usr/lib
> 	mkdir -p $(TARGET_DIR)/usr/lib/concierge

oh yes.

> 	cp -dpf $(DL_DIR)/concierge/* $(TARGET_DIR)/usr/lib/concierge/
> 	cp -dpf package/concierge/files/init.xargs $(TARGET_DIR)/usr/lib/concierge/
> 	touch -c $@
> 
>-$(TARGET_DIR)/usr/bin/concierge:
>+$(TARGET_DIR)/usr/bin/concierge: 
> 	cp -dpf package/concierge/files/concierge $(TARGET_DIR)/usr/bin/
> 	chmod +x $(TARGET_DIR)/usr/bin/concierge
> 	touch -c $@

wow. My favourite by now still is the "mkdir -p", but not using
$(INSTALL) -m0775 -D here is just about as good.
Hard to decide what hunk deserves the attribute of
most-misguided-and-nonsensical hunk of this revision. Let's just wait
for the next one :(
