From: Christian Stewart <christian@paral.in>
Date: Wed, 27 Mar 2019 11:36:20 -0700
Subject: [Buildroot] [RFC PATCH v1 1/6] package/go: implement go modules
 integration
In-Reply-To: <20190327175011.4aa0a655@windsurf>
References: <20190317012142.10545-1-christian@paral.in>
 <20190327175011.4aa0a655@windsurf>
Message-ID: <CA+h8R2pottDYri4wipLFqJdepDpos08Un2T5m--ifX5qjUOjMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Some initial clarifications: this is a RFC and very much a Work in
Progress. It is not complete, nor is it intended to be merged anywhere
near its current form. The patch series is a reply to Arnout's request
for an example of what these approaches might look like in Buildroot.

The original discussion is here:

https://patchwork.ozlabs.org/patch/1048076/

Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
>> Cavets with the current implementation:
>>
>>  - "make source" may not produce a valid output
>>  - module downloading occurs ignoring the Buildroot download server
>>  - module downloading occurs in a post-patch hook
>
> If it has all those caveats, so why do we want this ?

Because these are issues with the initial WIP/RFC. Please note the last
email in the chain at https://patchwork.ozlabs.org/patch/1048076/

Arnout:

  So these are the more controversial ones. I think you should pick the
  one you like most, make a quick prototype that works for one specific
  package, note what is missing in the commit log, and send it to the
  list for discussion.

So here you go. This is the prototype with the list of cavets of the
prototype. This is not a list of cavets with Go modules in general.

The introduction to the commit message is a copy of my writeup on what
Go modules are.

> I've been trying to get my head around this topic, but I don't really
> grasp why we're changing this. What is the advantage of implementing
> this go module integration compared to what we're doing today ?

The "old way" using GOPATH will be removed in Go 1.13 or Go 1.14. We
need to plan a solution in advance. However, vendor/ will not stop
working anytime soon.

The most minimal version of this patch series would be to enable
GO111MODULE, place a go.mod file which specifies the Go import path of
the root of the repository, and allow the Go tool to use the upstream
vendor/ tree. The patch already does this in the absence of
$(PKG_DIR)/go.mod and $(@D)/go.mod with the presence of $(@D)/vendor.

Today, to accomplish the same behavior with GOPATH (which is being
removed/deprecated in Go 1.13), we symlink a directory path like this:

$(@D)/gopath/src/github.com/docker/docker/ -> $(@D)

We currently require upstream developers to copy the source code of
every dependency into their repository under vendor/. For each Go
package we get a separate dependency tree provided by the upstream
developer at the version we have the package pinned to in Buildroot.

> Looking at your patches 2/6 to 6/6 doesn't make the thing very
> appealing: we need additional files (go.mod and go.sum) for each
> package using Go, which were not needed before, and we have a 5k lines
> patch in docker-cli.

The vendor/ mechanism continues to work, however, not every Go package
copies dependencies verbatim into their repository. Under the "current
way" to support these vendor-less packages, I would need to submit a
patch to buildroot that contains a copy of every dependency's Go source.

> I don't understand this last sentence: your series is converting
> docker-cli (which requires a huge patch), but not mender and flanneld.

Mender and Flanneld are examples of packages with vendor/ trees that are
still compatible with the new patch. Docker-cli is an example of how we
might override the upstream vendor/ tree with our own dependency
pinning. (the go.mod and go.sum files produce the same vendor/ tree as
upstream has in their source tree today).

This is a Proof-of-Concept of how we might update a specific dependency
with a critical CVE or other bug which is vendored into an old upstream
vendor/ tree. The Buildroot maintainers, upon discovering the CVE or
other bug, could update the specific dependency to a newer revision with
the fix. This a "feature" and more speculative. It's not required for a
v1 of this patch.

>> Buildroot packages previously used an additional feature in the Go tool which
>> allows packages to avoid using GOPATH by "vendoring" dependencies - copying the
>> code directly into the Git repository.
>>
>> vendor/github.com/docker/docker/pkg/myutils
>
> What does this path means ?

It's an example of the sentence immediately before the line. This patch
series is intended to be a initial introduction and a example of what
something like this might look like. The commit message is not intended
to be final yet. I will adjust anything I write in the future to
explicitly say "here is an example..." instead of assuming that the
reader is looking top-to-bottom.

> So some upstream Go projects collect all their dependencies in their
> Git repo, while some other upstream Go projects do not do that ? Just
> for my understanding, could you show an example of two projects, one
> in each situation ?

Yes, this is correct.

Most major projects still use vendor/ today because it's the most
foolproof way (without Go modules) to ensure no incorrect dependency
gets into the mix, and because most projects are still supporting Go
1.10 which does not have Go module support.

