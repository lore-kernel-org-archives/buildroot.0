From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 2 Feb 2020 10:04:32 +0100
Subject: [Buildroot] [PATCH 0/1] system/Config.in: introduce pre-build
 script
In-Reply-To: <20200121230956.23129-1-mmayer@broadcom.com>
References: <20200121230956.23129-1-mmayer@broadcom.com>
Message-ID: <20200202100432.1ada7720@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Markus,

On Tue, 21 Jan 2020 15:09:55 -0800
Markus Mayer <mmayer@broadcom.com> wrote:

> Specifically, we are building ARM64 images that also contain a 32-bit
> run-time environment from an Aarch32 toolchain (just the shared libraries
> and ld.so from sys-root, nothing fancier than that). -- No, we aren't doing
> this for fun, but because there are some binaries, which we don't have the
> sources for, that only come as 32-bit variants and they need to be able to
> execute in an ARM64 environment, as well.
> 
> We used to use /lib64 and /lib to store the shared libraries in the target
> file system. However, we have come to realize that using /lib and /lib32
> makes a lot of things much easier (/lib64 merely becomes a symlink to /lib
> in this setup) and began the transition.
> 
> However, introducing the change leads to a problem for developers they don't
> expect: they simply update their GIT repo as they are used to doing, and
> suddenly their already existing build is inconsistent with what is now
> expected, whereas in the past it has always been possible to do an
> incremental build even after a "git pull."

We simply don't support incremental builds like you describe, i.e there
is no way for Buildroot to guarantee after a "git pull" and a partial
rebuild with just "make" that changes will be taken into account. A
simple thing that adding a new --enable-foo option in a package that
has already been built will not see this package being rebuilt when
running "make".

So, while there may possibly be other situations where a pre-build
script could be useful, your particular use-case is not a very
convincing argument at all, because it clearly falls outside of what
Buildroot supports.

So what would be nice to see is if there are other use-cases for a
pre-build script that make sense.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
