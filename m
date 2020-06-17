From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Wed, 17 Jun 2020 13:55:58 -0500
Subject: [Buildroot] [PATCH v6] package/libvirt: new package
In-Reply-To: <20191024145817.3559-1-unixmania@gmail.com>
References: <20191024145817.3559-1-unixmania@gmail.com>
Message-ID: <CAMQcK5+dz7pMvYc4RWGXqEP2FPQ8pe8HrKhVwkY8qWduabxxrw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos,

Replying on behalf of Jared Bents <Jared.Bents@rockwellcollins.com>:

On Thu, Oct 24, 2019 at 9:59 AM <unixmania@gmail.com> wrote:
>
> From: Carlos Santos <unixmania@gmail.com>
>
> Libvirt is collection of software that provides a convenient way to
> manage virtual machines and other virtualization functionality, such as
> storage and network interface management. These software pieces include
> an API library, a daemon (libvirtd), and a command line utility (virsh).
>
>    http://libvirt.org/
>
> Thanks-to: DATACOM for providing hardware and software tools used to
>            develop and test this package.
>            https://www.datacom.com.br/en/produtos/network-appliance
>
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
> Supersedes: https://patchwork.ozlabs.org/patch/1180588/
> ---

[...]

> diff --git a/package/libvirt/libvirt.hash b/package/libvirt/libvirt.hash
> new file mode 100644
> index 0000000000..cb20627076
> --- /dev/null
> +++ b/package/libvirt/libvirt.hash
> @@ -0,0 +1,3 @@
> +# locally computed
> +sha256 e23328289b18bdedc1e966f6c26402b2983149c660ed8bd52cda6feab0c20c55  libvirt-5.8.0.tar.xz
> +sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
> new file mode 100644
> index 0000000000..8e6aaa73b5
> --- /dev/null
> +++ b/package/libvirt/libvirt.mk
> @@ -0,0 +1,377 @@
> +################################################################################
> +#
> +# libvirt
> +#
> +################################################################################
> +
> +LIBVIRT_VERSION = 5.8.0
> +LIBVIRT_SITE = https://libvirt.org/sources
> +LIBVIRT_SOURCE = libvirt-$(LIBVIRT_VERSION).tar.xz
> +LIBVIRT_LICENSE = LGPL-2.1+
> +LIBVIRT_LICENSE_FILES = COPYING
> +LIBVIRT_DEPENDENCIES = host-nfs-utils gnutls libxml2 udev
> +
> +LIBVIRT_CONF_ENV = \
> +       ac_cv_path_AUGPARSE=/dev/null \
> +       ac_cv_path_BRCTL=/usr/sbin/brctl \
> +       ac_cv_path_DMIDECODE=/usr/sbin/dmidecode \
> +       ac_cv_path_DMSETUP=/usr/sbin/dmsetup \
> +       ac_cv_path_DNSMASQ=/usr/sbin/dnsmasq \
> +       ac_cv_path_EBTABLES_PATH=/sbin/ebtables \
> +       ac_cv_path_IP_PATH=/sbin/ip
> +       ac_cv_path_IP6TABLES_PATH=/usr/sbin/ip6tables \
> +       ac_cv_path_IPTABLES_PATH=/usr/sbin/iptables \
> +       ac_cv_path_ISCSIADM=/usr/sbin/iscsiadm \
> +       ac_cv_path_LVCHANGE=/usr/sbin/lvchange \
> +       ac_cv_path_LVCREATE=/usr/sbin/lvcreate \
> +       ac_cv_path_LVREMOVE=/usr/sbin/lvremove \
> +       ac_cv_path_LVS=/usr/sbin/lvs \
> +       ac_cv_path_MKFS=/usr/sbin/mkfs \
> +       ac_cv_path_MODPROBE=/sbin/modprobe \
> +       ac_cv_path_MOUNT=/bin/mount \
> +       ac_cv_path_PARTED=/usr/sbin/parted \
> +       ac_cv_path_PKCHECK_PATH=/usr/bin/pkcheck \
> +       ac_cv_path_PVCREATE=/usr/sbin/pvcreate \
> +       ac_cv_path_PVREMOVE=/usr/sbin/pvremove \
> +       ac_cv_path_PVS=/usr/sbin/pvs \
> +       ac_cv_path_RADVD=/usr/sbin/radvd \
> +       ac_cv_path_RPCGEN=$(HOST_DIR)/bin/rpcgen \
> +       ac_cv_path_SHOWMOUNT=/usr/sbin/showmount \
> +       ac_cv_path_TC=/sbin/tc \
> +       ac_cv_path_UDEVADM=/sbin/udevadm \
> +       ac_cv_path_UMOUNT=/bin/umount \
> +       ac_cv_path_VGCHANGE=/usr/sbin/vgchange \
> +       ac_cv_path_VGCREATE=/usr/sbin/vgcreate \
> +       ac_cv_path_VGREMOVE=/usr/sbin/vgremove \
> +       ac_cv_path_VGS=/usr/sbin/vgs \
> +       ac_cv_path_VGSCAN=/usr/sbin/vgscan \
> +       ac_cv_path_XMLCATLOG=$(HOST_DIR)/bin/xmlcatalog \
> +       ac_cv_path_XMLLINT=$(HOST_DIR)/bin/xmllint \
> +       as_ln_s="ln -s"
> +
> +LIBVIRT_CONF_OPTS = \
> +       --disable-rpath \
> +       --without-apparmor \
> +       $(if $(BR2_PACKAGE_BASH_COMPLETION),--with,--without)-bash-completion \

