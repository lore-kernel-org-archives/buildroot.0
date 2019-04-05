From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 5 Apr 2019 10:32:04 +0200
Subject: [Buildroot] [RFC PATCH v1 1/6] package/go: implement go modules
 integration
In-Reply-To: <CA+h8R2pottDYri4wipLFqJdepDpos08Un2T5m--ifX5qjUOjMw@mail.gmail.com>
References: <20190317012142.10545-1-christian@paral.in>
 <20190327175011.4aa0a655@windsurf>
 <CA+h8R2pottDYri4wipLFqJdepDpos08Un2T5m--ifX5qjUOjMw@mail.gmail.com>
Message-ID: <575a8345-978c-1abd-13eb-4b6cd8829233@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Christian,

 Thanks again for working on this. And thanks Thomas for taking a look as well.

On 27/03/2019 19:36, Christian Stewart wrote:
> Hi Thomas,
> 
> Some initial clarifications: this is a RFC and very much a Work in
> Progress. It is not complete, nor is it intended to be merged anywhere
> near its current form. The patch series is a reply to Arnout's request
> for an example of what these approaches might look like in Buildroot.

 You should have put this sentence prominently in the first patch's commit
message. But the RFC should have been a hint, of course. Also, I've marked the
series as RFC in patchwork.


 I think that one issue with this gomodules stuff is that the mails (and commit
messages) are getting too long, which makes it very hard for people to
understand it all. Of course, it doesn't help that all this go stuff is wildly
unfamiliar for most people.

 But anyway, it would be good if parts of this problem could be bitten off in
smaller pieces. Suggestions will follow.


> The original discussion is here:
> 
> https://patchwork.ozlabs.org/patch/1048076/
> 
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
>>> Cavets with the current implementation:
>>>
>>>  - "make source" may not produce a valid output
>>>  - module downloading occurs ignoring the Buildroot download server
>>>  - module downloading occurs in a post-patch hook
>>
>> If it has all those caveats, so why do we want this ?
> 
> Because these are issues with the initial WIP/RFC.

 Still, it would be good if you had at least some idea of how these could be solved.


> Please note the last
> email in the chain at https://patchwork.ozlabs.org/patch/1048076/
> 
> Arnout:
> 
>   So these are the more controversial ones. I think you should pick the
>   one you like most, make a quick prototype that works for one specific
>   package, note what is missing in the commit log, and send it to the
>   list for discussion.

 You forgot to mention the two options, and which one you picked:

   - post-extract hook with optional go.mod in repository, "go mod vendor"
   - additional download method which does "go mod vendor" and re-compress to
     a tarball (similar to git download)

and IIUC you picked the first one.


> So here you go. This is the prototype with the list of cavets of the
> prototype. This is not a list of cavets with Go modules in general.
> 
> The introduction to the commit message is a copy of my writeup on what
> Go modules are.
> 
>> I've been trying to get my head around this topic, but I don't really
>> grasp why we're changing this. What is the advantage of implementing
>> this go module integration compared to what we're doing today ?
> 
> The "old way" using GOPATH will be removed in Go 1.13 or Go 1.14. We
> need to plan a solution in advance. However, vendor/ will not stop
> working anytime soon.

 So, here's a bite-sized piece: just convert GOPATH into GO111MODULE, but
assuming that the vendor/ tree is present. I believe that the current patch does
exactly that, but it *also* does something else...

> 
> The most minimal version of this patch series would be to enable
> GO111MODULE, place a go.mod file which specifies the Go import path of

 ... I understood from our previous conversation that the go.mod file is in fact
not needed. If the go.mod file is missing, then the go tool will just use the
vendor tree as is. Which is perfect for our current situation.

 So, IMO, the _APPLY_EXTRACT_GOMOD part should be removed from this patch. Then,
patch 1 becomes a really simple patch that people can get their head around. And
you get a much better baseline to explain what you want to do, since you no
longer have to compare against GOPATH; you only need to compare against a
non-instantiated vendor tree.

 As usual, if I understand correctly, of course :-)


> the root of the repository, and allow the Go tool to use the upstream
> vendor/ tree. The patch already does this in the absence of
> $(PKG_DIR)/go.mod and $(@D)/go.mod with the presence of $(@D)/vendor.
> 
> Today, to accomplish the same behavior with GOPATH (which is being
> removed/deprecated in Go 1.13), we symlink a directory path like this:
> 
> $(@D)/gopath/src/github.com/docker/docker/ -> $(@D)
> 
> We currently require upstream developers to copy the source code of
> every dependency into their repository under vendor/. For each Go
> package we get a separate dependency tree provided by the upstream
> developer at the version we have the package pinned to in Buildroot.
> 
>> Looking at your patches 2/6 to 6/6 doesn't make the thing very
>> appealing: we need additional files (go.mod and go.sum) for each
>> package using Go, which were not needed before, and we have a 5k lines
>> patch in docker-cli.
> 
> The vendor/ mechanism continues to work, however, not every Go package
> copies dependencies verbatim into their repository. Under the "current
> way" to support these vendor-less packages, I would need to submit a
> patch to buildroot that contains a copy of every dependency's Go source.

 Actually, you would need to specify additional downloads, and a post-extract
