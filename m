From: Geoff Levand <geoff@infradead.org>
Date: Thu, 12 May 2016 11:32:04 -0700
Subject: [Buildroot] [PATCH 4/9] package/go: Add
 BR2_TOOLCHAIN_HAS_THREADS
In-Reply-To: <20160512161252.7471bf1e@free-electrons.com>
References: <cover.1463010771.git.geoff@infradead.org>
 <62cf6f9a00fe67cf999e45f7cbf4bf2e295a0fd5.1463010771.git.geoff@infradead.org>
 <20160512161252.7471bf1e@free-electrons.com>
Message-ID: <1463077924.23824.35.camel@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, 2016-05-12 at 16:12 +0200, Thomas Petazzoni wrote:
> On Thu, 12 May 2016 00:08:46 +0000, Geoff Levand wrote:
> > CGO needs thread support.  Fixes build errors like these:
> > 
> >   warning requested reentrant code, but thread support was disabled
> > 
> > Signed-off-by: Geoff Levand <geoff@infradead.org>
> > ---
> >  package/go/Config.in.host | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/package/go/Config.in.host b/package/go/Config.in.host
> > index 094e402..e988483 100644
> > --- a/package/go/Config.in.host
> > +++ b/package/go/Config.in.host
> > @@ -1,5 +1,6 @@
> >  config BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
> >  > > 	> > bool
> >  > > 	> > default y
> > +> > 	> > depends on BR2_TOOLCHAIN_HAS_THREADS
> 
> This is not an architecture dependency, it's a toolchain dependency. We
> normally show a comment about such a dependency so that users know they
> need to enable thread support in their toolchain.

OK, so a Config.host.in like this?

config BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
	bool
	default y
	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_powerpc64 || BR2_powerpc64le || BR2_mips64 || BR2_mips64el
	depends on !BR2_ARM_CPU_ARMV4

comment "go needs a toolchain w/ threads"
	depends on !BR2_TOOLCHAIN_HAS_THREADS
	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS

> When you say "CGO needs thread support", is CGO the go runtime on the
> target? Does this means that any Go program needs threads?

cgo is the C language call support and has a runtime component (the
cgo package).

The host go compiler and some host tools use pthreads, and so are
linked with libpthread.

If a target go program uses the cgo package, it will need to be
linked with libpthread.

-Geoff
