From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Feb 2016 23:00:10 +0100
Subject: [Buildroot] [PATCH v2 3/3] python-cffi: add host variant
In-Reply-To: <1451978244-15878-4-git-send-email-yegorslists@googlemail.com>
References: <1451978244-15878-1-git-send-email-yegorslists@googlemail.com>
 <1451978244-15878-4-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160203230010.0112a74e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Jan 2016 08:17:24 +0100, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Host variant is needed to cross-compile CFFI based C library wrappers.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> Changes:
> 	v2: add host-libffi dependency
> 
>  package/python-cffi/python-cffi.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
> index 70fbe02..02c969b 100644
> --- a/package/python-cffi/python-cffi.mk
> +++ b/package/python-cffi/python-cffi.mk
> @@ -11,5 +11,7 @@ PYTHON_CFFI_SETUP_TYPE = setuptools
>  PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
>  PYTHON_CFFI_LICENSE = MIT
>  PYTHON_CFFI_LICENSE_FILES = LICENSE
> +HOST_PYTHON_CFFI_DEPENDENCIES = host-python-pycparser host-libffi
>  
>  $(eval $(python-package))
> +$(eval $(host-python-package))

This wasn't building properly here, because python-cffi uses pkg-config
to get the flags to link with libffi, and by default our pkg-config
returns results that are valid to build stuff for the target, not for
the host.

So, I've fixed that by passing a bunch of pkg-config environment
variables when building the host package.

Also, you were missing the host-pkgconf dependency for the dependencies
of host variant.

Committed with those issues fixed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
