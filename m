From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2020 21:26:33 +0200
Subject: [Buildroot] [PATCH] stress-ng: bump to version 0.11.14
In-Reply-To: <4289a40f5c830717edc9c400b89408216152c9c2.1592555865.git.baruch@tkos.co.il>
References: <4289a40f5c830717edc9c400b89408216152c9c2.1592555865.git.baruch@tkos.co.il>
Message-ID: <20200620212633.2baaac4a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 19 Jun 2020 11:37:45 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> Enable build for musl libc. glibc specific code is now behind __GNUC__.
> Add a patch to fix collision with kernel defined struct sysinfo.
> 
> Drop attr dependency. Not used anymore.
> 
> Make keyutils an optional dependency. Detected at config time.
> 
> Enable static build now that keyutils is not a mandatory dependency.
> 
> Format hash file with two spaces delimiters.
> 
> Cc: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Thanks, applied! One comment below.

> +Subject: [PATCH] stress-ng.h: suppress kernel sysinfo.h
> +
> +The kernel sysinfo.h (indirectly included from genetlink.h) defines
> +struct sysinfo. This collides with musl libc definition of the same
> +struct.

This hack of defining _LINUX_SYSINFO_H is not pretty. But after looking
at it, I see that uClibc-ng does exactly that. glibc takes a different
route: they use directly the definition from the kernel headers, and
don't duplicate it in the glibc headers.

Anyway, that's good enough, so I've applied.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
