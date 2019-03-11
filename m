From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Mar 2019 00:50:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/go: bump to version 1.12
In-Reply-To: <CA+h8R2ocNHQgo9=yYZ-AevRwCV9jo9tVE-eFTSi4YAO=2ODD2Q@mail.gmail.com>
References: <20190226034554.24429-1-christian@paral.in>
 <20190226082449.040c7a2a@windsurf.home>
 <CA+h8R2qERZ1EjoyCiSCD32K8KM9m5OS_RdQ3iS59m9UmBUEwYw@mail.gmail.com>
 <CA+_SqVbzRuEgvansndPeSVqOeratEK5aGc+OGTc0e6j0FeJEkw@mail.gmail.com>
 <87sgvvccbr.fsf@paral.in> <20190310102831.GC25009@scaer>
 <CA+h8R2ocNHQgo9=yYZ-AevRwCV9jo9tVE-eFTSi4YAO=2ODD2Q@mail.gmail.com>
Message-ID: <24269451-e4c6-1ac4-1084-c23996361eb4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Christian,

 Thanks for this excellent write-up! It certainly clarifies things.

On 11/03/2019 01:08, Christian Stewart wrote:
[snip]
> A project can contain any number of go.mod files. A go.mod file is akin
> to Node's package.json file. It specifies all direct and indirect
> dependencies of all Go packages in the subtree below the file. The Go
> tool can manage this file automatically if desired, and specifies a
> required format. Go.mod additionally requires dependency versions to be
> explicitly specified. There is no semantic versioning or asterisk-based
> version specifiers.
> 
> module mymodule
> 
> require (
> github.com/aws/aws-sdk-go v1.17.12 // indirect
> github.com/blang/semver v3.5.2-0.20180723201105-3c1074078d32+incompatible
> )

 So, since the version is explicit, it's actually completely equivalent to the
vendoring: it's still impossible to treat the modules as packages in the
Buildroot sense, since Buildroot doesn't allow the same package to have
different versions. It's essentially just making our life more difficult :-(.

 That said, at least it's a consistent way for Go packages to work.

 Another thing: the module specification is just a path component, not a full
URL. Is the https:// implicit? Does it always pull from git? Or does it have
some kind of autoconversion similar to our github helper?

[snip]
> With the above in mind, here's how I believe we could integrate this
> with Buildroot:
> 
>>>  - Remove GOPATH
> 
> GOPATH is deprecated anyway so this will be necessary. I'd strongly
> recommend that Buildroot make a hard requirement that all Go-based
> packages use the go.mod and go.sum construction, and configure Go to
> ignore the existing vendor/ trees.

 I've taken a look at the upstream master branch of the go packages we currently
have, and none of them seems to have a go.mod yet... So I think this is a little
bit premature.

> This would allow us to pin versioning
> and tightly control download checksumming through the package.hash ->
> go.sum merkle tree.

 I may miss something, but if it's in vendor/ in the upstream git repo (either
as a submodule or as a copy), it's also tightly controlled and checksummed,
right? So I don't think this is really bringing any value. For us, I mean - I
imagine it *does* bring value for people developing Go packages.


> If a package does not have a go.mod or go.sum file, a patch would be
> added to Buildroot to include the files with the correct pinned
> dependencies.
> 
>>>  - Configure Go to download module files to buildroot/dl/go-modules

 If all modules go together in a single location, there is a risk that there
will be two modules with the same name and version that are in reality different
modules. Or are the full paths repeated there? I.e., does the zip file end up
under a github.com/foo/bar directory?

> 
> We can set the paths such that the $GOPATH/pkg/mod/cache/download
> directory resolves to buildroot/dl/go-modules. According to the above
> documentation, a Buildroot user could then serve the dl/go-modules
> directory directly with a HTTP server and set GOPROXY such that all
> module downloads come from that server. This could be configurable
> eventually via the Buildroot KConfig architecture.

 No need for it to be configurable, it could be the BR2_PRIMARY_SITE.

 However, IIUC, the GOPROXY mechanism doesn't have any fallback. So I guess the
