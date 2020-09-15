From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Sep 2020 22:42:49 +0200
Subject: [Buildroot] [PATCH] pkgconf: Add HOST_MAKE_ENV sytem include
 and lib
In-Reply-To: <20191021123810.23135-1-thomas.preston@codethink.co.uk>
References: <20191021123810.23135-1-thomas.preston@codethink.co.uk>
Message-ID: <20200915224249.4b8b3869@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Sorry for the long delay in getting back to this patch.

On Mon, 21 Oct 2019 13:38:10 +0100
Thomas Preston <thomas.preston@codethink.co.uk> wrote:

> Recently, a change to the pkg-config wrapper made it more explicit about
> where the system include and library directories are, so that pkgconf
> does not print them. See upstream commit 9cc8680.
> 
> By default, we configure the pkg-config wrapper for the target sysroot,
> however the default system include and library directories are not
> reconfigured for the host build environment (they still point at the
> target sysroot). Fix this by adding the host system include and library
> directories to HOST_MAKE_ENV.
> 
> Note: this isn't likely to fix any bugs at present, but the incorrect
> configuration may hide an include-order related error which the original
> patch was supposed to fix!
> 
> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
> ---
>  package/Makefile.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 0a7899c852..3ae4d4d4e9 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -309,6 +309,8 @@ HOST_MAKE_ENV = \
>  	PATH=$(BR_PATH) \
>  	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
>  	PKG_CONFIG_SYSROOT_DIR="/" \
> +	PKG_CONFIG_SYSTEM_INCLUDE_PATH="/usr/include" \
> +	PKG_CONFIG_SYSTEM_LIBRARY_PATH="/usr/lib" \

So, today, Peter Korsgaard and me discussed this patch. While I think
we understand the idea of telling pkg-config that it is useless to emit
-I and -L options pointing to the default header/library paths of the
host compiler, the issue is that nothing guarantees that /usr/include
and /usr/lib are really the standard path for the host compiler, and
that these are the only paths.

Since your change was apparently not related to the fix of a specific
issue, and was merely there to improve "correctness", we don't think it
makes sense to have it if it's in fact not really correct for systems
where header/libraries are not in /usr/include and /usr/lib
respectively.

Of course, if you have more details about specific issues that this
patch was solving, let us know.

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
