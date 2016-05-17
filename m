From: Geoff Levand <geoff@infradead.org>
Date: Tue, 17 May 2016 13:15:11 -0700
Subject: [Buildroot] Analysis of build results for 2016-05-16
In-Reply-To: <20160517213407.7d47b4a3@free-electrons.com>
References: <20160517063022.7001A10142D@stock.ovh.net>
 <20160517153611.2a3b4199@free-electrons.com>
 <1463511367.5420.26.camel@infradead.org>
 <20160517213407.7d47b4a3@free-electrons.com>
Message-ID: <1463516111.5420.32.camel@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2016-05-17 at 21:34 +0200, Thomas Petazzoni wrote:
>          arm |                  host-go-1.6.2 | NOK | http://au
> > > > tobuild.buildroot.net/results/42a8d07101d8d954511d1c884ecb66e8d
> > > > 861899e/  ;
> > > 
> > > error: #warning requested reentrant code
> > > 
> > > Geoff, in fact it seems like host-go itself needs thread support
> > > in the
> > > target toolchain to build properly, so our plan to have only the
> > > Go
> > > packages depend on BR2_TOOLCHAIN_HAS_THREADS does not work.  
> > 
> > Yes, the solution I came up with is that the go target package must
> 
> By "go target package", you mean a target package that is written in
> Go, and not specifically the package/go/ package (which doesn't have
> a
> target variant), right?

Yes, a target package that has go source code.

> > specify BR2_TOOLCHAIN_HAS_THREADS if it uses cgo support.  If
> > BR2_TOOLCHAIN_HAS_THREADS is set, then host-go sets CGO_ENABLED=1
> > and
> > builds a compiler with cgo support.  If BR2_TOOLCHAIN_HAS_THREADS
> > is
> > not set, then host-go does not build in cgo support.  The two
> > cases:
> > 
> > A go package which does not use cgo sets
> > BR2_TOOLCHAIN_HAS_THREADS=n,
> 
> A package cannot *set* BR2_TOOLCHAIN_HAS_THREADS.
> BR2_TOOLCHAIN_HAS_THREADS is a property of the toolchain.

> > the host-go is not build with cgo support.  Both the target package
> > and host-go should build OK since no thread support is needed.
> > 
> > A package that uses cgo sets BR2_TOOLCHAIN_HAS_THREADS=y, host-go
> > is build with cgo support.  Both build OK since the toolchain has
> > thread support.
> 
> What needs to happen instead is the following (and is quite similar
> to
> what you said, except for the interaction with
> BR2_TOOLCHAIN_HAS_THREADS=y) :
> 
>  *) The host-go package will build cgo support when
>     BR2_TOOLCHAIN_HAS_THREADS=y and otherwise not build cgo support.
> 
>  *) Any target package that is written in Go and that needs cgo
> support
>     should have a "depends on BR2_TOOLCHAIN_HAS_THREADS" in its
>     dependencies.

Yes, sorry, that is correct.

> This needs to be explained by a comment in package/go/go.mk, as it is
> not trivial.

OK.
