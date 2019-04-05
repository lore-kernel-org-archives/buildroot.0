From: Christian Stewart <christian@paral.in>
Date: Fri, 05 Apr 2019 10:49:53 -0700
Subject: [Buildroot] [RFC PATCH v1 1/6] package/go: implement go modules
 integration
In-Reply-To: <8425d868-26c5-f458-8330-12d2e54e947c@mind.be>
References: <20190317012142.10545-1-christian@paral.in>
 <20190327175011.4aa0a655@windsurf>
 <CA+h8R2pottDYri4wipLFqJdepDpos08Un2T5m--ifX5qjUOjMw@mail.gmail.com>
 <575a8345-978c-1abd-13eb-4b6cd8829233@mind.be> <87a7h4d8zc.fsf@paral.in>
 <8425d868-26c5-f458-8330-12d2e54e947c@mind.be>
Message-ID: <874l7ccpfi.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Arnout Vandecappelle <arnout@mind.be> writes:
>  Okay, I see... So e.g. in docker-containerd, if we would create a go.mod with
> just "module github.com/docker/containerd" (note the 'incorrect' docker instead
> of containerd), we would not have to change the -X ...GitCommit setting?

This would not work since the code expects a specific import path. Note
the difference between an "import path" and the actual path where the
code is hosted, and the actual path where the code is located on disk.
These are 3 different paths.

It's correct to update the setting to match the code.

>>>  So, IMO, the _APPLY_EXTRACT_GOMOD part should be removed from this patch. Then,
>>> patch 1 becomes a really simple patch that people can get their head around. And
>>> you get a much better baseline to explain what you want to do, since you no
>>> longer have to compare against GOPATH; you only need to compare against a
>>> non-instantiated vendor tree.
>> 
>> This part cannot be removed but the go.mod in the Buildroot tree and the
>> module download / vendor steps could be for an initial version. I'll
>> spin a series with this soon.
>
>  I don't understand why it can't be removed. The APPLY_EXTRACT_GOMOD doesn't do
> anything if a vendor tree is already present, and in all our current go packages
> the vendor tree is already present...

The hook can probably be removed but we need to make the almost-empty
go.mod somewhere. 

>  Oh, hang on, you probably still have to create an almost-empty go.mod for the
> ones which don't have a vendor.conf.

I'm almost sorry I mentioned vendor.conf or gopkg.toml in the first
place, becuase it seems like you're now distracted by the other formats.
It's not really a good idea to use the auto conversion at runtime since
the result is not as deterministic as having a predetetermined go.mod,
and the conversion requires network lookups.

Pretend the other formats don't exist. They are there for legacy only anyway.


>>>  If you can give an example of a package that only has a few of these, I could
>>> create an example of how it might work without any extra infra. Although I'm not
>>> entirely sure if such an example would be very useful, except to show that it
>>> would be extremely hard to maintain.
>> 
>> This doesn't make any sense to me.
>
>  What doesn't make sense to you? Do you mean that you don't understand how it
> could be done with additional downloads, or do you mean that you don't
> understand how it could not be useful, or do you mean that you don't understand
> how it could be hard to maintain, or do you mean that you fail to parse the
> entire sentence?

I suppose you're saying you want to add more download statements in the
package and then download all of the dependencies into the vendor/ tree
using the Buildroot mechanism. This is not viable and I don't see why we
would even consider it to begin with.

>  Can you point out which bit causes the modules to be downloaded?

GOPROXY=direct go mod vendor, or you might try executing the build with
the series applied, compiling any Go package, and you'll see the
download happen during that step.

>> I don't see the point. If we discover a security issue, this provides a
>> mechanism to override a dependency at download time.
>
>  ... by keeping a copy of the entire go.mod and go.sum in Buildroot...

So what? Is it really that big of a cost?

>  "The vendoring model" means that every package bundles its dependencies.
> Whether those dependencies are maintained in the same git tree, or as git
> submodules, or as go modules with an explicit version doesn't make much
> difference. For the package developers it does make a world of difference, of
> course. But for the distro maintainer it runs down to the same thing: updates of
> dependencies are handled by the package developer, not by the distro maintainer.

I suggest you research the original reason why vendor was added, GOPATH,
the old "go get" mechanism, and the general history of package
versioning in Go. I have not found any of these things to be the
original reasoning behind these features in Go, nor have I found it
referenced anywhere in their documentation. Vendor was added because the
old Go "go get" tool did not offer an opportunity to override broken
"master" branches of dependencies. When Go modules come around, it
allows us to forget about vendoring, since the module files specify
exact version hashes in the go.mod file, so you get an exact result.

