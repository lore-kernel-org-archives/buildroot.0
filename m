From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Jan 2018 21:44:41 +0100
Subject: [Buildroot] [PATCH 3/8] python-setuptools: check host-python
 version
In-Reply-To: <20180102163337.6334-4-aduskett@gmail.com>
References: <20180102163337.6334-1-aduskett@gmail.com>
 <20180102163337.6334-4-aduskett@gmail.com>
Message-ID: <20180102214441.771066aa@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  2 Jan 2018 11:33:32 -0500, Adam Duskett wrote:
> python-setuptools is compatible with both python2 and python3, as such,
> there is no need to force python2 as a dependency.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/python-setuptools/python-setuptools.mk | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
> index 28d4f29b5b..a21494a288 100644
> --- a/package/python-setuptools/python-setuptools.mk
> +++ b/package/python-setuptools/python-setuptools.mk
> @@ -10,10 +10,18 @@ PYTHON_SETUPTOOLS_LICENSE = MIT
>  PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
>  PYTHON_SETUPTOOLS_SETUP_TYPE = setuptools
>  
> +ifeq ($(BR2_PACKAGE_HOST_PYTHON3),y)
> +HOST_PYTHON_SETUPTOOLS_NEEDS_HOST_PYTHON += python3
> +HOST_PYTHON_SETUPTOOLS_PYLIBVER = python$(PYTHON3_VERSION_MAJOR)
> +else
> +HOST_PYTHON_SETUPTOOLS_NEEDS_HOST_PYTHON += python
> +HOST_PYTHON_SETUPTOOLS_PYLIBVER = python$(PYTHON_VERSION_MAJOR)
> +endif

So, now, if the user selects:

BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_ARROW=y
BR2_PACKAGE_HOST_PYTHON3=y

then the build will break. Indeed, since python2 is selected as the
Python for the target, python-arrow should be built and installed for
python2, so it will expect host-python-setuptools to be built and
installed for host-python.

But because the user has selected BR2_PACKAGE_HOST_PYTHON3,
host-python-setuptools will be installed for host-python3.

So, I believe the build breaks with your change.

Basically the current reasoning of the current Python packaging is:

 - The user selects the target version of Python, and from that we
   derive:

   * That we need to build the same Python version for the host

   * That all host Python modules should be built installed for that
     Python version

 - Optionally, packages may depend on the other host-python{,3} if they
   really need that specific Python version. However, we do not support
   installing third party Python modules for this secondary host Python
   version.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
