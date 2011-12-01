From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 1 Dec 2011 09:33:24 +0100
Subject: [Buildroot] [PATCH 1/1] igh-ethercat: new package
In-Reply-To: <8994d83580fbd41c89016f1cc35e10ecce46025b.1322691543.git.thomas.petazzoni@free-electrons.com>
References: <cover.1322691543.git.thomas.petazzoni@free-electrons.com>
 <8994d83580fbd41c89016f1cc35e10ecce46025b.1322691543.git.thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LVJ+QSdZOs2YUwFnKH2Y7gH6LJMXtJeaF5cAQA85YERmg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

First of all: nice work.
I was about to attempt creating a .mk file myself as well, but you beat me :-)

On Wed, Nov 30, 2011 at 11:19 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

> ---
> ?package/Config.in ? ? ? ? ? ? ? ? ? ?| ? ?1 +
> ?package/igh-ethercat/Config.in ? ? ? | ? 23 +++++++++++++++++++++++
> ?package/igh-ethercat/igh-ethercat.mk | ? 34 ++++++++++++++++++++++++++++++++++
> ?3 files changed, 58 insertions(+), 0 deletions(-)
> ?create mode 100644 package/igh-ethercat/Config.in
> ?create mode 100644 package/igh-ethercat/igh-ethercat.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 4b5e5d8..2ccdc1d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -412,6 +412,7 @@ source "package/dhcpdump/Config.in"
> ?source "package/dnsmasq/Config.in"
> ?source "package/dropbear/Config.in"
> ?source "package/ebtables/Config.in"
> +source "package/igh-ethercat/Config.in"
> ?source "package/ethtool/Config.in"
> ?source "package/hostapd/Config.in"
> ?if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS

It seems you renamed the package later, as the alphabetical order is
not correct anymore.

> diff --git a/package/igh-ethercat/Config.in b/package/igh-ethercat/Config.in
> new file mode 100644
> index 0000000..764a021
> --- /dev/null
> +++ b/package/igh-ethercat/Config.in
> @@ -0,0 +1,23 @@
> +config BR2_PACKAGE_IGH_ETHERCAT
> + ? ? ? bool "igh-ethercat"
> + ? ? ? depends on BR2_LINUX_KERNEL
> + ? ? ? help
> + ? ? ? ? IgH EtherCAT Master for Linux.
> +
> + ? ? ? ? http://www.etherlab.org/en/ethercat/index.php
> +
> +if BR2_PACKAGE_IGH_ETHERCAT
> +
> +config BR2_PACKAGE_IGH_ETHERCAT_8139TOO
> + ? ? ? bool "8139too driver"
> +
> +config BR2_PACKAGE_IGH_ETHERCAT_E100
> + ? ? ? bool "e100 driver"
> +
> +config BR2_PACKAGE_IGH_ETHERCAT_E1000
> + ? ? ? bool "e1000 driver"
> +
> +config BR2_PACKAGE_IGH_ETHERCAT_R8169
> + ? ? ? bool "r8169 driver"
> +
> +endif
> diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
> new file mode 100644
> index 0000000..eb49591
> --- /dev/null
> +++ b/package/igh-ethercat/igh-ethercat.mk
> @@ -0,0 +1,34 @@
> +IGH_ETHERCAT_VERSION = stable-1.5
> +IGH_ETHERCAT_SITE ? ?= http://etherlabmaster.hg.sourceforge.net/hgweb/etherlabmaster/etherlabmaster/archive/
> +IGH_ETHERCAT_SOURCE ?= $(IGH_ETHERCAT_VERSION).tar.bz2
> +IGH_ETHERCAT_AUTORECONF = YES
> +IGH_ETHERCAT_DEPENDENCIES = linux
> +IGH_ETHERCAT_INSTALL_STAGING = YES
> +
> +IGH_ETHERCAT_CONF_OPT = \
> + ? ? ? --with-linux-dir=$(LINUX_DIR)
> +
> +IGH_ETHERCAT_CONF_OPT += $(if $(BR2_PACKAGE_IGH_ETHERCAT_8139TOO),--enable-8139too,--disable-8139too)
> +IGH_ETHERCAT_CONF_OPT += $(if $(BR2_PACKAGE_IGH_ETHERCAT_E100),--enable-e100,--disable-e100)
> +IGH_ETHERCAT_CONF_OPT += $(if $(BR2_PACKAGE_IGH_ETHERCAT_E1000),--enable-e1000,--disable-e1000)
> +IGH_ETHERCAT_CONF_OPT += $(if $(BR2_PACKAGE_IGH_ETHERCAT_R8169),--enable-r8169,--disable-r8169)
> +
> +define IGH_ETHERCAT_CREATE_CHANGELOG
> + ? ? ? touch $(@D)/ChangeLog
> +endef
> +
> +IGH_ETHERCAT_POST_PATCH_HOOKS += IGH_ETHERCAT_CREATE_CHANGELOG

Maybe it's a good idea to add a comment here, e.g.
# Since we download ethercat from source control, we have to emulate
the bootstrap script that creates ChangeLog.
# We don't want to run that script directly, as it also runs
'autoreconf' which will be done by the autotargets infrastructure.

> +
> +define IGH_ETHERCAT_BUILD_MODULES
> + ? ? ? $(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) modules
> +endef
> +
> +IGH_ETHERCAT_POST_BUILD_HOOKS += IGH_ETHERCAT_BUILD_MODULES
> +
> +define IGH_ETHERCAT_INSTALL_MODULES
> + ? ? ? $(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) modules_install
> +endef
> +
> +IGH_ETHERCAT_POST_INSTALL_TARGET_HOOKS += IGH_ETHERCAT_INSTALL_MODULES
> +
> +$(eval $(call AUTOTARGETS))
> \ No newline at end of file

Shouldn't there be a newline here?

Best regards,
Thomas
