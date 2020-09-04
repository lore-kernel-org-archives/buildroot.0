From: Christian Stewart <christian@paral.in>
Date: Fri, 4 Sep 2020 09:07:34 -0700
Subject: [Buildroot] [RFC PATCH v1 1/1] package/pkg-golang: download
 deps to vendor tree if not present
In-Reply-To: <20200904080612.GG14354@scaer>
References: <20200831070800.GN14354@scaer>
 <CAK714xKp0H5HEv5bp1bjDumZff6+cC41cs=exZk8bKuZTCV2vQ@mail.gmail.com>
 <20200903132852.GZ14354@scaer> <20200903160205.7e67bbe7@windsurf.home>
 <20200903151221.GA14354@scaer> <20200903181334.1a25642b@windsurf.home>
 <20200903191841.GC14354@scaer>
 <CA+h8R2rNmRJUor9CDjyNzsgGPCmpE3XPjtkFdjzCeMGYenWKxA@mail.gmail.com>
 <20200903204341.GE14354@scaer>
 <CA+h8R2ooPOmJeE0dK7bQ+AyHG+ZT3ZRtYG80RjUdpBf78Q4aHw@mail.gmail.com>
 <20200904080612.GG14354@scaer>
Message-ID: <CA+h8R2ryrWUX-4jLx2N58WePwoizb2-oaHYJE+ffyLM+8zB5uw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Fri, Sep 4, 2020 at 1:06 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> On 2020-09-03 14:47 -0700, Christian Stewart spake thusly:
> > On Thu, Sep 3, 2020 at 1:44 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > People are going to take Buildroot and store a private copy of it on
> > their internal server, make modifications?
>
> Of course this is totally legit. You do it all the time when you giot
> clone toyour local machine and do modifications, for example.

OK.

> Redistribution is the role of legal-info, see below how I suggest this
> is handled.

This isn't really my domain (legal-info) and what you've suggested -
picking the dependencies out of vendor/ - might work for this.

However, how do you know which version of the dependency is coming out
of vendor/ ? I suppose you're going to redistribute
my-package-vendor.tar.gz with anything proprietary excluded? So
ultimately you redistribute 15 copies of the same thing?

> > I don't understand what you're saying here. It should not be possible
> > to have the package manager bring in arbitrary dependencies at build
> > time. Buildroot builds are meant to produce the same output every
> > time, right?
>
> For example, dependencies in npm are loose, where yiou can say "I need
> package bar at version 1.x". So at some point, the 'x' in '1.x' will
> match the latest '1.1' and use that, but the next day, '1.2' might get
> released, and the 'x' would match that. So if bar 1.2 brings in a new
> dependency,or a new version of an existing dependency, two builds do not
> provide the same output and are thus not reproducible.

We're really going to add packages to Buildroot which will have fuzzy
dependencies and might bring in something different if Npm is having a
bad day?

For third party packages, this makes sense - you wouldn't have a hash
on it. But for packages in the Buildroot tree you would probably
expect a hash + a lock file. The same goes for Go with go.mod and
go.sum - without go.sum you can't be sure it will be the same every
time, and should not have a hash there.

Even with package-lock.json, the node_modules will not necessarily
produce the same hash every time, particularly across different OS
versions. So, are you saying we're not going to put hashes on
/anything/ that uses npm?

Go Modules is designed around always downloading the exact same
dependencies, and our approach for that language can at least be built
around that assumption (that it's going to use the go.sum every time
to produce the same dependency output for most Buildroot in-tree
packages).

> > > > It's
> > > > also the only way to redistribute the source code packages for the
> > > > libraries independently from the proprietary part,
> > >
> > > Except as I explained, it does not work in case the dependencies have
> > > dependencies to other proprietary packages, at an arbitrary depth...
> >
> > Package A (in buildroot) imports package B. Package B imports
> > proprietary package C.
>
> That is the other way around: the top-leval package is proprietary, and
> it imports FLOSS packages:
>
>   - foo is proprietary
>     - foo vendors bar
>       - bar is proprietary
>         - bar vendors buz, which is FLOSS (e.g. MIT, LGPL...)
>           - buz vendors ni
>             - ni is FLOSS...
>     - foo vendors doh
>       - doh is FLOSS...
>         - doh vendors bla
>           - bla is FLOSS...