Go modules were just added in Go 1.11 (we're at 1.12.1 now).

Here's a background on vendor:

https://github.com/golang/go/wiki/PackageManagementTools#go15vendorexperiment

Here's a background on Go modules:

https://github.com/golang/go/wiki/Modules

Docker currently still collects vendor tree. Here is a URL to that:

https://github.com/docker/engine/tree/da823cf3a5a3437763ba12b2fa369c826d4a2bf4/vendor

Here are some examples of projects that do not include vendor/:

 - https://github.com/dustin/gomemcached
 - https://github.com/syncthing/syncthing
 - https://github.com/drone/drone
 - https://github.com/nsqio/nsq
 - https://github.com/cockroachdb/cockroach

CockroachDB is an interesting example of a common case where vendor/
will NOT work with Buildroot. The vendor/ tree is a submodule. As we
currently download the GitHub tarball for GitHub based packages, this
source tarball will not contain the contents of vendor/.

However, the project does have Gopkg.lock and Gopkg.toml, which are
files for an old tool called "Dep" which was previously created by the
community to solve dependency versioning. The Go Modules tool will
automatically read and recognize this format and convert it to go.mod.

With this patch, you could add CockroachDB and the other projects above.
Without, it would not be able to be added, and I don't see any way to
get the submodule into the source tree, so it probably will never be
added to Buildroot.

>> It also does not allow us the opportunity to validate or adjust
>> dependency versions when upgrading packages in Buildroot.
>
> I'm sorry, but I don't understand what you mean here :-/

Please see my above comments re: updating a dependency version when a
CVE or other bug is found. Specifically, consider the case where we have
an older LTS Buildroot branch pointing to an unmaintained older revision
of the project. With vendor/ coming from the downloaded upstream source
tarball, we would not be able to fix the CVE or bug without copying the
patch in the Buildroot tree.

>> A project can contain any number of go.mod files. A go.mod file is akin to
>> Node's package.json file. It specifies all direct and indirect dependencies of
>> all Go packages in the subtree below the file. The Go tool can manage this file
>> automatically if desired, and specifies a required format. Go.mod additionally
>> requires dependency versions to be explicitly specified. There is no semantic
>> versioning or asterisk-based version specifiers.
>>
>> module mymodule
>>
>> require (
>> github.com/aws/aws-sdk-go v1.17.12 // indirect
>> github.com/blang/semver v3.5.2-0.20180723201105-3c1074078d32+incompatible
>> )
>
> Please add a sentence before dropping some example code. Something
> like: "Here is an example go.mod file that shows ...".

The entire paragraph before the code sample explains what it is. I will
explicitly label it as an example in the future.

>> replace (
>> k8s.io/gengo => ./staging/src/k8s.io/gengo
>> k8s.io/kube-openapi => ./staging/src/k8s.io/kube-openapi
>> )
>
> How does this story of "replace directives" fits in the overall
> picture ? You just give this information about "replace directives",
> with no connection with the rest of the explanation.

These can be placed into go.mod and allow you to replace a specific
dependency with another one, or to alias the dependency to a local path.

> Perhaps this should be concluded by "Buildroot will set GOPROXY to ...
> in order to achieve a behavior that ...".

Please note the commit message is a copy/paste of my Go modules
explanation from the email thread in the original discussion. I have no
idea how we would address GOPROXY in a v1 of this patch.

>> This commit sets GOPATH to $(DL_DIR)/go-module, as the Go module system will
>> download and cache code sources in the GOPATH/pkg/mod path.
>>
>> The go.mod and go.sum files can optionally be placed in $(2)_PKGDIR next to
>> Config.in and other support files.
>
> How does it work if there is no go.mod/go.sum file ?

We place a go.mod file with a single line, for example:

 module github.com/docker/docker

This is sufficient to use the upstream vendor/ tree. The Go tool can
also read the package files from other tools like Dep (Gopkg.toml).

>> They are copied in with a post-download hook, and "go mod download"
>> is executed to pull the dependencies from the internet.
>>
>> A hook is added to execute "go mod vendor".
>
> What is "go mod vendor" going to do ?

It will extract the files from the buildroot go-module download tree
into $(@D)/vendor/...

>> Upstream vendor trees are still optionally supported, but can be
>> overridden by placing go.mod into the Buildroot tree as described
>> above. Package developers can alternatively specify LIBFOO_GOMOD to
>> indicate the root module path. This allows the Go module tool to
>> compile code using a legacy vendor/ tree, without a GOPATH to
>> indicate the import path for the root module.
>>
>> DOCKER_ENGINE_GOMOD = github.com/docker/docker
>
> Again, please don't throw example code in the middle of the commit log
> without an introduction.

Please see above.

>> A Buildroot user can serve the dl/go-modules directory directly with
>> a HTTP server and set GOPROXY such that all module downloads come
>> from that server. This could be configurable eventually via the
>> Buildroot KConfig architecture.
>>
>> During the build phase, the "-mod=vendor" option is used to indicate
>> that the extracted vendor/ tree (from the post-extract step) is to be
>> used.
>
> These last two paragraphs are still very fuzzy for me :-/ I guess I
> need to read more about Go modules.

 1. Code is downloaded by the Go tool, hashed, and stored in dl/go-modules.
 2. Code is extracted to $(@D)/vendor with the "go mod vendor" command.
 3. go build -mod=vendor ./ will inform the Go tool that we want to use vendor/

Best regards,
Christian Stewart
