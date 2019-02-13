From: Anisse Astier <anisse@astier.eu>
Date: Wed, 13 Feb 2019 10:16:01 +0100
Subject: [Buildroot] [PATCH 1/1] go: explicitly disable modules to avoid
 unintended network lookup
In-Reply-To: <87sgwsh6k7.fsf@paral.in>
References: <20190126102355.24766-1-christian@paral.in>
 <87va1pgyhe.fsf@paral.in> <20190212165759.euozased2t6zrmka@bifrost>
 <87sgwsh6k7.fsf@paral.in>
Message-ID: <20190213091601.wnoefujowo6j5t7q@bifrost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christian,

On Tue, Feb 12, 2019 at 04:32:08PM -0800, Christian Stewart wrote:
> Hi Anisse,
> 
> You are perhaps mistaking GO111MODULE to be a temporary flag that will
> be removed in the future. This is not the case. GOPROXY=off and
> GO111MODULE=off do not have the same effect.
> 
> Engaging the Go modules system occurs whenever you are outside GOPATH or
> when you have the GO111MODULES=on environment variable set. We are
> inside GOPATH in /some/ cases in Buildroot. This does not affect the
> situation when GO111MODULE=on. GOPATH is ignored. Even if go.mod is
> nonexistent the system will download modules from the internet.

I missed the part about the leaking environment in the commit message,
my bad. It's absolutely critical to guard against this.

> 
> In Buildroot, we generally go to great lengths to check archive
> integrity with hash files and generally avoid downloading anything
> outside of the main Buildroot download process. This is to ensure that
> you can backup the dl/ folder and still produce a working build.
> 
> The Go modules system exists purely as a depedency version control and
> downloading mechanism in Go. It is NOT anything related to how the code
> is assembled within GoPath. GO111MODULE is not slated for removal
> anytime soon.
> 
> 
> Anisse Astier <anisse@astier.eu> writes:
> >> You suggested instead setting GOPROXY=off, this would not have the
> >> intended effect.
> >
> > What do you mean ? Isn't blocking any network fetching the goal ?
> 
> If you do this reproduction with ANY > go1.11 version of Buildroot
> today:
> 
> export GO111MODULE=on
> make docker-engine
> 
> Then Buildroot will leak the GO111MODULE variable into the build
> process, and Go will start downloading dependencies from the internet
> and ignore GOPATH. 
> 
> Here is a reproduction, where Go makes network calls:
> 
> https://asciinema.org/a/pKktUhsN2NDoWkiCEgW9iUPbA
> 
> This is clearly UNINTENDED and has bit me before as I had GO111MODULE
> set in my ambient working environment and found to my surprise that
> Buildroot had downloaded Go dependencies out-of-band during the process.
> 
> Now if I also set GOPROXY=off, Go STILL downloads depdencies from the
> internet. The flag has NO EFFECT whatsoever. It doesn't even disable
> downloading network dependencies at all!
> 
> Reproduce: https://asciinema.org/a/dCOpJqCvIraP4QXd969nsxabS
> 
> In this case it actually broke the build!

What happened here is that there was an automatic conversion from
vendor.conf to a go.mod, and then the build tried fetching the modules
(again), but was forbidden by the GOPROXY=off. So you're right that
GOPROXY=off isn't sufficient for blocking network calls since the
go.mod conversion process does some git fetch.

> 
> So, yes, setting GO111MODULE=off is absolutely required in the host and
> target envirionments for Buildroot for Go for the purposes of disabling
> the modules system (a extremely common move usually triggered implicitly
> by GOPATH existing, but not explicitly).
> 
> > So does setting GOPATH, if I'm reading the doc correctly. Which is
> > already done in pkg-golang.mk
> 
> This is not effective when GO111MODULE=on in the parent env.
> 
> > I'm more worried how we can deal with this if we start adding packages
> > that rely on go.mod or go-get-ability for building, and don't have any
> > vendoring. It seems that no in-tree package are currently depending on
> > other go packages, so we can say that this is a problem to be handled
> > once we have a few of those.
> 
> There is no situation from my view where Buildroot would use Go modules.
> There is simply no reason to engage a code package manager inside
> Buildroot. If we need cross dependencies between packages the best way
> to do so is to set up a Buildroot "host" gopath and copy the dependency
> sources or simlinks there.

Agreed.

> 
> > In summary, I agree it should be merged, I just wanted to discuss the
> > implications.
> 
> Granted, this is completely valid and I should have provided the above
> reproductions before. But, in my view this is a security issue. Having
> GO111MODULE leak into the target environment and cause differing
> behavior is not intended.

I should have read the commit message more thoroughly as well since you
mentioned this issue. Nitpick: the message says GO111MODULE=yes instead
of GO111MODULE=on.

Thanks for taking the time to answer.

Anisse
