From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 29 Dec 2018 17:16:06 +0200
Subject: [Buildroot] [PATCH 3/3] package/pkg-python: use
 --single-version-externally-managed for host setuptools
In-Reply-To: <20181228170132.13049-4-thomas.petazzoni@bootlin.com>
References: <20181228170132.13049-1-thomas.petazzoni@bootlin.com>
 <20181228170132.13049-4-thomas.petazzoni@bootlin.com>
Message-ID: <CALFsTFVbRhBSYz2O7gi-wkygEjEwoczMvnZD9q66mTKbWc1GiQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, Dec 28, 2018 at 7:01 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Currently, host Python packages that use setuptools are installed as
> Python Eggs, i.e they are installed in
> $(HOST_DIR)/lib/python2.7/site-packages/Something-<version>.egg. Once
> installed, each Python Egg is registered to a file called
> $(HOST_DIR)/lib/python2.7/site-packages/easy-install.pth. This file is
> read by the Python interpreter so that the installation location of
> each Egg is added to the Python path, and can be found by the Python
> interpreter.
>
> However, the fact that the installation of different Python modules
> need to update a common file is clearly not compatible with
> per-package directories and top-level parallel build.
>
> To fix this, we avoid using Python Eggs using the same
> --single-version-externally-managed option that we use for target
> modules. This option is normally meant for distributions packaging
> Python modules, and can therefore only be used if either --record (to
> record the list of files being installed) or --root is
> passed. --root=/ works fine and was suggested by
> https://stackoverflow.com/questions/6301003/stopping-setup-py-from-installing-as-egg/33791008#33791008.
>
> With this change, host Python modules installed by setuptools are now
> installed in the "regular" way, i.e directly in
> $(HOST_DIR)/lib/python2.7/site-packages/mako for host-python-mako.
>
> This makes the installation of host Python modules more similar to the
> one of target modules, and makes it compatible with per-package
> directory support and top-level parallel build.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/pkg-python.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index b641e3f865..4f42e2efc2 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -85,7 +85,9 @@ HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
>         PYTHONNOUSERSITE=1
>
>  HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
> -       --prefix=$(HOST_DIR)
> +       --prefix=$(HOST_DIR) \
> +       --root=/ \
> +       --single-version-externally-managed
>
>  ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
>  define PKG_PYTHON_FIXUP_SYSCONFIGDATA
> --
> 2.20.1
>

Reviewed-by: Asaf Kahlon <asafka7@gmail.com>
