From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 22 Apr 2020 00:54:05 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-argon2-cffi: use -msse2
 only when supported
In-Reply-To: <20200414102621.18804-1-asafka7@gmail.com>
References: <20200414102621.18804-1-asafka7@gmail.com>
Message-ID: <CADvTj4psbzVUKohk=AyR5zn_rVgnVGk6U7=EdAH+Sqd28rKSeA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I think we should maybe just merge this for now so that autobuilders
stop failing,
once my upstream PR is merged and the package is updated we can then remove
this workaround.

On Tue, Apr 14, 2020 at 4:27 AM Asaf Kahlon <asafka7@gmail.com> wrote:
>
> The package adds the '-msse2' flag according to the result of the
> pythonic "platform.machine()" statement, which runs on the host
> and doesn't necessarily reflects the existence of this flag on
> the target compiler.
> Hence, we'll set the 'optimzed' variable in setup.py only when
> we know SSE2 is supported.
>
> Fixes:
>   http://autobuild.buildroot.net/results/8c8aee8c8a0062575f489042bb11cc8515cbe48c/
>
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-argon2-cffi/python-argon2-cffi.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/package/python-argon2-cffi/python-argon2-cffi.mk b/package/python-argon2-cffi/python-argon2-cffi.mk
> index 099574e9c3..9f73e75c1e 100644
> --- a/package/python-argon2-cffi/python-argon2-cffi.mk
> +++ b/package/python-argon2-cffi/python-argon2-cffi.mk
> @@ -12,4 +12,10 @@ PYTHON_ARGON2_CFFI_LICENSE = MIT
>  PYTHON_ARGON2_CFFI_LICENSE_FILES = LICENSE
>  PYTHON_ARGON2_CFFI_DEPENDENCIES = host-python-cffi
>
> +define PYTHON_ARGON2_CFFI_SET_OPTIMZED_FLAG
> +        $(SED) 's;^\(optimized = *\)\(.*\);\1$(if $(BR2_X86_CPU_HAS_SSE2),True,False);' $(@D)/setup.py
> +endef
> +
> +PYTHON_ARGON2_CFFI_POST_PATCH_HOOKS += PYTHON_ARGON2_CFFI_SET_OPTIMZED_FLAG
> +
>  $(eval $(python-package))
> --
> 2.26.0
>