foo is proprietary - download to foo-version.tar.gz

foo selects bar - download to bar-version.tar.gz.

bar selects baz - download to baz-version.tar.gz

foo selects baz - we already have it in baz-version.tar.gz.

You can package them separately. Yes, you need to look into the first
archive to know what the dependencies are. But, you need to do this
with the vendoring anyway.

> > Yes this is simpler but it won't work in every case. The vendor tree
> > or the node_modules tree might have some minor things changed about it
> > which will break the hash.
>
> Then if the package manager can not generate reproducible archives, we
> can't have hashes for it, period.

No hashes for node_modules across all node_modules packages? :(

Buildroot packages that are actually merged into mainline, I would
expect to produce reproducible output and have hashes on their
downloaded source code files. It doesn't make sense to have a mainline
package which is fetching random stuff due to fuzzy semver specifiers.

For external or third party packages, those wouldn't have source code
hashes, and that makes sense.

For Go at least it will always be possible to make a hashed set of
source code archives. It's possible to download & compress each
dependency independently for Go as well, and analyze the licenses and
whatever else.

> > Node-modules also often contains symlinks
> > and binaries prepared for the particular host build system.
>
> But those are created at build time, not at download time, right? Well,
> node is so awful, that I would not be surprised...

No - download time - the post install hooks are run. For example,
electron might download + extract a tarball with Chromium.

> > I don't agree that legal is the only thing that matters here, you also
> > want to be sure that you'll have a Buildroot build that works every
> > time, without internet access, if you have a full "make download" pass
> > run in advance.
>
> Exactly the role of the dl/ directory; and that would contain the
> complete downloaded archives with all the vendored dependencies.

You want to have a download archive for every Buildroot package which
contains ALL the dependencies for the package, and make this the ONLY
way to do this?

Even when node_modules won't necessarily work on some machines without
running "npm install" again?

The storage space increase alone of storing the entire node_modules
for multiple packages across potentially many versions is a reason to
at least consider an alternative.

There's a way to split dependency source tarballs properly - even in
Node - and even if it was impossible in Node, the limitations of Node
shouldn't prevent us from doing this for a language that /can/ support
it like Go.

I understand that the goal is to keep things as simple as possible and
avoid adding any work for the maintainers, and indeed this makes
sense.

> > I don't understand what you're saying here. If I download package-c
> > dependency at 1.0.4 it will be under - for example -
> > $(BR2_DL_DIR)/go-modules/package-c/package-c-1.0.4.tar.gz. The
> > deduplication is for package dependencies with identical versions and
> > identical source URLs.
>
> Ah, because you store all the go vendored dependencies "away" of the
> package.
>
> I am not sure I like that, because it breaks the semantics of the dl/
> directory: all the csource needed by one package is in dl/foo/ and the
> vendored dependencies *are* part of the package.

We aren't actually running "go mod vendor" or "npm install" and
storing the result in the tarballs (as far as I am aware) today.

> So I am absolutely not in favour of storing the go modules on the side.

Just to clarify, so I understand, the reasons not to are ?

 - Currently we can say that if you extract a .tar.gz from dl it will
be buildable
 - It's too hard to add code to manage dependencies
 - Some packages don't use locking and are getting different deps everytime

And you're willing to take the downsides of mixing together all sorts
of proprietary and FLOSS code into these .tar.gz download files,
making it next to impossible to independently redistribute
dependencies from proprietary Go packages (for example?) and
increasing the size of the dl/ tree many times over?

> > You're also going to need to download tons of dependencies for
> > features of the program that you may not even have enabled in your
> > Buildroot config.
>
> So, when you download the linux kernel, there are tons of code for tons
> of features you don;t need.
>
> Really, vendoring is, tome, exactly like bundling, except that the
> aggregation happens on the client side, at download time, rather than on
> the developpers machine that pushes a pre-aggregated "repository".

It's entirely avoidable to store duplicate copies of the dependencies
for Go programs many times over in vendor/ trees compressed into the
.tar.gz with the root project.

Linux being a large project with tons of code you don't build, doesn't
necessarily preclude making some alternative when possible.

> > > This is what I mean by "reinventing the logic of the package managers".
> > > Because this one go.mod would refer to dependencies, that my have their
> > > won dependencies, so we'd have to look at the go.mod of teach
> > > dependencies, recursively... Well, I think the top-level go.mod has all
> > > the info, but what of the others?
> >
> > This is already implemented as a library in Go. You don't have to
> > re-do it from scratch.
> >
> > https://pkg.go.dev/golang.org/x/tools/go/packages?tab=doc
>
> But I don;t want we even have to deal with the internals of the go
> module stuff at all, that's what I'm saying.
>
> I don;t want we have to write a script (in whatever language) that has
> to deal with the go module internals, to reproduce the logic.

The packages and tools make it easy to do this without getting into
the internals, those are very high level APIs there.

I guess the only way to prove this particular point is to just write
the scripts as a RFC?

> > The top-level go.mod and go.sum have all information on transient and
> > indirect dependencies.
>
> Good for go. Last I had to play wit ^W^W suffer of npm stuff, that was
> not the case IIRC: a paclkage would only list its first-level
> dependencies, and the install would recurse into that... And since the
> versions of depenencies are floating, there is no way you can now what
> you'd need ahead of time.

I was not aware that you would ever add a package to Buildroot which
uses floating semver selections, and could get a different version
between "make" executions. Please remind me to never build or install
any of those packages :)

