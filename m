From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Jan 2013 23:36:47 +0100
Subject: [Buildroot] [PATCH 2/7] package/pmake: add host pmake
In-Reply-To: <5109509F.50404@mind.be>
References: <cover.1359498504.git.yann.morin.1998@free.fr>
 <201301301413.13408.yann.morin.1998@free.fr> <5109509F.50404@mind.be>
Message-ID: <201301302336.47836.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Wednesday 30 January 2013 Arnout Vandecappelle wrote:
> On 30/01/13 14:13, Yann E. MORIN wrote:
> > Arnout, All,
> >
> > On Wednesday 30 January 2013 08:52:53 Arnout Vandecappelle wrote:
> >> On 29/01/13 23:33, Yann E. MORIN wrote:
> >>> pmake is the make command used by the BSD.
> >>> It will used to build BSD-related packages, coming later.
> >>>
> >>> Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>
> >>> ---
> >>>    package/pmake/pmake-100_mk.patch         | 2624 ++++++++++++++++++++++++++++++
> >>>    package/pmake/pmake-110_mkdep.patch      |  230 +++
> >>>    package/pmake/pmake-120_fixes.patch      |  266 +++
> >>>    package/pmake/pmake-130_maxpathlen.patch |   39 +
> >>>    package/pmake/pmake-140_multiarch.patch  |  354 ++++
> >>>    package/pmake/pmake-150_mktemp.patch     |   31 +
> >>
> >>    Can't these patches be downloaded with PMAKE_PATCH?
> >
> > How much I'd like to! But no, the patches are in the -debian.tar.gz
> > archive:
> >      http://snapshot.debian.org/archive/debian/20120601T033558Z/pool/main/p/pmake/pmake_1.111-3.2.debian.tar.gz
> > which contains:
> >      $ tar tzf pmake_1.111-3.2.debian.tar.gz |sort
> >      debian/
> >      debian/changelog
> >      debian/compat
> >      debian/control
> >      debian/copyright
> >      debian/patches/
> >      debian/patches/100_mk.diff
> >      debian/patches/110_mkdep.diff
> >      debian/patches/120_fixes.diff
> >      debian/patches/130_maxpathlen.diff
> >      debian/patches/140_multiarch.diff
> >      debian/patches/150_mktemp.diff
> >      debian/patches/series
> >      debian/rules
> >      debian/source/
> >      debian/source/format
> >
> > And the generic infrastructure does not allow to extract an archive to
> > get patches from.
> 
>   Doesn't it?  It seems to work for liblockfile...

Ah, I see why you "think" it works. Here's the output of the log:

---8<---
support/scripts/apply-patches.sh /home/ymorin/dev/buildroot/O-qemu/build/liblockfile-1.08 /home/ymorin/src liblockfile_1.08-4.debian.tar.bz2
Unsupported format file for changelog, skip it
Unsupported format file for control, skip it

Applying 02-COPYRIGHT.patch using patch: 
patching file COPYRIGHT

Applying 04-505851-remove-debug-code.patch using patch: 
patching file lockfile.c

Applying 06-493462-dotlockfile.1.patch using patch: 
patching file dotlockfile.1

Applying 07-493462-dotlockfile.c.patch using patch: 
patching file dotlockfile.c

Applying 09-562937-make-ar-overwrittable.patch using patch: 
patching file Makefile.in
Unsupported format file for postinst, skip it
Unsupported format file for postinst.nfs, skip it
Unsupported format file for postrm, skip it
Unsupported format file for prerm.nfs, skip it
Unsupported format file for rules, skip it
Unsupported format file for shlibs, skip it
Unsupported format file for shlibs.nfslock, skip it
Unsupported format file for source, skip it

Applying liblockfile-install.patch using patch: 
patching file Makefile.in
---8<--

As ytou can see, 'support/scripts/apply-patches.sh' uncompresses the
archive because it ends in '.gz', which output a tarball to stdout, and
passes this to 'patch', which ignores whatever it does not recognise,
but eventually find "some" hunks which it applies:

    case "$patch" in
        *.gz)
        type="gzip"; uncomp="gunzip -dc"; ;;
        [--SNIP--]
    esac
    [--SNIP--]
    ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}"

So, basically, what's hapenning is that a tarball is used as a patch.

If you want my opinion, this is extremely *dirty*. And is in dire need of
be fixed.

You'll excuse me if I refuse to do that on purpose. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
