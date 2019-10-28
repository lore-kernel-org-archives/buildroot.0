From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Oct 2019 23:12:59 +0100
Subject: [Buildroot] [PATCH v3] toolchain: expose
 BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS for all toolchain types
In-Reply-To: <20191027205902.56911-1-matthew.weber@rockwellcollins.com>
References: <20191027205902.56911-1-matthew.weber@rockwellcollins.com>
Message-ID: <09e2f480-a076-240d-ea2e-a42c577834a1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27/10/2019 21:59, Matt Weber wrote:
> This patch extends the "copy extra GCC libraries to target" feature to
> also work for internal toolchains. The variable has been renamed to be
> BR2_TOOLCHAIN_EXTRA_LIBS and the configuration option moved under the
> generic toolchain package. For external toolchains, the step that does
> the copy is still in the copy_toolchain_lib_root() helper which copies
> from the sysroot to the target.  For the internal toolchain, the host
> gcc-final package does a post install hook to copy the libraries from
> the toolchain build folders to both the sysroot and target(!static).
> 
> Examples where this can be useful is for adding debug libraries to the
> target like the GCC libsanitizer (libasan/liblsan/...).
> 
> Cc: Markus Mayer <mmayer@broadcom.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

 Applied to master, thanks.

[snip]
> +	  Examples where this can be useful is for adding debug libraries

 This line is too long. As reported by check-package. Fortunately, I check for
that in a post-apply hook :-)

 If you want to do the same, use this as your .git/hooks/post-commit:

#! /bin/sh

# check-package on added/changed files
git show HEAD | \
        lsdiff -s | \
        awk '{ if ($1 != "-") print substr($2, 3) }' | \
        xargs -r ./utils/check-package


(note that you need to install lsdiff, and it barfs on renamed or removed files)

 Regards,
 Arnout

> +	  to the target like the GCC libsanitizer.
> +	  e.g. "libasan liblsan libtsan libubsan"
> +
>  # This boolean is true if the toolchain provides a built-in full
>  # featured gettext implementation (glibc), and false if only a stub
>  # gettext implementation is provided (uclibc, musl)
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index 5147da0104..4bae2ff412 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -156,7 +156,7 @@ ifeq ($(BR2_TOOLCHAIN_HAS_DLANG),y)
>  TOOLCHAIN_EXTERNAL_LIBS += libgdruntime.so* libgphobos.so*
>  endif
>  
> -TOOLCHAIN_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
> +TOOLCHAIN_EXTERNAL_LIBS += $(addsuffix .so*,$(call qstrip,$(BR2_TOOLCHAIN_EXTRA_LIBS)))
>  
>  
>  #
> diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> index a36747f490..fd95f8201b 100644
> --- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> +++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> @@ -438,12 +438,4 @@ config BR2_TOOLCHAIN_EXTERNAL_OPENMP
>  	  support. If you don't know, leave the default value,
>  	  Buildroot will tell you if it's correct or not.
>  
> -config BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS
> -	string "Extra toolchain libraries to be copied to target"
> -	help
> -	  If your external toolchain provides extra libraries that
> -	  need to be copied to the target filesystem, enter them
> -	  here, separated by spaces. They will be copied to the
> -	  target's /lib directory.
> -
>  endif
> 
