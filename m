From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Dec 2017 21:16:27 +0100
Subject: [Buildroot] [RFCv3 08/15] package/pkg-generic: handle host-xz
 as an extract dependency
In-Reply-To: <20171202150843.GD2988@scaer>
References: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
 <20171201205352.24287-9-thomas.petazzoni@free-electrons.com>
 <20171202150843.GD2988@scaer>
Message-ID: <20171202211627.6d664875@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 2 Dec 2017 16:08:43 +0100, Yann E. MORIN wrote:

> > +ifeq ($(filter host-tar host-skeleton host-xz,$(1)),)
> > +$(2)_EXTRACT_DEPENDENCIES += $(BR2_XZCAT_HOST_DEPENDENCY)
> > +endif  
> 
> So, all packages will now depend on this, even those that are not
> compressed with xz?

Yes, if there is no xzcat available on the system. This is exactly what
the current behavior is with DEPENDENCIES_HOST_PREREQ. My series does
not intend to solve this problem, which is a separate one.

I do believe however that by moving those dependencies (host-xz and
host-lzip) as proper package dependencies, it will be easier to have
follow-up patches that add the dependency only if lzip or xz are
needed. But again, my series does not intend to fix that, it's a
separate problem.

> Currently, filesystems that want to compress with xz all depend on
> host-xz unconditioanlly. Do we want to change that as well, so they only
> depend on it if needed?

I don't understand this part, because filesystems do not depend on
host-xz unconditionally. They only depend on it if xz compression of
the filesystem image is requested. From fs/common.mk:

ifeq ($$(BR2_TARGET_ROOTFS_$(2)_XZ),y)
ROOTFS_$(2)_DEPENDENCIES += host-xz
ROOTFS_$(2)_COMPRESS_EXT = .xz
ROOTFS_$(2)_COMPRESS_CMD = xz -9 -C crc32 -c
endif

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
