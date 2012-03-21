From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Mar 2012 13:26:07 +0100
Subject: [Buildroot] [PATCH 6/6] apply-patches.sh: use series file to
 apply patches in proper order
In-Reply-To: <1332336387-3434-1-git-send-email-ludovic.desroches@atmel.com>
References: <87k42e5nt8.fsf@macbook.be.48ers.dk>
 <1332336387-3434-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <20120321132607.20647967@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed, 21 Mar 2012 14:26:26 +0100,
ludovic.desroches at atmel.com a ?crit :

> At the beginning, recursivity was present into this set of patches but was
> removed since I have no real case needing it. I was thinking at this kind of
> tarball. So I put it again and do the corrections necessary for this feature:
> - Only .patch* and .diff* files are considered as valid patches. The wildcard
> at the end is for case such as .patch.arm for example.
> - Remove strip-components option which is no more necessary since we no more
> skip directories.
> 
> I have tested it with liblockfile and by building a rootfs for my target with
> a tarball containing patches for the kernel.

Do we really want to support this use case within apply-patches.sh
directly? Packages such as argus, cvs, input-tools, mii-diag,
setserial, sysklogd, sysvinit and thttpd all handle this by adding a
special xxx_POST_PATCH_HOOK that applies the patches in
debian/patches/. In other words:

 * The package infrastructure applies the Debian patch, which creates
   the debian/patches/ directory

 * The package, through a post-patch hook, is responsible for applying
   the patches in debian/patches/.

I think liblockfile behaviour was a bug, as it shouldn't have relied on
the fact that apply-patches.sh was applying patches recursively inside
a tarball.

It would, IMO, make more sense to keep that special behaviour within
package recipes (and therefore make liblockfile more similar to argus
and others) rather than complicating further the apply-patches.sh
script.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
