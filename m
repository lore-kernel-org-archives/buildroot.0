From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 12 Jul 2011 22:46:26 +0200
Subject: [Buildroot] Installation of package files in staging and target
In-Reply-To: <1310500118.6261.18.camel@cabbage.rehill.info>
References: <20110712000117.3af73a1a@skate>
 <201107121939.20652.yann.morin.1998@anciens.enib.fr>
 <1310500118.6261.18.camel@cabbage.rehill.info>
Message-ID: <201107122246.26672.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quotient, Thomas, All,

On Tuesday 12 July 2011 21:48:38 Quotient Remainder wrote:
> On Tue, 2011-07-12 at 19:39 +0200, Yann E. MORIN wrote:
> > That way, it becomes much easier to install packages. That may even simplify
> > the package removal later (if we are careful at install time). And as target/
> > and sdk/ are created at the end, we can more easily ensure what we keep/trash
> > when doing the copy.
> 
> Probably not directly related but kind of...
> We've been doing some stuff involving bundling up individual packages
> into installable, signed chunks and to facilitate this we've added an
> extra install stage to "package/Makefile.package.in".  Effectively it
> adds a ".stamp-pkg-installed" target, which sets a target-specific value
> for TARGET_DIR (e.g. ".../output/pkg") and calls the normal target
> install macros.  This has the effect of creating an individual directory
> tree of all files installed to the target.  A bit of extra processing is
> needed for the likes of device drivers that modify existing files
> ("/lib/modules/.../modules.dep" requires running depmod on target after
> installation,

depmod can be run prior to building the file system images, once all
kernel modules have been installed. You'd just have to provide a dummy
depmod that does nothing, so that modules that insists on calling depmod
can, but you delegate the real depmod later, when it indeed makes sense
to call it.

> installing extra libraries in "/usr/local/lib" requires
> ldconfig) but in general.  I know the installing bit isn't relevant for
> Buildroot mainline

There has been some thoughts and efforts in doing something similar (IIUC).
. Maybe you could share your changes, so they get mainlined, and every one
profits from it, and you stop having to port them from version to version.
;-)

> but I'm just wondering if the principle of separating
> packages' effects on the RFS is useful to anyone.  Maybe it'll trigger a
> moment of inspiration with someone.

At least, it allows to properly find new files added by the package, files
added that already existed, and files modified (which would fail, as the
modified file would be missing).

All without needing to play tricky tricks with any unionfs mechanism.

> >  * packages are installed with DESTDIR=$(O)/staging
> >      - exception made for bootloaders, and potentially kernel, which
> >        install directly in $(O)/images (although I am realy not a big
> >        fan, but that's personal taste)
> 
> Where does the skeleton fs come into play?  Is it copied to "target/"
> directly or would it pass through "staging/" first?  Probably the
> former, IMHO, since it's only useful on the target, unless it gets
> fiddled with during the build process, in which case it should pass
> through "staging/".

I'd say the skeleton should be handled as if it were a package. staging/ is
created as a copy of the skeleton, then packages are installed in there.

This allows packages to, for example, add users to /etc/passwd, or do
whatever they have to.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
