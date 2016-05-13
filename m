From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 May 2016 15:35:02 +0200
Subject: [Buildroot] [PATCH 4/9] package/go: Add
 BR2_TOOLCHAIN_HAS_THREADS
In-Reply-To: <1463077924.23824.35.camel@infradead.org>
References: <cover.1463010771.git.geoff@infradead.org>
 <62cf6f9a00fe67cf999e45f7cbf4bf2e295a0fd5.1463010771.git.geoff@infradead.org>
 <20160512161252.7471bf1e@free-electrons.com>
 <1463077924.23824.35.camel@infradead.org>
Message-ID: <20160513153502.47b944fe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 May 2016 11:32:04 -0700, Geoff Levand wrote:

> OK, so a Config.host.in like this?
> 
> config BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
> 	bool
> 	default y
> 	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_powerpc64 || BR2_powerpc64le || BR2_mips64 || BR2_mips64el
> 	depends on !BR2_ARM_CPU_ARMV4
> 
> comment "go needs a toolchain w/ threads"
> 	depends on !BR2_TOOLCHAIN_HAS_THREADS
> 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS

No, because we don't show comments for host packages (since most of
them are not selectable in menuconfig).

Unfortunately, the only solution that I see now is that *target* go
packages (such as flannel) should have this dependency on
BR2_TOOLCHAIN_HAS_THREADS + the comment.

All in all, I am in fact not super happy with how we're handling this,
but I don't really see how to do it better. One option would be to make
the go package a target package rather than a host package. But it's
also weird because it basically installs nothing to the target.

> > When you say "CGO needs thread support", is CGO the go runtime on the
> > target? Does this means that any Go program needs threads?  
> 
> cgo is the C language call support and has a runtime component (the
> cgo package).

Are all Go packages going to use "cgo" ? Or are pure Go software
potentially not using cgo ?

> The host go compiler and some host tools use pthreads, and so are
> linked with libpthread.

The fact that the host go compiler uses threads is irrelevant. The
BR2_TOOLCHAIN_HAS_THREADS boolean indicate whether there is thread
support or not on the *target*. You can basically assume that thread
support is always available on the host.

> If a target go program uses the cgo package, it will need to be
> linked with libpthread.

So if I understand correctly, it's only a subset of target Go programs
that need thread support?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
