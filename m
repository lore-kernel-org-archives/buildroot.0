From: Anisse Astier <anisse@astier.eu>
Date: Tue, 12 Feb 2019 17:57:59 +0100
Subject: [Buildroot] [PATCH 1/1] go: explicitly disable modules to avoid
 unintended network lookup
In-Reply-To: <87va1pgyhe.fsf@paral.in>
References: <20190126102355.24766-1-christian@paral.in>
 <87va1pgyhe.fsf@paral.in>
Message-ID: <20190212165759.euozased2t6zrmka@bifrost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christian,

On Tue, Feb 12, 2019 at 01:14:21AM -0800, Christian Stewart wrote:
> Anisse,
> 
> Christian Stewart <christian@paral.in> writes:
> > Go "modules" refers to the dependency fetching, verification (hashing), and
> > version control system built into Go as of 1.11.
> >
> > In the absence of the GO111MODULE environment variable, the Go compiler will
> > correctly compile using the "vendor" version of dependencies downloaded by
> > Buildroot during the compilation process for Go-based packages.
> 
> You suggested instead setting GOPROXY=off, this would not have the
> intended effect.

What do you mean ? Isn't blocking any network fetching the goal ?

> 
> It is indeed correct to disable modules altogether as this patch does.
> Disabling modules is not something that breaks Go or hinders it in any
> way. It simply disables the versioning and network dependency fetch
> mechanism. This is the correct approach to ensuring that the Go compiler
> will always use the vendor and gopaths correctly as set up by the
> Buildroot build system.

So does setting GOPATH, if I'm reading the doc correctly. Which is
already done in pkg-golang.mk

> 
> I still recommend to merge this patch as is.
> 

Merging this as-is isn't a bad idea in the short term. It makes explicit
a decision that is currently implicit (we use GOPATH).

I'm more worried how we can deal with this if we start adding packages
that rely on go.mod or go-get-ability for building, and don't have any
vendoring. It seems that no in-tree package are currently depending on
other go packages, so we can say that this is a problem to be handled
once we have a few of those.

In summary, I agree it should be merged, I just wanted to discuss the
implications.

Regards,

Anisse