--with-bash-completion needs to add a dependency on bash-completion.
This should be removed
from here and added down below similarly to how BR2_PACKAGE_AUDIT was handled.

> +       --without-bhyve \
> +       --without-dtrace \
> +       --without-esx \
> +       --without-firewalld \
> +       --without-firewalld-zone \
> +       --without-glusterfs \
> +       --without-hal \
> +       --with-host-validate \
> +       --without-hyperv \
> +       --with-init-script=$(if $(BR2_INIT_SYSTEMD),systemd,none) \
> +       --with-interface \
> +       --without-libxl \
> +       --without-login-shell \
> +       --without-netcf \
> +       --without-numad \
> +       --without-openwsman \
> +       --without-openvz \
> +       --without-phyp \
> +       --without-pm-utils \
> +       --with-remote \
> +       --without-sanlock \
> +       --without-secdriver-apparmor \
> +       --with-secrets \
> +       --without-storage-mpath \
> +       --without-storage-iscsi \
> +       --without-storage-iscsi-direct \
> +       --with-sysctl \
> +       --without-test-suite \
> +       --with-udev \
> +       --without-vmware \
> +       --without-vbox \
> +       --without-vz \
> +       --without-wireshark-dissector
> +
> +ifeq ($(BR2_PACKAGE_ATTR),y)
> +LIBVIRT_CONF_OPTS += --with-attr
> +LIBVIRT_DEPENDENCIES += attr
> +else
> +LIBVIRT_CONF_OPTS += --without-attr
> +endif
> +
> +ifeq ($(BR2_PACKAGE_AUDIT),y)
> +LIBVIRT_CONF_OPTS += --with-audit
> +LIBVIRT_DEPENDENCIES += audit
> +else
> +LIBVIRT_CONF_OPTS += --without-audit
> +endif

The below is what should be used for bash completion

ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
LIBVIRT_CONF_OPTS += --with-bash-completion
LIBVIRT_DEPENDENCIES += bash-completion
else
LIBVIRT_CONF_OPTS += --without-bash-completion
endif

> +
> +ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
> +LIBVIRT_CONF_OPTS += --with-blkid
> +LIBVIRT_DEPENDENCIES += util-linux
> +else
> +LIBVIRT_CONF_OPTS += --without-blkid
> +endif

[...]

Thanks,
-Ryan

---
Ryan Barnett | Sr Systems Engineer | Commercial Avionics
COLLINS AEROSPACE
400 Collins Rd NE, Cedar Rapids, IA 52498 USA
ryan.barnett at collins.com | collinsaerospace.com

CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.
