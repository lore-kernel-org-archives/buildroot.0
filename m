From: Christian Stewart <christian@paral.in>
Date: Mon, 11 Mar 2019 20:35:59 -0700
Subject: [Buildroot] [PATCH 1/1] package/go: bump to version 1.12
In-Reply-To: <24269451-e4c6-1ac4-1084-c23996361eb4@mind.be>
References: <20190226034554.24429-1-christian@paral.in>
 <20190226082449.040c7a2a@windsurf.home>
 <CA+h8R2qERZ1EjoyCiSCD32K8KM9m5OS_RdQ3iS59m9UmBUEwYw@mail.gmail.com>
 <CA+_SqVbzRuEgvansndPeSVqOeratEK5aGc+OGTc0e6j0FeJEkw@mail.gmail.com>
 <87sgvvccbr.fsf@paral.in> <20190310102831.GC25009@scaer>
 <CA+h8R2ocNHQgo9=yYZ-AevRwCV9jo9tVE-eFTSi4YAO=2ODD2Q@mail.gmail.com>
 <24269451-e4c6-1ac4-1084-c23996361eb4@mind.be>
Message-ID: <87imwovk68.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Arnout Vandecappelle <arnout@mind.be> writes:
>  So, since the version is explicit, it's actually completely equivalent to the
> vendoring: it's still impossible to treat the modules as packages in the
> Buildroot sense, since Buildroot doesn't allow the same package to have
> different versions. It's essentially just making our life more difficult :-(.

I don't think it makes sense to treat them as packages in this sense anyway.

>  That said, at least it's a consistent way for Go packages to work.

This also seems to all be in line with the Go developers' intent and
philosophy around dependency management: they prioritize compatibility
and robust operation over deduplicating dependency instances.

> Another thing: the module specification is just a path component, not a full
> URL. Is the https:// implicit? Does it always pull from git? Or does it have
> some kind of autoconversion similar to our github helper?

The Go code fetching mechanisms are complex, but heavily used, and I
would assume they always use https shallow Git clones of the desired
versions. The go.sum checksumming system ensures everything is
consistent as well.

>> GOPATH is deprecated anyway so this will be necessary. I'd strongly
>> recommend that Buildroot make a hard requirement that all Go-based
>> packages use the go.mod and go.sum construction, and configure Go to
>> ignore the existing vendor/ trees.
>
>  I've taken a look at the upstream master branch of the go packages we currently
> have, and none of them seems to have a go.mod yet... So I think this is a little
> bit premature.

Removing GOPATH is not as extreme as it sounds. This is just a
re-organization of the build code to simplify it quite a bit.

Today, the build code tries to synthesize a gopath (pkg-golang.mk):

$(2)_WORKSPACE ?= _gopath

$(2)_SRC_DOMAIN = $$(call domain,$$($(2)_SITE))
$(2)_SRC_VENDOR = $$(word 1,$$(subst /, ,$$(call notdomain,$$($(2)_SITE))))
$(2)_SRC_SOFTWARE = $$(word 2,$$(subst /, ,$$(call notdomain,$$($(2)_SITE))))
$(2)_SRC_SUBDIR ?= $$($(2)_SRC_DOMAIN)/$$($(2)_SRC_VENDOR)/$$($(2)_SRC_SOFTWARE)
$(2)_SRC_PATH = $$(@D)/$$($(2)_WORKSPACE)/src/$$($(2)_SRC_SUBDIR)

mkdir -p $$(dir $$($(2)_SRC_PATH))
ln -sf $$(@D) $$($(2)_SRC_PATH)

GOPATH="$$(@D)/$$($(2)_WORKSPACE)"

This creates the following directory structure:

$(@D)/pkg_gopath/src/github.com/myorg/mypackage/CODE_SYMLINKED_HERE

Then the Go tool is configured to use pkg_gopath as the GOPATH.

With the Go modules system, even if a Go project is not configured to
use Go modules at all, it no longer is necessary to build a GOPATH.

With the absence of a go.mod and go.sum file, and the presence of a
vendor/ dir, the Go tool will now correctly recognize the vendor/ and
build outside GOPATH. This defaults GO111MODULE=on when Go is invoked
outside GOPATH. In Go 1.13, GOPATH will be removed completely (or at
least, deprecated).

In buildroot, we can simplify the code significantly with this new
construction. We can simply extract code to $(@D), enable GO111MODULE,
and the build will function correctly.

>> This would allow us to pin versioning
>> and tightly control download checksumming through the package.hash ->
>> go.sum merkle tree.
>
>  I may miss something, but if it's in vendor/ in the upstream git repo (either
> as a submodule or as a copy), it's also tightly controlled and checksummed,
> right? 

The build would be executed with go build -mod=vendor, which tells the
Go tool to ignore go.mod and use vendor/ only. Then, if vendor/ is
already present in the upstream Git repo, we can skip the "go mod
download" and "go mod vendor" steps.

