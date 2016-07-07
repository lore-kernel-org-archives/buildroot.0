From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 7 Jul 2016 22:40:52 +0200
Subject: [Buildroot] [PATCH v2 1/2] openmpi: add Fortran support for
 MIPS32
In-Reply-To: <1467906454-60557-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1467906454-60557-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160707204052.GD3827@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2016-07-07 16:47 +0100, Vicente Olivert Riera spake thusly:
> We include a file containing cached values for Fortran tests that are
> performed at the configure step. These tests fail when cross-compiling
> and this is known upstream. See:
> 
> https://www.open-mpi.org/community/lists/users/2013/01/21186.php

Too bad... :-/

> In that thread the upstream maintainer admits that "cross compiling
> OpenMPI is a known issue" and the way to workaround this is to
> "pre-populate configure's answers to the Fortran tests (so that it
> doesn't actually have to run anything)"

Meh... :-/

> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v1 -> v2:
>  - Nothing.
> 
>  package/openmpi/openmpi.mk                         | 12 ++++-
>  .../openmpi_mips32_fortran_cached_values.mk        | 51 ++++++++++++++++++++++
>  2 files changed, 61 insertions(+), 2 deletions(-)
>  create mode 100644 package/openmpi/openmpi_mips32_fortran_cached_values.mk
> 
> diff --git a/package/openmpi/openmpi.mk b/package/openmpi/openmpi.mk
> index 8871eaf..47f42be 100644
> --- a/package/openmpi/openmpi.mk
> +++ b/package/openmpi/openmpi.mk
> @@ -13,8 +13,16 @@ OPENMPI_LICENSE_FILES = LICENSE
>  OPENMPI_INSTALL_STAGING = YES
>  OPENMPI_CONF_OPTS = --disable-vt
>  
> -# Disable fortran by default until we add BR2_TOOLCHAIN_HAS_FORTRAN
> -# hidden symbol to our toolchain infrastructure
> +ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
> +
> +# Enable Fortran for MIPS32
> +ifeq ($(BR2_mips)$(BR2_mipsel),y)
> +OPENMPI_CONF_OPTS += --enable-mpi-fortran=yes
> +include $(TOPDIR)/package/openmpi/openmpi_mips32_fortran_cached_values.mk

No nedd for the leading $(TOPDIR)/ as $(TOPDIR) is guaranteed by
Buildroot to be the CWD when running Buildroot.

> +endif
> +
> +else
>  OPENMPI_CONF_OPTS += --enable-mpi-fortran=no
> +endif
>  
>  $(eval $(autotools-package))
> diff --git a/package/openmpi/openmpi_mips32_fortran_cached_values.mk b/package/openmpi/openmpi_mips32_fortran_cached_values.mk
> new file mode 100644
> index 0000000..4962d88
> --- /dev/null
> +++ b/package/openmpi/openmpi_mips32_fortran_cached_values.mk
> @@ -0,0 +1,51 @@
> +OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_CHARACTER=1
> +OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_LOGICAL=4
> +OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_LOGICALp1=1
[--SNIP--]

I would have wrote it like that:

    OPENMPI_CONF_ENV += \
        ompi_cv_fortran_sizeof_CHARACTER=1 \
        ompi_cv_fortran_sizeof_LOGICAL=4 \
        ompi_cv_fortran_sizeof_LOGICALp1=1 \
        [...]


Otherwise, I don;t see a better solution, indeed... :-/

Or, instead of passing it in the environment, we can provide a configure
cache file, no?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
