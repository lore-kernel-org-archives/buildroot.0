From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Dec 2017 09:32:56 +0100
Subject: [Buildroot] [RFCv3 08/15] package/pkg-generic: handle host-xz
 as an extract dependency
In-Reply-To: <20171202211627.6d664875@windsurf.lan>
References: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
 <20171201205352.24287-9-thomas.petazzoni@free-electrons.com>
 <20171202150843.GD2988@scaer>
 <20171202211627.6d664875@windsurf.lan>
Message-ID: <20171203083256.GF2988@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-12-02 21:16 +0100, Thomas Petazzoni spake thusly:
> Hello,
> 
> On Sat, 2 Dec 2017 16:08:43 +0100, Yann E. MORIN wrote:
> 
> > > +ifeq ($(filter host-tar host-skeleton host-xz,$(1)),)
> > > +$(2)_EXTRACT_DEPENDENCIES += $(BR2_XZCAT_HOST_DEPENDENCY)
> > > +endif  
> > 
> > So, all packages will now depend on this, even those that are not
> > compressed with xz?
> 
> Yes, if there is no xzcat available on the system. This is exactly what
> the current behavior is with DEPENDENCIES_HOST_PREREQ. My series does
> not intend to solve this problem, which is a separate one.

I somehow interpreted your patches in my head as "only build them when
needed". ;-)

> I do believe however that by moving those dependencies (host-xz and
> host-lzip) as proper package dependencies, it will be easier to have
> follow-up patches that add the dependency only if lzip or xz are
> needed. But again, my series does not intend to fix that, it's a
> separate problem.

OK, agreed.

> > Currently, filesystems that want to compress with xz all depend on
> > host-xz unconditioanlly. Do we want to change that as well, so they only
> > depend on it if needed?
> 
> I don't understand this part, because filesystems do not depend on
> host-xz unconditionally. They only depend on it if xz compression of
> the filesystem image is requested. From fs/common.mk:
> 
> ifeq ($$(BR2_TARGET_ROOTFS_$(2)_XZ),y)
> ROOTFS_$(2)_DEPENDENCIES += host-xz
> ROOTFS_$(2)_COMPRESS_EXT = .xz
> ROOTFS_$(2)_COMPRESS_CMD = xz -9 -C crc32 -c
> endif

Well, first, let's assume that when the host has a suitable xzcat, it
also has the xz command as well; I think it's not too far-fetched an
assumption.

Then, we have BR2_XZCAT_HOST_DEPENDENCY empty, because we do have a
suitable xzcat, and thus a suitable xz. Yet, when the user requires
their filesystem to be xz-compressed, we still forcefully depend on
host-xz, even though we do have a suitable xz command.

What I mean is that, probably, we will want to make it:

    ROOTFS_$(2)_DEPENDENCIES += $$(BR2_XZCAT_HOST_DEPENDENCY)

Regards,
Yann E. MORIN.

> Best regards,
> 
> Thomas Petazzoni
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