full solution would be to add something like go download infra that first sets
GOPROXY to file://$(BR2_DL_DIR)/go-modules, then to
$(BR2_PRIMARY_SITE)/go-modules, then direct, and finally
$(BR2_SECONDARY_SITE)/go-modules.

 Except that I have another idea, see below.


> Initially, the desired behavior would be implemented by setting GOPROXY
> to "direct" (or perhaps the Buildroot download mirrors?) during the
> downloading phase.
> 
>> How would you get the modules list and their URIs, when we are just
>> downloading? The package sources are not yet extracted.
> 
> This is a good question. There are a couple of options. One conservative
> approach is to download and extract, and use the "extract" step to do
> the second stage of module downloading after extracting the package
> sources.
> 
> A more radical approach, which would perhaps be cleaner, would be to
> disable the Buildroot download mechanism completely for Go packages,
> include the root go.mod and go.sum in Buildroot next to the .mk and
> Config files, and allow Go to manage fetching all of the dependencies
> including the root package.

 That, combined with the go download infra I mentioned above, would indeed be a
feasible approach.

 Ideally, the go.mod would include the package itself too, so we don't need to
download in two steps (i.e. first the package itself, then the modules it uses).
But that might be a bit more difficult.

 But again, see below for an alternative (cliffhanger...)


>>>  - Set GOPROXY to allow network during download step only.
> 
> This would be, during the download phase, execute "go mod download"
> 
> During the extract phase, we would create the build/package/ dir under
> the output directory as usual in Buildroot, then execute "go mod vendor"
> to extract the code sources into build/package/vendor

 Alternatively, we could add a post-extract hook that executes "go mod vendor"
with GOPROXY=file://$(BR2_DL_DIR)/go-modules. But maybe that's what you meant.


> During the build phase, we would then disable the Go moduling system and

 disable == GOPROXY=off, right?

> compile from the extracted "vendor" tree. This would help improve build
> stability and determinism by only engaging the Module code during
> download / extract.

 So this gives me the idea of the alternative...

 If we anyway end up with everything extracted in the vendor tree, we can just
as well do that during the *download* step. Similar like we do for VCS
downloads: we get the *entire* source tree, including go modules, and tar that up.

 We'd still have a go SITE_METHOD and corresponding download helper. This one
would first use another download method to get the base tarball, then extract
it, run 'go mod vendor' with GOPROXY=direct, and create a new tarball.

 This way, the PRIMARY_SITE, SECONDARY_SITE, 'make source', PRIMARY_ONLY, 'make
source-check' would all still work. So it would be (I think) the least invasive
way to introduce this.

[snip]
>> However, I'd suggest that this extra module vendoring dance only occur
>> if the package has set a specific variable, like we do for git
>> submodules:
>>
>>     FOO_GO_MODULES = YES

 With my proposal, this would be FOO_SITE_METHOD = go

 Oh BTW we'd probably also need to support something like FOO_SITE_METHOD =
go+git. dl-wrapper will (should) strip off the first +, the go download helper
would have to handle the second +. But that can be done in a follow-up patch :-)

>>
>> (I almost wrote GOO_MODULES ;-) )
>>
>> That way, if a package does not explicitly request them, it would fail
>> at build time since they would not be available and would not be already
>> downloaded.
> 
> The only situation where we would not want to use Go modules is if the
> package has no external dependencies, or if we want to use the
> old-fashioned vendor/ tree approach. I can prototype this in a way where
> the old behavior will be kept without a FOO_GO_MODULES flag, if this is
> something that we want.

 I think it's worth prototyping something that is not complete yet, and send it
to the list with a lot of comments in the commit message about what is still
missing. That's probably a better basis for discussion that English text.

 Regards,
 Arnout

> 
>> Of course, if we expect the majority of go packages to have modules,
>> that variable would be moot...
> 
> Best regards,
> Christian Stewart
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
