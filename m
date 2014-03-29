From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Mar 2014 12:47:28 +0100
Subject: [Buildroot] [PATCH 3/6] pkg-python: support host-python
 dependency different from the python in the target
In-Reply-To: <1394057085-10399-4-git-send-email-s.martin49@gmail.com>
References: <1394057085-10399-1-git-send-email-s.martin49@gmail.com>
 <1394057085-10399-4-git-send-email-s.martin49@gmail.com>
Message-ID: <20140329114728.GF3227@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-03-05 23:04 +0100, Samuel Martin spake thusly:
> Some packages need a host-python interpreter with a version different
> from the one installed in the target to run some build scripts (eg.
> scons requires python2 to run, so build any kind of packages even if

s/so/to/

> the python interpreter selected for the target is python3).
> 
> In such cases, we need to add the right host-python dependency to the
> package using the host-python-package infrastructure, and we also want
> to invoke the right host python interpreter during the build steps.
> 
> This patch add a *_FORCE_HOST_PYTHON variable that can be set either

While we are at it: s/add/adds/

Also, I'd name the variable *_NEEDS_HOST_PYTHON (which is more
meaningfull than FORCE.)

> to 'python2' or 'python3'. This variable can be set by any package
> using the host-python-package infrastructure can set to force the
> python interpreter for the build.

This sentence is grammatically incorrect. s/can set//

> This variable also takes care of
> setting the right host-python dependency.
> 
> This *_FORCE_HOST_PYTHON variable only affects packages using the
> host-python-package infrastructure.
> 
> If some configure/build/install commands are overloaded in the *.mk
> file, the right python interpreter should be explicitly called.
> 
> If the package define some tool variable (eg.: SCONS), the variable

s/define/defines/

> should explicitly called the right python interpreter.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  docs/manual/adding-packages-python.txt |  8 ++++++
>  package/pkg-python.mk                  | 50 +++++++++++++++++++++++++++++++---
>  2 files changed, 54 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
> index b8d5331..da97654 100644
> --- a/docs/manual/adding-packages-python.txt
> +++ b/docs/manual/adding-packages-python.txt
> @@ -144,6 +144,14 @@ therefore only use a few of them, or none.
>    setuptools packages) and +HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPT+
>    (for host setuptools packages).
>  
> +* +HOST_PYTHON_FOO_FORCE_HOST_PYTHON+, to define the host python
> +  interpreter. The usage of this variable is limited to the host
> +  packages. The two supported value are +python2+ and +python3+.
> +  It will may sure the right host python package is available for

s/may sure/ensure/

> +  the build and will invoke it for the build. If some build steps
> +  are overloaded, the right python interpreter must be explicitly
> +  called in the commands.
> +
>  With the Python infrastructure, all the steps required to build and
>  install the packages are already defined, and they generally work well
>  for most Python-based packages. However, when required, it is still
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 512ef66..178b494 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -143,11 +143,29 @@ $(2)_DEPENDENCIES ?= $(filter-out host-python host-python3 host-python-setuptool
>  # Target packages need both the python interpreter on the target (for
>  # runtime) and the python interpreter on the host (for
>  # compilation). However, host packages only need the python
> -# interpreter on the host.
> +# interpreter on the host, whose version may be enforced by setting
> +# the *_FORCE_HOST_PYTHON variable.
> +#
> +# So:
> +# - for target packages, we always depend on the default python interpreter
> +#   (the one selected by the config);
> +# - for host packages:
> +#   - if *_FORCE_HOST_PYTHON is not set, then we depend on use the default
> +#     interperter;
> +#   - otherwise, we depend on the one requested by *_FORCE_HOST_PYTHON.
> +#
>  ifeq ($(4),target)
>  $(2)_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),host-python3 python3,host-python python)
>  else
> +ifeq ($($(2)_FORCE_HOST_PYTHON),)
>  $(2)_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
> +else
> +ifeq ($($(2)_FORCE_HOST_PYTHON),python2)
> +$(2)_DEPENDENCIES += host-python
> +else
> +$(2)_DEPENDENCIES += host-$$($(2)_FORCE_HOST_PYTHON)

If the user makes a typo in the variable value, we'd end up using
host-TYPO and the build may fail. For example, if the user types
'python' instead of 'python3', we'll end up using python2.

I thionk we should explicitly check for (empty), 'python2' or 'python3',
and abort on any other value:

    ifeq ($($(2)_FORCE_HOST_PYTHON),python2)
    $(2)_DEPENDENCIES += host-python
    else ifeq ($($(2)_FORCE_HOST_PYTHON),python3)
    $(2)_DEPENDENCIES += host-python3
    else
    $$(error Incorrect value '$($(2)_FORCE_HOST_PYTHON)' for $(2)_FORCE_HOST_PYTHON)
    endif
    endif

> +endif
> +endif
>  endif
>  
>  # Setuptools based packages will need host-python-setuptools (both
> @@ -161,6 +179,30 @@ $(2)_DEPENDENCIES += host-python-setuptools
>  endif
>  endif
>  
> +# Python interpreter to use for building the package.
> +#
> +# We may want to specify the python interpreter toi be used for building a
> +# package, especially for host-packages (target packages must be built using
> +# the same version of the interpreter as the one installed on the target).
> +#
> +# So:
> +# - for target packages, we always use the default python interpreter (which
> +#   is the same version as the one built and installed on the target);
> +# - for host packages:
> +#   - if *_FORCE_HOST_PYTHON is not set, then we use use the default
> +#     interperter;
> +#   - otherwise, we use the one requested by *_FORCE_HOST_PYTHON.
> +#
> +ifeq ($(4),target)
> +$(2)_PYTHON_INTERPRETER = $(HOST_DIR)/usr/bin/python
> +else
> +ifeq ($($(2)_FORCE_HOST_PYTHON),)
> +$(2)_PYTHON_INTERPRETER = $(HOST_DIR)/usr/bin/python
> +else
> +$(2)_PYTHON_INTERPRETER = $(HOST_DIR)/usr/bin/$($(2)_FORCE_HOST_PYTHON)

But we do not need to check here, as it would have been done above.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
