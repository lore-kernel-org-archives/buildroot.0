From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 31 Jul 2020 07:15:50 -0500
Subject: [Buildroot] [PATCH 15/15] docs/manual: add a section about
 SELinux
In-Reply-To: <20200731101040.1723047-16-antoine.tenart@bootlin.com>
References: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
 <20200731101040.1723047-16-antoine.tenart@bootlin.com>
Message-ID: <CANQCQpbDOQyzYkfKuJKQzSN-V5+-KrrmuJSGOPL2wGrfsOEp1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Antoine,


On Fri, Jul 31, 2020 at 5:16 AM Antoine Tenart
<antoine.tenart@bootlin.com> wrote:
>
> Add documentation about how to use SELinux in Buildroot, and what are
> the available mechanisms to extend and customize the SELinux policy.
>
> Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
> ---
>  docs/manual/manual.txt          |  2 +
>  docs/manual/selinux-support.txt | 66 +++++++++++++++++++++++++++++++++
>  2 files changed, 68 insertions(+)
>  create mode 100644 docs/manual/selinux-support.txt
>
> diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
> index 48de65ee1033..b5cc044805b1 100644
> --- a/docs/manual/manual.txt
> +++ b/docs/manual/manual.txt
> @@ -38,6 +38,8 @@ include::common-usage.txt[]
>
>  include::customize.txt[]
>
> +include::selinux-support.txt[]
> +
>  include::faq-troubleshooting.txt[]
>
>  include::known-issues.txt[]
> diff --git a/docs/manual/selinux-support.txt b/docs/manual/selinux-support.txt
> new file mode 100644
> index 000000000000..613b1c8f2275
> --- /dev/null
> +++ b/docs/manual/selinux-support.txt
> @@ -0,0 +1,66 @@
> +// -*- mode:doc; -*-
> +// vim: set syntax=asciidoc:
> +
> +[[selinux]]
> +== Using +SELinux+ in Buildroot
> +
> +https://selinuxproject.org[SELinux] is a Linux kernel security module enforcing
> +access control policies. In addition to the traditional file permissions and
> +access control lists, +SELinux+ allows to write rules for users or processes to
> +access specific functions of resources (files, sockets...).
> +
> ++SELinux+ has three modes of operating: +Enforcing+, +Permissive+ and
> ++Disabled+.  If not +Disabled+, the kernel will apply the policy and
> +non-authorized actions will be denied in +Enforcing+ mode or logged and reported
> +in +Permissive+ mode.  +Permissive+ mode is often used for troubleshooting
> +SELinux issues. In Buildroot this is controlled by the
> ++BR2_PACKAGE_REFPOLICY_POLICY_STATE_*+ configuration options.

It may be worth also mentioning that the kernel has configuration
options that play into if the modes are respected.  For example the
kernel could have bootargs set, development mode or policy disabled.
Maybe just adding a reference to the kernel.org kconfig would be
enough (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/security/selinux/Kconfig)?

> +
> +By default in Buildroot the +SELinux+ policy is provided by the upstream
> +https://github.com/SELinuxProject/refpolicy[refpolicy] project, enabled with
> ++BR2_PACKAGE_REFPOLICY+.
> +
> +[[enabling-selinux]]
> +=== Enabling SELinux support
> +
> +To have proper support for +SELinux+ in a Buildroot generated system, the
> +following configuration needs to be enabled:
> +
> +* +BR2_PACKAGE_REFPOLICY+
> +* +BR2_PACKAGE_POLICYCOREUTILS+
> +
> +The Linux kernel configuration must also enable +SELinux+ support with
> ++CONFIG_SECURITY_SELINUX+, +CONFIG_LSM+ (or using the +lsm+ kernel
> +parameter) and extended attributes in filesystems (+CONFIG_EXT2_FS_XATTR+ for
> ++ext2+, +CONFIG_SQUASHFS_XATTR+ for +squashfs+, etc...).
> +

It looks like Buildroot via libselinux pkg is setting at least the
following so the user won't have to be concerned with their kernel
support.  Unsure how to tie this into the documentation as the user
won't have to enable more then the filesystem xattrs.  Maybe xattrs
would make sense to globally turn on as well?

define LIBSELINUX_LINUX_CONFIG_FIXUPS
        $(call KCONFIG_ENABLE_OPT,CONFIG_AUDIT)
        $(call KCONFIG_ENABLE_OPT,CONFIG_DEFAULT_SECURITY_SELINUX)
        $(call KCONFIG_ENABLE_OPT,CONFIG_INET)
        $(call KCONFIG_ENABLE_OPT,CONFIG_NET)
        $(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY)
        $(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_NETWORK)
        $(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_SELINUX)
endef


Regards,
Matt
