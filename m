From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 4 Sep 2020 10:06:12 +0200
Subject: [Buildroot] [RFC PATCH v1 1/1] package/pkg-golang: download
 deps to vendor tree if not present
In-Reply-To: <CA+h8R2ooPOmJeE0dK7bQ+AyHG+ZT3ZRtYG80RjUdpBf78Q4aHw@mail.gmail.com>
References: <20200831070800.GN14354@scaer>
 <CAK714xKp0H5HEv5bp1bjDumZff6+cC41cs=exZk8bKuZTCV2vQ@mail.gmail.com>
 <20200903132852.GZ14354@scaer>
 <20200903160205.7e67bbe7@windsurf.home>
 <20200903151221.GA14354@scaer>
 <20200903181334.1a25642b@windsurf.home>
 <20200903191841.GC14354@scaer>
 <CA+h8R2rNmRJUor9CDjyNzsgGPCmpE3XPjtkFdjzCeMGYenWKxA@mail.gmail.com>
 <20200903204341.GE14354@scaer>
 <CA+h8R2ooPOmJeE0dK7bQ+AyHG+ZT3ZRtYG80RjUdpBf78Q4aHw@mail.gmail.com>
Message-ID: <20200904080612.GG14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, All,

On 2020-09-03 14:47 -0700, Christian Stewart spake thusly:
> On Thu, Sep 3, 2020 at 1:44 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2020-09-03 12:40 -0700, Christian Stewart spake thusly:
[--SNIP--]
> People are going to take Buildroot and store a private copy of it on
> their internal server, make modifications?
> 
> All of this on a GPLv2 licensed project? I thought this wasn't legal?

Of course this is totally legit. You do it all the time when you giot
clone toyour local machine and do modifications, for example.

> For br2-external packages you can relax the LICENSE requirement.

But in the Buildroot infra, we do not treat packages from br2-external
differently from in-tree packages.

> > The packages at stake here are non-public packages that people write as
> > part of their day-time job in their company. It is totally possible that
> > someone belives it would be "easier" to have the source of a dependency
> > bundled in their proprietary package.
> 
> That's fine, but that would go into br2-external as you've said.

No.

> > Which is *exactly* the case about a proprietary package vendoring a set
> > of external libraries.
> 
> If proprietary package is importing some external libraries that may
> be permissively licensed, even requiring redistribution in source
> form, without the proprietary section - how do you redistribute those
> dependencies separately?

Redistribution is the role of legal-info, see below how I suggest this
is handled.

> > > We're enforcing hash checks on these bundles. The format may not
> > > always be the same across versions. Storing the source code before
> > > it's extracted into a vendor tree is the only way to be sure that the
> > > hashes won't change between iterations of the package manager.
> >
> > If a package vendors unversioned dependencies, then indeed we can't add
> > hashes for that package, because two builds may get different stuff for
> > each such vendored dependency, like we don;t add hashes for stuff we
> > know is not reproducible (bzr, cvs, hg for example).
> 
> I don't understand what you're saying here. It should not be possible
> to have the package manager bring in arbitrary dependencies at build
> time. Buildroot builds are meant to produce the same output every
> time, right?

For example, dependencies in npm are loose, where yiou can say "I need
package bar at version 1.x". So at some point, the 'x' in '1.x' will
match the latest '1.1' and use that, but the next day, '1.2' might get
released, and the 'x' would match that. So if bar 1.2 brings in a new
dependency,or a new version of an existing dependency, two builds do not
provide the same output and are thus not reproducible.

See:
    https://docs.npmjs.com/files/package.json#dependencies
    https://docs.npmjs.com/misc/semver

> > > It's
> > > also the only way to redistribute the source code packages for the
> > > libraries independently from the proprietary part,
> >
> > Except as I explained, it does not work in case the dependencies have
> > dependencies to other proprietary packages, at an arbitrary depth...
> 
> I don't understand what you're saying here.
> 
> Package A (in buildroot) imports package B. Package B imports
> proprietary package C.

That is the other way around: the top-leval package is proprietary, and
it imports FLOSS packages:

  - foo is proprietary
    - foo vendors bar
      - bar is proprietary
        - bar vendors buz, which is FLOSS (e.g. MIT, LGPL...)
          - buz vendors ni
            - ni is FLOSS...
    - foo vendors doh
      - doh is FLOSS...
        - doh vendors bla
          - bla is FLOSS...

> > With my proposal, it would not be: there would be a single archive, for
> > which we have hashes. Then when we call legal-info, the package filter
> > is applied to generate a new archive in legal-info, which only contains
> > the filterd files.
> 
> Yes this is simpler but it won't work in every case. The vendor tree
> or the node_modules tree might have some minor things changed about it
> which will break the hash.

Then if the package manager can not generate reproducible archives, we
can't have hashes for it, period.

> Node-modules also often contains symlinks
> and binaries prepared for the particular host build system.

But those are created at build time, not at download time, right? Well,
node is so awful, that I would not be surprised...

> > And in the output of legal-info, we do not store the hahes from the
> > infra, we calculate the hashes already:
> >
> >     https://git.buildroot.org/buildroot/tree/Makefile#n870
> >
> > ... so we do not need to have hashes of download archives match the
> > legal-info archives.
> 
> I don't agree that legal is the only thing that matters here, you also
> want to be sure that you'll have a Buildroot build that works every
> time, without internet access, if you have a full "make download" pass
> run in advance.

Exactly the role of the dl/ directory; and that would contain the
complete downloaded archives with all the vendored dependencies.

