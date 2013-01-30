From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Jan 2013 15:49:33 +0100
Subject: [Buildroot] [PATCH 2/7] package/pmake: add host pmake
In-Reply-To: <201301301534.41339.yann.morin.1998@free.fr>
References: <cover.1359498504.git.yann.morin.1998@free.fr>
 <201301301413.13408.yann.morin.1998@free.fr>
 <20130130142442.3803d2bc@skate>
 <201301301534.41339.yann.morin.1998@free.fr>
Message-ID: <20130130154933.419b91f2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 30 Jan 2013 15:34:41 +0100, Yann E. MORIN wrote:

> Unfortunately, for pmake, the Debian "patch" does not come as a patch,
> but as a tarball to be extracted in the pmake source dir. So, using:
> 
>     PMAKE_DEB_VER = -3.2-debian
>     PMAKE_PATCH   = pmake_$(PMAKE_VERSION)$(PMAKE_DEB_VER).tar.gz
> 
> will not work, as this is not a patch. :-(

Argh, indeed. Those Debian people are really crazy. For some packages
they have a .orig.tar.gz + a .diff.gz that applies as a patch on top of
it, and for some other packages they have the .orig.tar.gz + a tarball
with the Debian specific files. What a mess...

What about:

 PMAKE_PATCH = \
   http://patch-tracker.debian.org/patch/series/dl/pmake/1.111-3.2/100_mk.diff \
   http://patch-tracker.debian.org/patch/series/dl/pmake/1.111-3.2/110_mkdep.diff \
   http://patch-tracker.debian.org/patch/series/dl/pmake/1.111-3.2/120_fixes.diff \
   http://patch-tracker.debian.org/patch/series/dl/pmake/1.111-3.2/130_maxpathlen.diff \
   http://patch-tracker.debian.org/patch/series/dl/pmake/1.111-3.2/140_multiarch.diff \
   http://patch-tracker.debian.org/patch/series/dl/pmake/1.111-3.2/150_mktemp.diff

Note that this requires the possibility of getting patches from a
different site than the tarball, but J?r?me Pouiller has submitted a
patch that makes this possible, see "[PATCH] Add support for plain URL
in $(PKG)_PATCH variable".

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
