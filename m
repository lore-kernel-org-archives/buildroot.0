From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jan 2013 15:38:21 +0100
Subject: [Buildroot] [PATCH 1/6] pkg-infra: log current message
In-Reply-To: <50FBF5EA.5010303@mind.be>
References: <cover.1358379198.git.yann.morin.1998@free.fr>
 <7d5b13e61ca5941293be6d1402c87ca990510e1b.1358379198.git.yann.morin.1998@free.fr>
 <50FBF5EA.5010303@mind.be>
Message-ID: <20130120153821.6fc6853c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Sun, 20 Jan 2013 14:49:30 +0100, Arnout Vandecappelle wrote:

>   I'm a bit concerned because this is another blocker for top-level 
> parallel build (the contents of last-action will be incorrect).

I agree that top-level parallel build would be nice, but I'm wondering
whether it is realistic to think we will support it one day. The main
problem I'm seeing with top-level parallel build is that we need to
create a per-package sysroot in order to get reproducible builds.

For the moment, we install all the libraries and headers in
$(STAGING_DIR), and we point all packages to $(STAGING_DIR) as the
toolchain sysroot, so that they find their required dependencies.

For now, the fact that the sysroot is unique and global is not a
problem as the build is completely serialized, and therefore
reproducible. If package A has an optional dependency on package B (not
expressed in Buildroot dependencies, but package A detects if B is
available in its configure script, and if it is, then uses B), then
either B is built before A, and A has B support, or B is built after A,
and A doesn't have B support.

If you switch to top-level parallel build, then sometimes, B will be
built before A, sometimes after, leading to A sometimes having B
support, sometimes B.

Of course, one way of seeing this is "that's a Buildroot bug, package A
should explicit its optional dependency on package B in its .mk file".
Unfortunately, in practice, it's going to be very hard to track *all*
those optional dependencies, especially when we bump package versions
and those bumps introduce need optional dependencies.

The only way to solve this is to create a per-package sysroot, in which
we install only the headers and libraries that the package explicitly
list as part of its dependencies. I know OpenBricks is doing that. And
I remember discussing with the OE-lite maintainer as this problem being
in his opinion the #1 reliability problem in OpenEmbedded.

Do we want to implement this per-package sysroot thing?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