hook to extract them into the vendor directory.

 If you can give an example of a package that only has a few of these, I could
create an example of how it might work without any extra infra. Although I'm not
entirely sure if such an example would be very useful, except to show that it
would be extremely hard to maintain.


>> I don't understand this last sentence: your series is converting
>> docker-cli (which requires a huge patch), but not mender and flanneld.
> 
> Mender and Flanneld are examples of packages with vendor/ trees that are
> still compatible with the new patch. Docker-cli is an example of how we
> might override the upstream vendor/ tree with our own dependency
> pinning. (the go.mod and go.sum files produce the same vendor/ tree as
> upstream has in their source tree today).

 If that is the example, then it shows that it's definitely not the way we want
to go... But I don't think it's the example that you want to show, because
you're not yet using go modules to download stuff.


> This is a Proof-of-Concept of how we might update a specific dependency
> with a critical CVE or other bug which is vendored into an old upstream
> vendor/ tree. The Buildroot maintainers, upon discovering the CVE or
> other bug, could update the specific dependency to a newer revision with
> the fix. This a "feature" and more speculative. It's not required for a
> v1 of this patch.

 Is this something that we want to do? Go has apparently chosen for this
vendoring model where it is the responsibility of the package maintainers to
update their dependencies, and not of the distro. In that model, if the package
maintainers don't do their job, we're not going to fix the world for them. In
general, we only take fixes (even for CVEs) that come from upstream. Maybe we'll
backport a fix, but nothing more than that.

 By using the vendoring approach, Go has basically chosen to make each CVE in a
library a CVE against all packages using that library, which has to be solved
separately in each user. Recursively.

 All of the above IMHO.

[snip]
> Here are some examples of projects that do not include vendor/:
> 
>  - https://github.com/dustin/gomemcached
>  - https://github.com/syncthing/syncthing
>  - https://github.com/drone/drone
>  - https://github.com/nsqio/nsq
>  - https://github.com/cockroachdb/cockroach
> 
> CockroachDB is an interesting example of a common case where vendor/
> will NOT work with Buildroot. The vendor/ tree is a submodule. As we
> currently download the GitHub tarball for GitHub based packages, this
> source tarball will not contain the contents of vendor/.

 That one would actually still work - we *can* use the git download method for
github packages.

 nsq is a better example - it doesn't have a vendor tree nor submodules. And it
has an actual modern go.mod. And it's a nice example that trying to do this
manually within buildroot is not doable: the go.mod is huge. Like, npm-huge...

 However, the current patch set does nothing to solve that, I think. So it would
be nice to have an example of how we might integrate something like nsq.


> However, the project does have Gopkg.lock and Gopkg.toml, which are
> files for an old tool called "Dep" which was previously created by the
> community to solve dependency versioning. The Go Modules tool will
> automatically read and recognize this format and convert it to go.mod.
> 
> With this patch, you could add CockroachDB and the other projects above.
> Without, it would not be able to be added, and I don't see any way to
> get the submodule into the source tree, so it probably will never be
> added to Buildroot.
> 
>>> It also does not allow us the opportunity to validate or adjust
>>> dependency versions when upgrading packages in Buildroot.
>>
>> I'm sorry, but I don't understand what you mean here :-/
> 
> Please see my above comments re: updating a dependency version when a
> CVE or other bug is found.

 As I explained above: Buildroot will not do that.

> Specifically, consider the case where we have
> an older LTS Buildroot branch pointing to an unmaintained older revision
> of the project. With vendor/ coming from the downloaded upstream source
> tarball, we would not be able to fix the CVE or bug without copying the
> patch in the Buildroot tree.

 Well, actually we can... In any of the approaches we're considering, after the
extract step we will have all the dependencies present in the vendor/ tree. So
we can always add a patch for a CVE fix in a dependent package in the usual way
(we just have to add some directory components to the upstream patch).

 The only situation where this would not be the case is if we would let the go
tool do its downloads during the build step. But that is something we
*definitely* want to avoid.


>>> A project can contain any number of go.mod files. A go.mod file is akin to
>>> Node's package.json file. It specifies all direct and indirect dependencies of
>>> all Go packages in the subtree below the file. The Go tool can manage this file
>>> automatically if desired, and specifies a required format. Go.mod additionally
>>> requires dependency versions to be explicitly specified. There is no semantic
>>> versioning or asterisk-based version specifiers.
>>>
>>> module mymodule
>>>
>>> require (
>>> github.com/aws/aws-sdk-go v1.17.12 // indirect
>>> github.com/blang/semver v3.5.2-0.20180723201105-3c1074078d32+incompatible
>>> )
>>
>> Please add a sentence before dropping some example code. Something
>> like: "Here is an example go.mod file that shows ...".
> 
> The entire paragraph before the code sample explains what it is. I will
> explicitly label it as an example in the future.
> 
>>> replace (
>>> k8s.io/gengo => ./staging/src/k8s.io/gengo
>>> k8s.io/kube-openapi => ./staging/src/k8s.io/kube-openapi
>>> )
>>
>> How does this story of "replace directives" fits in the overall
>> picture ? You just give this information about "replace directives",
>> with no connection with the rest of the explanation.
> 
> These can be placed into go.mod and allow you to replace a specific
> dependency with another one, or to alias the dependency to a local path.

 Yeah, that bit is not very clear to me either... Is it intended to be able to