I don't see any evidence that distro maintainers do not patch go.mod.

> There are obviously advantages to the vendoring model. It relieves the
> package developers from dealing with changing APIs of their
> dependencies, it allows them to work around bugs in dependencies, and
> it makes sure that what they test is also what the final user is going
> to get. Also for library developers it makes things easier, because
> ABI compatibility is no longer a thing. And even for distro
> maintainers it makes things easier, because in essence the distro no
> longer needs to worry about dependencies. However, it has this one big
> disadvantage that a vulnerability can no longer be fixed by just
> updating a single package.

I agree that it is a good idea to test the final result when you change
a dependency. But you can update a single package. You're
misunderstanding the behavior of the Go tool. If you update a single
line in go.mod, only a single package will be updated, since all of the
dependencies, indirect or not, are copied into go.mod to begin with.

>>>  Well, actually we can... In any of the approaches we're considering, after the
>>> extract step we will have all the dependencies present in the vendor/ tree. So
>>> we can always add a patch for a CVE fix in a dependent package in the usual way
>>> (we just have to add some directory components to the upstream patch).
>> 
>> I don't see why this is better than overriding go.mod?
>
>  Because usually, changing the version brings in a whole lot more changes than
> just the CVE fix.

I don't see why this is the case. Maybe in a versioning system like
package.json, but please see above on why Go modules are different.
Fully qualified version strings make this not the case.

>  "this would not be the case" refers to your statement that we would not be able
> to fix a CVE (by adding a .patch). My statement is: we are able to fix CVEs like
> we do it for any other package, as long as go modules are instantiated/extracted
> before the patch step.

Yeah, this is true, we can fix things this way. But usually, patches in
the buildroot tree are meant to be able to be applied with "git am"
against the original code repository, correct? This way that would not
be possible. Seems awkward.

>  If we don't set GOPROXY=off, the Go tool might go off and download stuff.

We set GOPROXY=off even today in master. The Go tool will NOT go off and
download stuff randomly :)

>> Why would this be the only case where adding a
>> patch would not work? With a new download method, it would go:
>> 
>>  1. Download base package (containing go.mod)
>>  2. (optional) Copy in go.mod and go.sum from Buildroot tree
>>  3. Execute "go mod vendor." Note, go.sum ensures the result is consistent.
>>  4. Compress the result and store in dl/ tree.
>>  5. Later, in the extract step, extract this tarball
>>  6. Apply any patches (this can also target the vendor/ tree if needed)
>>  7. Build the package with -mod=vendor arg which uses the vendor/ tree.
>
>  Exactly, so it is still possible to use the patch approach instead of changing
> the version.

... which was the point of me listing the order of things happening.
However, you can also see why it might be useful to have go.mod and
go.sum in the tree, considering that you are not patching BEFORE running
"go mod download" or "go mod vendor." You need an opportunity to
override those files earlier on, especially if a dependency no longer
exists, and you're looking to update the code URL for it.

Here's an example: sometimes, packages use "vanity urls" like
mydomain.com/mynamespace/mycode (or similar). The Go tool does send HTTP
requests to that domain, which usually will redirect the tool to a
Github repo.

It would be impossible with patches + the proposed ordering above to fix
the import URL if someone's domain were to go away randomly. The
Buildroot proxy helps here, of course.

>> How would this break external packages? The _GOMOD variable is
>> automatically determined using the same logic that the GOPATH directory
>> structure is determined today. This means that existing external
>> packages using vendor/ would still build fine.
>
>  An existing external package that doesn't use vendor/ but instead uses go.mod
> (and thus downloads stuff in the build step, because the go tool will do that
> automatically) would break. I don't know if this is even possible at the moment,
> I'm just indicating a possible concern. Maybe I'm exaggerating and setting
> GOPROXY=off doesn't really carry any risks.

None use this. This is not a backwards compatibility concern yet. I
understand your reasoning but GOPROXY=off in master so nobody should be
using this yet.

>> The goal of copying go.mod in from the Buildroot tree is to allow you to
>> override / provide go.mod if there is not one or if the existing one is
>> outdated with security issues,
>
>  There are two concerns here, and I think we should consider them separately.
>
> 1. Make sure that building with -mod works.
>   a. Upstream has a go.mod -> nothing needs to be done.

This is the currently implemented logic in the PoC patches.

