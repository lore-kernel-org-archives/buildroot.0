From: Christian Stewart <christian@paral.in>
Date: Sun, 10 Mar 2019 17:08:30 -0700
Subject: [Buildroot] [PATCH 1/1] package/go: bump to version 1.12
In-Reply-To: <20190310102831.GC25009@scaer>
References: <20190226034554.24429-1-christian@paral.in>
 <20190226082449.040c7a2a@windsurf.home>
 <CA+h8R2qERZ1EjoyCiSCD32K8KM9m5OS_RdQ3iS59m9UmBUEwYw@mail.gmail.com>
 <CA+_SqVbzRuEgvansndPeSVqOeratEK5aGc+OGTc0e6j0FeJEkw@mail.gmail.com>
 <87sgvvccbr.fsf@paral.in> <20190310102831.GC25009@scaer>
Message-ID: <CA+h8R2ocNHQgo9=yYZ-AevRwCV9jo9tVE-eFTSi4YAO=2ODD2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

"Yann E. MORIN" <yann.morin.1998@free.fr> writes:
>> I'm beginning to work on this now, would it be acceptable if Buildroot
>> adopted the following approach:

Here's a brief explanation of what Go modules are from the perspective
of a Buildroot developer.

Reference: https://github.com/golang/go/wiki/Modules

Go code uses a package-based imports system. Imports are relative to a
root directory, previously called GOPATH.

import "github.com/docker/docker/pkg/myutils"

This would resolve to $GOPATH/src/github.com/docker/docker/pkg/myutils.

Note, although Github is in the import, it is not necessary to fetch the
code from Github. This is just a naming convention.

Buildroot packages currently use an additional feature in the Go tool
which allows packages to avoid using GOPATH by "vendoring" dependencies
- copying the code directly into the Git repository.

vendor/github.com/docker/docker/pkg/myutils

Today all of our Buildroot Go modules use "vendor" to avoid downloading
dependencies. But, this requires that the Go projects we add to
Buildroot include all of their dependencies in their repositories, which
is a mess. It also does not allow us the opportunity to validate
dependency changes when upgrading packages in Buildroot.

The Go module system aims to completely replace the GOPATH mechanism by
allowing the Go tool to reason about package versioning, code fetching,
proxying, and checksumming.

A project can contain any number of go.mod files. A go.mod file is akin
to Node's package.json file. It specifies all direct and indirect
dependencies of all Go packages in the subtree below the file. The Go
tool can manage this file automatically if desired, and specifies a
required format. Go.mod additionally requires dependency versions to be
explicitly specified. There is no semantic versioning or asterisk-based
version specifiers.

module mymodule

require (
github.com/aws/aws-sdk-go v1.17.12 // indirect
github.com/blang/semver v3.5.2-0.20180723201105-3c1074078d32+incompatible
)

The Go tool creates a go.sum file next to the go.mod file. The go.sum
file is akin to Node's package-shrinkwrap.json.

github.com/aws/aws-sdk-go v1.15.31/go.mod
h1:mFuSZ37Z9YOHbQEwBWztmVzqXrEkub65tZoCYDt7FT0=
github.com/aws/aws-sdk-go v1.17.12
h1:jMFwRUaM0LcfdenfvbDLePNoWSoCdOHqF4RCvSB4xNQ=
github.com/aws/aws-sdk-go v1.17.12/go.mod
h1:KmX6BPdI08NWTb3/sm4ZGu5ShLoqVDhKgpiN924inxo=
github.com/blang/semver
v3.5.2-0.20180723201105-3c1074078d32+incompatible
h1:8fBbhRkI5/0ocLFbrhPgnGUm0ogc+Gko1cRodPWDKX4=
github.com/blang/semver
v3.5.2-0.20180723201105-3c1074078d32+incompatible/go.mod
h1:kRBLl5iJ+tD4TcOOxsy/0fnwebNt5EWlYSAyrTnjyyk=

The file contains import paths, versions, and file hashes for the
download as well as the contained go.mod file.

With replace directives, it's possible to link together local copies of
modules:

replace (
k8s.io/gengo => ./staging/src/k8s.io/gengo
k8s.io/kube-openapi => ./staging/src/k8s.io/kube-openapi
)

When GO111MODULE=on, all of the Go tool commands become "module-aware."
GOPATH is no longer required. Running "go build" for example will fetch
dependencies from the Internet, checksum them, and extract to a staging
directory (defaulting currently to GOPATH/pkg/gomod or so). Imports are
automatically resolved to the appropriately versioned staging directory.