> Because writing a go program (or any other language) is duplicating the
> logic of 'go mod vendor'.

But we would still be running "go mod vendor" - the idea is to
pre-fill the Go modules cache from the Buildroot dl tree, and avoid
having tarballs in the dl tree that contain source code from multiple
projects simultaneously.

The goal is also to avoid breaking package source code download hashes
after upgrading the tool, due to a change in the format of vendor/, to
reduce source code tarball sizes, to make it easier to separate out
proprietary and FLOSS components, and to ensure that the build is
reproducible.

I'll build & submit a RFC prototype so that it's clearer what I'm
actually suggesting here.

> > > I guess package.log is for npm. No idea what yarn is. Still, that's only
> > > two out of at least three...
> > Are you saying it's not possible to collect an index of indirect
> > dependencies with those?
>
> IIRC, for NPM, no. Or not trivially, or not reproducibly.

You absolutely can collect a manifest of dependencies reproducibly and
easily with the package-lock.json.

> > > > > I do not want to have to repeat the vendoring logic in Buildroot.
> > > > Why repeat it? Re-use it from the programming language! Not everything
> > > > has to be in bash.
> > > It's not about the language; it's about the logic.
> > I don't understand what you mean.
>
> The logic of vendoring.

All of which is implemented in these languages already in a format
that is at a very high level and will require little to no
"reinventing the wheel" from us. (at least, for Go)

> > You wouldn't put anything proprietary into Buildroot proper since it's
> > a GPLv2 project. It would be a extension package.
>
> We do have proprietary packages in Buidlroot:
>
>     boot/s500-bootloader/
>     package/armbian-firmware/
>     package/nvidia-driver/
>     package/wilc1000-firmware/
>
> And quite a few others...

OK, I see what you mean by proprietary.

> (Note: I dropped the rest of the mail because I don't have time to reply
> to it right now, and I am afraid I would anyway re-hash what I already
> said...)

I'll get back to you all with a RFC patch for the Go approach. I can't
speak for node but allowing Node to have unhashed fuzzy semver
specifiers in Buildroot, is not something I can recommend, since it
seems almost like a security issue.

Best regards,
Christian Stewart