> > > It's the only way to deduplicate downloads of identical
> > > package versions, to do LICENSE checks on dependencies, etc etc etc.
> >
> > That would not de-duplicate, because the separate archives would end up
> > in $(FOO_DL_DIR), which is $(BR2_DL_DIR)/foo/ anyway.
> 
> I don't understand what you're saying here. If I download package-c
> dependency at 1.0.4 it will be under - for example -
> $(BR2_DL_DIR)/go-modules/package-c/package-c-1.0.4.tar.gz. The
> deduplication is for package dependencies with identical versions and
> identical source URLs.

Ah, because you store all the go vendored dependencies "away" of the
package.

I am not sure I like that, because it breaks the semantics of the dl/
directory: all the csource needed by one package is in dl/foo/ and the
vendored dependencies *are* part of the package.

So I am absolutely not in favour of storing the go modules on the side.

> > Just running the package manager and compressing the result is the
> > easiest and simplest solution, that will work reliably and consistently
> > across all cases.
> 
> I don't agree, there are tons of cases where simply compressing the
> result after running "npm install" or "go mod vendor" will not
> necessarily work.

Why?

> You're also going to need to download tons of dependencies for
> features of the program that you may not even have enabled in your
> Buildroot config.

So, when you download the linux kernel, there are tons of code for tons
of features you don;t need.

Really, vendoring is, tome, exactly like bundling, except that the
aggregation happens on the client side, at download time, rather than on
the developpers machine that pushes a pre-aggregated "repository".

> > > > > >   - at extract step, how do you know that you have to also extract the
> > > > > >     archive with the vendor stuff? Probably easy by looking if said
> > > > > >     archive exists. But then, if each dependency is stored in its own
> > > > > >     archive, how do you know which to extract?
> > >
> > >  - Extract the main package
> > >  - Check the package.json or go.mod or cargo or whatever
> > >  - Extract the relevant stuff into a format the package manager understands
> >
> > This is what I mean by "reinventing the logic of the package managers".
> > Because this one go.mod would refer to dependencies, that my have their
> > won dependencies, so we'd have to look at the go.mod of teach
> > dependencies, recursively... Well, I think the top-level go.mod has all
> > the info, but what of the others?
> 
> This is already implemented as a library in Go. You don't have to
> re-do it from scratch.
> 
> https://pkg.go.dev/golang.org/x/tools/go/packages?tab=doc

But I don;t want we even have to deal with the internals of the go
module stuff at all, that's what I'm saying.

I don;t want we have to write a script (in whatever language) that has
to deal with the go module internals, to reproduce the logic.

go mod vendor is all that we should ever need to create the archives.

> The top-level go.mod and go.sum have all information on transient and
> indirect dependencies.

Good for go. Last I had to play wit ^W^W suffer of npm stuff, that was
not the case IIRC: a paclkage would only list its first-level
dependencies, and the install would recurse into that... And since the
versions of depenencies are floating, there is no way you can now what
you'd need ahead of time.

So again, I want that we have a consistent handling of all the package
managers, that they all behave the same.

> > >  - Run the package manager from the language to assemble the "vendor"
> > > tree in the source dir (maybe same step).
> >
> >     go mod vendor
> >
> > And that is all, I don't even need to look at go.mod and parse it to
> > know where to extract things; or even where to download them from.
> 
> And how is this better than running a Go program which understands how
> to download dependencies into the .tar.gz format that we expect, and
> to fetch them back again from that format into the Go module cache,
> and then the vendor/ tree?

Because writing a go program (or any other language) is duplicating the
logic of 'go mod vendor'.

> > I guess package.log is for npm. No idea what yarn is. Still, that's only
> > two out of at least three...
> Are you saying it's not possible to collect an index of indirect
> dependencies with those?

IIRC, for NPM, no. Or not trivially, or not reproducibly.

> > > > I do not want to have to repeat the vendoring logic in Buildroot.
> > > Why repeat it? Re-use it from the programming language! Not everything
> > > has to be in bash.
> > It's not about the language; it's about the logic.
> I don't understand what you mean.

The logic of vendoring.

For example, this could be a logic:

    def fill_deps(dep_file):
        for dep in file.read(dep_file):
            download(dep)
            fill_deps(dep.dependencies)

    def main():
        fill_deps(load_main_deps())

I do not want we do that, because it will be a maintenance burden, and
is duplicating the logic the package managers are there to cover in the
first place!

> > How do we know that such or such vendored depednency has to be
> > redsitributed?
> >
> > But is license "(C) BIG CORP" a redistributable license or not?
> 
> If you run "make source" it collects source for everything to produce
> the build, correct?
> 
> So, in this case we would collect everything needed for the build,
> scan LICENSE, if the package is in the Buildroot tree, fail if we
> don't recognize all the LICENSE files (allowing for manual override of
> course), and if it's in buildroot-ext, assume anything without LICENSE
> or with an unrecognized LICENSE is not redistributable and show a
> warning.
> 
> You wouldn't put anything proprietary into Buildroot proper since it's
> a GPLv2 project. It would be a extension package.

We do have proprietary packages in Buidlroot:

    boot/s500-bootloader/
    package/armbian-firmware/
    package/nvidia-driver/
    package/wilc1000-firmware/

And quite a few others...

IEANAL and all disclaimers... And no, this is not a violation of the
GPLv2 at all: Buildroot is not a derived work of those, not are those
a derived work of Buildroot.

(Note: I dropped the rest of the mail because I don't have time to reply
to it right now, and I am afraid I would anyway re-hash what I already
said...)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
