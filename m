From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Mar 2019 23:37:42 +0100
Subject: [Buildroot] [PATCH v3 0/2] Add gettext-tiny package
In-Reply-To: <20190212215520.7422-1-vadim4j@gmail.com>
References: <20190212215520.7422-1-vadim4j@gmail.com>
Message-ID: <20190309233742.3095c546@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Feb 2019 23:55:18 +0200
Vadim Kochan <vadim4j@gmail.com> wrote:

> Add lightweight alternative for the GNU gettext package - gettext-tiny.
> The sources are used from sabotage-linux project. Some files are used
> from the original gettext gnu like po/*, gettextize and some m4 files.
> 
> The original gettext package is renamed to gettext-gnu because now gettext is
> a virtual package and gettext-gnu and gettext-tiny became as gettext providers.
> 
> The main purpose of gettext-tiny is to be used only for the host if NLS
> is not enabled.

I finally took some time to play around with this. The first thing is
that I didn't like a lot the download of lots of gettext-gnu files from
gettext-tiny. I've played a bit with this, and ended up trying to use
the gettext-gnu tarball instead. See:

  https://github.com/tpetazzoni/buildroot/tree/gettext-tiny
  https://github.com/tpetazzoni/buildroot/commit/22936b22944f49646c8732fb2742a526d0a556e2#diff-e5eacf305a325109262748204673e7b5R19

for the details. It also avoids the need to patch to get config.rpath,
because config.rpath is available in the gettext-gnu tarball.

I also reworked how the virtual package was handled, but I then
understood that I had mistaken that only the host package was really a
virtual package with two implementation: the target gettext package has
only one implementation: gettext-gnu.

However, the ecryptfs-utils case has shown that it is possible for a
package to need a gettext implementation even if BR2_SYSTEM_ENABLE_NLS
is disabled. So from there, we have two solutions:

 - Patch ecryptfs-utils itself so that it doesn't use gettext when
   --disable-nls is used. Perhaps this is the right thing to do. In
   this case, we could indeed mandate that the target gettext package
   is only available when BR2_SYSTEM_ENABLE_NLS=y, and therefore indeed
   have the gettext virtual package always point to gettext-gnu.

 - Alternatively, support gettext-tiny as a target package, which would
   provide both libintl and the gettext program (the latter to please
   ecryptfs-utils).

I was initially worried that some packages that don't understand
--disable-nls might try to link with libintl, and that we would
therefore need a target gettext package even if BR2_SYSTEM_ENABLE_NLS.
However, libintl is only a replacement library for the gettext
functions that don't exist in uclibc/musl, but do exist in glibc.
Because in glibc they are part of the C library itself, I don't think
any package is ever going to link explicitly with libintl. It's only
Buildroot that ensures -lintl is passed to the LIBS/LDFLAGS when
needed. So I believe we're good.

So, perhaps the good solution is option (1) above ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
