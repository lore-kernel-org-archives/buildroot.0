From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 10:29:29 +0100
Subject: [Buildroot] [RFCv3 08/15] package/pkg-generic: handle host-xz
 as an extract dependency
In-Reply-To: <20171203083256.GF2988@scaer>
References: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
 <20171201205352.24287-9-thomas.petazzoni@free-electrons.com>
 <20171202150843.GD2988@scaer>
 <20171202211627.6d664875@windsurf.lan>
 <20171203083256.GF2988@scaer>
Message-ID: <20171203102929.7962bc0a@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 3 Dec 2017 09:32:56 +0100, Yann E. MORIN wrote:

> > Yes, if there is no xzcat available on the system. This is exactly what
> > the current behavior is with DEPENDENCIES_HOST_PREREQ. My series does
> > not intend to solve this problem, which is a separate one.  
> 
> I somehow interpreted your patches in my head as "only build them when
> needed". ;-)

Nope, I'm not fixing that (separate) problem. I still want to fix this
problem as well, but not as part of the per-package SDK stuff.

> > > Currently, filesystems that want to compress with xz all depend on
> > > host-xz unconditioanlly. Do we want to change that as well, so they only
> > > depend on it if needed?  
> > 
> > I don't understand this part, because filesystems do not depend on
> > host-xz unconditionally. They only depend on it if xz compression of
> > the filesystem image is requested. From fs/common.mk:
> > 
> > ifeq ($$(BR2_TARGET_ROOTFS_$(2)_XZ),y)
> > ROOTFS_$(2)_DEPENDENCIES += host-xz
> > ROOTFS_$(2)_COMPRESS_EXT = .xz
> > ROOTFS_$(2)_COMPRESS_CMD = xz -9 -C crc32 -c
> > endif  
> 
> Well, first, let's assume that when the host has a suitable xzcat, it
> also has the xz command as well; I think it's not too far-fetched an
> assumption.
> 
> Then, we have BR2_XZCAT_HOST_DEPENDENCY empty, because we do have a
> suitable xzcat, and thus a suitable xz. Yet, when the user requires
> their filesystem to be xz-compressed, we still forcefully depend on
> host-xz, even though we do have a suitable xz command.
> 
> What I mean is that, probably, we will want to make it:
> 
>     ROOTFS_$(2)_DEPENDENCIES += $$(BR2_XZCAT_HOST_DEPENDENCY)

Yes, I thought about this too. But again, it's a separate issue: the
filesystem code already depends on host-xz, regardless of whether xz is
already available on the system.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
