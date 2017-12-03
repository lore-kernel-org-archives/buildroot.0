From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Dec 2017 23:22:49 +0100
Subject: [Buildroot] [RFCv3 03/15] Makefile,
 skeleton: move the host skeleton logic to host-skeleton package
In-Reply-To: <20171201205352.24287-4-thomas.petazzoni@free-electrons.com>
References: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
 <20171201205352.24287-4-thomas.petazzoni@free-electrons.com>
Message-ID: <20171203222249.GA4164@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-12-01 21:53 +0100, Thomas Petazzoni spake thusly:
> As part of the per-package SDK work, we want to avoid having logic
> that installs files to the global HOST_DIR, and instead do it inside
> packages. One thing that gets installed to the global HOST_DIR is the
> minimal "skeleton" that we create in host:
> 
>  - the "usr" symbolic link for backward compatibility
> 
>  - the "lib" directory, and its lib64 or lib32 symbolic links
> 
> This commit moves this logic to a new host-skeleton package, and makes
> all packages (except itself) depend on it. We also make sure that this
> host-skeleton package doesn't depend on host-patchelf, because
> host-patchelf depends on host-skeleton.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

With for a small nit, below...

[--SNIP--]
> diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
> index d380f41649..a32bacd0b3 100644
> --- a/package/skeleton/skeleton.mk
> +++ b/package/skeleton/skeleton.mk
> @@ -11,4 +11,16 @@
>  SKELETON_ADD_TOOLCHAIN_DEPENDENCY = NO
>  SKELETON_ADD_SKELETON_DEPENDENCY = NO
>  
> +# We create a compatibility symlink in case a post-build script still
> +# uses $(HOST_DIR)/usr
> +define HOST_SKELETON_INSTALL_CMDS
> +	@ln -snf . $(HOST_DIR)/usr
> +	@mkdir -p $(HOST_DIR)/lib
> +	@case $(HOSTARCH) in \
> +		(*64) ln -snf lib $(HOST_DIR)/lib64;; \
> +		(*)   ln -snf lib $(HOST_DIR)/lib32;; \
> +	esac

Maybe take the opportunity to replace '@' with '$(Q)'?

That aside, my Reviewed-by tag stands.

> +endef
> +
>  $(eval $(virtual-package))
> +$(eval $(host-generic-package))

Aham that's certainly bizarre that the target variant is a virtual
package but the host a real one. :-)

But nothing wrong with that.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
