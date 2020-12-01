From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Dec 2020 22:35:48 +0100
Subject: [Buildroot] [PATCH/next v1 1/5] package/python3-jinja2: add
 special host variant
In-Reply-To: <20201117223436.24036-1-ps.report@gmx.net>
References: <20201117223436.24036-1-ps.report@gmx.net>
Message-ID: <a80722d4-2f85-fdbf-1fd8-381512ef9305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/11/2020 23:34, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/python-jinja2/python-jinja2.mk     |  1 +
>  package/python3-jinja2/python3-jinja2.hash |  5 +++++
>  package/python3-jinja2/python3-jinja2.mk   | 18 ++++++++++++++++++
>  3 files changed, 24 insertions(+)
>  create mode 100644 package/python3-jinja2/python3-jinja2.hash
>  create mode 100644 package/python3-jinja2/python3-jinja2.mk
> 
> diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
> index 5f6492915c..51b484d03e 100644
> --- a/package/python-jinja2/python-jinja2.mk
> +++ b/package/python-jinja2/python-jinja2.mk
> @@ -4,6 +4,7 @@
>  #
>  ################################################################################
>  
> +# Please keep in sync with package/python3-jinja2/python3-jinja2.mk

 We have taken this approach for a number of host python packages, but I would
like to avoid continuing down this path. The idea is to slowly deprecate
python2, so adding workarounds for it is not great...

 We discussed this at FOSDEM this year [1]. The conclusion that is relevant for
this is:

host python modules will always use host-python3. So the host-python-package
infra should be adapted to handle that.

Of course, the last part of that sentence never happened... But I really would
prefer to implement that rather than adding 3 more packages.

[Adding a couple of people in Cc that I vaguely remember were involved in the
discussion.]


 Regards,
 Arnout

[1]
https://elinux.org/Buildroot:DeveloperDaysFOSDEM2020#Continue_Python2_deprecation_.28Titouan.29




>  PYTHON_JINJA2_VERSION = 2.11.2
>  PYTHON_JINJA2_SOURCE = Jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
>  PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/64/a7/45e11eebf2f15bf987c3bc11d37dcc838d9dc81250e67e4c5968f6008b6c
> diff --git a/package/python3-jinja2/python3-jinja2.hash b/package/python3-jinja2/python3-jinja2.hash
> new file mode 100644
> index 0000000000..21170a2a99
> --- /dev/null
> +++ b/package/python3-jinja2/python3-jinja2.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/jinja2/json
> +md5  0362203b22547abca06ed1082bc1e7b4  Jinja2-2.11.2.tar.gz
> +sha256  89aab215427ef59c34ad58735269eb58b1a5808103067f7bb9d5836c651b3bb0  Jinja2-2.11.2.tar.gz
> +# Locally computed sha256 checksums
> +sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.rst
> diff --git a/package/python3-jinja2/python3-jinja2.mk b/package/python3-jinja2/python3-jinja2.mk
> new file mode 100644
> index 0000000000..cc8b1ff86f
> --- /dev/null
> +++ b/package/python3-jinja2/python3-jinja2.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# python3-jinja2
> +#
> +################################################################################
> +
> +PYTHON3_JINJA2_VERSION = 2.11.2
> +PYTHON3_JINJA2_SOURCE = Jinja2-$(PYTHON3_JINJA2_VERSION).tar.gz
> +PYTHON3_JINJA2_SITE = https://files.pythonhosted.org/packages/64/a7/45e11eebf2f15bf987c3bc11d37dcc838d9dc81250e67e4c5968f6008b6c
> +PYTHON3_JINJA2_SETUP_TYPE = setuptools
> +PYTHON3_JINJA2_LICENSE = BSD-3-Clause
> +PYTHON3_JINJA2_LICENSE_FILES = LICENSE.rst
> +
> +HOST_PYTHON3_JINJA2_NEEDS_HOST_PYTHON = python3
> +# In host build, setup.py tries to download markupsafe if it is not installed
> +HOST_PYTHON3_JINJA2_DEPENDENCIES = host-python3-markupsafe
> +
> +$(eval $(host-python-package))
> 
