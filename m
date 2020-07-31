From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Fri, 31 Jul 2020 14:52:14 +0200
Subject: [Buildroot] [PATCH 15/15] docs/manual: add a section about
 SELinux
In-Reply-To: <CANQCQpbDOQyzYkfKuJKQzSN-V5+-KrrmuJSGOPL2wGrfsOEp1w@mail.gmail.com>
References: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
 <20200731101040.1723047-16-antoine.tenart@bootlin.com>
 <CANQCQpbDOQyzYkfKuJKQzSN-V5+-KrrmuJSGOPL2wGrfsOEp1w@mail.gmail.com>
Message-ID: <159619993383.1725162.13822977480980478846@kwain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matthew,

Quoting Matthew Weber (2020-07-31 14:15:50)
> On Fri, Jul 31, 2020 at 5:16 AM Antoine Tenart
> <antoine.tenart@bootlin.com> wrote:
> > +
> > +https://selinuxproject.org[SELinux] is a Linux kernel security module enforcing
> > +access control policies. In addition to the traditional file permissions and
> > +access control lists, +SELinux+ allows to write rules for users or processes to
> > +access specific functions of resources (files, sockets...).
> > +
> > ++SELinux+ has three modes of operating: +Enforcing+, +Permissive+ and
> > ++Disabled+.  If not +Disabled+, the kernel will apply the policy and
> > +non-authorized actions will be denied in +Enforcing+ mode or logged and reported
> > +in +Permissive+ mode.  +Permissive+ mode is often used for troubleshooting
> > +SELinux issues. In Buildroot this is controlled by the
> > ++BR2_PACKAGE_REFPOLICY_POLICY_STATE_*+ configuration options.
> 
> It may be worth also mentioning that the kernel has configuration
> options that play into if the modes are respected.  For example the
> kernel could have bootargs set, development mode or policy disabled.
> Maybe just adding a reference to the kernel.org kconfig would be
> enough (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/security/selinux/Kconfig)?

I think we could mention other Kconfig options are available in the
kernel and may have an impact on the SELinux policy behaviour. There's a
part about the kernel configuration below, I'll add it there.

> > +By default in Buildroot the +SELinux+ policy is provided by the upstream
> > +https://github.com/SELinuxProject/refpolicy[refpolicy] project, enabled with
> > ++BR2_PACKAGE_REFPOLICY+.
> > +
> > +[[enabling-selinux]]
> > +=== Enabling SELinux support
> > +
> > +To have proper support for +SELinux+ in a Buildroot generated system, the
> > +following configuration needs to be enabled:
> > +
> > +* +BR2_PACKAGE_REFPOLICY+
> > +* +BR2_PACKAGE_POLICYCOREUTILS+
> > +
> > +The Linux kernel configuration must also enable +SELinux+ support with
> > ++CONFIG_SECURITY_SELINUX+, +CONFIG_LSM+ (or using the +lsm+ kernel
> > +parameter) and extended attributes in filesystems (+CONFIG_EXT2_FS_XATTR+ for
> > ++ext2+, +CONFIG_SQUASHFS_XATTR+ for +squashfs+, etc...).
> > +
> 
> It looks like Buildroot via libselinux pkg is setting at least the
> following so the user won't have to be concerned with their kernel
> support.

Right. I'll keep this part, but say the configuration should be
magically fixed by libselinux.

> Unsure how to tie this into the documentation as the user won't have
> to enable more then the filesystem xattrs.  Maybe xattrs would make
> sense to globally turn on as well?

That should be possible, I don't know to what extend do we want to fix
the kernel configuration. As other SELinux Kconfig options are already
turned on by libselinux, I'd say that could make sense.

Thanks!
Antoine

-- 
Antoine T?nart, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
