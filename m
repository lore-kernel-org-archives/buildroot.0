From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Mar 2019 17:50:11 +0100
Subject: [Buildroot] [RFC PATCH v1 1/6] package/go: implement go modules
 integration
In-Reply-To: <20190317012142.10545-1-christian@paral.in>
References: <20190317012142.10545-1-christian@paral.in>
Message-ID: <20190327175011.4aa0a655@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,

I've been trying to get my head around this topic, but I don't really
grasp why we're changing this. What is the advantage of implementing
this go module integration compared to what we're doing today ? Looking
at your patches 2/6 to 6/6 doesn't make the thing very appealing: we
need additional files (go.mod and go.sum) for each package using Go,
which were not needed before, and we have a 5k lines patch in
docker-cli.

On Sat, 16 Mar 2019 18:21:37 -0700
Christian Stewart <christian@paral.in> wrote:

> This commit moves from the GOPATH mechanism to the new GO111MODULE approach for
> Go based packages. Old Go packages (with the exception of docker-cli) will
> compile without changes (for example, mender, flanneld).

I don't understand this last sentence: your series is converting
docker-cli (which requires a huge patch), but not mender and flanneld.

> Cavets with the current implementation:
> 
>  - "make source" may not produce a valid output
>  - module downloading occurs ignoring the Buildroot download server
>  - module downloading occurs in a post-patch hook

If it has all those caveats, so why do we want this ?

> Go code uses a package-based imports system. Imports are
> relative to a root directory, previously called GOPATH.
> 
> import "github.com/docker/docker/pkg/myutils"
> 
> This would resolve to $GOPATH/src/github.com/docker/docker/pkg/myutils.
> 
> Buildroot packages previously used an additional feature in the Go tool which
> allows packages to avoid using GOPATH by "vendoring" dependencies - copying the
> code directly into the Git repository.
> 
> vendor/github.com/docker/docker/pkg/myutils

What does this path means ?

> Old packages that used the vendor/ approach remain compatible via inferring the
> root import path from the download URL if no go.mod is present.
> 
> All current Buildroot Go modules use "vendor" to avoid downloading dependencies.
> This requires that the Go projects added to Buildroot include all of their
> dependencies in their repositories.

So some upstream Go projects collect all their dependencies in their
Git repo, while some other upstream Go projects do not do that ? Just
for my understanding, could you show an example of two projects, one in
each situation ?

> It also does not allow us the opportunity to
> validate or adjust dependency versions when upgrading packages in Buildroot.

I'm sorry, but I don't understand what you mean here :-/

> A project can contain any number of go.mod files. A go.mod file is akin to
> Node's package.json file. It specifies all direct and indirect dependencies of
> all Go packages in the subtree below the file. The Go tool can manage this file
> automatically if desired, and specifies a required format. Go.mod additionally
> requires dependency versions to be explicitly specified. There is no semantic
> versioning or asterisk-based version specifiers.
> 
> module mymodule
> 
> require (
> github.com/aws/aws-sdk-go v1.17.12 // indirect
> github.com/blang/semver v3.5.2-0.20180723201105-3c1074078d32+incompatible
> )

Please add a sentence before dropping some example code. Something
like: "Here is an example go.mod file that shows ...".

> The Go tool creates a go.sum file next to the go.mod file. The go.sum
> file is akin to Node's package-shrinkwrap.json.
> 
> github.com/aws/aws-sdk-go v1.15.31/go.mod
> h1:mFuSZ37Z9YOHbQEwBWztmVzqXrEkub65tZoCYDt7FT0=
> github.com/aws/aws-sdk-go v1.17.12
> h1:jMFwRUaM0LcfdenfvbDLePNoWSoCdOHqF4RCvSB4xNQ=
> github.com/aws/aws-sdk-go v1.17.12/go.mod
> h1:KmX6BPdI08NWTb3/sm4ZGu5ShLoqVDhKgpiN924inxo=
> github.com/blang/semver
> v3.5.2-0.20180723201105-3c1074078d32+incompatible
> h1:8fBbhRkI5/0ocLFbrhPgnGUm0ogc+Gko1cRodPWDKX4=
> github.com/blang/semver
> v3.5.2-0.20180723201105-3c1074078d32+incompatible/go.mod
> h1:kRBLl5iJ+tD4TcOOxsy/0fnwebNt5EWlYSAyrTnjyyk=

