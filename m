From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Sep 2020 22:43:41 +0200
Subject: [Buildroot] [RFC PATCH v1 1/1] package/pkg-golang: download
 deps to vendor tree if not present
In-Reply-To: <CA+h8R2rNmRJUor9CDjyNzsgGPCmpE3XPjtkFdjzCeMGYenWKxA@mail.gmail.com>
References: <20200831062335.1105977-1-christian@paral.in>
 <20200831070800.GN14354@scaer>
 <CAK714xKp0H5HEv5bp1bjDumZff6+cC41cs=exZk8bKuZTCV2vQ@mail.gmail.com>
 <20200903132852.GZ14354@scaer>
 <20200903160205.7e67bbe7@windsurf.home>
 <20200903151221.GA14354@scaer>
 <20200903181334.1a25642b@windsurf.home>
 <20200903191841.GC14354@scaer>
 <CA+h8R2rNmRJUor9CDjyNzsgGPCmpE3XPjtkFdjzCeMGYenWKxA@mail.gmail.com>
Message-ID: <20200903204341.GE14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, All,

On 2020-09-03 12:40 -0700, Christian Stewart spake thusly:
> On Thu, Sep 3, 2020 at 12:19 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > For example, let's say that Joe Developer Jr. in BIG CORP copies some
> > LGPL-licensed code into their proprietary project, as a bundled library.
> >
> > This is totally legit: the proprietary parts are not tainted (I hate
> > that word, but have not better for now) by the LGPL stuff. Yet, they
> > have to redistribute the LGPL stuff.
> >
> > Buildroot currently offers noway for them to do that.
> 
> In what world would a Buildroot package ever be added as an in-tree
> package with a proprietary library *copied into the source code tree*
> ??

I never talked about upstream Buildroot.

But consider that people would take Buildroot, put it in git in their
internal git server, and modify it by adding local packages to it. Or
they could also use a br2-external tree.

The packages at stake here are non-public packages that people write as
part of their day-time job in their company. It is totally possible that
someone belives it would be "easier" to have the source of a dependency
bundled in their proprietary package.

Which is *exactly* the case about a proprietary package vendoring a set
of external libraries.

> > Vendoring is the same as bundling, except it happens at download time on
> > our side, not on the upstream developper's machine.
> 
> We're enforcing hash checks on these bundles. The format may not
> always be the same across versions. Storing the source code before
> it's extracted into a vendor tree is the only way to be sure that the
> hashes won't change between iterations of the package manager.

If a package vendors unversioned dependencies, then indeed we can't add
hashes for that package, because two builds may get different stuff for
each such vendored dependency, like we don;t add hashes for stuff we
know is not reproducible (bzr, cvs, hg for example).

> It's
> also the only way to redistribute the source code packages for the
> libraries independently from the proprietary part,

Except as I explained, it does not work in case the dependencies have
dependencies to other proprietary packages, at an arbitrary depth...

> maintaining the hashes.

With my proposal, it would not be: there would be a single archive, for
which we have hashes. Then when we call legal-info, the package filter
is applied to generate a new archive in legal-info, which only contains
the filterd files.

And in the output of legal-info, we do not store the hahes from the
infra, we calculate the hashes already:

    https://git.buildroot.org/buildroot/tree/Makefile#n870

... so we do not need to have hashes of download archives match the
legal-info archives.

> It's the only way to deduplicate downloads of identical
> package versions, to do LICENSE checks on dependencies, etc etc etc.

That would not de-duplicate, because the separate archives would end up
in $(FOO_DL_DIR), which is $(BR2_DL_DIR)/foo/ anyway.

> I don't see an alternative option here. Just running the package
> manager and compressing the result is less convincing than writing
> some code to properly understand each dependency.

Just running the package manager and compressing the result is the
easiest and simplest solution, that will work reliably and consistently
across all cases.

> > > >   - at extract step, how do you know that you have to also extract the
> > > >     archive with the vendor stuff? Probably easy by looking if said
> > > >     archive exists. But then, if each dependency is stored in its own
> > > >     archive, how do you know which to extract?
> 
>  - Extract the main package
>  - Check the package.json or go.mod or cargo or whatever
>  - Extract the relevant stuff into a format the package manager understands

