From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Wed, 4 Dec 2019 08:12:54 -0600
Subject: [Buildroot] [PATCH 1/2] package/pkg-python: use
 HOST_CONFIGURE_OPTS for distutils
In-Reply-To: <20191111140643.2629-1-ryan.barnett@rockwellcollins.com>
References: <20191111140643.2629-1-ryan.barnett@rockwellcollins.com>
Message-ID: <CAMQcK5JFGOpe+=7fxq5cr7BVG9aiDjsEAVRgBq19-Zcxjgg7ow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 11, 2019 at 8:06 AM Ryan Barnett
<ryan.barnett@rockwellcollins.com> wrote:
>
> When building host python packages, we need to ensure that distutils
> package types utilize HOST_CONFIGURE_OPTS. This ensures that the
> correct linker and compiler environment variables are set to compile
> utilizing the host directory.
>
> It was discovered that when compiling a host-python package, it was
> using linking against the build machines library folder instead of the
> host folder because LDFLAGS was not properly set and was improperly
> detecting whether or not a shared or static library was present in the
> host folder.

Is there any feedback on this approach to compiling a host python
distutils packages?

Or is it preferred to explicitly pass the LDFLAGS variable in the DISTUTILS_ENV?

> Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
> ---
>  package/pkg-python.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index be1ce071df..8e4c7e5795 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -52,7 +52,8 @@ PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS = \
>  # Host distutils-based packages
>  HOST_PKG_PYTHON_DISTUTILS_ENV = \
>         PATH=$(BR_PATH) \
> -       PYTHONNOUSERSITE=1
> +       PYTHONNOUSERSITE=1 \
> +       $(HOST_CONFIGURE_OPTS)
>
>  HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
>         --prefix=$(HOST_DIR)
> --
> 2.18.0
>

Thanks,
-Ryan