override the version of recursive dependencies?


>> Perhaps this should be concluded by "Buildroot will set GOPROXY to ...
>> in order to achieve a behavior that ...".
> 
> Please note the commit message is a copy/paste of my Go modules
> explanation from the email thread in the original discussion. I have no
> idea how we would address GOPROXY in a v1 of this patch.

 Easy: in the current sitatution, we *never* want the go tool to download
anything (because we expect everything to be present in the vendor/ tree), so we
can just globally export GOPROXY=off. IIUC.

 Note that this is something that would potentially break existing external
packages, so should be mentioned clearly in the release notes. It can be fixed
easily, of course, by setting GOPROXY=direct in <PKG>_GO_ENV.

 Given that this is a slightly more controversial thing, I would do it in a
separate patch from the GOPATH removal.


>>> This commit sets GOPATH to $(DL_DIR)/go-module, as the Go module system will
>>> download and cache code sources in the GOPATH/pkg/mod path.
>>>
>>> The go.mod and go.sum files can optionally be placed in $(2)_PKGDIR next to
>>> Config.in and other support files.
>>
>> How does it work if there is no go.mod/go.sum file ?
> 
> We place a go.mod file with a single line, for example:
> 
>  module github.com/docker/docker
> 
> This is sufficient to use the upstream vendor/ tree. The Go tool can
> also read the package files from other tools like Dep (Gopkg.toml).

 So,

- if a go.mod is present, we can use the Go tool;
- if a legacy .toml or whatever is present, we can use the Go tool;
- if there is a vendor/ tree but no metadata, we need to create an almost-empty
  go.mod.

Correct?

 And all of that is only needed to be able to do the 'go mod vendor' command in
a post-extract hook, right?

 What does 'go mod vendor' do if there is no go.mod or legacy file?

 What I also don't understand is why we would ever add a go.mod ourselves... If
upstream has one, clearly there is no reason to add one. If upstream has a
.toml, then we can just use that. If upstream has nothing, it means that
everything is already in the vendor/ tree so implicitly versioned, so we also
don't need anything from the go mod logic. We *maybe* should create the one-line
go.mod that just declares the module, but even that I'm not sure of.

 Can you explain why patch 2 is needed, converting runc's vendor.conf into a
go.mod and go.sum?


>>> They are copied in with a post-download hook, and "go mod download"
>>> is executed to pull the dependencies from the internet.

 I may be blind, but I don't see this call to 'go mod download'... I suppose
that it is in fact the 'go mod vendor' call that will implicitly do a download, no?


>>> A hook is added to execute "go mod vendor".
>>
>> What is "go mod vendor" going to do ?
> 
> It will extract the files from the buildroot go-module download tree
> into $(@D)/vendor/...
> 
>>> Upstream vendor trees are still optionally supported, but can be
>>> overridden by placing go.mod into the Buildroot tree as described
>>> above. Package developers can alternatively specify LIBFOO_GOMOD to
>>> indicate the root module path. This allows the Go module tool to
>>> compile code using a legacy vendor/ tree, without a GOPATH to
>>> indicate the import path for the root module.
>>>
>>> DOCKER_ENGINE_GOMOD = github.com/docker/docker
>>
>> Again, please don't throw example code in the middle of the commit log
>> without an introduction.
> 
> Please see above.
> 
>>> A Buildroot user can serve the dl/go-modules directory directly with
>>> a HTTP server and set GOPROXY such that all module downloads come
>>> from that server. This could be configurable eventually via the
>>> Buildroot KConfig architecture.
>>>
>>> During the build phase, the "-mod=vendor" option is used to indicate
>>> that the extracted vendor/ tree (from the post-extract step) is to be
>>> used.
>>
>> These last two paragraphs are still very fuzzy for me :-/ I guess I
>> need to read more about Go modules.
> 
>  1. Code is downloaded by the Go tool, hashed, and stored in dl/go-modules.
>  2. Code is extracted to $(@D)/vendor with the "go mod vendor" command.
>  3. go build -mod=vendor ./ will inform the Go tool that we want to use vendor/

 So, I think this should be chunked into:

1. Replace GOPATH with -mod=vendor - the same patch will need to update packages
if needed to keep them building.

2. Update packages to remove no-longer-needed _WORKSPACE etc. settings.

3. export GOPROXY=off

4. Run 'go mod vendor' in a post-extract hook. This should still be RFC because
it violates the offline builds principle. Don't forget to mention some ideas of
how the limitations could be overcome.

5. Add a package (nsq?) that would be very difficult to support without the
go.mod support.

6. Add support for Buildroot-supplied go.mod.

7. Add or modify a package that actually makes sensible use of the
Buildroot-supplied go.mod.


 Regards,
 Arnout
