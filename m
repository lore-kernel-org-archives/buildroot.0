From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 May 2016 22:56:42 +0200
Subject: [Buildroot] [PATCH v3 5/6] package/flannel: Add
 BR2_TOOLCHAIN_HAS_THREADS
In-Reply-To: <1464727672.12343.16.camel@infradead.org>
References: <cover.1464286518.git.geoff@infradead.org>
 <627469f0b7b4e604da3a5ab3ef721f138a1c95a8.1464286518.git.geoff@infradead.org>
 <20160528154158.70f4f025@free-electrons.com>
 <1464727672.12343.16.camel@infradead.org>
Message-ID: <20160531225642.3af186b6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 31 May 2016 13:47:52 -0700, Geoff Levand wrote:

> Looking at the go sources, they force -pie when compiling cgo support
> for ARM.  See line number 3188 in https://golang.org/src/cmd/go/build.go.

Can you get more details than the "get accurate imported sym" the code
has?

> I think the only solution is to not build go packages that use cgo
> when BR2_arm && BR2_TOOLCHAIN_USES_UCLIBC, so something like this:
> 
> +# cgo on ARM requires PIE linkage, which is not compatable with uClibc.
> +comment "flannel is not available with uClibc-based toolchain on ARM architecture"
> +       depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on BR2_arm && BR2_TOOLCHAIN_USES_UCLIBC
> +
>  config BR2_PACKAGE_FLANNEL
>         bool "flannel"
>         depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
>         depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on !(BR2_arm && BR2_TOOLCHAIN_USES_UCLIBC)
>         help
> 
> If this looks OK, I'll submit a patch.

This is really annoying, as all Go packages that need cgo support will
not work in what is probably Buildroot's most widely used
configuration: ARM with uClibc.

So I'd really like to push things a bit further, and either fix uClibc
so that static+PIE works, or understand why Go wants PIE on ARM.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
