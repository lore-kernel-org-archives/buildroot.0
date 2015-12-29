From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 18:32:18 +0100
Subject: [Buildroot] [PATCH] Added uwsgi to packages
In-Reply-To: <CAKR0bvtdwebq-VkZ9+pcVb2KwHZvJ_AVb4sydQYvjgPndQRTJQ@mail.gmail.com>
References: <CAKR0bvtdwebq-VkZ9+pcVb2KwHZvJ_AVb4sydQYvjgPndQRTJQ@mail.gmail.com>
Message-ID: <20151229183218.23fac6c1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andrea Cappelli,

Thanks for your contribution!

On Tue, 29 Dec 2015 16:07:11 +0100, Andrea Cappelli wrote:

> please find attached a patch to add the uwsgi (
> https://uwsgi-docs.readthedocs.org/en/latest/) package to buildroot

Thanks. However, you posted your patch as an attachment, which is quite
impractical to review. Could you send it inline, by using the "git
send-email" tool, as explained in the Buildroot documentation at
https://buildroot.org/downloads/manual/manual.html#submitting-patches ?

I am nonetheless trying to give you some review below.

> From 28572c6adc48fd64d69f12f89312be587d991fbc Mon Sep 17 00:00:00 2001
> From: Andrea Cappelli <a.cappelli@gmail.com>
> Date: Tue, 29 Dec 2015 16:02:51 +0100
> Subject: [PATCH 1/1] Added uwsgi package

The title should be:

	uwsgi: new package

> 
> 
> Signed-off-by: Andrea Cappelli <a.cappelli@gmail.com>
> ---
>  package/Config.in                                  |    1 +
>  ...ent-variable-to-support-cross-compilation.patch |   17 ++++++++++
>  ...ent-variable-to-support-cross-compilation.patch |   33 ++++++++++++++++++++
>  package/uwsgi/Config.in                            |    8 +++++
>  package/uwsgi/uwsgi.mk                             |   18 +++++++++++
>  5 files changed, 77 insertions(+)
>  create mode 100644 package/uwsgi/0001-Added-environment-variable-to-support-cross-compilation.patch
>  create mode 100644 package/uwsgi/0002-Added-environment-variable-to-support-cross-compilation.patch
>  create mode 100644 package/uwsgi/Config.in
>  create mode 100644 package/uwsgi/uwsgi.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index a024d3d..e2a9b0c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1450,6 +1450,7 @@ endif
>  	source "package/ulogd/Config.in"
>  	source "package/ushare/Config.in"
>  	source "package/ussp-push/Config.in"
> +	source "package/uwsgi/Config.in"
>  	source "package/vde2/Config.in"
>  	source "package/vnstat/Config.in"
>  	source "package/vpnc/Config.in"
> diff --git a/package/uwsgi/0001-Added-environment-variable-to-support-cross-compilation.patch b/package/uwsgi/0001-Added-environment-variable-to-support-cross-compilation.patch
> new file mode 100644
> index 0000000..3216cc7
> --- /dev/null
> +++ b/package/uwsgi/0001-Added-environment-variable-to-support-cross-compilation.patch

This patch and the second patch should be merged, they really are the
same thing.

> @@ -0,0 +1,17 @@
> +Added environment variable to support cross-compilation (1)
> +
> +diff --git a/uwsgiconfig.py b/uwsgiconfig.py
> +index 29051d5..e8cb2d2 100644
> +--- a/uwsgiconfig.py
> ++++ b/uwsgiconfig.py
> +@@ -120,6 +120,9 @@ def binarize(name):
> +     return name.replace('/', '_').replace('.','_').replace('-','_')
> + 
> + def spcall(cmd):
> ++    if 'UWSGI_CROSS_COMPILE' in os.environ and not os.path.isabs(cmd):
> ++        cmd = os.path.join(os.environ['UWSGI_CROSS_COMPILE'],
> ++                           'usr', 'bin', cmd)

This looks wrong: you are pointing UWSGI_CROSS_COMPILE to
$(STAGING_DIR), which contains things built for the target. And then...

> +     p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE,stderr=open('uwsgibuild.log','w'))

You run on the build machine a command installed in STAGING_DIR.
Doesn't look good. Can you explain what you're trying to do here?

