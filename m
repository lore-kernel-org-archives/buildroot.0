From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Nov 2010 08:37:24 +0100
Subject: [Buildroot] [PATCH] linux: strip installed modules
In-Reply-To: <87oc9nad27.fsf@macbook.be.48ers.dk>
References: <1289919560-2280-1-git-send-email-vapier@gentoo.org>
	<87oc9nad27.fsf@macbook.be.48ers.dk>
Message-ID: <20101118083724.50b78d0e@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 17 Nov 2010 21:51:44 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  Mike> The installed kernel modules should have useless build cruft stripped out
>  Mike> of them.  On my system, a default build went from a very unreasonable 30MB
>  Mike> to a normal 3MB (on disk) and from 14MB to 3MB when compressed due to the
>  Mike> info stored in the kernel modules alone.
> 
> Thanks. We're moving away from per-package stripping though, so I would
> prefer to add it to the toplevel target-finalize step instead though -

Actually, yes and now. The stripping will go back into per-package, but
inside the package infrastructure instead. This is because we want to
do all the cleanup (documentation, headers, useless .a and .la files)
right after the package installation in order to make the "package
management" stuff work (this is something that Lionel already did in
his experiments of package management). So it will not be inside each
package .mk file as it used to be, but it's still going to be done on a
per-package basis.

> find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | xargs $(STRIPCMD) ..

In this particular case, the stripping is very much kernel-specific, so
I don't see a strong reason of adding this to linux/linux.mk. Except
maybe packages that do compile additional kernel modules, such as
linux-fusion (and more could be added).

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
