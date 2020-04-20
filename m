From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Apr 2020 13:54:54 +0200
Subject: [Buildroot] [PATCH] package/modem-manager: use libqmi and
 libmbim if they are selected
In-Reply-To: <CAAP7ucJXDvXxAjDKYLxTiBhakitTv7ri4yi0b4sT8qZJg=LCaw@mail.gmail.com>
References: <20191104124844.8112-1-unixmania@gmail.com>
 <20200419230056.7df2d309@windsurf.home>
 <CAAP7ucJXDvXxAjDKYLxTiBhakitTv7ri4yi0b4sT8qZJg=LCaw@mail.gmail.com>
Message-ID: <20200420135454.5933877d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Aleksander,

On Mon, 20 Apr 2020 11:11:45 +0200
Aleksander Morgado <aleksander@aleksander.es> wrote:

> >  - Change modem-manager.mk to test BR2_PACKAGE_LIBMBIM and
> >    BR2_PACKAGE_QMI instead of BR2_PACKAGE_MODEM_MANAGER_LIBMBIM and
> >    BR2_PACKAGE_MODEM_MANAGER_LIBQMI.
> >  
> 
> I'm not sure what you mean with the above paragraph. What do you mean
> with e.g. "testing" BR2_PACKAGE_LIBMBIM instead of
> BR2_PACKAGE_:MODEM_MANAGER_LIBMBIM?

I mean this:

diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 75fc5811db..6b4e9b6250 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -13,7 +13,7 @@ MODEM_MANAGER_DEPENDENCIES = host-pkgconf libglib2 $(TARGET_NLS_DEPENDENCIES)
 MODEM_MANAGER_INSTALL_STAGING = YES
 MODEM_MANAGER_CONF_OPTS = --disable-more-warnings
 
-ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQMI),y)
+ifeq ($(BR2_PACKAGE_LIBQMI),y)
 MODEM_MANAGER_DEPENDENCIES += libqmi
 MODEM_MANAGER_CONF_OPTS += --with-qmi
 else
@@ -27,7 +27,7 @@ else
 MODEM_MANAGER_CONF_OPTS += --without-udev
 endif
 
-ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBMBIM),y)
+ifeq ($(BR2_PACKAGE_LIBMBIM),y)
 MODEM_MANAGER_DEPENDENCIES += libmbim
 MODEM_MANAGER_CONF_OPTS += --with-mbim
 else

> > Also, as was pointed out during the discussion, it would be good to
> > change the network-manager package to not force the modem-manager
> > MBIM/QMI support when modem-manager support is enabled. I.e, remove the
> > following lines:
> >
> >         select BR2_PACKAGE_MODEM_MANAGER_LIBMBIM
> >         select BR2_PACKAGE_MODEM_MANAGER_LIBQMI
> >
> > from package/network-manager/Config.in
> >  
> 
> I agree with this change in NM, I'll send a patch for that. But is it
> just removing those lines?

Yes.

> Ideally, MBIM and QMI (and QMI over MBIM) support should be "the
> default" when building MM, and the users can disable them explicitly
> if not required. I'm not sure how to handle that in buildroot, truth
> be told.

Normally, the Buildroot policy is to make all features optional in the
upstream software really optional in Buildroot as well. I.e, if
modem-manager can build and be useful with qmi/mbim support, then we
shouldn't force to build the modem-manager support with qmi/mbim
support.

Is modem-manager completely useless without qmi/mbim support ? Does
network-manager absolutely requires qmi/mbim support in modem-manager ?

If not, then qmi/mbim should be optional, and not force-selected by
network-manager when enabling modem-manager support.

Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
