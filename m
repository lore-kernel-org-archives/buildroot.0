From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Jun 2015 02:57:37 +0200
Subject: [Buildroot] [PATCH 11/12] grub2: prepare and install El Torito
 image
In-Reply-To: <20150605230911.GN3641@free.fr>
References: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433430330-2166-12-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150605230911.GN3641@free.fr>
Message-ID: <20150606025737.4f5a6567@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 6 Jun 2015 01:09:11 +0200, Yann E. MORIN wrote:

> > diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
> > index 697f0ad..dd04bb3 100644
> > --- a/boot/grub2/grub2.mk
> > +++ b/boot/grub2/grub2.mk
> > @@ -76,6 +76,8 @@ define GRUB2_IMAGE_INSTALLATION
> >  		-p "$(GRUB2_PREFIX)" \
> >  		$(if $(GRUB2_BUILTIN_CONFIG),-c $(GRUB2_BUILTIN_CONFIG)) \
> >  		$(GRUB2_BUILTIN_MODULES)
> > +	cat $(HOST_DIR)/usr/lib/grub/$(GRUB2_TUPLE)/cdboot.img \
> > +		$(GRUB2_IMAGE) > $(HOST_DIR)/usr/lib/grub/$(GRUB2_TUPLE)/grub-eltorito.img
> 
> In retrospect, I think you should install that in $(BINARIES_DIR), like
> is done for $(GRUB2_IMAGE), not in $(HOST_DIR).

Well, I had a reason to install it in HOST_DIR rather than
BINARIES_DIR. Since I'm producing this image unconditionally, even if
the user is not interested in ISO9660, I didn't want to clutter
BINARIES_DIR with this file, which would appear as soon as the user
enables grub2. So I preferred to install it together with all the other
"internal" Grub images in HOST_DIR, and pick it up from there in the
iso9660.mk logic.

Now, if you think cluttering BINARIES_DIR with this file only useful
for ISO booting as soon as Grub 2 is enabled is fine, then I'll happily
change it.

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