The result is that the Go tool uses the following directory layout
regardless of if Go modules download/extract was used during the
download phase:

 - $(@D)/vendor: contains all deps extracted
 - $(@D)/go.mod: contains at minimum "module github.com/myorg/mymodule"

> So I don't think this is really bringing any value. For us, I mean - I
> imagine it *does* bring value for people developing Go packages.

If we ignore vendor/ in the upstream Git repository and introduce our
own go.mod, it would allow us to tightly control changes to dependencies
(including security updates) within the Buildroot project, even if
upstream maintainers do not update their vendor trees. This is
especially important when we are using older revisions of projects that
do not maintain release branches with vendored code.

In short, this would allow us to centralize the responsibility of Go
dependency management in the Go module system, store all dependencies in
the GOPROXY mechanism / Buildroot download directory, and force upgrades
of dependencies for older revisions of projects without introducing
large code vendoring patches into the Buildroot tree.

>> If a package does not have a go.mod or go.sum file, a patch would be
>> added to Buildroot to include the files with the correct pinned
>> dependencies.

This seems like a viable solution -

 1. Copy the Buildroot package directory go.mod, go.sum in if exists.
 2. If no go.mod exists in the project, write one with the minimum
 "module github.com/myorg/mymodule" line.
 3. Execute "go mod download" and "go mod vendor" as discussed.

In point #1, if vendor/ already exists, and we indicate we want to
override vendor/, then we can delete the upstream Git vendor/ tree in
this step.

>>>>  - Configure Go to download module files to buildroot/dl/go-modules
>
>  If all modules go together in a single location, there is a risk that there
> will be two modules with the same name and version that are in reality different
> modules. Or are the full paths repeated there? I.e., does the zip file end up
> under a github.com/foo/bar directory?

No. The Go tool uses an intricate path scheme to avoid collisions, and
does not assume integrity of the on-disk cache (as far as I know).

>> We can set the paths such that the $GOPATH/pkg/mod/cache/download
>> directory resolves to buildroot/dl/go-modules. According to the above
>> documentation, a Buildroot user could then serve the dl/go-modules
>> directory directly with a HTTP server and set GOPROXY such that all
>> module downloads come from that server. This could be configurable
>> eventually via the Buildroot KConfig architecture.
>
>  No need for it to be configurable, it could be the BR2_PRIMARY_SITE.

This seems like the best approach.

