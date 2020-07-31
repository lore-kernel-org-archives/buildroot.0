From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 31 Jul 2020 10:08:12 -0700
Subject: [Buildroot] [PATCH 00/15] Improve SELinux support
In-Reply-To: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
References: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
Message-ID: <CAFSsvmrU12Q9p=A0MmAWeK3dScyn4RSQY=69MJD1GcCZ0Bb_tA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello;

On Fri, Jul 31, 2020 at 3:15 AM Antoine Tenart
<antoine.tenart@bootlin.com> wrote:
>
> Hi all,
>
> This series aims at providing proper SELinux support in Buildroot. Some
> of the building blocks were available, such as packages for refpolicy,
> policycoreutils or libselinux; but getting to a point were a generated
> image could be used with a loaded SELinux policy was not
> straightforward. The series also adds support for customizing the
> SELinux policy through various ways.
>
I have been meaning to do this for a very long time! Thank you for going
through this hassle for me!


> The first missing block was the ability to generate an SELinux-ready
> image. SELinux depends on files' extended attributes, set based on the
> policy. Those attributes could be set from within a running system with
> the restorecon utility but that meant we had to special case the first
> boot. That also prevented to build an image with SELinux in enforcing
> mode as the first boot would have failed. This is fixed by setting and
> copying files' extended attributes when generating filesystem images.
> See patches 1 to 3.

I have been bothered by this for years as well, and this is  a great first
step.

>
> Then more control is provided over what is included in the refpolicy. By
> default the refpolicy provides lots of modules and rules for many
> packages. All of those packages are not necessarily part of the target
> system but all are built, resulting in a large monolithic policy and
> lots of unused rules. We reworked the refpolicy to only include by
> default 'base' modules and a small list of always-needed others. The
> result is a much smaller binary policy. See patch 4.
>
> On top of the more minimal SELinux policy, ways are provided in patches
> 5 to 14 to enable or provide extra modules. That allows to:
>
> - Enable modules provided within the refpolicy from Buildroot packages
>   so that the resulting policy does include all the required rules. For
>   example, the dbus Buildroot packages enable the 'dbus' SELinux module
>   available in the refpolicy.

Excellent idea!
>
> - Provide extra SELinux modules to be built in the policy, from
>   Buildroot packages.

This was a huge feature I also wanted to provide, as there are several
packages that will need custom support such as the login application. (iirc)

>
> - Enable modules available in the refpolicy from the Buildroot
>   configuration.
>
> - Provide extra modules in user-defined folders.
>
> - Override the location of the refpolicy source and all of the above
>   mechanisms, as when designing a fully custom system, one could want to
>   provide a fully custom SELinux policy.
>

Any chance of supporting a modular policy in the future? :)

> Finally, the documentation is updated in patch 15 to explain how to use
> SELinux within Buildroot.
>
Perhaps a test-case would be in order as well?

> Thanks!
> Antoine
>

Overall, this is a wonderful, long-needed patch series of which I am incredibly
excited to review!

I will provide feedback hopefully by the end of today!

Adam

> Antoine Tenart (15):
>   package/e2fsprogs: set xattrs for the root dir as well
>   fs/common.mk: set SELinux file security contexts
>   fs/common.mk: move down ROOTFS_REPRODUCIBLE for consistency
>   package/refpolicy: smaller monolithic policy
>   package/refpolicy: allow packages to select SELinux modules
>   package/systemd: select SELinux modules
>   package/dbus: select SELinux module
>   package/util-linux: select SELinux module
>   package/e2fsprogs: select SELinux module
>   package/refpolicy: allow providing user defined modules
>   package/refpolicy: allow selecting additional modules
>   package/refpolicy: allow to provide a custom refpolicy
>   package/refpolicy: allow packages to provide their own SELinux modules
>   package/refpolicy: fix the configure, build and install steps
>   docs/manual: add a section about SELinux
>
>  docs/manual/manual.txt                        |  2 +
>  docs/manual/selinux-support.txt               | 66 ++++++++++++++++
>  fs/common.mk                                  | 23 ++++--
>  package/dbus/dbus.mk                          |  2 +
>  ...-xattrs-to-the-root-directory-as-wel.patch | 46 +++++++++++
>  package/e2fsprogs/e2fsprogs.mk                |  2 +
>  package/pkg-generic.mk                        |  6 ++
>  package/refpolicy/Config.in                   | 54 +++++++++++++
>  package/refpolicy/refpolicy.mk                | 78 +++++++++++++++++--
>  package/systemd/systemd.mk                    |  2 +
>  package/util-linux/util-linux.mk              |  4 +
>  11 files changed, 274 insertions(+), 11 deletions(-)
>  create mode 100644 docs/manual/selinux-support.txt
>  create mode 100644 package/e2fsprogs/0001-create_inode-set-xattrs-to-the-root-directory-as-wel.patch
>
> --
> 2.26.2
>
