From: Geoff Levand <geoff@infradead.org>
Date: Tue, 31 May 2016 13:47:52 -0700
Subject: [Buildroot] [PATCH v3 5/6] package/flannel: Add
 BR2_TOOLCHAIN_HAS_THREADS
In-Reply-To: <20160528154158.70f4f025@free-electrons.com>
References: <cover.1464286518.git.geoff@infradead.org>
 <627469f0b7b4e604da3a5ab3ef721f138a1c95a8.1464286518.git.geoff@infradead.org>
 <20160528154158.70f4f025@free-electrons.com>
Message-ID: <1464727672.12343.16.camel@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sat, 2016-05-28 at 15:41 +0200, Thomas Petazzoni wrote:
> There are still some issues with the flannel build:
> 
>   http://autobuild.buildroot.org/results/d98/d98e1857590738313a293b58f02230539bbaa405/build-end.log
> 
> The error is:
> 
> /home/buildroot/autobuild/run/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find Scrt1.o: No such file or directory
> 
> My understanding is that this happens when trying to build PIE binaries
> that are statically linked. uClibc does not support that, or at least
> not with our current toolchain support. Would it be possible to not
> build PIE binaries with Go ? Or alternatively, investigate if it can be
> fixed in uClibc ?

Looking at the go sources, they force -pie when compiling cgo support
for ARM.  See line number 3188 in https://golang.org/src/cmd/go/build.go.

I think the only solution is to not build go packages that use cgo
when BR2_arm && BR2_TOOLCHAIN_USES_UCLIBC, so something like this:

+# cgo on ARM requires PIE linkage, which is not compatable with uClibc.
+comment "flannel is not available with uClibc-based toolchain on ARM architecture"
+       depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+       depends on BR2_TOOLCHAIN_HAS_THREADS
+       depends on BR2_arm && BR2_TOOLCHAIN_USES_UCLIBC
+
 config BR2_PACKAGE_FLANNEL
        bool "flannel"
        depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
        depends on BR2_TOOLCHAIN_HAS_THREADS
+       depends on !(BR2_arm && BR2_TOOLCHAIN_USES_UCLIBC)
        help

If this looks OK, I'll submit a patch.

-Geoff