Here is some reference from go help goproxy:

  A Go module proxy is any web server that can respond to GET requests for
  URLs of a specified form. The requests have no query parameters, so even
  a site serving from a fixed file system (including a file:/// URL)
  can be a module proxy.

  The GET requests sent to a Go module proxy are:

  GET $GOPROXY/<module>/@v/list returns a list of all known versions of the
  given module, one per line.

  GET $GOPROXY/<module>/@v/<version>.info returns JSON-formatted metadata
  about that version of the given module.

  GET $GOPROXY/<module>/@v/<version>.mod returns the go.mod file
  for that version of the given module.

  GET $GOPROXY/<module>/@v/<version>.zip returns the zip archive
  for that version of the given module.

  To avoid problems when serving from case-sensitive file systems,
  the <module> and <version> elements are case-encoded, replacing every
  uppercase letter with an exclamation mark followed by the corresponding
  lower-case letter: github.com/Azure encodes as github.com/!azure.

So perhaps we would want to add some suffix to PRIMARY_SITE.

Something further down the pipe, but worth looking at for those
interested, is the upcoming Go code notary project: 

https://go.googlesource.com/proposal/+/master/design/25530-notary.md

>  However, IIUC, the GOPROXY mechanism doesn't have any fallback. So I guess the
> full solution would be to add something like go download infra that first sets
> GOPROXY to file://$(BR2_DL_DIR)/go-modules, then to
> $(BR2_PRIMARY_SITE)/go-modules, then direct, and finally
> $(BR2_SECONDARY_SITE)/go-modules.

https://github.com/golang/go/issues/26334

Looks like indeed, it doesn't have a fallback yet. However, this is a
bit awkward: what if our GOPROXY doesn't have just a single dependency?

The download tree looks like:

??? github.com
??? ??? davecgh
??? ??? ??? go-spew
??? ???     ??? @v
??? ???         ??? list
??? ???         ??? list.lock
??? ???         ??? v1.1.1.info
??? ???         ??? v1.1.1.mod
??? golang.org
    ??? x
        ??? crypto
        ??? ??? @v
        ???     ??? list
        ???     ??? list.lock
        ???     ??? v0.0.0-20180904163835-0709b304e793.info
        ???     ??? v0.0.0-20180904163835-0709b304e793.lock
        ???     ??? v0.0.0-20180904163835-0709b304e793.mod
        ???     ??? v0.0.0-20180904163835-0709b304e793.zip
        ???     ??? v0.0.0-20180904163835-0709b304e793.ziphash

I tried downloading just one dependency, then copying the
$GOPATH/pkg/mod/cache/download/* files to GOPROXY=file://path/to/copy.

Then, invoking Go build:

go: finding golang.org/x/crypto v0.0.0-20180904163835-0709b304e793
Fetching file://goproxy/golang.org/x/crypto/@v/v0.0.0-20180904163835-0709b304e793.info
Fetching file://goproxy/golang.org/x/crypto/@v/v0.0.0-20180904163835-0709b304e793.mod

Okay, this worked as expected. Now, adding a new dependency:

Fetching file://goproxy/github.com/urfave/cli/@v/list
Fetching file://goproxy/github.com/urfave/@v/list
Fetching file://goproxy/github.com/@v/list
build tmod: cannot load github.com/urfave/cli: cannot find module providing package github.com/urfave/cli

Hmm. Looks like it doesn't have a fallback yet.

Athens is another project addressing this area: https://github.com/gomods/athens

>  Except that I have another idea, see below.

>> A more radical approach, which would perhaps be cleaner, would be to
>> disable the Buildroot download mechanism completely for Go packages,
>> include the root go.mod and go.sum in Buildroot next to the .mk and
>> Config files, and allow Go to manage fetching all of the dependencies
>> including the root package.
>
>  That, combined with the go download infra I mentioned above, would indeed be a
> feasible approach.
>
>  Ideally, the go.mod would include the package itself too, so we don't need to
> download in two steps (i.e. first the package itself, then the modules it uses).
> But that might be a bit more difficult.

This is completely doable.

This approach actually opens up a few other interesting possibilties. We
can add a command to set the environment variables up for the Go tool,
and then execute the tool to automatically maintain the go.mod file for
a particular package.

  With no package arguments, 'go get' applies to the main module, and to
  the Go package in the current directory, if any. In particular, 'go
  get -u' and 'go get -u=patch' update all the dependencies of the main
  module. 

  If invoked with -mod=readonly, the go command is disallowed from the
  implicit automatic updating of go.mod described above. Instead, it
  fails when any changes to go.mod are needed. This setting is most
  useful to check that go.mod does not need updates, such as in a
  continuous integration and testing system. The "go get" command
  remains permitted to update go.mod even with -mod=readonly, and the
  "go mod" commands do not take the -mod flag (or any other build
  flags).

Of course, this is speculative and not necessary for an initial implementation.

>  Alternatively, we could add a post-extract hook that executes "go mod vendor"
> with GOPROXY=file://$(BR2_DL_DIR)/go-modules. But maybe that's what you meant.

This is correct.

>> During the build phase, we would then disable the Go moduling system and
>
>  disable == GOPROXY=off, right?

GOPROXY=off in every situation other than when we want to download code.

Additionally, during build, we would use "-mod=vendor."

  To build using the main module's top-level vendor directory to satisfy
  dependencies (disabling use of the usual network sources and local
  caches), use 'go build -mod=vendor'. Note that only the main module's
  top-level vendor directory is used; vendor directories in other
  locations are still ignored.

>  If we anyway end up with everything extracted in the vendor tree, we can just
> as well do that during the *download* step. Similar like we do for VCS
> downloads: we get the *entire* source tree, including go modules, and tar that up.
>
>  We'd still have a go SITE_METHOD and corresponding download helper. This one
> would first use another download method to get the base tarball, then extract
> it, run 'go mod vendor' with GOPROXY=direct, and create a new tarball.
>
>  This way, the PRIMARY_SITE, SECONDARY_SITE, 'make source', PRIMARY_ONLY, 'make
> source-check' would all still work. So it would be (I think) the least invasive
> way to introduce this.

This seems like the right approach. This all feels similar to how
Buildroot uses the Git tool to clone a repository, check out a revision,
and bundle up a tarball today.

>  With my proposal, this would be FOO_SITE_METHOD = go
>
>  Oh BTW we'd probably also need to support something like FOO_SITE_METHOD =
> go+git. dl-wrapper will (should) strip off the first +, the go download helper
> would have to handle the second +. But that can be done in a follow-up patch :-)

This is way too fancy for me to implement :)

>  I think it's worth prototyping something that is not complete yet, and send it
> to the list with a lot of comments in the commit message about what is still
> missing. That's probably a better basis for discussion that English text.

Something to note: you can set GOMOD variable to the path to a go.mod file.

Okay, I'll have a look at:

 - use vendor/ with GO111MODULE=on, remove gopath
 - use -mod=vendor during build phase
 - set GOCACHE properly (what is it set to today??)
 - set GOPATH such that the Go tool downloads to dl/go-modules/pkg/mod

And (pick one):

 - post-extract hook with optional go.mod in repository, "go mod vendor"
 - additional site method which "go mod vendor" and re-compress to tarball

Best regards,
Christian Stewart
