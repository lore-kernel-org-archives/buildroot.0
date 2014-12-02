From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Dec 2014 13:28:44 +0100
Subject: [Buildroot] [PATCHv2 3/4] support/scripts: add size-stats script
In-Reply-To: <1429484.vXm9l0Ysfx@aquila>
References: <1417470100-32657-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417470100-32657-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <1429484.vXm9l0Ysfx@aquila>
Message-ID: <20141202132844.6288543a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Tue, 02 Dec 2014 12:01:11 +0100, J?r?me Pouiller wrote:

> Is it possible to rely on Kconfiglib in order to support customized skeleton
> and overlays? Or you think skeleton and overlays (and post-build scripts) 
> should be managed by package infra (like https://patchwork.ozlabs.org/patch/399413/)?

Ultimately, yes, I think the skeleton should be a package. Regarding
overlays, maybe not, since we want overlays to be copied on each "make"
invocation, to make them easy to install. So it would indeed be
necessary to add some support for overlays, and post-build script as
well.

I guess we could consider this a follow-up improvement, but I'm willing
to work on this topic once the basic stuff is merged.

> > +#
> > +# This function returns a dict where each key is the path of a file in
> > +# the root filesystem, and the value is a dict containing two
> > +# elements: the name of the package to which this file belongs (key:
> > +# pkg) and the size of the file (key: size).
> > +#
> > +# builddir: path to the Buildroot output directory
> > +#
> > +def build_package_dict(builddir):
> > +    pkgdict = {}
> > +    with open(os.path.join(builddir, "build", "packages-file-list.txt")) as filelistf:
> > +        for l in filelistf.readlines():
> > +            f = l.split(",")
> > +            fpath = f[1].strip().replace("./", "")
> > +            fullpath = os.path.join(builddir, "target", fpath)
> > +            if not os.path.exists(fullpath):
> > +                continue
> It means the file was remove by another package. You may emit a warning
> there?

Hum, indeed, emitting a warning here seems useful.

> > +            pkg = f[0]
> > +            sz = os.stat(fullpath).st_size
> > +            pkgdict[fpath] = { 'pkg': pkg, 'size': sz }
> If pkgdict[fpath] is already defined, it means:
>   a. pkg == pkgdict[fpath].pkg -> Package was reinstalled
>   b. pkg != pkgdict[fpath].pkg -> File was overwritten by another package
> 
> You may emit a warning is second case?

Well, it depends on whether we consider overwritten files as normal or
not. For now, the main case where we overwrite things in Buildroot is
when a package such as coreutils, installs some commands that are
"better" than the Busybox ones, in which case coreutils wins over
Busybox. But since Busybox installs symlinks, and this tool doesn't
track symlinks, we don't consider this as a file being overwritten.

So maybe I could have a warning here.

Regarding "package was reinstalled", this entire script/logic is meant
to be used after a "make clean all" cycle. I don't think it is worth
bothering with supporting package re-installation and other crazy things
that can happen outside of a normal "make clean all" cycle.

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
