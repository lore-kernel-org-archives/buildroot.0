From: Geoff Levand <geoff@infradead.org>
Date: Fri, 13 May 2016 09:05:43 -0700
Subject: [Buildroot] [PATCH 2/9] package/go-bootstrap: Set CGO_ENABLED=0
In-Reply-To: <87y47egohi.fsf@dell.be.48ers.dk>
References: <cover.1463010771.git.geoff@infradead.org>
 <2e8ab7d6d36bdc954535b9637f9ab8e131d64313.1463010771.git.geoff@infradead.org>
 <87y47egohi.fsf@dell.be.48ers.dk>
Message-ID: <1463155543.23824.44.camel@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, 2016-05-13 at 13:56 +0200, Peter Korsgaard wrote:
> > > > > > "Geoff" == Geoff Levand <geoff@infradead.org> writes:
> 
>  > Fixes build erorros like these:
>  >   cgo.a(_all.o): unknown relocation type 42; compiled without 
> -fpic?
> 
>  > Signed-off-by: Geoff Levand <geoff@infradead.org>
>  > ---
>  >  package/go-bootstrap/go-bootstrap.mk | 3 ++-
>  >  1 file changed, 2 insertions(+), 1 deletion(-)
> 
>  > diff --git a/package/go-bootstrap/go-bootstrap.mk b/package/go
> -bootstrap/go-bootstrap.mk
>  > index bcf7c0b..1ced355 100644
>  > --- a/package/go-bootstrap/go-bootstrap.mk
>  > +++ b/package/go-bootstrap/go-bootstrap.mk
>  > @@ -19,7 +19,8 @@ HOST_GO_BOOTSTRAP_MAKE_ENV = \
>  >  	GOOS=linux \
>  >  	GOROOT_FINAL="$(HOST_GO_BOOTSTRAP_ROOT)" \
>  >  	GOROOT="$(@D)" \
>  > -	GOBIN="$(@D)/bin"
>  > +	GOBIN="$(@D)/bin" \
>  > +	CGO_ENABLED=0
> 
> That is not a very detailed description. I know next to nothing about
> go, but according to google this doesn't have anything directly to do
> with -fpic or not. From https://golang.org/cmd/cgo/

Sure, I'll add some more details to the comment.

> Cgo enables the creation of Go packages that call C code.
> ..
> The cgo tool is enabled by default for native builds on systems where
> it
> is expected to work. It is disabled by default when cross-compiling.
> You
> can control this by setting the CGO_ENABLED environment variable when
> running the go tool: set it to 1 to enable the use of cgo, and to 0
> to
> disable it. The go tool will set the build constraint "cgo" if cgo is
> enabled.
> 
> When cross-compiling, you must specify a C cross-compiler for cgo to
> use. You can do this by setting the CC_FOR_TARGET environment
> variable
> when building the toolchain using make.bash, or by setting the CC
> environment variable any time you run the go tool. The CXX_FOR_TARGET
> and CXX environment variables work in a similar way for C++ code.
> 
> 
> So it sounds like this change disables the cgo tool. How does that
> match
> with your other change to pull in the toolchain dependencies which
> was
> "To build programs that need cgo support"?

This change disables cgo support for the bootstrap compiler.  It is not
needed.  The bootstrap compiler is just used to build the final go
compiler.  We need full cgo support in the final go compiler to support
any go programs that may need cgo support.

I hope this makes more sense.

-Geoff