This is what I mean by "reinventing the logic of the package managers".
Because this one go.mod would refer to dependencies, that my have their
won dependencies, so we'd have to look at the go.mod of teach
dependencies, recursively... Well, I think the top-level go.mod has all
the info, but what of the others?

>  - Run the package manager from the language to assemble the "vendor"
> tree in the source dir (maybe same step).

    go mod vendor

And that is all, I don't even need to look at go.mod and parse it to
know where to extract things; or even where to download them from.

> > > You would parse the go.mod file I suppose, but that doesn't give you
> > > indirect dependencies. Perhaps some Go tool can help with that ? But
> > > indeed, that's a good question.
> ?? go.mod handles indirect dependencies.
> > And what about cargo? npm? php composer? Others? (what, there are
> > others? ;-] )
> package.lock yarn.lock. Require it.

I guess package.log is for npm. No idea what yarn is. Still, that's only
two out of at least three...

> > I do not want to have to repeat the vendoring logic in Buildroot.
> Why repeat it? Re-use it from the programming language! Not everything
> has to be in bash.

It's not about the language; it's about the logic.

> > Also, I do not want that we have various level of vendoring support for
> > the various package managers.
> OK, so we implement it across the board, which language would not be
> able to support this?

npm is noptorious for having very bad behaviour wrt vendoring dependencies,
for example (in my limited suffering^Wexperience packaging npm stuff, I
have to admit)

> > > >   - when you generate the legal-info/ directory, how do you know what to
> > > >     put in there for that package? You are back to the problem above,
> > > >     plus you would also want to ignore those vendored deps that are not
> > > >     redistributable, although we have no way in Buildroot to describe
> > > >     that either....
> Use the license field in the package.json or wherever the specifiers
> exist, and if they aren't there, detect common LICENSE file names, if
> you can't find anything, fail.

How do we know that such or such vendored depednency has to be
redsitributed?

But is license "(C) BIG CORP" a redistributable license or not?

> Go has a few very robust license detector packages. (if desired).

It is not only about detecting the license (which is however a very
important step, indeed)m but it is about deciding whether to
redistribute it or not.

If we assume that all vendored stuff is only FLOSS and can only be
FLOSS, then that is OK: we redistribute everything that is vendored.

But that is not the cae: if a proprietary package vendors another
proprietary package, how do we know that we should not redistribute that
second package as well? Knowing the license name is *not* enough to
decide; only a human can tell.

> > So, if we jut concentrate on how we can help people do exactly that:
> > filter out the bits they do not want to redistribute?
> >
> > One solution would be to have packages provide some legal-inf hooks,
> > something like (e.g.: only keep files which names match the regexp):
> >
> >     FOO_LEGAL_INFO_FILTER_REGEXP = ^vendor/FLOSS/
> >
> > Or whatever, that would be applied at the time the legal-info is
> > generated.
> 
> How does this solve the problem? If I need to give the source tarballs
> away for dependencies, and it's all mixed into one massive tarball,
> you can't separate things out and keep the hashes the same

It solves the problem that the legal-info/ directory only contains what
you accept to redistribute.

> I thought the requirement was that you would be able to send someone
> the buildroot "dl" directory and be able to perform a build without
> network fetches.

Wait, you are confusing the two: the content of dl/ which is used at
build time, and from which we extract the sources that are built, and
the content of legal-info/ which contains what you should provide to
be in compliance with licenses terms.

> > Paint me unconvinced.
> What's the alternative?

Please re-review my proposal: the content of dl/ would always contains
everything unmolested. It is only when calling 'make legal-info' that
the filtering would be applied, and a new archive would be genrated with
only the filter (or filtered-out) content. I.e. basically:

    $ make legal-info
        for pkg in PACKAGES:
            if pkg.FOO_LEGAL_INFO_FILTER_REGEXP is not set:
                copy dl/foo-version.tar.gz to legal-info/foo-version/foo-version.tar.gz
                continue
            extract dl/foo-version.tar.gz \
                into temp-dir/ \
                if file matches pkg.FOO_LEGAL_INFO_FILTER_REGEXP
            create legal-info/foo-version/foo-version.tar.gz \
                from temp-dir/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
