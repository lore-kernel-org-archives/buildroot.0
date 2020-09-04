From: Sam Voss <sam.voss@gmail.com>
Date: Fri, 4 Sep 2020 15:25:59 -0500
Subject: [Buildroot] [RFC PATCH v1 1/1] package/pkg-golang: download
 deps to vendor tree if not present
In-Reply-To: <CA+h8R2ryrWUX-4jLx2N58WePwoizb2-oaHYJE+ffyLM+8zB5uw@mail.gmail.com>
References: <20200831070800.GN14354@scaer>
 <CAK714xKp0H5HEv5bp1bjDumZff6+cC41cs=exZk8bKuZTCV2vQ@mail.gmail.com>
 <20200903132852.GZ14354@scaer> <20200903160205.7e67bbe7@windsurf.home>
 <20200903151221.GA14354@scaer> <20200903181334.1a25642b@windsurf.home>
 <20200903191841.GC14354@scaer>
 <CA+h8R2rNmRJUor9CDjyNzsgGPCmpE3XPjtkFdjzCeMGYenWKxA@mail.gmail.com>
 <20200903204341.GE14354@scaer>
 <CA+h8R2ooPOmJeE0dK7bQ+AyHG+ZT3ZRtYG80RjUdpBf78Q4aHw@mail.gmail.com>
 <20200904080612.GG14354@scaer>
 <CA+h8R2ryrWUX-4jLx2N58WePwoizb2-oaHYJE+ffyLM+8zB5uw@mail.gmail.com>
Message-ID: <CAK714xK8U_EFpC2C=H123jDmSUaYQTNgzv0ibt4QPT74VPy5pQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey everybody,

Was a long end of the week, and I finally had a minute to catch back up.

On Fri, Sep 4, 2020 at 11:07 AM Christian Stewart <christian@paral.in> wrote:
>
[snip]
> > Redistribution is the role of legal-info, see below how I suggest this
> > is handled.
>
> This isn't really my domain (legal-info) and what you've suggested -
> picking the dependencies out of vendor/ - might work for this.
>
> However, how do you know which version of the dependency is coming out
> of vendor/ ? I suppose you're going to redistribute
> my-package-vendor.tar.gz with anything proprietary excluded? So
> ultimately you redistribute 15 copies of the same thing?

I think that is an unfortunate consequence, yes, that we will have
some overlap of released things if two top-level packages which share
a similar dep chain. I think for now that should not be the focus of
the topic, as it's an unfortunate side-effect disk space is cheap.
>
> > > I don't understand what you're saying here. It should not be possible
> > > to have the package manager bring in arbitrary dependencies at build
> > > time. Buildroot builds are meant to produce the same output every
> > > time, right?
> >
> > For example, dependencies in npm are loose, where yiou can say "I need
> > package bar at version 1.x". So at some point, the 'x' in '1.x' will
> > match the latest '1.1' and use that, but the next day, '1.2' might get
> > released, and the 'x' would match that. So if bar 1.2 brings in a new
> > dependency,or a new version of an existing dependency, two builds do not
> > provide the same output and are thus not reproducible.
>
> We're really going to add packages to Buildroot which will have fuzzy
> dependencies and might bring in something different if Npm is having a
> bad day?
>
> For third party packages, this makes sense - you wouldn't have a hash
> on it. But for packages in the Buildroot tree you would probably
> expect a hash + a lock file. The same goes for Go with go.mod and
> go.sum - without go.sum you can't be sure it will be the same every
> time, and should not have a hash there.

Cargo+rust also uses a lock file, and the patchset proposed by Patrick
uses the "lock" flag to disallow buildroot from "upgrading" any
packages on the fly. It must use what is in the lock.

>
> Even with package-lock.json, the node_modules will not necessarily
> produce the same hash every time, particularly across different OS
> versions. So, are you saying we're not going to put hashes on
> /anything/ that uses npm?
>
> Go Modules is designed around always downloading the exact same
> dependencies, and our approach for that language can at least be built
> around that assumption (that it's going to use the go.sum every time
> to produce the same dependency output for most Buildroot in-tree
> packages).
>
> > > > > It's
> > > > > also the only way to redistribute the source code packages for the
> > > > > libraries independently from the proprietary part,
> > > >
> > > > Except as I explained, it does not work in case the dependencies have
> > > > dependencies to other proprietary packages, at an arbitrary depth...
> > >
> > > Package A (in buildroot) imports package B. Package B imports
> > > proprietary package C.

I'm not sure if this makes sense, in a general sense. I'm not sure how
we would anticipate this actually happening, where a FLOSS package
grabs something proprietary.

And to that point, maybe proprietary isn't what we should necessarily
be directly describing. In my mind it should be considered as
non-openly distributable.

> >
> > That is the other way around: the top-leval package is proprietary, and
> > it imports FLOSS packages:
> >
> >   - foo is proprietary
> >     - foo vendors bar
> >       - bar is proprietary
> >         - bar vendors buz, which is FLOSS (e.g. MIT, LGPL...)
> >           - buz vendors ni
> >             - ni is FLOSS...
> >     - foo vendors doh
> >       - doh is FLOSS...
> >         - doh vendors bla
> >           - bla is FLOSS...
>
> foo is proprietary - download to foo-version.tar.gz
>
> foo selects bar - download to bar-version.tar.gz.
>
> bar selects baz - download to baz-version.tar.gz
>
> foo selects baz - we already have it in baz-version.tar.gz.
>
> You can package them separately. Yes, you need to look into the first
> archive to know what the dependencies are. But, you need to do this
> with the vendoring anyway.

