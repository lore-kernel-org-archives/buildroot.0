From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Nov 2015 23:53:59 +0100
Subject: [Buildroot] [PATCH] core: fix setting of HOSTARCH
In-Reply-To: <1447095621-32080-1-git-send-email-yann.morin.1998@free.fr>
References: <1447095621-32080-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20151111235359.707acc35@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Peter,

On Mon,  9 Nov 2015 20:00:21 +0100, Yann E. MORIN wrote:
> Currently, we set HOSTARCH to the output of `uname -m`. This gives us

> But since w eintroduced the latest Linaro toolchains, we now have
> toolchains that require a 64-bit userland.
> 
> So, when running on a 64-bit kernel, we believe those toolchains are
> available, even when the user is running a 32-bit userland. This causes
> build failures for our autobuilders, like so:
> 
>     http://autobuild.buildroot.org/results/9cd/9cdf10ec5b31144b2e03ea09cf128702339895b3/

Those build failures are not caused by a 32 bits vs. 64 bits issue. In
fact, I started running my chroot under "linux32", but it was even
worse. Because indeed my chroots *are* 64 bits.

However, the real problem is that the new Linaro toolchains have been
built against glibc 2.14 (for the host), while my chroot only uses
glibc 2.11 (from Debian 6.0).

I'm not sure how to handle this. Some old distros may not have glibc
2.14.

Suggestions?

In any case, I believe the rework of how we get HOSTARCH is not really
needed IMO: 1/ it is not the source of the problem for the Linaro
toolchain and 2/ it is most likely appropriate to use setarch/linux32
when running a 32 bits chroot under a 64 bits kernel.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
