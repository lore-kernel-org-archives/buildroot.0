From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 5 Feb 2015 15:59:38 +0100
Subject: [Buildroot] [PATCH v2] python-cherrypy: new package
In-Reply-To: <1423146868-27214-1-git-send-email-fhunleth@troodon-software.com>
References: <1423146868-27214-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <CAGm1_kvHOHPiXBeobKSfbN_8OW2RohVrVfNc06d-X9k8msS6EA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 5, 2015 at 3:34 PM, Frank Hunleth
<fhunleth@troodon-software.com> wrote:
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
> Changes v1 -> v2:
>   - removed depends statement in Config.in per Yegor's comment
>     that it wasn't needed if it runs on both Python 2 and 3.
>
>  package/Config.in                          |  1 +
>  package/python-cherrypy/Config.in          |  6 ++++++
>  package/python-cherrypy/python-cherrypy.mk | 14 ++++++++++++++
>  3 files changed, 21 insertions(+)
>  create mode 100644 package/python-cherrypy/Config.in
>  create mode 100644 package/python-cherrypy/python-cherrypy.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index fe3d3d0..a5d1be5 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -510,6 +510,7 @@ menu "external python modules"
>         source "package/python-certifi/Config.in"
>         source "package/python-cffi/Config.in"
>         source "package/python-cheetah/Config.in"
> +       source "package/python-cherrypy/Config.in"
>         source "package/python-coherence/Config.in"
>         source "package/python-configobj/Config.in"
>         source "package/python-configshell-fb/Config.in"
> diff --git a/package/python-cherrypy/Config.in b/package/python-cherrypy/Config.in
> new file mode 100644
> index 0000000..e48d601
> --- /dev/null
> +++ b/package/python-cherrypy/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_CHERRYPY
> +       bool "python-cherrypy"

cherrypy seems to use "import zlib", so following statements are required:

select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime

see cherrypy/lib/encoding.py

Could you also create a python-cherrypy.hash file? See
http://git.buildroot.net/buildroot/tree/package/python-werkzeug/python-werkzeug.hash

I've also seen xmlrpc imports. IIRC it requires expat
(BR2_PACKAGE_PYTHON_PYEXPAT) support in Python
(cherrypy/lib/xmlrpcutil.py).

> +       help
> +         A minimalist web framework
> +
> +         http://www.cherrypy.org
> diff --git a/package/python-cherrypy/python-cherrypy.mk b/package/python-cherrypy/python-cherrypy.mk
> new file mode 100644
> index 0000000..a08b21a
> --- /dev/null
> +++ b/package/python-cherrypy/python-cherrypy.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-cherrypy
> +#
> +################################################################################
> +
> +PYTHON_CHERRYPY_VERSION = 3.6.0
> +PYTHON_CHERRYPY_SOURCE = CherryPy-$(PYTHON_CHERRYPY_VERSION).tar.gz
> +PYTHON_CHERRYPY_SITE = http://pypi.python.org/packages/source/C/CherryPy
> +PYTHON_CHERRYPY_LICENSE = BSD-3c
> +PYTHON_CHERRYPY_LICENSE_FILES = LICENSE.txt
> +PYTHON_CHERRYPY_SETUP_TYPE = distutils
> +
> +$(eval $(python-package))
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