There are various ways to control the download / extract behavior:

  The GOPROXY environment variable allows further control over the
  download source. If GOPROXY is unset, is the empty string, or is the
  string "direct", downloads use the default direct connection to
  version control systems. Setting GOPROXY to "off" disallows
  downloading modules from any source. Otherwise, GOPROXY is expected to
  be the URL of a module proxy, in which case the go command will fetch
  all modules from that proxy. No matter the source of the modules,
  downloaded modules must match existing entries in go.sum...

  Even when downloading directly from version control systems, the go
  command synthesizes explicit info, mod, and zip files and stores them
  in its local cache, $GOPATH/pkg/mod/cache/download, the same as if it
  had downloaded them directly from a proxy. The cache layout is the
  same as the proxy URL space, so serving $GOPATH/pkg/mod/cache/download
  at (or copying it to) https://example.com/proxy would let other users
  access those cached module versions with
  GOPROXY=https://example.com/proxy.

GOPROXY additionally supports file:// URLs.

---

With the above in mind, here's how I believe we could integrate this
with Buildroot:

>>  - Remove GOPATH

GOPATH is deprecated anyway so this will be necessary. I'd strongly
recommend that Buildroot make a hard requirement that all Go-based
packages use the go.mod and go.sum construction, and configure Go to
ignore the existing vendor/ trees. This would allow us to pin versioning
and tightly control download checksumming through the package.hash ->
go.sum merkle tree.

If a package does not have a go.mod or go.sum file, a patch would be
added to Buildroot to include the files with the correct pinned
dependencies.

>>  - Configure Go to download module files to buildroot/dl/go-modules

We can set the paths such that the $GOPATH/pkg/mod/cache/download
directory resolves to buildroot/dl/go-modules. According to the above
documentation, a Buildroot user could then serve the dl/go-modules
directory directly with a HTTP server and set GOPROXY such that all
module downloads come from that server. This could be configurable
eventually via the Buildroot KConfig architecture.

Initially, the desired behavior would be implemented by setting GOPROXY
to "direct" (or perhaps the Buildroot download mirrors?) during the
downloading phase.

> How would you get the modules list and their URIs, when we are just
> downloading? The package sources are not yet extracted.

This is a good question. There are a couple of options. One conservative
approach is to download and extract, and use the "extract" step to do
the second stage of module downloading after extracting the package
sources.

A more radical approach, which would perhaps be cleaner, would be to
disable the Buildroot download mechanism completely for Go packages,
include the root go.mod and go.sum in Buildroot next to the .mk and
Config files, and allow Go to manage fetching all of the dependencies
including the root package.

>>  - Set GOPROXY to allow network during download step only.

This would be, during the download phase, execute "go mod download"

During the extract phase, we would create the build/package/ dir under
the output directory as usual in Buildroot, then execute "go mod vendor"
to extract the code sources into build/package/vendor

During the build phase, we would then disable the Go moduling system and
compile from the extracted "vendor" tree. This would help improve build
stability and determinism by only engaging the Module code during
download / extract.

>>  - Require go.mod and go.sum hashes for all Go packages.

> Not sure what go.mod and go.sum are, but if you're suggesting that we
> have hashes in foo.hash for all modules in package foo, that would be
> nice, yes!

They are explained above - these files specify the required dependency
versions, and hash the downloaded code artifacts to ensure integrity.

>>  - During extract step, run "go mod vendor" to extract code to build/
> ... getting the modules from $(BR2_DL_DIR) instead of downloading them
> that is?

Exactly.

>>  - Use vendored building mode "-mod=vendor"
>
> If that were possible, I would like that, yes. That'd be good!
>
> However, I'd suggest that this extra module vendoring dance only occur
> if the package has set a specific variable, like we do for git
> submodules:
>
>     FOO_GO_MODULES = YES
>
> (I almost wrote GOO_MODULES ;-) )
>
> That way, if a package does not explicitly request them, it would fail
> at build time since they would not be available and would not be already
> downloaded.

The only situation where we would not want to use Go modules is if the
package has no external dependencies, or if we want to use the
old-fashioned vendor/ tree approach. I can prototype this in a way where
the old behavior will be kept without a FOO_GO_MODULES flag, if this is
something that we want.

> Of course, if we expect the majority of go packages to have modules,
> that variable would be moot...

Best regards,
Christian Stewart
