From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Jan 2019 11:31:44 +0100
Subject: [Buildroot] [PATCH 2/3] package/pkg-python: use
 host-python3-setuptools when needed
In-Reply-To: <20181228170132.13049-3-thomas.petazzoni@bootlin.com>
References: <20181228170132.13049-1-thomas.petazzoni@bootlin.com>
 <20181228170132.13049-3-thomas.petazzoni@bootlin.com>
Message-ID: <20190101113144.40d63e41@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Dec 2018 18:01:30 +0100, Thomas Petazzoni wrote:
> When a package uses "setuptools" as its <pkg>_SETUP_TYPE, we currently
> add a dependency on host-python-setuptools. This means that:
> 
>  (1) When BR2_PACKAGE_PYTHON=y, the default host Python version is
>      Python 2.x, and host-python-setuptools is installed for
>      host-python.
> 
>  (2) When BR2_PACKAGE_PYTHON3=y, the default host Python version is
>      Python 3.x, and host-python-setuptools is installed for
>      host-python3.
> 
>  (3) When no target Python interpreter is selected, the default host
>      Python version is Python 2.x, and host-python-setuptools is
>      installed for host-python.
> 
> Situations (1) and (3) are problematic for host Python packages that
> need Python 3.x. Such packages use <pkg>_NEEDS_HOST_PYTHON = python3,
> but if they use setuptools as their setup type, they will not find
> setuptools installed for host-python3 in situations (1) and (3)
> described above.
> 
> We currently have a single package that sets <pkg>_NEEDS_HOST_PYTHON =
> python3: host-meson. host-meson generally works because if setuptools
> is not found, it falls back to distutils, which is part of the
> standard Python library. However, if there is a setuptools version
> installed system-wide, it may be picked up, but may not necessarily be
> the same version as Buildroot setuptools, potentially causing
> problems.
> 
> This commit makes the necessary change to the python-package
> infrastructure to fix this behavior, by identifying the following
> cases:
> 
>  - When a host Python package says <pkg>_NEEDS_HOST_PYTHON = python3,
>    then we know it wants setuptools installed for host-python3, so we
>    use host-python3-setuptools.
> 
>  - When a host Python package says <pkg>_NEEDS_HOST_PYTHON = python2,
>    then we known it wants setuptools installed for host-python, so we
>    use host-python-setuptools.
> 
>  - When BR2_PACKAGE_PYTHON3=y, and we have a target package, or a host
>    package with no NEEDS_HOST_PYTHON option, then we want setuptools
>    installed for host-python3, so we use host-python3-setuptools.
> 
>  - When BR2_PACKAGE_PYTHON=y or no target interpreter is enabled at
>    all, and we have a target package, or a host package with no
>    NEEDS_HOST_PYTHON option, then we want setuptools for host-python,
>    so we use host-python-setuptools.
> 
> To make this happen, we use host-python3-setuptools introduced in a
> previous commit, but we also change host-python-setuptools to force
> its installation for host-python. The latter is needed if you build
> with BR2_PACKAGE_PYTHON3=y but want to install a Python-based package
> that has NEEDS_HOST_PYTHON=python2.
> 
> There is one single package that needs be adjusted following this:
> lirc-tools, because it is not using the python-package
> infrastructure. It directly depends on host-python-setuptools, which
> no longer works because host-python-setuptools now only installs for
> Python 2.x, while lirc-tools Python binding only supports Python
> 3.x. Switching to host-python3-setuptools solves this problem.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/lirc-tools/lirc-tools.mk              |  2 +-
>  package/pkg-python.mk                         | 35 ++++++++++++++-----
>  .../python-setuptools/python-setuptools.mk    |  1 +
>  3 files changed, 29 insertions(+), 9 deletions(-)

Applied to master, thanks. Thanks Asaf and Yegor for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
