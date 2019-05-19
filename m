From: michal.lyszczek at bofc.pl <michal.lyszczek@bofc.pl>
Date: Sun, 19 May 2019 10:32:16 +0200
Subject: [Buildroot] [PATCH v2 04/13] package/openrc: add support for
 spawning getty
In-Reply-To: <20190518232016.078e190e@windsurf>
References: <20190512195550.24457-1-michal.lyszczek@bofc.pl>
 <20190512195550.24457-4-michal.lyszczek@bofc.pl>
 <20190518232016.078e190e@windsurf>
Message-ID: <20190519083216.4kikzqwpyfyfct7l@c-ml-p3510.redembedded.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas
On 2019-05-18 23:20:16, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 12 May 2019 21:55:41 +0200
> Micha? ?yszczek <michal.lyszczek@bofc.pl> wrote:
> 
> > diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
> > index 53f2947dcc..0feea22818 100644
> > --- a/package/openrc/openrc.mk
> > +++ b/package/openrc/openrc.mk
> > @@ -42,4 +42,17 @@ define OPENRC_REMOVE_UNNEEDED
> >  endef
> >  OPENRC_TARGET_FINALIZE_HOOKS += OPENRC_REMOVE_UNNEEDED
> >  
> > +ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
> > +GETTY_SVCNAME = getty.$(SYSTEM_GETTY_PORT)
> > +GETTY_CONF_D = $(TARGET_DIR)/etc/conf.d/$(GETTY_SVCNAME)
> 
> The namespace of variables is global, so all variables defined by a
> package must be prefixed by the package name, here OPENRC_.

Right, didn't know that, thanks. Will fix.

> > +define OPENRC_SET_GETTY
> > +	echo "baud=\"$(SYSTEM_GETTY_BAUDRATE)\"" > $(GETTY_CONF_D)
> > +	echo "term_type=\"$(SYSTEM_GETTY_TERM)\"" >> $(GETTY_CONF_D)
> > +	echo "getty_options=\"-L $(SYSTEM_GETTY_OPTIONS)\"" >> $(GETTY_CONF_D)
> > +	ln -sf getty $(TARGET_DIR)/etc/init.d/$(GETTY_SVCNAME)
> > +	ln -sf /etc/init.d/$(GETTY_SVCNAME) $(TARGET_DIR)/etc/runlevels/default/$(GETTY_SVCNAME)
> > +endef
> > +OPENRC_TARGET_FINALIZE_HOOKS += OPENRC_SET_GETTY
> > +endif # BR2_TARGET_GENERIC_GETTY
> > +
> >  $(eval $(generic-package))
> > diff --git a/package/skeleton-init-openrc/skeleton/etc/conf.d/.empty b/package/skeleton-init-openrc/skeleton/etc/conf.d/.empty
> > new file mode 100644
> > index 0000000000..e69de29bb2
> > diff --git a/package/skeleton-init-openrc/skeleton/etc/init.d/getty b/package/skeleton-init-openrc/skeleton/etc/init.d/getty
> > new file mode 100755
> > index 0000000000..acae1b218b
> > --- /dev/null
> > +++ b/package/skeleton-init-openrc/skeleton/etc/init.d/getty
> 
> I am not sure: should this be part of the OpenRC skeleton package ? Or
> the OpenRC package itself ?

All init sysvinit/sysvinit.mk, busybox/busybox.mk systemd/systemd.mk has
BR2_TARGET_GENERIC_GETTY defined in their packages makefile and not
skeleton. It seemed consistent for me.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190519/c363eff9/attachment.asc>