>   b. Upstream has no go.mod, but has vendor.conf or .toml -> nothing needs to be
> done, the Go tool handles these as well.

I don't recommend this, since the conversion is not deterministic and
does network calls, as I mentioned above.

Copying in the go.mod and go.sum might have spooked you because of the
line count and the hashes in the file. But the reason for it is really
really intentional. I don't want to introduce points of uncertainty into
the build process.

Isn't this a bigger priority for us than a lower line count in the repo??

For this reason I regret mentioning vendor.conf conversion at all.

>   c. Upstream has no go.mod or vendor.conf or anything -> go.mod with just the
> module line needs to be created.

Yup, currently implemented.

> 2. Modify dependencies by changing their versions.
>    -> Buildroot-supplied go.mod is required.

Sort-of, unless we can make a way to patch it before we run the download process.

>  So, if my above analysis is correct, a Buildroot-supplied go.mod is only needed
> for the 'changing versions' scenario (which I am not convinced is something we
> need). For the 'upstream has nothing' scenario, it is sufficient to generate the
> one-line go.mod.
>
>  Is that correct?

Sure, and I'm happy to NOT allow package maintainers to override it by
placing a go.mod and go.sum next to their .mk file. I don't know why
limiting this is an advantage. You could just say that developers can
place those files if they want in their external packages, and never do
it in the Buildroot tree. But why close off the functionality? I'm going
to have to keep a custom patch on top of Buildroot to add it back in
again for my own projects and external packages otherwise.

Maybe you think you need to manually maintain the go.mod and go.sum
files. This isn't the case. We would use the Go tool to convert the
vendor.conf or whatever from upstream, check the result for consistency,
then update the go.mod and go.sum in the Buildroot tree with the output
from this. But, as far as I can see, none of the packages in the
mainline Buildroot tree will need this (yet). But you may as well leave
the 2 lines in the code to enable external packages to make this choice.

>>> Can you explain why patch 2 is needed, converting runc's vendor.conf
>>> into a go.mod and go.sum?
>> 
>> Converting vendor.conf does network lookups with a non-deterministic
>> result.

This is an exact example of what I'm describing in the previous paragraph.

>  Let me rephrase the question... As far as I understand, after the current patch
> series, the Go tool will still not download anything for the existing packages,
> because the vendor tree is already there. Is that correct? If not, could you
> point out where the download happens?

"go mod vendor"

Although, if you look at the code, if the vendor tree is present, this
is not called.

When compiling, go build -mod=vendor will tell the tool to use vendor/
and use the go.mod file only for the module path line (roughly
equiv to just the 1-line go.mod file).

>  Ah, of course, because the go.mod is autogenerated, it will still work. But
> then why are those changes in docker-containerd.mk needed? I still don't get it :-(

This series could be done without those, using vendor in the tree. It's
an example.

> I put this separate because AFAIU setting GOPROXY to off is not
> strictly needed. In the current situation, the Go tool is never going
> to download anything anyway, because the go.mod is empty.

It's strictly needed. The Go tool will analyze the code and determine
the import paths of all the code files, and then generate / update
go.mod. You might want to run the patch series and observe the behavior yourself.

>>> 4. Run 'go mod vendor' in a post-extract hook. This should still be RFC because
>>> it violates the offline builds principle. Don't forget to mention some ideas of
>>> how the limitations could be overcome.
>> 
>> Not going to do this in a "real" solution.
>
>  The real solution being the go download method, right?

Most likely, but I also would just rule out doing any downloading
outside of the download step. This makes sense, right?

>>> 5. Add a package (nsq?) that would be very difficult to support without the
>>> go.mod support.
>> 
>> I don't see why this is required for this, but that is the goal (to
>> allow external and internal packages that use go.mod and to transition
>> off of GOPATH for vendor/ based packages.)
>
>  It's not *required*, it's just to show what is the use case for this work.

Hey, I'm all for adding new packages, required or not.

>>> 6. Add support for Buildroot-supplied go.mod.
>> 
>> I agree this could be done after the initial minimal commit creating the
>> single-line go.mod file, setting GOPROXY=off, and setting -mod=vendor.
>
>  For this one, it would be nice if there could be an alternative that doesn't
> require copying the entire go.mod and go.sum, but rather override only one or
> two. Because I still think that that is going to be the only use case of this
> feature.

Maybe, but you're making a lot of absolute statements here without
actually using the Go modules workflow yourself to know why those
statements are or aren't true. Please have a look at my reasoning above
and see what you think.

Best regards,
Christian 