I don't think I'm following what you're getting at here - if you mean
'select' at a buildroot-level, I think it makes sense that both foo
and bar have vendoring which include baz, because they both need it.

This goes back into what I said before, and while it isn't perfect I
think is going to be a fact of our first iteration without making this
so convoluted nobody is going to take it on leading to everybody
carrying patchsets internally with an RFC thrown out to the mailing
list and wishing whoever wants to handle it "good luck".

>
> > > Yes this is simpler but it won't work in every case. The vendor tree
> > > or the node_modules tree might have some minor things changed about it
> > > which will break the hash.
> >
> > Then if the package manager can not generate reproducible archives, we
> > can't have hashes for it, period.
>
> No hashes for node_modules across all node_modules packages? :(

To my understanding, a lot of node is kind of "wild west" still, we
had to pull stuff in through the "install node packages" string this
year, and handle all vendoring ourselves.

>
> Buildroot packages that are actually merged into mainline, I would
> expect to produce reproducible output and have hashes on their
> downloaded source code files. It doesn't make sense to have a mainline
> package which is fetching random stuff due to fuzzy semver specifiers.
>
> For external or third party packages, those wouldn't have source code
> hashes, and that makes sense.
>
> For Go at least it will always be possible to make a hashed set of
> source code archives. It's possible to download & compress each
> dependency independently for Go as well, and analyze the licenses and
> whatever else.
>
> > > Node-modules also often contains symlinks
> > > and binaries prepared for the particular host build system.
> >
> > But those are created at build time, not at download time, right? Well,
> > node is so awful, that I would not be surprised...
>
> No - download time - the post install hooks are run. For example,
> electron might download + extract a tarball with Chromium.
>
> > > I don't agree that legal is the only thing that matters here, you also
> > > want to be sure that you'll have a Buildroot build that works every
> > > time, without internet access, if you have a full "make download" pass
> > > run in advance.
> >
> > Exactly the role of the dl/ directory; and that would contain the
> > complete downloaded archives with all the vendored dependencies.
>
> You want to have a download archive for every Buildroot package which
> contains ALL the dependencies for the package, and make this the ONLY
> way to do this?
>
> Even when node_modules won't necessarily work on some machines without
> running "npm install" again?
>
> The storage space increase alone of storing the entire node_modules
> for multiple packages across potentially many versions is a reason to
> at least consider an alternative.

What "reasonable" alternative do we have at this point?

>
> There's a way to split dependency source tarballs properly - even in
> Node - and even if it was impossible in Node, the limitations of Node
> shouldn't prevent us from doing this for a language that /can/ support
> it like Go.

Agree. NPM is notoriously worse than other modern package managers.

>
> I understand that the goal is to keep things as simple as possible and
> avoid adding any work for the maintainers, and indeed this makes
> sense.
>
> > > I don't understand what you're saying here. If I download package-c
> > > dependency at 1.0.4 it will be under - for example -
> > > $(BR2_DL_DIR)/go-modules/package-c/package-c-1.0.4.tar.gz. The
> > > deduplication is for package dependencies with identical versions and
> > > identical source URLs.
> >
> > Ah, because you store all the go vendored dependencies "away" of the
> > package.
> >
> > I am not sure I like that, because it breaks the semantics of the dl/
> > directory: all the csource needed by one package is in dl/foo/ and the
> > vendored dependencies *are* part of the package.

Semantics are semantics though, and a deviation shouldn't be thrown
out just due to them.

[snip]

> The goal is also to avoid breaking package source code download hashes
> after upgrading the tool, due to a change in the format of vendor/, to
> reduce source code tarball sizes, to make it easier to separate out
> proprietary and FLOSS components, and to ensure that the build is
> reproducible.
>
> I'll build & submit a RFC prototype so that it's clearer what I'm
> actually suggesting here.

Please reach out to me, I think we should be on reasonably-same
footing on an RFC and we're going to want to leverage this for both Go
and Rust.

>
> > > > I guess package.log is for npm. No idea what yarn is. Still, that's only
> > > > two out of at least three...
> > > Are you saying it's not possible to collect an index of indirect
> > > dependencies with those?
> >
> > IIRC, for NPM, no. Or not trivially, or not reproducibly.
>
> You absolutely can collect a manifest of dependencies reproducibly and
> easily with the package-lock.json.
>
> > > > > > I do not want to have to repeat the vendoring logic in Buildroot.
> > > > > Why repeat it? Re-use it from the programming language! Not everything
> > > > > has to be in bash.
> > > > It's not about the language; it's about the logic.
> > > I don't understand what you mean.
> >
> > The logic of vendoring.
>
> All of which is implemented in these languages already in a format
> that is at a very high level and will require little to no
> "reinventing the wheel" from us. (at least, for Go)
>
> > > You wouldn't put anything proprietary into Buildroot proper since it's
> > > a GPLv2 project. It would be a extension package.
> >
> > We do have proprietary packages in Buidlroot:
> >
> >     boot/s500-bootloader/
> >     package/armbian-firmware/
> >     package/nvidia-driver/
> >     package/wilc1000-firmware/
> >
> > And quite a few others...
>
> OK, I see what you mean by proprietary.

I actually meant to make this point earlier, but didn't. I think
"proprietary" isn't necessarily what I meant to stir up here. In my
case, and I believe others, my proprietary is non-distributable. Some
proprietary is distributable.

This is where we go back to my original comments: I think keeping
these packages out of the dep-chain should be the responsibility of
the package owners. Maybe we don't even error out when we catch it
happening, because to your point we may not care. Or add an option to
explicitly override.

Sorry for snipping a lot out, but as with Christian I replied to
everything that I felt wouldn't send us back in circles.

Thanks,

Sam
