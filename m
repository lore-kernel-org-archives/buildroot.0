From: Christian Stewart <christian@paral.in>
Date: Fri, 05 Apr 2019 03:47:35 -0700
Subject: [Buildroot] [RFC PATCH v1 1/6] package/go: implement go modules
 integration
In-Reply-To: <575a8345-978c-1abd-13eb-4b6cd8829233@mind.be>
References: <20190317012142.10545-1-christian@paral.in>
 <20190327175011.4aa0a655@windsurf>
 <CA+h8R2pottDYri4wipLFqJdepDpos08Un2T5m--ifX5qjUOjMw@mail.gmail.com>
 <575a8345-978c-1abd-13eb-4b6cd8829233@mind.be>
Message-ID: <87a7h4d8zc.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,


Arnout Vandecappelle <arnout@mind.be> writes:
>>>> Cavets with the current implementation:
>>>>
>>>>  - "make source" may not produce a valid output
>>>>  - module downloading occurs ignoring the Buildroot download server
>>>>  - module downloading occurs in a post-patch hook
>>> If it has all those caveats, so why do we want this ?
>> Because these are issues with the initial WIP/RFC.
>  Still, it would be good if you had at least some idea of how these could be solved.

Create a new package download method that uses the "go mod download" and
"go mod vendor" steps seems to be the only way to go.

>  So, here's a bite-sized piece: just convert GOPATH into GO111MODULE, but
> assuming that the vendor/ tree is present. I believe that the current patch does
> exactly that, but it *also* does something else...
>> 
>> The most minimal version of this patch series would be to enable
>> GO111MODULE, place a go.mod file which specifies the Go import path of
>
>  ... I understood from our previous conversation that the go.mod file is in fact
> not needed. If the go.mod file is missing, then the go tool will just use the
> vendor tree as is. Which is perfect for our current situation.

The file IS needed because the Go tool needs to know the root package
path at $(@D). For example, in Docker, this is
"github.com/docker/docker" even though the code comes from
"github.com/docker/engine."

>
>  So, IMO, the _APPLY_EXTRACT_GOMOD part should be removed from this patch. Then,
> patch 1 becomes a really simple patch that people can get their head around. And
> you get a much better baseline to explain what you want to do, since you no
> longer have to compare against GOPATH; you only need to compare against a
> non-instantiated vendor tree.

This part cannot be removed but the go.mod in the Buildroot tree and the
module download / vendor steps could be for an initial version. I'll
spin a series with this soon.

>  Actually, you would need to specify additional downloads, and a post-extract
> hook to extract them into the vendor directory.
>
>  If you can give an example of a package that only has a few of these, I could
> create an example of how it might work without any extra infra. Although I'm not
> entirely sure if such an example would be very useful, except to show that it
> would be extremely hard to maintain.

This doesn't make any sense to me.

>  If that is the example, then it shows that it's definitely not the way we want
> to go... But I don't think it's the example that you want to show, because
> you're not yet using go modules to download stuff.

I am using Go modules to download stuff in this PoC patch.

>> This is a Proof-of-Concept of how we might update a specific dependency
>> with a critical CVE or other bug which is vendored into an old upstream
>> vendor/ tree. The Buildroot maintainers, upon discovering the CVE or
>> other bug, could update the specific dependency to a newer revision with
>> the fix. This a "feature" and more speculative. It's not required for a
>> v1 of this patch.
>
>  Is this something that we want to do? Go has apparently chosen for this
> vendoring model where it is the responsibility of the package maintainers to
> update their dependencies, and not of the distro. In that model, if the package
> maintainers don't do their job, we're not going to fix the world for them. In
> general, we only take fixes (even for CVEs) that come from upstream. Maybe we'll
> backport a fix, but nothing more than that.

I don't see the point. If we discover a security issue, this provides a
mechanism to override a dependency at download time. If this is not
something that Buildroot wants I'm happy to just remove the 2 lines it
takes to implement it in the code.

>  By using the vendoring approach, Go has basically chosen to make each CVE in a
> library a CVE against all packages using that library, which has to be solved
> separately in each user. Recursively.

They have not chosen to do this. The vendoring model is/was a stop-gap
until something better (Modules) was developed.

>  nsq is a better example - it doesn't have a vendor tree nor submodules. And it
> has an actual modern go.mod. And it's a nice example that trying to do this
> manually within buildroot is not doable: the go.mod is huge. Like, npm-huge...
>
>  However, the current patch set does nothing to solve that, I think. So it would
> be nice to have an example of how we might integrate something like nsq.

The current patch set DOES solve this. It would work fine AS IS, since
the "go mod vendor" step downloads and extracts dependencies from go.mod.

The only awkward part of the RFC is that this behavior is not placed
into a proper download mechanism rather than the extract step.

>>>> It also does not allow us the opportunity to validate or adjust
>>>> dependency versions when upgrading packages in Buildroot.
>>
>> Please see my above comments re: updating a dependency version when a
>> CVE or other bug is found.
>
>  As I explained above: Buildroot will not do that.

Why?

>> Specifically, consider the case where we have
>> an older LTS Buildroot branch pointing to an unmaintained older revision
>> of the project. With vendor/ coming from the downloaded upstream source
>> tarball, we would not be able to fix the CVE or bug without copying the
>> patch in the Buildroot tree.
>
>  Well, actually we can... In any of the approaches we're considering, after the
> extract step we will have all the dependencies present in the vendor/ tree. So
> we can always add a patch for a CVE fix in a dependent package in the usual way
> (we just have to add some directory components to the upstream patch).

