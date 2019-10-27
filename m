From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 15:56:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/libselinux: fix build with fts.h
In-Reply-To: <20191027142100.5362-1-fontaine.fabrice@gmail.com>
References: <20191027142100.5362-1-fontaine.fabrice@gmail.com>
Message-ID: <20191027155604.03cb1fce@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 15:21:00 +0100
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
> Fixes:
>  - http://autobuild.buildroot.net/results/a9cd6f09725f39256c892584b4f533b2de96c410
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Nice catch! Thanks for looking into this.

>  LIBSELINUX_MAKE_OPTS += \
> -	$(PKG_PYTHON_DISTUTILS_ENV) \
> +	$(filter-out -D_FILE_OFFSET_BITS=64,$(PKG_PYTHON_DISTUTILS_ENV)) \

I'm wondering if this is really the best solution. For example,
PKG_PYTHON_DISTUTILS_ENV also defines LDFLAGS, which means it overrides
the LDFLAGS definition that adds -lpcre -lpthread in libselinux.mk.

So I'm not sure what to do here :-/

Stop using PKG_PYTHON_DISTUTILS_ENV and duplicate the few definitions
that we really need in libselinux.mk ?

Something else ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