> + 
> +     if p.wait() == 0:
> +
> diff --git a/package/uwsgi/0002-Added-environment-variable-to-support-cross-compilation.patch b/package/uwsgi/0002-Added-environment-variable-to-support-cross-compilation.patch
> new file mode 100644
> index 0000000..6230132
> --- /dev/null
> +++ b/package/uwsgi/0002-Added-environment-variable-to-support-cross-compilation.patch
> @@ -0,0 +1,33 @@
> +Added environment variable to support cross-compilation (2)
> +
> +diff --git a/plugins/python/uwsgiplugin.py b/plugins/python/uwsgiplugin.py
> +index f9b4ddb..c5d3e2b 100644
> +--- a/plugins/python/uwsgiplugin.py
> ++++ b/plugins/python/uwsgiplugin.py
> +@@ -51,11 +51,21 @@ if not 'UWSGI_PYTHON_NOLIB' in os.environ:
> +             LIBS.append('-lutil')
> +     else:
> +         try:
> +-            LDFLAGS.append("-L%s" % sysconfig.get_config_var('LIBDIR'))
> +-            os.environ['LD_RUN_PATH'] = "%s" % (sysconfig.get_config_var('LIBDIR'))

Hum, I don't remember if our sysconfig is not supposed to return
correct values, provided the appropriate _python_sysroot environment
variable is defined. But I'm not sure anymore, this it would be worth checking.

> ++            if not 'UWSGI_CROSS_COMPILE' in os.environ:
> ++                path_ = sysconfig.get_config_var('LIBDIR')
> ++            else:
> ++                path_ = os.path.join(os.environ['UWSGI_CROSS_COMPILE'],
> ++                                            'usr', 'lib')

I think UWSGI_CROSS_COMPILE is not the best choice. Something like
'SYSROOT' would be better for example. CROSS_COMPILE variables
typically point to the cross-compilation tools, which is not what
you're doing here.

> ++            LDFLAGS.append("-L%s" % path_)
> ++            os.environ['LD_RUN_PATH'] = path_
> +         except:
> +-            LDFLAGS.append("-L%s/lib" % sysconfig.PREFIX)
> +-            os.environ['LD_RUN_PATH'] = "%s/lib" % sysconfig.PREFIX
> ++            if not 'UWSGI_CROSS_COMPILE' in os.environ:
> ++                path_ = "%s/lib" % sysconfig.PREFIX
> ++            else:
> ++                path_ = os.path.join(os.environ['UWSGI_CROSS_COMPILE'],
> ++                                            'usr', 'lib')
> ++            LDFLAGS.append("-L%s" % path_)
> ++            os.environ['LD_RUN_PATH'] = path_

Adding directories pointing to cross-compiled libraries in LD_RUN_PATH
seems wrong. LD_RUN_PATH will be used by the dynamic linker on your
build machine... so it will not do anything good if pointed to
cross-compiled libraries.

> + 
> +         LIBS.append('-lpython%s' % get_python_version())
> + else:
> +
> diff --git a/package/uwsgi/Config.in b/package/uwsgi/Config.in
> new file mode 100644
> index 0000000..bdeb60b
> --- /dev/null
> +++ b/package/uwsgi/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_UWSGI
> +	bool "uwsgi"
> +        depends on BR2_PACKAGE_PYTHON

Indentation should be done via a tab.

Also, why do you depend on python here? It seems like uwsgi can be used
in many other languages than python: ruby, etc. Do we really need
python on the target to build uwsgi ?

> +	select BR2_PACKAGE_LIBXML2
> +	help
> +	  The uWSGI project aims at developing a full stack for building hosting services.
> +          https://uwsgi-docs.readthedocs.org/en/latest/
> +	  https://pypi.python.org/pypi/uWSGI

Only the former URL should be kept I believe, and it must be separated
from the description by an empty new line.

Also, the description should be wrapped to max 72 characters in width.

> diff --git a/package/uwsgi/uwsgi.mk b/package/uwsgi/uwsgi.mk
> new file mode 100644
> index 0000000..6ff6019
> --- /dev/null
> +++ b/package/uwsgi/uwsgi.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# uwsgi
> +#
> +################################################################################
> +
> +UWSGI_VERSION = 2.0.11.2
> +UWSGI_SOURCE = uwsgi-$(UWSGI_VERSION).tar.gz
> +UWSGI_SITE = https://pypi.python.org/packages/source/u/uWSGI
> +UWSGI_SETUP_TYPE = setuptools
> +UWSGI_LICENSE = GPLv2
> +UWSGI_LICENSE_FILES = LICENSE
> +
> +UWSGI_DEPENDENCIES = libxml2
> +
> +UWSGI_ENV += UWSGI_CROSS_COMPILE="$(STAGING_DIR)"

> +
> +$(eval $(python-package))

You could also use the Makefile, to not use the python-package
infrastructure, and therefore not make this package depend on python
being available for the target.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
