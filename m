From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Mar 2017 23:54:41 +0100
Subject: [Buildroot] [Patch v3 9/9] s6-linux-init: new package
In-Reply-To: <1482182955-23916-10-git-send-email-eric.le.bihan.dev@free.fr>
 (Eric Le Bihan's message of "Mon, 19 Dec 2016 22:29:15 +0100")
References: <1482182955-23916-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1482182955-23916-10-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <87shmgyeha.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric Le Bihan <eric.le.bihan.dev@free.fr> writes:

 > This new package provides s6-linux-init, a set of minimalistic tools to
 > create a s6-based init system, including a /sbin/init program, on a
 > machine running a Linux kernel.

Hmm, should this then be added as one of the available init options in
the system menu? Or if not, at least depend on BR2_INIT_NONE to ensure
no other init system overwrites /sbin/init?


 > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
 > ---
 >  package/Config.in                        |  1 +
 >  package/s6-linux-init/Config.in          | 11 ++++++++++
 >  package/s6-linux-init/s6-linux-init.hash |  2 ++
 >  package/s6-linux-init/s6-linux-init.mk   | 36 ++++++++++++++++++++++++++++++++
 >  4 files changed, 50 insertions(+)
 >  create mode 100644 package/s6-linux-init/Config.in
 >  create mode 100644 package/s6-linux-init/s6-linux-init.hash
 >  create mode 100644 package/s6-linux-init/s6-linux-init.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index 29d9121..a7d70eb 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -1761,6 +1761,7 @@ menu "System tools"
 >  	source "package/rsyslog/Config.in"
 >  	source "package/runc/Config.in"
 >  	source "package/s6/Config.in"
 > +	source "package/s6-linux-init/Config.in"
 >  	source "package/s6-linux-utils/Config.in"
 >  	source "package/s6-portable-utils/Config.in"
 >  	source "package/s6-rc/Config.in"
 > diff --git a/package/s6-linux-init/Config.in b/package/s6-linux-init/Config.in
 > new file mode 100644
 > index 0000000..db07e69
 > --- /dev/null
 > +++ b/package/s6-linux-init/Config.in
 > @@ -0,0 +1,11 @@
 > +config BR2_PACKAGE_S6_LINUX_INIT
 > +	bool "s6-linux-init"
 > +	select BR2_PACKAGE_S6
 > +	select BR2_PACKAGE_S6_LINUX_UTILS
 > +	select BR2_PACKAGE_S6_PORTABLE_UTILS
 > +	depends on BR2_USE_MMU # s6
 > +	help
 > +	  s6-linux-init is a set of minimalistic tools to create a s6-based
 > +	  init system, including a /sbin/init binary, on a Linux kernel.
 > +
 > +	  http://skarnet.org/software/s6-linux-init/
 > diff --git a/package/s6-linux-init/s6-linux-init.hash b/package/s6-linux-init/s6-linux-init.hash
 > new file mode 100644
 > index 0000000..e02e391
 > --- /dev/null
 > +++ b/package/s6-linux-init/s6-linux-init.hash
 > @@ -0,0 +1,2 @@
 > +# Locally generated
 > +sha256 131484e61eff0e671e112f0436b13e8e7d08752f810d8bec4924a68383eee2b9 s6-linux-init-0.2.0.0.tar.gz
 > diff --git a/package/s6-linux-init/s6-linux-init.mk b/package/s6-linux-init/s6-linux-init.mk
 > new file mode 100644
 > index 0000000..112e176
 > --- /dev/null
 > +++ b/package/s6-linux-init/s6-linux-init.mk
 > @@ -0,0 +1,36 @@
 > +################################################################################
 > +#
 > +# s6-linux-init
 > +#
 > +################################################################################
 > +
 > +S6_LINUX_INIT_VERSION = 0.2.0.0
 > +S6_LINUX_INIT_SITE = http://skarnet.org/software/s6-linux-init
 > +S6_LINUX_INIT_LICENSE = ISC
 > +S6_LINUX_INIT_LICENSE_FILES = COPYING
 > +S6_LINUX_INIT_DEPENDENCIES = s6 s6-linux-utils s6-portable-utils
 > +
 > +S6_LINUX_INIT_CONF_OPTS = \
 > +	--prefix=/usr \
 > +	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
 > +	--with-include=$(STAGING_DIR)/usr/include \
 > +	--with-dynlib=$(STAGING_DIR)/usr/lib \
 > +	--with-lib=$(STAGING_DIR)/usr/lib/execline \
 > +	--with-lib=$(STAGING_DIR)/usr/lib/s6 \
 > +	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
 > +	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
 > +	$(SHARED_STATIC_LIBS_OPTS)
 > +
 > +define S6_LINUX_INIT_CONFIGURE_CMDS
 > +	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(S6_LINUX_INIT_CONF_OPTS))
 > +endef
 > +
 > +define S6_LINUX_INIT_BUILD_CMDS
 > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 > +endef
 > +
 > +define S6_LINUX_INIT_INSTALL_TARGET_CMDS
 > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 > +endef
 > +
 > +$(eval $(generic-package))
 > -- 
 > 2.5.5

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
