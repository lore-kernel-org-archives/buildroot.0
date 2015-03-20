From: Steven Noonan <steven@uplinklabs.net>
Date: Fri, 20 Mar 2015 14:19:25 -0700
Subject: [Buildroot] [PATCH] package: add pacman 4.2.1
In-Reply-To: <20150320213443.7dcf4817@free-electrons.com>
References: <1426736888-29437-1-git-send-email-steven@uplinklabs.net>
 <1426736888-29437-5-git-send-email-steven@uplinklabs.net>
 <20150320205209.2830b9bc@free-electrons.com>
 <CAKbGBLiyLf4JgiTrgN=w8YQu5xAgYHmt0UWysRGYxhjNWJjZeg@mail.gmail.com>
 <20150320213443.7dcf4817@free-electrons.com>
Message-ID: <CAKbGBLjGVfC0WneHefdVoGUsshFtDfAk_ReRtvp4tU-7uF+vyw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 20, 2015 at 1:34 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Steven Noonan,
>
> On Fri, 20 Mar 2015 13:18:46 -0700, Steven Noonan wrote:
>
>> > In addition to the comments made by Baruch, could you also include in
>> > the commit log a motivation for adding this package in Buildroot?
>> >
>> > It seems a bit weird to package the package manager of another distro.
>>
>> Why do we have RPM then? :)
>
> Well, to be honest I don't know how rpm compares to pacman. I believe
> the reason we have rpm and opkg is because some people might build
> their own binary packages (outside of Buildroot, since Buildroot
> doesn't allow building binary packages), and install them inside a
> Buildroot system.
>
>> If we don't want it in there I have no problem maintaining it in my
>> own tree.
>
> Well, it's that we don't want it, the package seems pretty simple, so
> it's not that a big issue. It's just that it's a bit unusual, and some
> explanations about the use case would be useful.
>

OK, fair enough. Pacman is fairly generally applicable and could work
fine for Buildroot (just as RPM could).

I have two distinct use cases:

- PXE Arch Linux installer ramdisks (ArchISO is a bit too big for my tastes)
- Minimalistic virtualization hosts

First, I'd like to use Buildroot to create a minimal PXE booted
ramdisk to do automated Arch Linux installs -- in order to do that, I
need pacman + the arch-install-scripts.

And second, which may be part of a larger discussion to have: I also
envision Buildroot being used to create very stripped down Linux
installs for virtualization hosts, i.e. kernel + bare minimum
userspace + xen/kvm/lxc. Most Xen/KVM/LXC admins seem to use full
desktop/server Linux installs on their virtualization hosts, but this
is really unnecessary and often is disruptive to guest operating
systems. I would contend people should really treat the privileged
domain (host) as an embedded system, especially to avoid contention
between guests and the host. For example, why would you want mandb or
updatedb running via cron on your host when you'll never use the
fruits of their labor there? All those do is consume resources that
could otherwise be used by a guest, and introduce observable latencies
in the guest environments. As for how this relates to Pacman: in order
to act as a minimal LXC host, the various Linux distribution package
managers are needed for 'lxc-create' with a template (e.g. Fedora has
the Debian and Arch package managers available in their repositories,
as odd as that may seem at first glance). In the case of KVM and Xen,
you're just dealing with disk images, so it's not necessary to have
the other distros' package managers.