I don't see why this is better than overriding go.mod?

>  The only situation where this would not be the case is if we would let the go
> tool do its downloads during the build step. But that is something we
> *definitely* want to avoid.

This doesn't make any sense to me either. Who proposed downloading
during the build step? Why would this be the only case where adding a
patch would not work? With a new download method, it would go:

 1. Download base package (containing go.mod)
 2. (optional) Copy in go.mod and go.sum from Buildroot tree
 3. Execute "go mod vendor." Note, go.sum ensures the result is consistent.
 4. Compress the result and store in dl/ tree.
 5. Later, in the extract step, extract this tarball
 6. Apply any patches (this can also target the vendor/ tree if needed)
 7. Build the package with -mod=vendor arg which uses the vendor/ tree.

>>>> replace (
>>>> k8s.io/gengo => ./staging/src/k8s.io/gengo
>>>> k8s.io/kube-openapi => ./staging/src/k8s.io/kube-openapi
>>>> )
>>>
>>> How does this story of "replace directives" fits in the overall
>>> picture ? You just give this information about "replace directives",
>>> with no connection with the rest of the explanation.
>> 
>> These can be placed into go.mod and allow you to replace a specific
>> dependency with another one, or to alias the dependency to a local path.
>
>  Yeah, that bit is not very clear to me either... Is it intended to be able to
> override the version of recursive dependencies?

Yes. You can also tell Go to use local copies of dependencies out-of-tree.

>  Easy: in the current sitatution, we *never* want the go tool to download
> anything (because we expect everything to be present in the vendor/ tree), so we
> can just globally export GOPROXY=off. IIUC.

This is already done in the above patch, with the exception of the "go
mod vendor" step which does a download, which would be moved into a
download provider in the actual change.

>  Note that this is something that would potentially break existing external
> packages, so should be mentioned clearly in the release notes. It can be fixed
> easily, of course, by setting GOPROXY=direct in <PKG>_GO_ENV.

How would this break external packages? The _GOMOD variable is
automatically determined using the same logic that the GOPATH directory
structure is determined today. This means that existing external
packages using vendor/ would still build fine.

>  Given that this is a slightly more controversial thing, I would do it in a
> separate patch from the GOPATH removal.

I'm not sure what specifically you're referring to here.

>  So,
>
> - if a go.mod is present, we can use the Go tool;
> - if a legacy .toml or whatever is present, we can use the Go tool;
> - if there is a vendor/ tree but no metadata, we need to create an almost-empty
>   go.mod.
>
> Correct?

Yes, the go.mod needs to contain a single line to inform the Go tool of
the package path of the root of the code.

>  And all of that is only needed to be able to do the 'go mod vendor' command in
> a post-extract hook, right?

No, this is needed to get Go to use the vendor/ tree without a GOPATH,
because it used to derive the root package path of the code from the
location in the GOPATH tree.

>  What does 'go mod vendor' do if there is no go.mod or legacy file?

It fails.

>  What I also don't understand is why we would ever add a go.mod ourselves... If
> upstream has one, clearly there is no reason to add one.

Upstream does not have one in a lot of cases (yet).

> If upstream has a .toml, then we can just use that. If upstream has
> nothing, it means that everything is already in the vendor/ tree so
> implicitly versioned, so we also don't need anything from the go mod
> logic. We *maybe* should create the one-line go.mod that just declares
> the module, but even that I'm not sure of.

The goal of copying go.mod in from the Buildroot tree is to allow you to
override / provide go.mod if there is not one or if the existing one is
outdated with security issues, BEFORE the "go mod download" "go mod
vendor" steps performed in a download handler (the download step, before
the patch step).

> Can you explain why patch 2 is needed, converting runc's vendor.conf
> into a go.mod and go.sum?

Converting vendor.conf does network lookups with a non-deterministic
result.

> I may be blind, but I don't see this call to 'go mod download'... I suppose
> that it is in fact the 'go mod vendor' call that will implicitly do a download, no?

Yes, when GOPROXY=direct.

>  So, I think this should be chunked into:
>
> 1. Replace GOPATH with -mod=vendor - the same patch will need to update packages
> if needed to keep them building.

No updates to existing packages should be needed, and it's roughly the
same patch as what is in this RFC, except with the "copy in go.mod"
lines removed, and the "go mod vendor" lines removed.

> 2. Update packages to remove no-longer-needed _WORKSPACE etc. settings.
> 3. export GOPROXY=off

Already done in this patch, and would be done in step #1, not after step #2.

> 4. Run 'go mod vendor' in a post-extract hook. This should still be RFC because
> it violates the offline builds principle. Don't forget to mention some ideas of
> how the limitations could be overcome.

Not going to do this in a "real" solution.

> 5. Add a package (nsq?) that would be very difficult to support without the
> go.mod support.

I don't see why this is required for this, but that is the goal (to
allow external and internal packages that use go.mod and to transition
off of GOPATH for vendor/ based packages.)

> 6. Add support for Buildroot-supplied go.mod.

I agree this could be done after the initial minimal commit creating the
single-line go.mod file, setting GOPROXY=off, and setting -mod=vendor.

Best regards,
Christian
