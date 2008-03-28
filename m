From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 28 Mar 2008 21:41:36 +0100
Subject: [Buildroot] gcc 4.2.2 patch
In-Reply-To: <1206735722.3224.70.camel@nigel-x60>
References: <1206735722.3224.70.camel@nigel-x60>
Message-ID: <20080328204136.GN1783@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 28, 2008 at 08:22:02PM +0000, Nigel Kukard wrote:
>Is this patch ok to bump gcc to 4.2.2?
>
>I grep -r'd the buildroot tree and replaced each occurrence manually and
>removed 4.2.0.
>
>-N

>Index: package/lvm2/lvm2.mk
>===================================================================
>--- package/lvm2/lvm2.mk	(revision 21539)
>+++ package/lvm2/lvm2.mk	(working copy)
>@@ -64,7 +64,7 @@
> $(LVM2_TARGET_SBINS): $(LVM2_DIR)/.configured
> 	$(MAKE) CC=$(TARGET_CC) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR)
> 	$(MAKE) CC=$(TARGET_CC) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR) install
>-	for binary in $(LVM2_SBIN); do echo $$binary; cp -a $(STAGING_DIR)/sbin/$$binary $(TARGET_DIR)/sbin; done
>+	for binary in $(LVM2_SBIN); do echo $$binary; install -m0755 -p $(STAGING_DIR)/sbin/$$binary $(TARGET_DIR)/sbin; done

close.
Correct would have been to use $(INSTALL). Also the for loop doesn't
make too much sense, fwiw.

Something like this should do everything that is needed and is not
bloated:
	$(INSTALL) -D -m0755 $(patsubst %,$(STAGING_DIR)/sbin/%,$(LVM2_SBIN)) $(TARGET_DIR)/sbin/

Remember that this is *make* and not your favourite shell..
