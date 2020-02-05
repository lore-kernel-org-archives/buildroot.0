From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 05 Feb 2020 15:57:31 +0100
Subject: [Buildroot] [PATCH 1/1] system: don't attempt swapon/swapoff in
 inittab if not available
In-Reply-To: <20200205125519.15246-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Wed, 5 Feb 2020 13:55:18 +0100")
References: <20200205125519.15246-1-patrickdepinguin@gmail.com>
Message-ID: <87wo91ulno.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > The default inittab files added by busybox and sysvinit run 'swapon -a'
 > during init and 'swapoff -a' during shutdown.

 > But, the swapon/swapoff programs are not guaranteed to be
 > available. For the busybox versions, it is steered by
 > CONFIG_SWAPON/CONFIG_SWAPOFF. For the util-linux versions, it is steered by
 > BR2_PACKAGE_UTIL_LINUX_BINARIES.

 > In a case where swapon/swapoff is not available but the inittab tries to
 > execute them, the boot log would be polluted by error messages like:

 >     swapon: not found

 > Avoid this by commenting out the swapon/swapoff lines if the swapon/swapoff
 > binaries are not available.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > ---
 >  package/busybox/busybox.mk   |  1 +
 >  package/sysvinit/sysvinit.mk |  1 +
 >  system/system.mk             | 13 +++++++++++++
 >  3 files changed, 15 insertions(+)

 > diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
 > index 6283bc96ea..45f74271f2 100644
 > --- a/package/busybox/busybox.mk
 > +++ b/package/busybox/busybox.mk
 > @@ -226,6 +226,7 @@ endif # BR2_TARGET_GENERIC_GETTY
 >  BUSYBOX_TARGET_FINALIZE_HOOKS += BUSYBOX_SET_GETTY
 
 >  BUSYBOX_TARGET_FINALIZE_HOOKS += SYSTEM_REMOUNT_ROOT_INITTAB
 > +BUSYBOX_TARGET_FINALIZE_HOOKS += SYSTEM_UPDATE_SWAPON_SWAPOFF_INITTAB
 
 >  endif # BR2_INIT_BUSYBOX
 
 > diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
 > index c778a9cde5..a717ae0459 100644
 > --- a/package/sysvinit/sysvinit.mk
 > +++ b/package/sysvinit/sysvinit.mk
 > @@ -45,5 +45,6 @@ endif # BR2_TARGET_GENERIC_GETTY
 >  SYSVINIT_TARGET_FINALIZE_HOOKS += SYSVINIT_SET_GETTY
 
 >  SYSVINIT_TARGET_FINALIZE_HOOKS += SYSTEM_REMOUNT_ROOT_INITTAB
 > +SYSVINIT_TARGET_FINALIZE_HOOKS += SYSTEM_UPDATE_SWAPON_SWAPOFF_INITTAB
 
 >  $(eval $(generic-package))
 > diff --git a/system/system.mk b/system/system.mk
 > index 8db87cb129..df6e1be693 100644
 > --- a/system/system.mk
 > +++ b/system/system.mk
 > @@ -87,6 +87,19 @@ define SYSTEM_REMOUNT_ROOT_INITTAB
 >  endef
 >  endif
 
 > +define SYSTEM_UPDATE_SWAPON_SWAPOFF_INITTAB
 > +	if [ -e $(TARGET_DIR)/sbin/swapon ]; then \
 > +		$(SED) '\%:/sbin/swapon%s/^#*//' $(TARGET_DIR)/etc/inittab ; \
 > +	else \
 > +		$(SED) '\%:/sbin/swapon%s/^#*/#/' $(TARGET_DIR)/etc/inittab ; \
 > +	fi
 > +	if [ -e $(TARGET_DIR)/sbin/swapoff ]; then \
 > +		$(SED) '\%:/sbin/swapoff%s/^#*//' $(TARGET_DIR)/etc/inittab ; \
 > +	else \
 > +		$(SED) '\%:/sbin/swapoff%s/^#*/#/' $(TARGET_DIR)/etc/inittab ; \
 > +	fi

It seems a bit more "normal" to check for execute permissions, like we
do in alsa-utils.mk, so I changed it to -x and committed, thanks.

-- 
Bye, Peter Korsgaard
