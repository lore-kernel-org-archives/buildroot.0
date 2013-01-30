From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Jan 2013 14:13:13 +0100
Subject: [Buildroot] [PATCH 2/7] package/pmake: add host pmake
In-Reply-To: <5108D155.3060208@mind.be>
References: <cover.1359498504.git.yann.morin.1998@free.fr>
 <b0d70289993ab5426e1c411b1fc102c7a8022b5d.1359498504.git.yann.morin.1998@free.fr>
 <5108D155.3060208@mind.be>
Message-ID: <201301301413.13408.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Wednesday 30 January 2013 08:52:53 Arnout Vandecappelle wrote:
> On 29/01/13 23:33, Yann E. MORIN wrote:
> > pmake is the make command used by the BSD.
> > It will used to build BSD-related packages, coming later.
> >
> > Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>
> > ---
> >   package/pmake/pmake-100_mk.patch         | 2624 ++++++++++++++++++++++++++++++
> >   package/pmake/pmake-110_mkdep.patch      |  230 +++
> >   package/pmake/pmake-120_fixes.patch      |  266 +++
> >   package/pmake/pmake-130_maxpathlen.patch |   39 +
> >   package/pmake/pmake-140_multiarch.patch  |  354 ++++
> >   package/pmake/pmake-150_mktemp.patch     |   31 +
> 
>   Can't these patches be downloaded with PMAKE_PATCH?

How much I'd like to! But no, the patches are in the -debian.tar.gz
archive:
    http://snapshot.debian.org/archive/debian/20120601T033558Z/pool/main/p/pmake/pmake_1.111-3.2.debian.tar.gz
which contains:
    $ tar tzf pmake_1.111-3.2.debian.tar.gz |sort
    debian/
    debian/changelog
    debian/compat
    debian/control
    debian/copyright
    debian/patches/
    debian/patches/100_mk.diff
    debian/patches/110_mkdep.diff
    debian/patches/120_fixes.diff
    debian/patches/130_maxpathlen.diff
    debian/patches/140_multiarch.diff
    debian/patches/150_mktemp.diff
    debian/patches/series
    debian/rules
    debian/source/
    debian/source/format

And the generic infrastructure does not allow to extract an archive to
get patches from.

Alternatively, we could use the post-patches hook to get the patches
from the archive, and apply them; but then, we'd need to be able to
download this archive, and AFAIK, the package infrastructure does not
allow downloading more than one archive for a package, although it
might be possible to extend PKG_SOURCE to include more than one file
to download (but then, which should be extracted?).

Maybe we could add a PKG_EXTRA_SOURCES, which is a space-separated
files which get downloaded. Then, a post-download hook could do whatever
is needed with those files; or they can be extracted as sub-dir in the
package's directory. Finally, a post-extract or/and post-patch hooks
can do whatever is needed.

But I'm not too fond of this, as it makes the package infrastructure even
more complex, just for the sake of not bundling a few (big) patches for
a package that will probably not change in the forseeable future (pmake
has not seen any change in Debian for the past 18 months).

But we could bump the Debian snapshot date to a more recent one, which
still contains stuff last changed 2011-09-22:
    http://snapshot.debian.org/archive/debian/20130130T095609Z/pool/main/p/pmake/
(except for the hurd package that was assembled in 2012).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
