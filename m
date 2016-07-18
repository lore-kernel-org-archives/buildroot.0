From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jul 2016 22:19:35 +0200
Subject: [Buildroot] [PATCH 00/12 v8] Introduce libudev (branch
 yem/libudev-4)
In-Reply-To: <20160718175241.GA3738@free.fr>
References: <cover.1468274498.git.yann.morin.1998@free.fr>
 <20160716154736.19dd42fb@free-electrons.com>
 <20160718175241.GA3738@free.fr>
Message-ID: <20160718221935.3dbad2da@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Jul 2016 19:52:41 +0200, Yann E. MORIN wrote:

> That is *not* about size; I don't think I even ever made that point as a
> reason to have only libudev.

OK, then I really don't see the point.

> > So I'm not sure if it's really worth the effort. After all, installing
> > only libudev without eudev is not really supported upstream (we have to
> > trick by building only some subdirectories).
> > 
> > I'm not entirely decided yet, so I'm waiting for arguments. But I'm
> > hesitating between merging this, or asking people who really care about
> > this to simply remove the eudev daemon in a post-build script.  
> 
> But then you would not have libudev if you use mdev or a static /dev.

Correct. But why would you want mdev or a static /dev absolutely if you
need udev?

> Note that libudev is not about managing /dev. It is about providing an
> abstraction to device descriptions (e.g. type and so on) as well as
> events (like hotplug).

Right, but libudev is provided by eudev, and it does both, without even
providing a configure option to build either one or the other.

> A udev daemon (be it from eudev or systemd) is about managing the
> content of /dev. For that it uses libudev to get the device descriptions
> and events, and matches that to a DB of rules to generate the entries
> in /dev.
> 
> Bernd has a (imho, valid) use-case about using only libudev without a
> udev daemon altogether; there *are* other similar cases.

You still don't explain which use-case is that. You keep saying that
Bernd wants to use libudev without the udev daemon, but you don't
explain *why*.

As far as I'm aware, Bernd's use case is on using Kodi, so I'm sure you
can agree that the build time savings and storage size savings are
really in the noise.

> For example, we now have support (and have pending patches) for some
> "containerisation" stuff, like docker and lxc. You can also see that
> Buildroot can be used to generate lightweight containers. Such
> containers need not have a udev daemon of their own (the system has one,
> and /dev is bind-mounted into the container); however, an application
> inside that container will need to have access to the device "DB" and
> events, thus needs libudev.

As far as I understand, in a Docker situation, you don't bind
mount /dev into your container. Instead, you use the --device option of
docker run to get only some specific devices visible in your container.

Regarding LXC
(https://linuxcontainers.org/fr/lxc/manpages/man5/lxc.container.conf.5.html) :

  By default, lxc creates a few symbolic links (fd,stdin,stdout,stderr)
  in the container's /dev directory but does not automatically create
  device node entries. This allows the container's /dev to be set up as
  needed in the container rootfs. If lxc.autodev is set to 1, then
  after mounting the container's rootfs LXC will mount a fresh tmpfs
  under /dev (limited to 100k) and fill in a minimal set of initial
  devices. This is generally required when starting a container
  containing a "systemd" based "init" but may be optional at other
  times. Additional devices in the containers /dev directory may be
  created through the use of the lxc.hook.autodev hook. 

So no, it does not seem like bind-mounting /dev inside a container is a
typical use-case.

Again, this is a lot of additional complexity for very very dubious
use-cases. I believe we have much more interesting and useful things to
merge than this functionality, at least as long as it doesn't come with
stronger arguments as to why it's useful.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
