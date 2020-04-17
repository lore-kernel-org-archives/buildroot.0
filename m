From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 22:52:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/python3-setuptools: bump to
 version 46.1.3
In-Reply-To: <20200417203051.5020-1-james.hilliard1@gmail.com>
References: <20200417203051.5020-1-james.hilliard1@gmail.com>
Message-ID: <20200417225210.5a9e1266@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 17 Apr 2020 14:30:51 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Rebased add executable patch.
> 
> We can no longer keep the python3 and python2 versions in sync as
> python2 support was dropped in setuptools version 45.0.0.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Except that this is not exactly doing what you think it does :)

python-setuptools is also used for Python 3!

python-setuptools is both a host and a target package. As a host
package, it will always install setuptools for Python 2.x. As a target
package however, it will install setuptools for the currently selected
version of Python for the target. So python-setuptools will be the
package installing setuptools on the target for Python 3!

python3-setuptools is a host only package, which is used when setuptools is needed for host Python 3.xL

> ---
>  .../python-setuptools/python-setuptools.mk    |  2 -
>  .../0001-add-executable.patch                 | 75 ++++++++++++++++++-
>  .../python3-setuptools.hash                   |  4 +-
>  .../python3-setuptools/python3-setuptools.mk  |  6 +-
>  4 files changed, 79 insertions(+), 8 deletions(-)
>  mode change 120000 => 100644 package/python3-setuptools/0001-add-executable.patch
>  mode change 120000 => 100644 package/python3-setuptools/python3-setuptools.hash
> 
> diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
> index 2cb575ae22..dcbb949545 100644
> --- a/package/python-setuptools/python-setuptools.mk
> +++ b/package/python-setuptools/python-setuptools.mk
> @@ -4,8 +4,6 @@
>  #
>  ################################################################################
>  
> -# Please keep in sync with
> -# package/python3-setuptools/python3-setuptools.mk
>  PYTHON_SETUPTOOLS_VERSION = 44.0.0
>  PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).zip
>  PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/b0/f3/44da7482ac6da3f36f68e253cb04de37365b3dba9036a3c70773b778b485
> diff --git a/package/python3-setuptools/0001-add-executable.patch b/package/python3-setuptools/0001-add-executable.patch
> deleted file mode 120000
> index 5bab3d96a1..0000000000
> --- a/package/python3-setuptools/0001-add-executable.patch
> +++ /dev/null
> @@ -1 +0,0 @@
> -../python-setuptools/0001-add-executable.patch
> \ No newline at end of file
> diff --git a/package/python3-setuptools/0001-add-executable.patch b/package/python3-setuptools/0001-add-executable.patch
> new file mode 100644
> index 0000000000..9ac01baa42
> --- /dev/null
> +++ b/package/python3-setuptools/0001-add-executable.patch
> @@ -0,0 +1,74 @@
> +From fec19eb1f3d242867d82e5ed1d082090f3171ed4 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
> +Date: Mon, 7 Dec 2015 01:14:33 +0100
> +Subject: [PATCH] add executable
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Add a new --executable option to distribute so that we can
> +force the shebang line in installed python scripts.
> +
> +[Thomas: refresh for setuptools 5.8.]
> +[J?rg: refresh for setuptools 18.7.1]
> +[James: refresh for setuptools 46.1.3]
> +
> +Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +---
> + setuptools/command/install.py         | 2 ++
> + setuptools/command/install_scripts.py | 9 +++++++++
> + 2 files changed, 11 insertions(+)
> +
> +diff --git a/setuptools/command/install.py b/setuptools/command/install.py
> +index 72b9a3e4..6781d2bc 100644
> +--- a/setuptools/command/install.py
> ++++ b/setuptools/command/install.py
> +@@ -16,6 +16,7 @@ class install(orig.install):
> +     """Use easy_install to install the package, w/dependencies"""
> + 
> +     user_options = orig.install.user_options + [
> ++        ('executable=', 'e', "specify final destination interpreter path"),
> +         ('old-and-unmanageable', None, "Try not to use this!"),
> +         ('single-version-externally-managed', None,
> +          "used by system package builders to create 'flat' eggs"),
> +@@ -31,6 +32,7 @@ class install(orig.install):
> + 
> +     def initialize_options(self):
> +         orig.install.initialize_options(self)
> ++        self.executable = None
> +         self.old_and_unmanageable = None
> +         self.single_version_externally_managed = None
> + 
> +diff --git a/setuptools/command/install_scripts.py b/setuptools/command/install_scripts.py
> +index 8c9a15e2..bf0417b6 100644
> +--- a/setuptools/command/install_scripts.py
> ++++ b/setuptools/command/install_scripts.py
> +@@ -12,6 +12,13 @@ class install_scripts(orig.install_scripts):
> +     def initialize_options(self):
> +         orig.install_scripts.initialize_options(self)
> +         self.no_ep = False
> ++        self.executable = None
> ++
> ++    def finalize_options(self):
> ++        orig.install_scripts.finalize_options(self)
> ++        self.set_undefined_options('install',
> ++                ('executable','executable')
> ++        )
> + 
> +     def run(self):
> +         import setuptools.command.easy_install as ei
> +@@ -32,6 +39,8 @@ class install_scripts(orig.install_scripts):
> +         )
> +         bs_cmd = self.get_finalized_command('build_scripts')
> +         exec_param = getattr(bs_cmd, 'executable', None)
> ++        if self.executable is not None:
> ++            exec_param = self.executable
> +         try:
> +             bw_cmd = self.get_finalized_command("bdist_wininst")
> +             is_wininst = getattr(bw_cmd, '_is_running', False)
> +-- 
> +2.20.1
> +
> diff --git a/package/python3-setuptools/python3-setuptools.hash b/package/python3-setuptools/python3-setuptools.hash
> deleted file mode 120000
> index a3af7f0fb1..0000000000
> --- a/package/python3-setuptools/python3-setuptools.hash
> +++ /dev/null
> @@ -1 +0,0 @@
> -../python-setuptools/python-setuptools.hash
> \ No newline at end of file
> diff --git a/package/python3-setuptools/python3-setuptools.hash b/package/python3-setuptools/python3-setuptools.hash
> new file mode 100644
> index 0000000000..1d9f94f4ee
> --- /dev/null
> +++ b/package/python3-setuptools/python3-setuptools.hash
> @@ -0,0 +1,3 @@
> +# From https://pypi.org/pypi/setuptools/json
> +md5  562328cde5a33564c0ebf16699a27b65  setuptools-46.1.3.zip
> +sha256  795e0475ba6cd7fa082b1ee6e90d552209995627a2a227a47c6ea93282f4bfb1  setuptools-46.1.3.zip
> diff --git a/package/python3-setuptools/python3-setuptools.mk b/package/python3-setuptools/python3-setuptools.mk
> index 3f4f1100fe..7615a42a0f 100644
> --- a/package/python3-setuptools/python3-setuptools.mk
> +++ b/package/python3-setuptools/python3-setuptools.mk
> @@ -4,11 +4,9 @@
>  #
>  ################################################################################
>  
> -# Please keep in sync with
> -# package/python-setuptools/python-setuptools.mk
> -PYTHON3_SETUPTOOLS_VERSION = 44.0.0
> +PYTHON3_SETUPTOOLS_VERSION = 46.1.3
>  PYTHON3_SETUPTOOLS_SOURCE = setuptools-$(PYTHON3_SETUPTOOLS_VERSION).zip
> -PYTHON3_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/b0/f3/44da7482ac6da3f36f68e253cb04de37365b3dba9036a3c70773b778b485
> +PYTHON3_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/b5/96/af1686ea8c1e503f4a81223d4a3410e7587fd52df03083de24161d0df7d4
>  PYTHON3_SETUPTOOLS_LICENSE = MIT
>  PYTHON3_SETUPTOOLS_LICENSE_FILES = LICENSE
>  PYTHON3_SETUPTOOLS_SETUP_TYPE = setuptools



-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