Ditto, please make it clear that this is an example of a go.sum file.

> The file contains import paths, versions, and file hashes for the download as
> well as the contained go.mod file.
> 
> With replace directives, it's possible to link together local copies of modules:
> 
> replace (
> k8s.io/gengo => ./staging/src/k8s.io/gengo
> k8s.io/kube-openapi => ./staging/src/k8s.io/kube-openapi
> )

How does this story of "replace directives" fits in the overall
picture ? You just give this information about "replace directives",
with no connection with the rest of the explanation.

> When GO111MODULE=on, all of the Go tool commands become "module-aware." GOPATH
> is no longer required. Running "go build" for example will fetch dependencies
> from the Internet, checksum them, and extract to a staging directory (defaulting
> currently to GOPATH/pkg/gomod or so). Imports are automatically resolved to the
> appropriately versioned staging directory.
> 
> There are various ways to control the download / extract behavior:
> 
>   The GOPROXY environment variable allows further control over the
>   download source. If GOPROXY is unset, is the empty string, or is the
>   string "direct", downloads use the default direct connection to
>   version control systems. Setting GOPROXY to "off" disallows
>   downloading modules from any source. Otherwise, GOPROXY is expected to
>   be the URL of a module proxy, in which case the go command will fetch
>   all modules from that proxy. No matter the source of the modules,
>   downloaded modules must match existing entries in go.sum...
> 
>   Even when downloading directly from version control systems, the go
>   command synthesizes explicit info, mod, and zip files and stores them
>   in its local cache, $GOPATH/pkg/mod/cache/download, the same as if it
>   had downloaded them directly from a proxy. The cache layout is the
>   same as the proxy URL space, so serving $GOPATH/pkg/mod/cache/download
>   at (or copying it to) https://example.com/proxy would let other users
>   access those cached module versions with
>   GOPROXY=https://example.com/proxy.
> 
> GOPROXY additionally supports file:// URLs.

Perhaps this should be concluded by "Buildroot will set GOPROXY to ...
in order to achieve a behavior that ...".

> This commit sets GOPATH to $(DL_DIR)/go-module, as the Go module system will
> download and cache code sources in the GOPATH/pkg/mod path.
> 
> The go.mod and go.sum files can optionally be placed in $(2)_PKGDIR next to
> Config.in and other support files.

How does it work if there is no go.mod/go.sum file ?

> They are copied in with a post-download hook, and "go mod download"
> is executed to pull the dependencies from the internet.
> 
> A hook is added to execute "go mod vendor".

What is "go mod vendor" going to do ?

> Upstream vendor trees are still optionally supported, but can be
> overridden by placing go.mod into the Buildroot tree as described
> above. Package developers can alternatively specify LIBFOO_GOMOD to
> indicate the root module path. This allows the Go module tool to
> compile code using a legacy vendor/ tree, without a GOPATH to
> indicate the import path for the root module.
> 
> DOCKER_ENGINE_GOMOD = github.com/docker/docker

Again, please don't throw example code in the middle of the commit log
without an introduction.

> A Buildroot user can serve the dl/go-modules directory directly with
> a HTTP server and set GOPROXY such that all module downloads come
> from that server. This could be configurable eventually via the
> Buildroot KConfig architecture.
> 
> During the build phase, the "-mod=vendor" option is used to indicate
> that the extracted vendor/ tree (from the post-extract step) is to be
> used.
> 
> Go modules are never disabled with this approach. They are compatible
> with the legacy vendor/ tree approach by the above mechanisms.

These last two paragraphs are still very fuzzy for me :-/ I guess I
need to read more about Go modules.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
