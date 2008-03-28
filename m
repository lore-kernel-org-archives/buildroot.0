From: Nigel Kukard <nkukard@lbsd.net>
Date: Fri, 28 Mar 2008 21:03:42 +0000
Subject: [Buildroot] gcc 4.2.2 patch
In-Reply-To: <20080328204136.GN1783@mx.loc>
References: <1206735722.3224.70.camel@nigel-x60> <20080328204136.GN1783@mx.loc>
Message-ID: <1206738222.3224.78.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> >Is this patch ok to bump gcc to 4.2.2?
> >
> >I grep -r'd the buildroot tree and replaced each occurrence manually and
> >removed 4.2.0.
> >
> >-N
> 
> >Index: package/lvm2/lvm2.mk
> >===================================================================
> >--- package/lvm2/lvm2.mk	(revision 21539)
> >+++ package/lvm2/lvm2.mk	(working copy)
> >@@ -64,7 +64,7 @@
> > $(LVM2_TARGET_SBINS): $(LVM2_DIR)/.configured
> > 	$(MAKE) CC=$(TARGET_CC) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR)
> > 	$(MAKE) CC=$(TARGET_CC) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR) install
> >-	for binary in $(LVM2_SBIN); do echo $$binary; cp -a $(STAGING_DIR)/sbin/$$binary $(TARGET_DIR)/sbin; done
> >+	for binary in $(LVM2_SBIN); do echo $$binary; install -m0755 -p $(STAGING_DIR)/sbin/$$binary $(TARGET_DIR)/sbin; done

Dammit ... I must stop diff'ing multiple changes! or I must stop
drinking while diff'ing  ;)

I'll commit the gcc bump above.

> close.
> Correct would have been to use $(INSTALL). Also the for loop doesn't
> make too much sense, fwiw.
> 
> Something like this should do everything that is needed and is not
> bloated:
> 	$(INSTALL) -D -m0755 $(patsubst %,$(STAGING_DIR)/sbin/%,$(LVM2_SBIN)) $(TARGET_DIR)/sbin/
> 
> Remember that this is *make* and not your favourite shell..

Thanks, I'll keep that in mind. I've found quite a number of for's in
the tree, if I come across them again I'll fix it.

-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080328/0be9b26e/attachment.pgp 
