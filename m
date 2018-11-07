From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 7 Nov 2018 22:14:01 +0100
Subject: [Buildroot] [PATCH 2/3] graph-depends: split off
 get_version/get_depends into pkgutil.py
In-Reply-To: <20181107210657.GD4702@scaer>
References: <20170203205745.14488-1-patrickdepinguin@gmail.com>
 <20170203205745.14488-4-patrickdepinguin@gmail.com>
 <20181107180753.GA4702@scaer>
 <CAAXf6LVC==B0Rb7-ZpDh=k2VyF4UJZYaamQ0hhhZzpS6z=Syrg@mail.gmail.com>
 <20181107193903.GC4702@scaer>
 <CAAXf6LVjAtrzEERUTMyBUe3pXFHa1BZgXkYfCySKxTEU=GCaoQ@mail.gmail.com>
 <20181107210657.GD4702@scaer>
Message-ID: <CAAXf6LVGOGew5yTZBjHZ+mrSae5FxGHp4WQJOv6qM__6FvYqSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El mi?., 7 nov. 2018 a las 22:07, Yann E. MORIN
(<yann.morin.1998@free.fr>) escribi?:
>
> On 2018-11-07 21:41 +0100, Thomas De Schampheleire spake thusly:
> > El mi?., 7 nov. 2018 a las 20:39, Yann E. MORIN
> > (<yann.morin.1998@free.fr>) escribi?:
> > > On 2018-11-07 20:06 +0100, Thomas De Schampheleire spake thusly:
> > > > El mi?., 7 nov. 2018 a las 19:07, Yann E. MORIN
> > > > (<yann.morin.1998@free.fr>) escribi?:
> > > > > On 2017-02-03 21:57 +0100, Thomas De Schampheleire spake thusly:
> > > > > > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> > > > > >
> > > > > > Functions to obtain the version and dependencies of a package from Python
> > > > > > can be useful for several scripts. Extract this logic out of graph-depends
> > > > > > into pkgutil.py.
> > > > >
> > > > > Coming back to this script, because I'm rewriting the way graph-depends
> > > > > gets the dependency tree. When you said "useful for several scripts,"
> > > > > did you expect it to be useful to scripts that are not in Buildroot
> > > > > (e.g. user-local scripts)?
> > > >
> > > > Yes, exactly. We are using the logic from pkgutil from another python
> > > > script and want to avoid code duplication.
> > > > This particular script is not something that upstream accepts, i.e.
> > > > generating opkg files for specific packages (and for that, we need to
> > > > know the dependencies and versions of each package).
> > >
> > > So, if you were to get a new function that would return basically the
> > > same, but in another format, but much quicker (~4s instead of ~45s),
> > > would that be something you could adapt to?
> > >
> > > I'm changing the way the dependency tree is extracted from the Makefile
> > > data, and the function now has this API (function name yet to be
> > > bike-shedded about):
> > >
> > >     dict_deps, dict_types = get_dependency_tree(direction)
> > >
> > > where:
> > >
> > >   - direction is either string 'forward' or 'back',
> > >
> > >   - dict_deps is a dictionnary, which keys are the package names, and
> > >     which values are lists of packages that are direct dependencies of
> > >     the key package (basically, what get_all_depends() currently
> > >     returns, but the whole dependency tree)
> >
> > How is dict_deps different from what get_depends in brpkgutil.py
> > currently returns? Your statement "but the whole dependency tree" is
> > not clear to me.
>
> Currently, brpkgutil.get_depends() takes a list of packages for which
> to get the dependencies. The new get_dependency_tree() does not take
> such a list; it always returns the whole dependency tree (i.e. from the
> 'ALL' meta package).

Ok, thanks.

>
> > >   - dict_types is a dictionnary, which keys are the package names, and
> > >     the values are string representing whtehr the packages are target or
> > >     host, and virtual or not, e.g.: 'target', 'target-virtual', 'host',
> > >     'host-virtual'.
> > >
> > > If needed, I could very easily make it return a three-tuple, with the
> > > third one being dict_versions, keyed by package names, with values the
> > > package version.
> > >
> > > Would that be something that would be usable in your use case?
> >
> > To help the discussion, here are some snippets from our code:
> >
> >         Package.versions = brpkgutil.get_version(list(Package.files.keys()))
> >         Package.depends = brpkgutil.get_depends(list(Package.files.keys()))
>
> So you could write:
>
>     Package.depends, Package.versions = brpkgutil.get_dependency_tree('forward')
>
> >         self.version = Package.versions[self.pkg]        # this
> > variable will be used in several places, we just need the string
> > representing the version
> >     ...
> >     def get_opkg_depends(self):
> >         """Return the dependencies that need to be declared in the opkg"""
> >         deps = set(Package.depends[self.pkg]).intersection(set(Package.requested_pkgs))
> >         if deps is not None:
> >             return ','.join(deps)
> >         else:
> >             return ''
> >
> > The code above is basically all we do with the version and dependencies.
> > As long as we can get this info in some way, I'm fine with changes.
> > Returning the versions together with the dependencies in one call,
> > removing the call to brpkgutil.get_version is fine by me, if it is
> > better for the in-tree usage (I'm fine with either way).
>
> OK, good.
>
> Currently, in Buildroot, we use the version string just because we need
> to know whether a package is virutal or not. Do you really need the
> version string for what it is, or just to test if it is virtual or not?

We do need the version, which is used in the .ipk filename as well as
in its metadata.
Whether the package is virtual or not is not a concern for us.

Thanks,
Thomas
