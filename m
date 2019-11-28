From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Nov 2019 19:11:27 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/libselinux: fix build with fts.h
In-Reply-To: <20191028111709.18054-1-fontaine.fabrice@gmail.com>
References: <20191028111709.18054-1-fontaine.fabrice@gmail.com>
Message-ID: <20191128191127.0da72894@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Mon, 28 Oct 2019 12:17:09 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 3fce6f1c150dbe4be58d083008ca8dbe7257836e added
> PKG_PYTHON_DISTUTILS_ENV to LIBSELINUX_MAKE_OPTS which has the side
> effect of adding CFLAGS without filtering out -D_FILE_OFFSET_BITS=64.
> This raises the following build failure:
> 
> In file included from selinux_restorecon.c:17:0:
> /accts/mlweber1/rc-buildroot-test/scripts/instance-1/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/fts.h:41:3: error: #error "<fts.h> cannot be used with -D_FILE_OFFSET_BITS==64"
>  # error "<fts.h> cannot be used with -D_FILE_OFFSET_BITS==64"
>    ^
> 
> Fix this by adding a PKG_PYTHON_DISTUTILS_PYTHON_ENV to use it within
> libselinux. This will avoid overriding CFLAGS and LDFLAGS
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/a9cd6f09725f39256c892584b4f533b2de96c410
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

After thinking more about it, I'm not a big fan of this split of
PKG_PYTHON_DISTUTILS_ENV, it's a bit artificial, only serves the
purpose of libselinux, and is not done "symmetrically" for other
PKG_PYTHON_* variables.

So I've proposed an alternate implementation:
https://patchwork.ozlabs.org/patch/1202256/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
